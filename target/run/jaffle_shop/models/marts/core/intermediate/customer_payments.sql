

      create or replace transient table SCD_POC.PUBLIC.customer_payments  as
      (use warehouse compute_wh;
with payments as (

    select * from SCD_POC.PUBLIC.stg_payments

),

orders as (

    select * from SCD_POC.PUBLIC.stg_orders

),

final as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders using (order_id)

    group by 1

)

select * from final
      );
    