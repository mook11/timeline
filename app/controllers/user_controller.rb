class UserController < ApplicationController
  def signup
  end

  def signup_complete
  u = User.new
  u.username = params[:username]
  if params[:password] == params[:retype_password] 
  	u.passward = params[:password]
	if (u.save)
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

  def login
  
  end

  def login_complete
  u = User.where(username: params[:username])[0]
  if u.nil?
  	flash[:alert] = "잘못된 아이디거나 패스워드 입니다"
	redirect_to :back
  else
	if u.username != u.passward
	flash[:alert] = " 잘못된 아이디거나 패스워드 입니다."
	redirect_to :back
	else
	cookies[:user_id] = u.id
	flash[:alert] = "로그인 성공"
	redirect_to "/wall/posts"
	end
  end
  end

  def logout
  cookies.delete(:user_id)
  redirect_to :back
  end
end
