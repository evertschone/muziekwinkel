class Nummer < Product
  validates_presence_of :tracknr
  validates_format_of :tracknr, :with => /\A([0-9])\Z/i
  validates_format_of :lengte, :with => /\A([0-9]{2,2}):([0-9]{2,2})\Z/i

  belongs_to :album
end
