desc 'Create users from emails list'
task :create_users => [:environment] do
  def inscription(email)
    puts "create user #{email}"
    user = User.find_by(email: email)
    unless user
      User.inscription(email)
    end
    puts "End of creation"
  end

  def parse_data_for
    file = ENV['USER_EMAILS']
    emails = File.open(file, 'r').read.split(/, /)

    emails.each do |mail|
      inscription(mail)
    end
  end

  parse_data_for
end

