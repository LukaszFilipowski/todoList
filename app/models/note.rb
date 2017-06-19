class Note < ApplicationRecord
  belongs_to :user

  def self.allowed_colors
    [["Domyślny",""],["Żółty","warning"],["Czerwony","danger"], ["Niebieski", "info"], ["Zielony", "success"]]

  end

  def self.allowed_icons
    ["address-book", "bandcamp", "male", "female", "imdb", "podcast", "shower", "user-circle-o", "id-card", "eercast"]
  end
end
