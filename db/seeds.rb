Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U", "Cyberdyne Systems", "Skynet", "Wayne Enterprises", "Stark Industries"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager", "Sniper", "Clown", "Alligator Hunter", "Sandwich Artist", "Spec Ops", "Spetsnaz Operative"]
CITIES = ["乌鲁木齐", "Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland", "Baghdad", "Tehran", "Damascus", "Muskat", "Berlin"]
CATEGORIES = ["Development", "Construction", "Healthcare", "Finance", "Accounting", "Marketing", "Design", "Engineering", "QA", "Research"]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    Category.create(title: CATEGORIES[num])
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: rand(1..5), city: CITIES.sample, category_id: num + 1)
    puts "  Created #{company.jobs[num].title}"
  end
end
