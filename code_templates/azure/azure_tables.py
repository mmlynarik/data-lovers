"""
Simple code snippets to manipulate data in Azure table storage
"""

from azure.data.tables import TableServiceClient

data_dict = {
    "key": "value"
}

entity = {
    "PartitionKey": partition_index,
    "RowKey": object_index,
    "data": data_dict
}

connection_string = get_your_credential()

azure_table_name = "your_table_name"

# connect to Azure storage
table_service_client = TableServiceClient.from_connection_string(
    conn_str=connection_string
)

# connect to an existing table in Azure table storage
table_client = table_service_client.get_table_client(table_name=azure_table_name)

# insert new entity(=data) into Azure table storage
table_client = table_client.create_entity(entity=entity)
