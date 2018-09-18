class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    name = "#{self.first_name} #{self.last_name}"
    name
  end
  def list_roles
    roles = ""
    self.characters.each do |c|
      roles << "#{c.name} - #{c.show.name}"
    end
    roles
  end

end
