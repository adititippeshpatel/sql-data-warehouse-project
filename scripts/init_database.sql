/*

create database and schemas

script purpose:
    this script creates a new database named 'DataWarehouse'. It also creates three schemas
    within the database: 'bronze','silver', and 'gold'.
*/


use master;
create database DataWarehouse;
use DataWarehouse;
create schema bronze;
create schema silver;
create schema gold;
