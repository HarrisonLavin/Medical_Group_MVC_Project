module Findable

  def find_by_name(name)
    all.find do |object|
      object.name.upcase == name
    end
  end
end