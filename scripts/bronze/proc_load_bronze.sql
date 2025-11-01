/*
=====================================================
stored procedure: load the bronze layer(source->bronze)
=====================================================
script purpose:
    -this stored procedure loads data into the bronze schema from external csv files.
    -uses the bulk insert command to load data from csv files to bronze tables

run with exec bronze.load_bronze; (at end after running the below script)

create or alter procedure bronze.load_bronze as
begin
    declare @start_time datetime, @end_time datetime;
    print 'loading bronze layer';
    print '==========================';
    print '---------------------------';
    print 'loading crm tables';
    print '---------------------------';

    set @start_time=getdate();
    bulk insert bronze.crm_cust_info
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    with (
        firstrow=2,
        fieldterminator=',',
        tablock
    );
    set @end_time=getdate();
    print 'duration' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds';
    select * from bronze.crm_cust_info;

    bulk insert bronze.crm_prd_info
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    with(
       firstrow=2,
       fieldterminator=',',
       tablock
    );

    bulk insert bronze.crm_sales_details
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    with(
      firstrow=2,
      fieldterminator=',',
      tablock
      );
    print '---------------------------';
    print 'loading erp tables';
    print '---------------------------';
    bulk insert bronze.erp_loc_a101
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    with(
        firstrow=2,
        fieldterminator=',',
        tablock

    );

    bulk insert bronze.erp_cust_az12
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    with(
       firstrow=2,
       fieldterminator=',',
       tablock
    );

    bulk insert bronze.erp_px_cat_g1v2
    from 'C:\Users\Aditi\Downloads\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    with(
       firstrow=2,
       fieldterminator=',',
       tablock

    );
end
