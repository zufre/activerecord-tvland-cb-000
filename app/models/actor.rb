class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    name = "#{self.first_name} #{self.last_name}"
    name
  end
  def list_roles
    characters = []
    show_names = []

    self.characters.each do |char_instance|
      characters << char_instance.name
    end

    self.shows.each do |show_instance|
      show_names << show_instance.name
    end

    characters = characters.join()
    show_names = show_names.join()

    return characters + " % " + show_names
  end

end
