output "ec2_instance_profile_name" { value = aws_iam_instance_profile.ec2_ssm.name }
output "eks_cluster_role_arn" { value = aws_iam_role.eks_cluster.arn }
output "eks_nodes_role_arn" { value = aws_iam_role.eks_nodes.arn }
output "github_actions_role_arn" { value = length(aws_iam_role.github_actions) > 0 ? aws_iam_role.github_actions[0].arn : "" }
