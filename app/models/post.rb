class Post < ActiveRecord::Base
	validates :content,:presence => {:message => "plz input something"}
end
