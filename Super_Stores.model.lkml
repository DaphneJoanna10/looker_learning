connection: "learning_d"

include: "/views/*.view.lkml"
# include all views in the views/ folder in this project
# access_grant: prak {
#   user_attribute: test_at
#   allowed_values: ["ind","us"]
# }
explore: orders {
  sql_always_where: ${discount} <= .5 ;;
  access_filter: {
    field: region
    user_attribute: test_at
  }
}

explore: order_details {}
# explore: pdt_orders {}
# datagroup: sample_pdt  {
#   sql_trigger:  SELECT MAX(order_id) FROM `elastic-pocs.Super_Store_Sales.Orders` ;;
#   max_cache_age: "24 hour"
# }


access_grant: d_sample {
  user_attribute: d_test
  allowed_values: ["test-in", "test-us"]
}
