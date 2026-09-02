# Agent Instructions

Keep these instructions concise, project-specific, and current.

## Implementation Plan

- Keep phased plans in `user-docs/implementation-plan/`.
- Use the `generate-implementation-plan` skill to create or materially revise a plan.
- Keep the plan index and phase statuses synchronized.
- During implementation, record progress, checks, blockers, and meaningful departures from the plan.
- Record material changes to scope, sequencing, architecture, or the data model before or alongside the code change.

## Engineering Rules

- Understand the scope and inspect existing patterns before editing.
- Write the least code needed to solve the current problem.
- Prefer small, explicit, reviewable changes over speculative abstractions or broad rewrites.
- Organize code around features or domains; avoid god objects and catch-all utility files.
- Keep files generally under 400 lines and functions generally under 50 lines. Refactor when complexity makes that impractical.
- Preserve backwards compatibility unless a change is explicitly requested.
- Explain trade-offs before making a major architectural change.
- Before starting a local app, check whether the expected instance is already running and reuse it when possible.
- Use the `write-in-jaro-style` skill when drafting or substantially revising prose.
- Summarize changes, verification, risks, and trade-offs in plain English.

## Testing Rules

- Follow test-driven development by default: write tests before or alongside implementation.
- Add a regression test before fixing a bug when practical.
- Prefer many small tests, feature-scoped integration tests where useful, and end-to-end tests only for critical journeys.
- Test business rules, permissions, failure paths, and important boundaries.
- Never remove or weaken a failing test merely to make checks pass.
- Discover checks from project scripts, configuration, continuous-integration files, and existing documentation.
- Run the smallest relevant checks first, then broader checks when the risk warrants it.
- Never claim a check passed unless it was actually run.
- Report checks that could not run, why, and what risk remains.

## Security Rules

- Never commit secrets or expose them to client-side code. Use the platform's secret storage.
- Treat every client, file, webhook, and external response as untrusted input. Validate at the boundary.
- Enforce authentication and authorization on the server or data layer. UI restrictions are not security controls.
- Deny access by default. Check ownership, tenant, and role boundaries for every protected operation.
- Prefer platform-managed authentication and database-level authorization, such as row-level security, where available.
- Define who owns each persistent record, who may read or change it, and what happens when ownership changes.
- Return only the fields the caller needs. Avoid leaking sensitive data through errors, logs, analytics, or caches.
- Redact credentials, tokens, personal data, and payment details from logs.
- Verify webhook signatures against the raw request body and make event processing idempotent.
- Validate uploaded file type, size, name, and storage path. Do not trust the filename or declared content type.
- Use established cryptographic and payment libraries; do not invent security protocols.
- Add negative authorization tests that prove one user or tenant cannot access another's data.
- Before security- or privacy-sensitive work, identify the assets, actors, trust boundaries, likely abuse cases, and controls. This is required for authentication, payments, webhooks, file handling, personal data, and cross-tenant changes.
- If a safe design is unclear, stop and surface the uncertainty before implementation.

## Dependency Rules

- Ask or explain why before adding a major dependency.
- Prefer official SDKs and small, actively maintained packages.
- Check whether the project or platform already provides the capability.
- Avoid overlapping packages and unnecessary transitive dependency trees.
- Commit the appropriate lockfile and review dependency changes deliberately.
- Remove unused dependencies only after verifying they are genuinely unused.

## ADR Rules

- Store architecture decision records in `docs/decision-records/`.
- Create one only for a consequential decision that is expensive to reverse.
- Explain the context, decision, alternatives, and consequences; focus on why, not implementation detail.
- Use the next available number and a short descriptive filename.
- Keep records concise and update their status when a decision is superseded.

## Pointer Map

- `user-docs/`: product context, requirements, plans, and other user-facing project material.
- `user-docs/implementation-plan/`: phased implementation plan and progress history.
- `docs/decision-records/`: durable architecture decisions.
- `.agents/skills/`: repository-local agent skills.
- `.codex/config.toml`: repository-local Codex configuration, including MCP servers.
