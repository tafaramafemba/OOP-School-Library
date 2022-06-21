require 'json'

module PreserveData
  def create_file(path)
    Dir.mkdir('data') unless Dir.exist?('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: true)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def file_exist?(filename)
    File.exist? filename
  end

  def fetch_teacher
    path = 'data/users.json'

    if file_exist?(path)
      fetch_data(path).map do |users|
        Teacher.new(users['id'], users['age'], users['name'], users['specialization'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_student
    path = 'data/users.json'

    if file_exist?(path)
      fetch_data(path).map do |users|
        Student.new(users['id'], users['age'], users['name'], users['classroom'])
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
        select_user = users.select { |user| user.id == rental['id'] }
        select_book = books.select { |book| book.title == rental['title'] }

        Rental.new(select_user[0], select_book[0], date)
      end
    else
      create_file(path)
      []
    end
  end

  def save_student(user)
    path = 'data/users.json'
    data = fetch_data(path)
      data.push({ id: user.id, age: user.age, name: user.name, classroom: user.classroom })
    save(path, data)
  end

  def save_teacher(user)
    path = 'data/users.json'
    data = fetch_data(path)
      data.push({ id: user.id, age: user.age, name: user.name})

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
