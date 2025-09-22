view: products {
  sql_table_name: `Super_Store_Sales.products` ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: ord_id {
    type: number
    sql: ${TABLE}.ord_id ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, name, order_items.count]
  }
}
