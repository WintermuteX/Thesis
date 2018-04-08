view: vehicles {
  sql_table_name: UK_Car_Crashes.Vehicles ;;

  dimension: accident_index {
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: age_band_of_driver {
    type: string
    sql: ${TABLE}.Age_Band_of_Driver ;;
  }

  dimension: age_of_driver {
    type: string
    sql: ${TABLE}.Age_of_Driver ;;
  }

  dimension: age_of_vehicle {
    type: string
    sql: ${TABLE}.Age_of_Vehicle ;;
  }

  dimension: driver_home_area_type {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.driver_home_area_type as int64) = 1 ;;
        label: "Urban area"
      }
      when: {
        sql: cast(${TABLE}.driver_home_area_type as int64) = 2 ;;
        label: "Small town"
      }
      when: {
        sql: cast(${TABLE}.driver_home_area_type as int64) = 3 ;;
        label: "Rural area"
      }
      # Possibly more when statements
      else: "Unknown"
    }

 #   sql: ${TABLE}.Driver_Home_Area_Type ;;
  }

  dimension: driver_imd_decile {
    type: string
    sql: ${TABLE}.Driver_IMD_Decile ;;
  }

  dimension: engine_capacity {
    type: number
    sql: ${TABLE}.Engine_Capacity ;;
  }

  dimension: first_point_of_impact {
    hidden: yes
    type: string
    sql: ${TABLE}.First_Point_of_Impact ;;
  }

  dimension: hit_object_in_carriageway {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 0 ;;
        label: "None"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 1 ;;
        label: "Previous accident"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 2 ;;
        label: "Roadworks"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 4 ;;
        label: "Parked vehicle"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 5 ;;
        label: "Bridge (roof)"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 6 ;;
        label: "Bridge (side)"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 7 ;;
        label: "Bollard or refuge"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 8 ;;
        label: "Open door of vehicle"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 9 ;;
        label: "Central island of roundabout"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 10 ;;
        label: "Kerb"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 11 ;;
        label: "Other object"
      }
      when: {
        sql: cast(${TABLE}.hit_object_in_carriageway as int64) = 11 ;;
        label: "Any animal (other than ridden horse)"
      }
      else: "Unknown"
      }
  }

  dimension: hit_object_off_carriageway {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 0 ;;
        label: "None"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 1 ;;
        label: "Road sign or traffic signal"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 2 ;;
        label: "Lamp post"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 3 ;;
        label: "Telegraph or electricity pole"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 4 ;;
        label: "Tree"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 5 ;;
        label: "Bus stop or bus shelter"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 6 ;;
        label: "Central crash barrier"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 7 ;;
        label: "Near/offside crash barrier"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 8 ;;
        label: "Submerged in water"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 9 ;;
        label: "Entered ditch"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 10 ;;
        label: "Other permanent object"
      }
      when: {
        sql: cast(${TABLE}.hit_object_off_carriageway as int64) = 11 ;;
        label: "Wall or fence"
      }
      else: "Unknown"
      }
  }

  dimension: journey_purpose_of_driver {
    hidden: yes
    type: string
    sql: ${TABLE}.Journey_Purpose_of_Driver ;;
  }

  dimension: junction_location {
    hidden: yes
    type: string
    sql: ${TABLE}.Junction_Location ;;
  }

  dimension: propulsion_code {
    type: string
    sql: ${TABLE}.Propulsion_Code ;;
  }

  dimension: sex_of_driver {
    hidden: yes
    type: string
    sql: ${TABLE}.Sex_of_Driver ;;
  }

  dimension: skidding_and_overturning {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 0 ;;
        label: "No Skid"
      }

      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 1 ;;
        label: "Skidded"
        }

      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 2 ;;
        label: "Skidded and overturned"
        }

      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 3 ;;
        label: "Jackknifed"
        }

      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 4 ;;
        label: "Jackknifed and overturned"
        }

      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 5 ;;
        label: "Overturned"
        }
    else: "Unknown"
        }
  }

  dimension: towing_and_articulation {
    type: string
    sql: ${TABLE}.Towing_and_Articulation ;;
  }

  dimension: vehicle_leaving_carriageway {
    type: string
    sql: ${TABLE}.Vehicle_Leaving_Carriageway ;;
  }

  dimension: vehicle_location_restricted_lane {
    hidden: yes
    type: string
    sql: ${TABLE}.Vehicle_Location_Restricted_Lane ;;
  }

  dimension: vehicle_manoeuvre {
    hidden: yes
    type: string
    sql: ${TABLE}.Vehicle_Manoeuvre ;;
  }

  dimension: vehicle_reference {
    type: string
    sql: ${TABLE}.Vehicle_Reference ;;
  }

  dimension: vehicle_type {
    hidden: yes
    type: string
    sql: ${TABLE}.Vehicle_Type ;;
  }

  dimension: was_vehicle_left_hand_drive {
    type: string
    case: {
      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 1 ;;
        label: "No"
      }
      when: {
        sql: cast(${TABLE}.skidding_and_overturning as int64) = 2 ;;
        label: "Yes"
      }
      else: "Unknown"
      }
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: average_engine_capacity{
    type: average
    sql: cast(vehicles.Engine_Capacity as int64) ;;
    value_format_name: decimal_0
  }
}
