json.project 
json.id @project.id
json.name @project.project_name
json.location @project.location
json.description @project.description
json.start_date @project.start_date
json.end_date @project.end_date
json.slots @project.slots
json.organization_id @project.organization_id
json.image @project.image
json.category @project.category

json.users @users.each do |user|
  json.name user.full_name
  json.id user.id
end