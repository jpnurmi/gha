import codeql/actions-queries/Security/CWE-829/UnpinnedActionsTag

/**
 * Override GitHub's trusted-owner whitelist so that *all* actions must be pinned.
 */
override predicate isTrustedOwner(string nwo) { false }
