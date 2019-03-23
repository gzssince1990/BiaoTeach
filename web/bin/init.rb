require "sequel"

module BiaoTeach

  options = {
    :host => ENV["DATABASE_HOST"],
    :port => ENV["DATABASE_PORT"],
    :database => ENV["DATABASE_NAME"],
    :user => ENV["DATABASE_USER"],
    :password => ENV["DATABASE_PASSWORD"],
  }

  20.times do |count|
    p options
    DB = Sequel.postgres(options)
    puts "Successfully connected to DB"
    break
  rescue StandardError => error
    raise if count == 20 - 1

    puts "DB not ready yet. Sleeping for 1 second before retrying (#{count}).", error.message
    sleep 1
  end

end

%w[
  models
].tap do |paths|
  Dir["./{#{paths.join(",")}}/**/*.rb"].each { |rb| require rb }
end

puts "...application loaded"