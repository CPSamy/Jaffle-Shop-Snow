
  create or replace  view SCD_POC.PUBLIC.stg_payments  as (
    use warehouse compute_wh;
with source as (
    select * from SCD_POC.PUBLIC.raw_payments

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        --`amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source

)

select * from renamed
  );
