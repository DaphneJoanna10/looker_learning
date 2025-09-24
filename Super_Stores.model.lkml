connection: "tableau_looker_pilot"

include: "/views/*.view.lkml"
include: "/**/*.view.lkml"
include:  "/dashboard/*.dashboard.lookml"

explore: orders{
  join: order_details  {
    relationship: many_to_one
    sql_on: ${orders.order_id} = ${order_details.order_id} ;;
  }

}

explore: sql_runner_query {}
explore: order_customer_summary {}
