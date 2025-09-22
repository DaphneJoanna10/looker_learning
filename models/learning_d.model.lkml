connection: "tableau_looker_pilot"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: learning_d_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: learning_d_default_datagroup

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: order_items {
  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: users {}
