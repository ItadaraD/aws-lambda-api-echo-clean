variable "region" {
  type    = string
  default = "us-east-1"
}

variable "lambda_name" {
  type    = string
  default = "lambda-echo"
}

variable "runtime" {
  type    = string
  default = "python3.11"
}

variable "routes" {
  type    = list(string)
  default = ["/echo", "/health"]
}
