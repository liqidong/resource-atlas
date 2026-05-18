# Evaluate Dual-Use Install Boundaries

Use this when reviewing scripts, package managers, menus, or agent tools that fetch and run dual-use security software.

## Current Resources

- [HackingTool](../resources/hackingtool.md): high-risk command launcher that installs and runs many third-party offensive-security tools, often through shell commands and elevated privileges.

## Review Axes

- Privileged installer requirements and system-wide file changes
- Remote scripts, package managers, compiled tools, and fetched binaries
- Whether commands are displayed before execution
- Whether inputs are shell-interpolated or passed as structured argument lists
- Network boundary: GitHub, package registries, tunneling services, target networks, and APIs
- Isolation options such as disposable VMs or containers
- Auditability of upstream versions and update behavior
- Legal and ethical scope controls for dual-use capabilities

## Next Resources To Analyze

- Sandboxed security labs and intentionally vulnerable targets
- Reproducible security tool containers with pinned versions
- Package-manager trust models for security distributions
