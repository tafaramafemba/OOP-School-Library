module ListPeople
  def list_all_people
    users.each do |user|
      puts "[#{user.classroom}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    continue?
  end
end
