# AGENTS.md

## Writing this file

Keep every entry as short as possible without losing clarity.

## Conventions

Follow existing codebase patterns for tests and code. Example: one expect per test.

## Testing

If the repo uses Docker, run tests and linters (rspec, rubocop) via Docker commands.

## OpenSpec

Specs describe expected behavior only. No code references.

## Logging

Two options:
- CloudWatch: use `rails_semantic_logger`.
- Grafana: use telemetry.

## Code review

When asked to review code, always dispatch the `reviewer` subagent
(defined in `.devin/agents/reviewer/AGENT.md`) instead of reviewing
inline. This applies to any review request, including short ones such
as "review my code" or "take a look at this diff".

- Dispatch the subagent before forming your own opinion on the code.
- Report its findings back with the file paths and line numbers it cites.
- If the review scope is ambiguous (uncommitted diff vs. whole codebase),
  ask which is wanted, then dispatch.
