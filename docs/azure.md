# Azure functions

# WebJobs

WebJobs enable you to run a program or script in the same instance as a web app, API app or mobile app.

WebJobs provide a UI for self-service administration. 

WebJobs currently support Python only without the WebJobs SDK. 

WebJobs support triggers by timer, Azure Storage queues and blobs, Azure service bus queues and topics, Azure Cosmos DB, Azure Event Hubs, File system. 

# Data Storage

## [Blob storage][1]
* cloud file system
* the cheapest and with the best performance
* recommended for any solution which stores larger datasets
* can be made accessible publicly and easily downloaded and shared
* specific storage -> as a file, e.g. binary serialized pandas dataframe
* images, documents which can be opened directly in the browser
* distributed access
* streaming video and audio
* write log files
* backup and restore, disaster recovery, archiving
* store data for analysis by an on-premises or Azure-hosted service
* can be accessed via HTTPS from anywhere
* client libraries support python

## [Azure Table storage][2]
* simple tabular data
* non-relational structured data (structured NoSQL data)
* data that don't require complex joins, foreign keys, or stored procedures and can be denormalized for fast access
* schemaless design
* RowKey + PartitionKey
* allows searching through the data, choose subset of the dataset based on the Keys
* user data for web applications, address books, device information, metadata
* accepts authenticated calls from inside and outside the Azure cloud
* a table is a collection of entities (<1MB for Azure storage, <2MB for Azure Cosmos DB)

[Create Azure Table storage][5]

## Azure PostgreSQL or CosmosDb
* relational database
* most expensive solution

## [Inserting data into Azure table storage via HTTP POST request][3]
## [Inserting data into Azure blob storage via HTTP POST request][4]


*How to decide?*
1) Data size
2) Data retention (How long to store the data)
3) How often to be used by its consumers?
4) Do we need to choose head, tail, or query the data directly?
5) When are the data created and for how long are they valid?
6) Data access and sensitivity

[1]: https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction
[2]: https://docs.microsoft.com/en-us/azure/storage/tables/table-storage-overview
[3]: https://docs.microsoft.com/en-us/rest/api/storageservices/insert-entity
[4]: https://docs.microsoft.com/en-us/rest/api/storageservices/put-blob
[5]: https://docs.microsoft.com/en-us/azure/storage/tables/table-storage-quickstart-portal