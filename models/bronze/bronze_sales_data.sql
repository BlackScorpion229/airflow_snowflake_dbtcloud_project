{{
    config(materialized='table')
}}
select * from {{source("Bronze_Module","SALES_DATA")}}