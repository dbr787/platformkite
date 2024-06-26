variable "buildkite_org" {
  description = "The Buildkite organization slug."
  type        = string
}

variable "aws_region" {
  description = "The AWS region to use."
  type        = string
  default     = "ap-southeast-2"
}

variable "project_id" {
  description = "An identifier for this project. Used for prefixing resource names and tagging resources."
  type        = string
  validation {
    condition     = length(var.project_id) <= 8
    error_message = "The project_id variable must 8 characters or less."
  }
}

variable "email" {
  description = "The users email address."
  type        = string
}

variable "create_vpc_and_subnets" {
  description = "Create new VPC and subnets using the provided CIDR blocks (vpc_cidr, public_subnet_a_cidr, public_subnet_b_cidr)."
  type        = bool
  default     = true
}

variable "public_zone_name" {
  description = "The name of an existing public hosted zone in Route 53 to use for creating public DNS records."
  type        = string
}

variable "private_zone_name" {
  description = "The name of an existing private hosted zone in Route 53 to use for creating private DNS records."
  type        = string
}

variable "vpc_cidr" {
  description = "The cidr block for the VPC being used, or being created when deploy_core_infra is true."
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "The cidr block for the primary public subnet being used, or being created when deploy_core_infra is true."
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "The cidr block for the secondary public subnet being used, or being created when deploy_core_infra is true."
  type        = string
}

variable "allowed_ip_cidrs" {
  description = "A list of ip addresses in cidr notation that are allowed access to resources."
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "pe_version" {
  description = "The version of Puppet Enterprise to install (i.e. latest or 2021.2.0)."
  type        = string
  default     = "latest"
}

variable "pe_primary_instance_type" {
  description = "The ec2 instance type for the Puppet Enterprise primary server."
  type        = string
  default     = "c5a.2xlarge"
}

variable "pe_primary_ssh_user" {
  description = "The ec2 user to use for provisioners. This will be different for different operating systems."
  type        = string
  default     = "ec2-user"
}

variable "pe_primary_ami_owner" {
  description = "The owner to use in the pe_primary_ami data source to identify the ec2 ami to use."
  type        = string
  default     = "309956199498"
}

variable "pe_primary_ami_name_filter" {
  description = "The name filter to use in the pe_primary_ami data source to identify the ec2 ami to use."
  type        = string
  default     = "RHEL-7.9_HVM_GA*"
}

variable "pe_primary_role" {
  description = "The Puppet role to assign to the Puppet Enterprise primary server."
  type        = string
  default     = ""
}

variable "pe_primary_environment" {
  description = "The Puppet environment to assign to the Puppet Enterprise primary server."
  type        = string
  default     = "production"
}

variable "control_repo" {
  description = "The git URL for the Puppet Enterprise Control Repository (i.e. git@github.com:user/control-repo.git)."
  type        = string
  default     = ""
}

variable "github_token" {
  description = "The location of a file containing a GitHub personal access token to use for creating a code manager webhook."
  type        = string
  default     = ""
}

variable "eyaml_private_key" {
  description = "The location of the private key to use for hiera-eyaml encryption."
  type        = string
}

variable "eyaml_public_key" {
  description = "The location of the public key to use for hiera-eyaml encryption."
  type        = string
}

variable "nodes" {
  description = "A list of terraform objects or maps including the details or variables for each group of nodes to provision. See the nodes module for nested variable details."
  type        = list(any)
}
