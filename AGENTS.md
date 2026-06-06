# Agent Instructions

Keep this file concise, repo-specific, and current.

## Project Context

- Product:
- Users:
- Business goal:
- Non-negotiables:
- Useful user docs: `user-docs/`

## Decision Hierarchy

When priorities conflict, choose in this order:

1. Security and privacy
2. Data correctness
3. Tests and verifiability
4. Maintainability
5. Delivery speed
6. Visual polish

## Required Workflow

1. Understand scope and constraints before editing.
2. Inspect existing patterns before introducing new ones.
3. Update `agent-reference/stack-decisions.md` when architectural or stack decisions become known or change.
4. Write or update a small plan for non-trivial work.
5. Add or adjust tests using TDD principles.
6. Implement in small, reviewable steps.
7. Before starting the app for browser-based verification, check whether the expected local app is already running and reuse that instance instead of starting a second server on a new port.
8. Run relevant checks, fix failures, and re-run checks until they pass or a real blocker remains.
9. Summarize changes, checks run, risks, and tradeoffs. The app is being developed by an individual familiar with coding, but who isn't a full-time engineer. Hence when using engineering terms, concepts, or jargon in your summaries, make sure to define them in plain English.

## Implementation Plan

- Living plan folder: `user-docs/implementation-plan/`
- Use the `implementation-plan` skill when creating or materially updating phased MVP plans from PRDs or idea docs.
- Keep `user-docs/implementation-plan/index.md` synchronized with phase files, including phase statuses: `NOT STARTED`, `IN PROGRESS`, or `COMPLETED`.
- Update the active phase file during development with progress notes, verification results, blockers, and user-requested divergences from the original plan.
- Record material scope, sequencing, stack, or data model changes in the plan before or alongside implementation so future agents can reconcile codebase state with plan history.

## Engineering Rules

- Keep files generally under 400 lines.
- Keep functions generally under 50 lines.
- Avoid god objects.
- Avoid catch-all utility files.
- Prefer feature/domain-oriented organization.
- Prefer explicit code over clever abstractions.
- Write the least amount of code required to accomplish the task.
- Prefer small changes over speculative generalization.
- Do not add layers of abstraction until they are clearly needed.
- Refactor when complexity rises.
- Avoid broad unsolicited rewrites.
- Preserve backwards compatibility unless instructed otherwise.
- Explain tradeoffs before major architectural changes.
- Prefer incremental implementation over large rewrites.

## Testing Rules

- Follow TDD by default.
- Write tests before or alongside implementation.
- Follow the testing pyramid.
- Prefer many small tests.
- Use medium tests for feature-scoped behavior.
- Reserve large/E2E tests for critical user journeys.
- Write tests for business logic.
- Add regression tests before fixing bugs.
- Never remove failing tests just to pass CI.
- Never claim tests passed unless actually run.
- Discover relevant checks from package scripts, project config, CI, and existing docs.
- Run the smallest checks that prove the change first, then broader checks when risk warrants it.
- If checks fail, diagnose and fix the underlying issue before re-running them.
- Report any check that could not be run, including the reason and residual risk.

Test categories:

- Small tests: function-scoped and highly isolated.
- Medium tests: feature-scoped tests that may use local process resources, local databases, emulators, or test containers, but must not require network access or real third-party services.
- Large tests: end-to-end tests for critical user journeys only due to cost and maintenance overhead.

## Security Rules

- Never expose secrets to the client.
- Assume client input is untrusted.
- Enforce authorization server-side.
- Prefer platform-managed auth.
- Use database-level authorization such as RLS where applicable.
- Do not invent cryptography.
- Use `agent-reference/security-guardrails.md` for auth, data access, payments, webhooks, file handling, logging, or external integrations.
- Use `agent-reference/data-access.md` when adding or changing data ownership, permissions, or persistence behavior.
- Use `agent-reference/threat-modeling.md` for security-sensitive or privacy-sensitive changes.

## Dependency Rules

- Ask or justify before adding major dependencies.
- Prefer official SDKs.
- Avoid abandoned packages.
- Remove unused dependencies when safely verified.

## ADR Rules

- Create ADRs only for major decisions that are expensive to reverse.
- ADRs explain why, not how.
- Keep ADRs concise.
- Do not create ADRs for routine implementation details.

## Documentation Budget

- `AGENTS.md` should ideally remain under 200 lines.
- `agent-reference/` docs should ideally remain under 150-250 lines each.
- ADRs should ideally fit within one screen.
- Prefer checklists, rules, and structure over long prose.
- Avoid tutorials, generic engineering essays, and repeated guidance.
- Explain intent, constraints, and non-obvious decisions.
- Do not explain basic concepts already widely understood by coding agents.
- If a document grows too large: split it, summarize it, archive outdated guidance, or remove redundancy.

## Pointer Map

- `user-docs/`: user-authored docs, plans, PRDs, long prompts, and project context.
- `agent-reference/stack-decisions.md`: selected stack, hosting, backend, auth, database, and architecture choices.
- `agent-reference/security-guardrails.md`: practical security checklist for implementation and review.
- `agent-reference/data-access.md`: data ownership, authorization, and persistence guidance.
- `agent-reference/threat-modeling.md`: lightweight threat modeling guidance.
- `agent-reference/dependency-policy.md`: dependency hygiene and approval criteria.
- `agent-reference/skill-preferences.md`: user preferences for creating or updating agent skills.
- `user-docs/implementation-plan/`: phased implementation plan, status signpost, progress notes, and divergence log.
