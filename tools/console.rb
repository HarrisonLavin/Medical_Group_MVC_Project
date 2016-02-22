require_relative '../config/environment.rb'
require_relative 'seed.rb'

def reload!
  load '../config/environment.rb'  
end


Pry.start