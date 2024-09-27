variable "name" {
  description = "Name of the VPC and EKS Cluster"
  default     = "nvidia-triton-server"
  type        = string
}

# NOTE: Trainium and Inferentia are only available in us-west-2 and us-east-1 regions
variable "region" {
  description = "region"
  default     = "us-west-2"
  type        = string
}

variable "eks_cluster_version" {
  description = "EKS Cluster version"
  default     = "1.30"
  type        = string
}

# VPC with 2046 IPs (10.1.0.0/21) and 2 AZs
variable "vpc_cidr" {
  description = "VPC CIDR. This should be a valid private (RFC 1918) CIDR range"
  default     = "10.1.0.0/21"
  type        = string
}

# RFC6598 range 100.64.0.0/10
# Note you can only /16 range to VPC. You can add multiples of /16 if required
variable "secondary_cidr_blocks" {
  description = "Secondary CIDR blocks to be attached to VPC"
  default     = ["100.64.0.0/16"]
  type        = list(string)
}

# To enable or disable NVIDIA Triton server resources creation
variable "nvidia_triton_server" {
  type = object({
    enable = bool
    repository: string
    tag: string
    model_repository_path = string
    triton_model = string
  })
  default = {
      enable = true
      repository: "nvcr.io/nvidia/tritonserver"
      tag: "23.09-py3"
      model_repository_path = "../model_repository"
      triton_model = "triton-yolo"
    }
}
