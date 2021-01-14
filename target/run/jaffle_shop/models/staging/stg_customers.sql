
  create or replace  view SCD_POC.PUBLIC.stg_customers  as (
    with source as (
   
    
    select * from SCD_POC.PUBLIC.raw_customers

), 
renamed as ()
    select
  
        id as customer_id,
        first_name,
        last_name,
        email

    from source

)
     select * from renamed
  );
