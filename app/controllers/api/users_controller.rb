module Api
  class UsersController < ApplicationController
    include ImageHelper
    include UsersHelper
    # include ErrorHelper

    before_action :set_user_auth, only:
      [:index, :modify, :authentication,
       :presentations, :favorite_presentations]
    #   :reviews, :review_update, :review_destroy]

    # before_action :set_review, only:
    #  [:review_update, :review_destroy]

    skip_before_filter :verify_authenticity_token, only:
      [:create, :authentication, :signup, :signin,
       :presentations, :favorite_presentations]
    #   :reviews, :review_update, :review_destroy]

    def index
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.present?
        @user = @user_auth.user
        # else
        # ErrorHelper.error_handling(
        #    '사용자 인증 실패', '존재하지 않는 사용자입니다.'
        # )
        # render "error.json.jbuilder"
      end
    end

    def modify
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @user = @user_auth.user
        add_user_param(@user)
        ImageHelper.update_single_image(params[:image], @user)
        @user.save!
      end
    end

    def authentication
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @token = UsersHelper.gen_user_auth(@user_auth.user).access_token
      end
    end

    def signup
      # 사용자 로그인 모든 파라미터 nil 여부 체크 필요
      if User.available_email(params[:email])
        @user = User.new
        add_user_param(@user)
        ImageHelper.create_single_image(params[:image], @user)
        @user.save!
        @token = UsersHelper.gen_user_auth(@user).access_token
      end
    end

    def signin
      # 로그인 실패할 경우 제이선 에러 출력
      @user = User.existed_user(params[:email], params[:password])
      if @user.present?
        UsersHelper.gen_user_auth(@user)
        @user.save!
      end
    end

    def presentations
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @user = @user_auth.user
        @user_presentations = @user.presentations.all.order(created_at: :DESC)
      end
    end

    def favorite_presentations
      if @user_auth.user.present?
        @user = @user_auth.user
        @user_favorites = @user.favorites
      end
    end

    private

    def add_user_param(user)
      user.email = params[:email]
      user.password = params[:password]
      user.fullname = params[:fullname]
      user.team_id = params[:team_id]
    end

    def set_user_auth
      @user_auth = UserAuth.find_by_access_token(params[:access_token])
    end

    # def set_review
    #  @review = Review.find(params[:review_id])
    # end
  end
end
