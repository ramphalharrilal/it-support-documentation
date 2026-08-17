#!/usr/bin/env python3
"""Validate links, portfolio structure, placeholders, and obvious secrets."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote


ROOT = Path(__file__).resolve().parents[1]
REQUIRED_PATHS = (
    "README.md",
    "operations/service-desk-operating-model.md",
    "case-studies/microsoft-365-access-incident.md",
    "case-studies/dns-resolution-incident.md",
    "templates/incident-ticket.md",
    "templates/change-record.md",
    "automation/windows/Collect-SystemHealth.ps1",
    "automation/windows/README.md",
    "security/phishing-first-response.md",
)
MARKDOWN_LINK = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
PLACEHOLDER = re.compile(r"\b(?:TODO|TBD|FIXME|LOREM IPSUM)\b", re.IGNORECASE)
SECRET_PATTERNS = (
    re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----"),
    re.compile(r"\bgh[pousr]_[A-Za-z0-9_]{30,}\b"),
    re.compile(r"\bsk-[A-Za-z0-9_-]{20,}\b"),
    re.compile(r"\bAIza[0-9A-Za-z_-]{30,}\b"),
    re.compile(r"(?i)\b(?:password|secret|api[_-]?key)\s*=\s*['\"][^'\"]+['\"]"),
)


def markdown_files() -> list[Path]:
    return sorted(path for path in ROOT.rglob("*.md") if ".git" not in path.parts)


def validate_required_paths(errors: list[str]) -> None:
    for relative in REQUIRED_PATHS:
        if not (ROOT / relative).is_file():
            errors.append(f"missing required portfolio artifact: {relative}")


def validate_markdown(path: Path, errors: list[str]) -> None:
    text = path.read_text(encoding="utf-8")
    relative = path.relative_to(ROOT)

    if PLACEHOLDER.search(text):
        errors.append(f"unfinished placeholder in {relative}")

    for target in MARKDOWN_LINK.findall(text):
        target = target.strip().split()[0]
        if target.startswith(("http://", "https://", "mailto:", "#")):
            continue
        clean_target = unquote(target.split("#", 1)[0])
        if not clean_target:
            continue
        resolved = (path.parent / clean_target).resolve()
        try:
            resolved.relative_to(ROOT.resolve())
        except ValueError:
            errors.append(f"link escapes repository in {relative}: {target}")
            continue
        if not resolved.exists():
            errors.append(f"broken relative link in {relative}: {target}")

    for pattern in SECRET_PATTERNS:
        if pattern.search(text):
            errors.append(f"possible secret in {relative}: pattern {pattern.pattern}")


def validate_powershell(errors: list[str]) -> None:
    script = ROOT / "automation/windows/Collect-SystemHealth.ps1"
    if not script.is_file():
        return
    text = script.read_text(encoding="utf-8")
    required_markers = (".SYNOPSIS", ".DESCRIPTION", "[CmdletBinding()]", "ConvertTo-Json")
    for marker in required_markers:
        if marker not in text:
            errors.append(f"PowerShell collector missing required marker: {marker}")

    risky_commands = re.compile(
        r"(?im)^\s*(?:Remove-Item|Restart-Computer|Stop-Computer|Disable-|Uninstall-|Clear-EventLog)\b"
    )
    if risky_commands.search(text):
        errors.append("PowerShell collector contains a state-changing command")

    for pattern in SECRET_PATTERNS:
        if pattern.search(text):
            errors.append(f"possible secret in PowerShell collector: pattern {pattern.pattern}")


def main() -> int:
    errors: list[str] = []
    files = markdown_files()
    validate_required_paths(errors)
    for path in files:
        validate_markdown(path, errors)
    validate_powershell(errors)

    if errors:
        print("Repository validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print(f"Repository validation passed: {len(files)} Markdown files checked.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
