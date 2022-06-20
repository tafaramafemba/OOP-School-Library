require './main'

class List
  def list_all_books
    @booklist.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    prompt_user
  end
  
  
  def list_all_people
    @list_people.each do |user|
      puts "[#{user.class}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    prompt_user
  end
end


