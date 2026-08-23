package kubernetes.admission

deny[msg] {
    input.request.kind.kind == "Pod"
    not input.request.object.spec.securityContext.runAsNonRoot
    msg := "Containers must be configured to run as non-root (Zero-Trust Security Rule)."
}
