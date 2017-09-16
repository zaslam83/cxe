class Currency < ActiveRecord::Base
  attr_accessible :buyrate, :currencycode, :currencyname, :sellrate
  
  validates :currencyname, presence: true,
                    length: { maximum: 50 }

  validates :currencycode, presence: true,
                    length: { maximum: 5 }

  validates :buyrate, presence: true,
                    length: { maximum: 8 },
					:numericality => { :greater_than_or_equal_to => 0 }

  validates :sellrate, presence: true,
                    length: { maximum: 8 },
					:numericality => { :greater_than_or_equal_to => 0 }
					
	

def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    #currency = find_by_currencycode(row["currencycode"]) || new
    currency = Currency.where(:currencycode => row["currencycode"]).where(:currencyname => row["currencyname"]).first || new
	currency.attributes = row.to_hash.slice(*accessible_attributes)
    currency.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Csv.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
	
end
