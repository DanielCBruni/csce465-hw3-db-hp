---
name: legacy-parser
description: This skill parses a legacy log file using the legacy_log_parser binary. Only accepts file paths under ~/csce465-agentsec/hw3/inbox/.
---

# Legacy Parser Skill

## 1. Usage
Use this when asked to parse, validate, or inspect a legacy log file that already exists under '~/csce465-agentsec/hw3/inbox/'.

## 2. Access Control
This skill accepts exactly one argument. The argument must be a file path under '~/csce465-agentsec/hw3/inbox/'. Any other path outside that directory must be rejected before any file is invoked.

## 3. How to Invoke
Run: ~/csce465-agentsec/hw3/run_parser.sh <file_path>

'run_parser.sh' resolves the path, enforces the inbox/ boundayr, and then executes the 'legacy_log_parser' binary.
