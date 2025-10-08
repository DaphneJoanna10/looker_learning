# view: pdt_orders {
#   derived_table: {
#     datagroup_trigger: sample_pdt
#     sql:
#       SELECT
#         COUNT(*) AS count,
#         state,
#         SUM(sales) AS sales
#       FROM `elastic-pocs.Super_Store_Sales.Orders`
#       GROUP BY state ;;
#   }

#   dimension: count {
#     type: number
#     sql: ${TABLE}.count ;;
#   }

#   dimension: state {
#     type: string
#     sql: ${TABLE}.state ;;
#   }

#   measure: sales {
#     type: number
#     sql: ${TABLE}.sales ;;
#   }
# }
