class Post < ActiveRecord::Base
	has_many :comments
	validates :content,:presence => {:message => "plz input something"}
end
