# Copilot instructions

- Workflow: Strict Test-Driven Development (TDD) only. Always write or update tests first, run the test suite, then implement the minimal code to make tests pass. Repeat the red/green/refactor cycle until the feature is complete.

- Console output: Print only one short, clear message to the console describing the current step. Allowed messages include, but are not limited to:
  - "Step: writing test"
  - "Step: running tests"
  - "Step: implementing code"
  - "Step: refactoring"
  - "Step: done"
  Do not print other logs, stack traces, or debugging output to the console—only the single step message is permitted.

- Questions & uncertainty: If at any point the agent is uncertain about requirements, design, or next steps, stop and ask specific clarifying questions. Provide short options where helpful.

- Communication style: Keep messages and questions concise and focused. Continue only after the user answers clarification questions.
