import ray
import raydp
from pyspark.sql import SparkSession
import time

# Initialize Ray
ray.init(address="auto")

# Initialize Spark
spark = raydp.init_spark(
    app_name="RayDPExample",
    num_executors=2,
    executor_cores=1,
    executor_memory="500mb"
)


# Create a Spark DataFrame
df = spark.createDataFrame([(1, "a"), (2, "b"), (3, "c")], ["id", "value"])

print(df.show(n=4))
time.sleep(20)
# Stop Spark
raydp.stop_spark()

# Shutdown Ray
ray.shutdown()