class UnitechItem < ActiveRecord::Base
  attr_accessible :cat1, :cat2, :cat3, :cat4, :desc, :manufacturer, :manufacturer_pb, :model, :name, :price, :quantity, :unit, :weight

  def self.search(search)
    if search
      uppercase_search = UnicodeUtils.upcase(search)
      find(:all, :conditions => [
        "name LIKE ? COLLATE NOCASE
        OR cat1 LIKE ? COLLATE NOCASE
        OR cat2 LIKE ? COLLATE NOCASE
        OR cat3 LIKE ? COLLATE NOCASE 
        OR cat4 LIKE ? COLLATE NOCASE
        OR manufacturer LIKE ? COLLATE NOCASE
        OR manufacturer_pb LIKE ? COLLATE NOCASE",
         "%#{search}%",
         "%#{uppercase_search}%",
         "%#{uppercase_search}%",
         "%#{uppercase_search}%",
         "%#{uppercase_search}%",
         "%#{uppercase_search}%",
         "%#{uppercase_search}%"])
    else
      find(:all)
    end
  end
end
