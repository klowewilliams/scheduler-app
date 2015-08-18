# 25.times do
#   Project.create(
#     :project_name => "Project" + " " + Faker::App.name,
#     :location => Faker::Address.city + ", " + Faker::Address.state_abbr,
#     :description => Faker::Lorem.paragraph,
#     :category_id => Faker::Number.between(1, 8),
#     :start_date => Faker::Time.between(365.days.ago, Time.now, :all),
#     :end_date => Faker::Time.forward(30, :all),
#     :slots => Faker::Number.between(1, 100),
#     :status => "active",
#     :organization_id => Faker::Number.between(1, 67),
#     :image => Faker::Company.logo
#     )
# end
