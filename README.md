# Claude Code Plugins

A [Claude Code plugin marketplace](https://code.claude.com/docs/en/plugin-marketplaces.md) by David Dorfman.

## Available Plugins

| Plugin | Description |
| --- | --- |
| [bash-history](https://github.com/d3dave/claude-code-bash-history) | Bash history plugin for Claude Code |

## Git Hooks

This repository includes helpful git hooks for Claude Code users.

### Pre-Push Hook (Merge Conflict Resolver)

A pre-push hook that automatically detects merge conflicts with the remote branch and spawns Claude to resolve them before pushing.

**Features:**
- Checks for potential merge conflicts before pushing
- Automatically fetches remote changes to detect conflicts
- Spawns Claude CLI to intelligently resolve conflicts
- Preserves your local changes during conflict detection

**Installation:**

```bash
# Clone this repo or navigate to it
cd claude-code-plugins

# Install to current repo
./hooks/install.sh

# Or install to a specific repo
./hooks/install.sh /path/to/your/repo
```

**Requirements:**
- Claude Code CLI must be installed and available as `claude`

## Installation

Add this marketplace to Claude Code:

```
/plugin marketplace add d3dave/claude-code-plugins
```

Then install individual plugins:

```
/plugin install bash-history@d3dave
```
