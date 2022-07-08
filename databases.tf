resource "aws_glue_catalog_database" "database_csv" {
  name = "piotr_test_database_csv"
}

resource "aws_glue_catalog_table" "table_csv" {
  name          = "piotr_test_table_csv"
  database_name = aws_glue_catalog_database.database_csv.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    UPDATED_BY_CRAWLER = "piotr_test_crawler_csv"
    compressionType = "none"
	  classification = "csv"
  }

  storage_descriptor {
    location      = "s3://piotr-testbucket-terraform/customers/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
  

  ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"

      parameters = {
        "field.delim": ","
    }
    }

    columns {
        name = "customerid"
        type = "bigint"
    }

    columns {
        name = "customername"
        type = "string"
    }
    
    columns {
        name = "email"
        type = "string"
    }
    
    columns {
        name = "city"
        type = "string"
    }
    
    columns {
        name = "country"
        type = "string"
    }
    
    columns {
        name = "territory"
        type = "string"
    }
    
    columns {
        name = "contactfirstname"
        type = "string"
    }
    
    columns {
        name = "contactlastname"
        type = "string"
    }
  }
}