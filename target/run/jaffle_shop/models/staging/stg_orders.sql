
  create or replace  view SCD_POC.PUBLIC.stg_orders  as (
    use warehouse compute_wh;
with source as (
    select * from SCD_POC.PUBLIC.raw_orders

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed
  );
