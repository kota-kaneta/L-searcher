FactoryBot.define do
  factory :schedule do
    location {'東京'}
    from_time_sun {12}
    to_time_sun {18}
    from_time_mon {12}
    to_time_mon {18}
    from_time_tue {12}
    to_time_tue {18}
    from_time_wed {12}
    to_time_wed {18}
    from_time_thu {12}
    to_time_thu {18}
    from_time_fri {12}
    to_time_fri {18}
    from_time_sat {12}
    to_time_sat {18}
  end
end