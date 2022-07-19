import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext

glueContext = GlueContext(SparkContext.getOrCreate())

customerdf = glueContext.create_dynamic_frame.from_catalog(
             database="piotr_test_database_csv",
             table_name="piotr_test_table_csv")

glueContext.write_dynamic_frame.from_options(customerdf, connection_type = "s3", connection_options = {"path": "s3://piotr-testbucket-terraform/target"}, format = "json")
