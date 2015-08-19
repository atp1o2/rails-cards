class CategoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @categories = Category.where(user_id: @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @category = Category.new
  end

  def show
    @user = User.find(params[:user_id])
    @category = Category.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.new(category_params)

    if @category.save
      redirect_to user_category_path(@user, @category)
    else
      render 'new'
    end
  end

  def edit
    # validate user
    @category = Category.find(params[:id])
  end

  def update
    # validate user
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to user_category_path(@user, @category)
    else
      render 'edit'
    end
  end

  def destroy
    # validate user
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to user_categories_path
  end

  private

  def current_user
    User.find(params[:user_id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
