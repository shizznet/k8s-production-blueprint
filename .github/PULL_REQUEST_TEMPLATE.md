## Summary
<!-- Short description of the change -->

## What Changed
- List major updates

## Validation
- [ ] Kustomize build succeeds:
      `kustomize build k8s/overlays/dev | kubectl apply --dry-run=client -f -`
- [ ] YAML lint passes
- [ ] No plaintext secrets committed
- [ ] CI checks pass

## Notes for Reviewers
<!-- Deployment notes, rollback notes, or anything reviewers must know -->
