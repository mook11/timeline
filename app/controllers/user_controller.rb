class UserController < ApplicationController
  def signup
  end

  def signup_complete
  u = User.new
  u.username = params[:username]
  if params[:password] == params[:retype_password] 
  	u.password = params[:password]
	if u.save
	flash[:alert]="회원 가입 완료"
	redirect_to "/wall/posts"
	else
	flash[:alert]=u.errors.values.flatten.join(' ')
	redirect_to :back
	end
	else
	flash[:alert] = "패스워드가 다릅니다."
	redirect_to :back
	end
  end
end
