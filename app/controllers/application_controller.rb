class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


    # ログインしていないユーザによるアクセスを禁ずる
    def authenticate_user
      if current_user == nil
        redirect_to new_session_path, notice: "ログインが必要です"
      end
    end

    #ログインユーザーによるアクセスを禁ずる
    def forbid_login_user
      if current_user
        redirect_to user_path(current_user.id), notice: "すでにログイン中です"
      end
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

    # ログインユーザのみ投稿の編集・削除許可
    def ensure_correct_user
      if current_user.id != params[:id].to_i
        redirect_to pictures_path, notice: "権限がありません"
      end
    end


end
