view: orders {
  sql_table_name: `elastic-pocs.Super_Store_Sales.Orders` ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Order_ID ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.Customer_ID ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Order_Date ;;
  }
  dimension: postal_code {
    type: number
    sql: ${TABLE}.Postal_Code ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }
  dimension: profit {
    type: number
    sql: ${TABLE}.Profit ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }
  dimension_group: ship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Ship_Date ;;
  }
  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }
  measure: count {
    type: count
    drill_fields: [order_id, customer_name, product_name, order_details.count]
  }

  # Parameter to choose metric
  parameter: metric_choice {
    type: unquoted
    allowed_value: { label: "Sales" value: "sales" }
    allowed_value: { label: "Profit" value: "profit" }
    default_value: "sales"
  }

  # Dynamic measure controlled by parameter
  measure: dynamic_metric {
    type: number
    sql:
      CASE
        WHEN {% parameter metric_choice %} = 'sales' THEN ${TABLE}.Sales
        WHEN {% parameter metric_choice %} = 'profit' THEN ${TABLE}.Profit
      END ;;
    value_format_name: decimal_2
    drill_fields: [order_id, customer_name, product_name]
  }

}
