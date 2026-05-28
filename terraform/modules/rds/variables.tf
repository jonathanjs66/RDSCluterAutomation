variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"

  validation {
    condition     = contains(["postgres"], var.engine)
    error_message = "Only 'postgres' is supported."
  }
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = "16"
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be 'dev' or 'prod'."
  }
}

variable "username" {
  description = "Master DB username"
  type        = string
  default     = "dbadmin"
}

variable "password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}
