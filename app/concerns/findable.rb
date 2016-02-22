module Findable

  def find_by_field(input, field)
    all.find do |object|
      object.field.upcase == input.upcase
    end
  end

  def self.find_or_create_by(name:)
    result = DB[:conn].execute("SELECT * FROM #{self}s WHERE name = ? LIMIT 1", name)
    if !result.empty?
      result_data = result[0]
      result = self.new(name: result_data[1])
      dog.id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    else
      dog = self.create(name: name, breed: breed)
    end
    dog
    # binding.pry
  end 

end
