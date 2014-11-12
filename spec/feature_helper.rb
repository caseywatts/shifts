def app_setup
  @app_config = create(:app_config)
  @department = create(:department)
  @loc_group = build(:loc_group, department: @department)
  @location = create(:location, loc_group: @loc_group)
end

def create_timeslot
  visit '/time_slots/new'
  within("#new_time_slot") do
    # fill_in DATE, :with => TOMORROW
    # fill_in time_slot_start_time_4i, :with => "10" #10am
    # ...more time
  end
  click_button 'Create New'
end

# THIS DOESN'T WORK
# An easy way to select a timeslot row
# @param
#   location_id id of the location we're looking for
#   day_of_week 1-7 to describe the day of the week
# def time_slot_row(location_id, day_of_week)
#   find("#location#{location_id} .timeslots")[day_of_week]
# end