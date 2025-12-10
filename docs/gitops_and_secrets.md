# GitOps & Secrets (Flux + SOPS)

This repository includes example Flux manifests and SOPS configuration for managing secrets with AWS KMS.

## Flux
- The manifests under `gitops/flux/flux-system` demonstrate `GitRepository` and `Kustomization` resources for dev and prod overlays.
- Recommended bootstrap method (interactive):
  `flux bootstrap github --owner=<your-username> --repository=<repo-name> --branch=main --path=./gitops/flux/flux-system --personal`

## SOPS
- `.sops.yaml` contains a placeholder KMS ARN: `arn:aws:kms:ap-south-1:123456789012:key/REPLACE-ME-WITH-YOUR-ACTUAL-KMS-KEY-ID`
- Use `k8s/secrets/appsecret.template.yaml` as the plaintext secret file.
- Encrypt it with:
  `./tools/encrypt-secret.sh k8s/secrets/appsecret.template.yaml k8s/secrets/appsecret.enc.yaml`

## How Flux decrypts secrets
- Flux can be configured to use SOPS and KMS for decryption using the flux `kustomize-controller` and `sops` integration.
- See Flux docs for enabling decryption: https://fluxcd.io/docs/guides/mozilla-sops/
