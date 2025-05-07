## Order of apply:
1. k8s-aws-infra - to create base infrastructure
2. k8s-yaml - to create k8s resources
3. in k8s-aws-infra - update r53 with the correct ALB DNS and re-apply again

## Important notice about working with NAT instances

Once this repo is cloned from GitHub, before doing `terraform apply` make sure to check Line Separators for .sh scripts in `modules/nat` they should be using linux format equal to`LF`.
Otherwise, you have a risk of facing weird issues when userdata script will fail and, as a result, Network Interface with EIP tied to it will not be attached to the newly created NAT instance.

Also, make sure not to do Instance Refresh for ASG used for NAT instance when the new instance is being created before the old one is deleted - unless Network Interface isn't unattached from the old instance, the new one won't be able to attach it, script that's doing it will fail.