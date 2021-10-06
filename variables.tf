variable "name" {
  type        = string
  description = "The name of the Glue job"
}

variable "command_name" {
  type        = string
  default     = "glueetl"
  description = "The name of the job command. Defaults to glueetl"

  validation {
    condition     = var.command_name == "glueetl" || var.command_name == "pythonshell" || var.command_name == "gluestreaming"
    error_message = "For an Apache Spark ETL job, this must be glueetl. For a Python shell job, it must be pythonshell. For an Apache Spark streaming ETL job, this must be gluestreaming."
  }
}

variable "connections" {
  type        = list(string)
  default     = []
  description = "A list with connections for this job"
}

variable "default_arguments" {
  type        = map(string)
  default     = {}
  description = "A map with default arguments for this job"
}

variable "glue_version" {
  type        = string
  default     = "2.0"
  description = "The Glue version to use"
}

variable "max_capacity" {
  type        = number
  default     = null
  description = "The maximum number of data processing units that can be allocated"
}

variable "max_retries" {
  type        = number
  default     = 0
  description = "The maximum number of times to retry a failing job"
}

variable "number_of_workers" {
  type        = string
  default     = null
  description = "The number of workers that are allocated when the job runs"
}

variable "policy" {
  type        = string
  default     = null
  description = "A valid Glue IAM policy JSON document"
}

variable "python_version" {
  type        = string
  default     = "3"
  description = "The Python version (2 or 3) being used to execute a Python shell job"
}

variable "role_arn" {
  type        = string
  default     = null
  description = "An optional Glue execution role"
}

variable "schedule" {
  type        = string
  default     = null
  description = "A cron expression used to specify the schedule for the glue trigger"
}

variable "schedule_active" {
  type        = bool
  default     = true
  description = "Whether the glue trigger should be active"
}

variable "script_location" {
  type        = string
  description = "Specifies the S3 path to the script that is executed by the job"
}

variable "trigger_actions" {
  type        = map(string)
  default     = {}
  description = "A map with actions initiated by the trigger"
}

variable "trigger_predicate" {
  type        = map(string)
  default     = {}
  description = "A map with predicate for the trigger"
}

variable "trigger_type" {
  type        = string
  default     = "SCHEDULED"
  description = "The type ('CONDITIONAL' or 'ON_DEMAND' or 'SCHEDULED') of the trigger"

  validation {
    condition     = var.trigger_type == "CONDITIONAL" || var.trigger_type == "ON_DEMAND" || var.trigger_type == "SCHEDULED"
    error_message = "Valid values are CONDITIONAL, ON_DEMAND, and SCHEDULED."
  }
}

variable "worker_type" {
  type        = string
  default     = null
  description = "The type of predefined worker that is allocated when the job runs"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources"
}
