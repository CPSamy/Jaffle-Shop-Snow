

      create or replace transient table SCD_POC.PUBLIC.customer_orders  as
      (with orders as (

    select * from SCD_POC.PUBLIC.stg_orders

),

final as (

    select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders

    group by 1

)

select * from final
      );
    