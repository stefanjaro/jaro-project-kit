# Jaro Project Kit

A small collection of agent artefacts that Jaro reuses across projects. It is deliberately not a framework starter or a complete development process.

The kit keeps the things that are personal and stable here. Third-party skills stay in their upstream repositories and are installed only in projects that need them.

## Start a project

1. Copy `AGENTS.template.md` into the target project's root as `AGENTS.md`.
2. Copy the personal skills you want from `.agents/skills/` into the target project's `.agents/skills/` folder.
3. Copy `.codex/config.toml` if the project should expose the Playwright MCP server to Codex.
4. Run only the third-party installer scripts the project needs.

For example:

```sh
./scripts/install-impeccable.sh /path/to/project
./scripts/install-superpowers.sh /path/to/project
./scripts/install-supabase.sh /path/to/project
```

Omit the path to install into the current folder. Every script targets Codex and uses the installer's project scope. None passes the global-install flag.

## Personal skills

- `incrementally-validate-idea`: reduce an idea to the smallest version that can generate useful evidence.
- `generate-implementation-plan`: turn a developed idea or requirements document into a phased, living implementation plan.
- `write-in-jaro-style`: draft and revise repository or public-facing prose using patterns derived from Jaro's published writing.

## Third-party skills

- Impeccable: product and interface design skills from `pbakaus/impeccable`.
- Superpowers: development workflow skills from `obra/superpowers`.
- Supabase: Supabase's official agent skills from `supabase/agent-skills`.

These are installed from their sources instead of copied into this repository, so updates remain the upstream maintainers' job.

## What belongs here

- `AGENTS.template.md`: the small set of instructions that should survive across project types.
- `.agents/skills/`: Jaro's own reusable skills.
- `.codex/config.toml`: project-scoped Codex configuration.
- `scripts/`: one project-scoped installer per preferred third-party skill collection.
- `docs/decision-records/`: the ADR location used by the agent template.
- `user-docs/implementation-plan/`: the output location used by the implementation-planning skill.
