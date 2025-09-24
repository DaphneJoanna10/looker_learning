
view: sql_runner_query {
  derived_table: {
    sql: SELECT
        Order_ID AS order_id,
        Customer_ID AS customer_id,
        COUNT(Product_ID) AS product_count,
        SUM(Sales) AS order_revenue,
        SUM(Quantity) AS total_quantity,
        SUM(Profit) AS total_profit
      FROM `elastic-pocs.Super_Store_Sales.Orders`
      GROUP BY Order_ID, Customer_ID;;
  }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: [detail*]
  }

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: product_count {
    type: number
    sql: ${TABLE}.product_count ;;
  }

  dimension: order_revenue {
    type: number
    sql: ${TABLE}.order_revenue ;;
  }

  dimension: total_quantity {
    type: number
    sql: ${TABLE}.total_quantity ;;
  }

  dimension: total_profit {
    type: number
    sql: ${TABLE}.total_profit ;;
  }

  set: detail {
    fields: [
        order_id,
  customer_id,
  product_count,
  order_revenue,
  total_quantity,
  total_profit
    ]
  }
}
