class House < ActiveRecord::Base
	has_many :house_attachments, :dependent => :destroy

end
