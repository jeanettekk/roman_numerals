# AGENTS.md

## Code review

When asked to review code, always dispatch the `reviewer` subagent
(defined in `.devin/agents/reviewer/AGENT.md`) instead of reviewing
inline. This applies to any review request, including short ones such
as "review my code" or "take a look at this diff".

- Dispatch the subagent before forming your own opinion on the code.
- Report its findings back with the file paths and line numbers it cites.
- If the review scope is ambiguous (uncommitted diff vs. whole codebase),
  ask which is wanted, then dispatch.
