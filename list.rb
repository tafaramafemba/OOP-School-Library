module List
  def list_all_books
    @booklist.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    prompt_user
  end

  def list_all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp.to_i

    puts "Rentals: #{user_id}"
    @rentals.each do |rental|
      if rental.person.id == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
      | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    prompt_user
  end
end
