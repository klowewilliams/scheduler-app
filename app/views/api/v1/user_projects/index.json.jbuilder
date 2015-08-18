json.array! @user_projects.each do |user_project|
  json.start user_project.start_date
  json.end user_project.end_date
  json.title user_project.user.full_name
  json.user_id user_project.user.id
end