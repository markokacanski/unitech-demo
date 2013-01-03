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

  def self.get_subcategories(category = nil)
    if category
      rows = where("cat1 = '#{category}'").uniq.pluck(:cat2)
      
      if rows.empty?
        rows = where("cat2 = '#{category}'").uniq.pluck(:cat3)       
      end

      if rows.empty?
        rows = where("cat3 = '#{category}'").uniq.pluck(:cat4)
      end

      if rows.empty?
        rows = where("cat4 = '#{category}'").uniq.pluck(:cat4)
      end
    else
      rows = uniq.pluck(:cat1)
    end

    return rows
  end

  def self.get_manufacturers
    rows = uniq.pluck(:manufacturer)
    return rows
  end

  def self.get_podbrends(manufacturer = nil)
    if manufacturer
      rows = where("manufacturer = '#{manufacturer}'").uniq.pluck(:manufacturer_pb);
    else
      rows = uniq.pluck(:manufacturer_pb);
    end

    return rows
  end
end
