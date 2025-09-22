view: order_items {
  sql_table_name: `sample_looker.order_items` ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: item_price {
    type: number
    sql: ${TABLE}.item_price ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  measure: count {
    type: count
    drill_fields: [order_item_id, products.product_id, products.name, orders.order_id]
  }
}
