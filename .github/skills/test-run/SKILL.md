---
name: test-run
description: Demo skill for running tests in a project. Use whenever you need a quick validation pass or want an example of a skill workflow. Ignore in all other cases.
---

# Test Run Skill

This is a demo skill meant to show how a repository skill can guide an agent through test execution.

## When to use this skill

Use this skill when the user asks to run tests, verify a change, or check whether a feature is passing validation.

## Demo workflow

1. Read the project setup to discover the expected test command.
2. Prefer repository-provided scripts such as `npm test`, `pytest`, or a Make target.
3. Run the smallest relevant test command first.
4. If it fails, read the output and fix the root cause.
5. Re-run the same validation until it passes.
6. Summarize the result clearly for the user.

## Example commands

- `npm test`
- `pytest`
- `cargo test`
- `go test ./...`

## Example response

"I ran the project test suite with `npm test` and verified the change is passing. If you want, I can also investigate any flaky or slow tests."

## Demo note

This is intentionally lightweight and designed for demonstration purposes only.
