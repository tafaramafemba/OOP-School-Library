require 'json'

module PreserveData
  def create_file(path)
    Dir.mkdir('data') unless Dir.exist?('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: false)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def file_exist?(filename)
    File.exist? filename
  end

  def fetch_user
    path = 'data/users.json'

    if file_exist?(path)
      fetch_data(path).map do |users|
        if users['instance'] == 'Teacher'
          Teacher.new(users['id'], users['age'], users['name'], users['specialization'], parent_permission: true)
        else

          Student.new(users['id'], users['age'], users['name'], users['classroom'], users['parent_permission'])
        end
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_books
    path = 'data/books.json'

    if file_exist?(path)
      fetch_data(path).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_rentals
    path = 'data/rentals.json'

    if file_exist?(path)
      fetch_data(path).map do |rental|
        date = rental['date']
        select_user = user.select { |user| user.id == rental['id'] }
        select_book = books.select { |book| book.title == rental['title'] }

        Rental.new(date, select_book[0], select_user[0])
      end
    else
      create_file(path)
      []
    end
  end

  def save_user(user)
    path = 'data/users.json'
    data = fetch_data(path)

    if user.instance_of?(Teacher)
      data.push({ instance: 'Teacher', id: user.id, age: user.age, name: user.name })
    else
      data.push({ instance: 'Student', id: user.id, age: user.age, name: user.name, classroom: user.classroom })
    end

    save(path, data)
  end

  def save_book(book)
    path = 'data/books.json'
    data = fetch_data(path)

    data.push({ title: book.title, author: book.author })
    save(path, data)
  end

  def save_rental(rental)
    path = 'data/rentals.json'
    data = fetch_data(path)

    data.push({ date: rental.date, id: rental.person.id, title: rental.book.title })
    save(path, data)
  end
end
