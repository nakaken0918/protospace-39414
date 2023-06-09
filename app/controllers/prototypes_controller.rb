class PrototypesController < ApplicationController
  # 全てのユーザーに許可する。
  before_action :authenticate_user!, except:[:index, :show]
  before_action :move_to_index, except: [:index, :show]
  # ユーザー本人のみに許可する。
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    # 全てのprototypeを代入する。
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create 
    @prototype = Prototype.new(prototype_params)
    # 投稿されたprototypeデータと投稿主のuser_idを関連付けて保存。
    if @prototype.save
      redirect_to root_path
    else
      # 新規投稿フォームに戻る。
      render :new
    end
  end

  def show
    # 投稿されたprototypeの表示
    @prototype = Prototype.find(params[:id])
    # コメント欄の表示
    @comment = @prototype.comments.build
    # コメント内容の表示
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    @prototype = Prototype.find(params[:id])
    
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
  
    unless current_user == @prototype.user
      render :edit
      return
    end
  
    if params[:prototype][:title].blank? || params[:prototype][:catch_copy].blank? || params[:prototype][:concept].blank?
      render :edit
    else
      if @prototype.update(prototype_params)
        redirect_to prototype_path(@prototype.id)
      else
        render :edit
      end
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_user
    @user = current_user
  end

end

