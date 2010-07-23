class PostcodeList < ActiveRecord::Base

  has_one :zone_member, :as => :zoneable
  has_one :zone, :through => :zone_member

  def to_s
    self.postcodes
  end

  def include?(postcode)
    postcodes = self.postcodes.split(',')
    postcodes.any? {|p| postcode.upcase.starts_with?(p) }
  end

end
