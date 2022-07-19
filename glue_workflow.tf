#GlueJob
resource "aws_glue_job" "gluejob" {
  name     = "piotr_test_gluejob"
  role_arn = aws_iam_role.glue_role.arn

  glue_version = "3.0"

  command {
    script_location = "s3://piotr-testbucket-terraform/scripts/GlueJob.py"
  }
  
}


#Workflow

#Name
resource "aws_glue_workflow" "workflow" {
  name = "piotr_test_workflow"
}

#Trigger to start crawler
resource "aws_glue_trigger" "trigger_start_crawler" {
  name          = "piotr_test_trigger_start_crawler"
  type          = "ON_DEMAND"
  enabled       = true
  workflow_name = aws_glue_workflow.workflow.name

  actions {
    crawler_name = aws_glue_crawler.crawler_csv.name
  }
}

#Trigger to start GlueJob (if cralwer finished)
resource "aws_glue_trigger" "trigger_start_gluejob" {
  name          = "piotr_test_trigger_start_gluejob"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.workflow.name

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crawler_csv.name
      crawl_state    = "SUCCEEDED"
    }
  }

  actions {
    job_name = aws_glue_job.gluejob.name
  }
}