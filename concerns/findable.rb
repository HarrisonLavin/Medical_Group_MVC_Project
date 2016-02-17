module Findable

  def find_by_field(input, field)
    all.find do |object|
      object.field.upcase == input.upcase
    end
  end

  def find_or_create_by_name(name)
    if name 
    end
  end
  
end