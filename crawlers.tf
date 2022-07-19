resource "aws_glue_crawler" "crawler_csv" {
  database_name = aws_glue_catalog_database.database_csv.name
  name          = "piotr_test_crawler_csv"
  role          = aws_iam_role.glue_role.arn
  
  catalog_target {
    database_name = aws_glue_catalog_database.database_csv.name
    tables        = [aws_glue_catalog_table.table_csv.name]
  }

  schema_change_policy {
    delete_behavior = "LOG"
  }
}


