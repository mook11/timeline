class User < ActiveRecord::Base
validates :username, :presence => { :message => "아이디를 꼭 써야합니다."}
validates :username, :uniqueness => { :massage => "동일한 아이디가 존재합니다."}
validates :passward, :presence => {:minimum => 6, :too_short => "너무 짧습니다."}
end
