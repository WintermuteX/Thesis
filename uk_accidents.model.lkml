connection: "gavin_dcl_thesis"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: accidents {

  join: vehicles_defined_2 {
    sql_on: ${accidents.accident_index} = ${vehicles_defined_2.accident_index}  ;;
    relationship: one_to_many
  }

  join: casualties_defined {
    sql_on: CONCAT(${vehicles_defined_2.accident_index},${vehicles_defined_2.vehicle_reference})  =  CONCAT(${casualties_defined.accident_index},${casualties_defined.vehicle_reference}) ;;
    relationship: one_to_many
  }

   join: districts_defined {
    sql: LEFT JOIN `UK_Car_Crashes.Local_Authority_District` AS district ON accidents.Local_Authority__District_ = district.code LEFT JOIN `indigo-bazaar-192612.Looker_Scratch.LR_5BHQGAUBPYB6BOJ8DA5PF_districts_defined` AS districts_defined ON districts_defined.district = district.label


     ;;
    relationship: one_to_many
  }
}
#   join: districts_defined {
#     sql_on: ${districts_defined.district} = ${accidents.local_authority__district_}
#     ;;
#     relationship: one_to_many
#   }
# }

explore: vehicles {
  join: vehicle_type

  {
    view_label: "Vehicles"
    sql_on: cast(${vehicles.vehicle_type} as int64) = ${vehicle_type.code} ;;
    relationship: many_to_one
  }
  join:  vehicle_manoeuvre{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.vehicle_manoeuvre} as int64) = ${vehicle_manoeuvre.code}  ;;
  relationship: many_to_one
  }

  join:  vehicle_location{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.vehicle_location_restricted_lane} as int64) = ${vehicle_location.code}  ;;
  relationship: many_to_one
  }

  join:  point_of_impact{
  view_label: "Vehicles"
  sql_on: cast(${vehicles.first_point_of_impact} as int64) = ${point_of_impact.code} ;;
  relationship: many_to_one
  }

  join: sex_of_driver {
  view_label: "Vehicles"
  sql_on: cast(${vehicles.sex_of_driver} as int64) = ${sex_of_driver.code} ;;
  relationship: many_to_one
  }
  join: age_band {
    view_label: "Vehicles"
    sql_on: cast(${vehicles.age_band_of_driver} as int64) = ${age_band.code} ;;
    relationship: many_to_one
  }
}

explore: casualties {

  join: casualty_class {
  view_label: "Casualties"
  sql_on: cast(${casualties.casualty_class} as int64) = ${casualty_class.code} ;;
  relationship: many_to_one
  }
  join: casualty_type {
  view_label: "Casualties"
  sql_on: cast(${casualties.casualty_type} as int64) = ${casualty_type.code} ;;
  relationship: many_to_one
  }

  join: ped_location {
  view_label: "Casualties"
  sql_on: cast(${casualties.pedestrian_location} as int64) = ${ped_location.code} ;;
  relationship: many_to_one
  }
  join: ped_movement {
  view_label: "Casualties"
  sql_on: cast(${casualties.pedestrian_movement} as int64) = ${ped_movement.code} ;;
  relationship: many_to_one
  }
  join: sex_of_driver {
  view_label: "Casualties"
  sql_on: cast(${casualties.sex_of_casualty} as int64) = ${sex_of_driver.code} ;;
  relationship: many_to_one
  }
  join: age_band {
  view_label: "Casualties"
  sql_on: cast(${casualties.age_band_of_casualty} as int64) = ${age_band.code} ;;
  relationship: many_to_one
  }
}
explore: local_authority_data {}
