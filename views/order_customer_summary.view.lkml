view: order_customer_summary {
  derived_table: {
    explore_source: sql_runner_query {
      column: customer_id {}
      column: order_id {}
    }
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
    description: "Unique ID of the customer"
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    description: "Unique ID of the order"
  }
}
