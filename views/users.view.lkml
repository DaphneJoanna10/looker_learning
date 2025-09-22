view: users {
  sql_table_name: `Super_Store_Sales.Orders` ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension_group: signup {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.signup_date ;;
  }
  dimension: age {
    type:  number
    sql:  ${TABLE}.age ;;
  }
  dimension: age_tier {
    type: tier
    tiers: [18, 25, 35, 45, 55, 65, 75, 90]
    style: integer
    sql: ${age} ;;
  }
  measure: count {
    type: count
    drill_fields: [user_id, name, orders.count]
  }
}
