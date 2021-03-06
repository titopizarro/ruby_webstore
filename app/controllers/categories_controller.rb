class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy delete ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /categories/1/edit
  def edit
    @edit = true
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    params[:category][:keyword_id].split(' ').each do |name|
      unless name.empty?
        keyword = Keyword.find_by name: name.to_s.strip
        if !keyword
          @category.keywords << Keyword.new(name: name.to_s.strip)
        else
          respond_to do |format|
            format.html { redirect_to :categories, :flash => { :error => "Category not saved, keyword *#{name.to_s.strip}* is already in use!" } and return }
            format.json { render :categories, status: :created, location: @categories }
          end
        end
      end
    end

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    params[:category][:keyword_id].split(' ').each do |name|
      unless name.empty?
        keyword = Keyword.find_by name: name.to_s.strip
        if !keyword
          @category.keywords << Keyword.new(name: name.to_s.strip)
        else
          respond_to do |format|
            format.html { redirect_to @category, :flash => { :error => "Category not updated, keyword *#{name.to_s.strip}* is already in use!" } and return }
            format.json { render :show, status: :ok, location: @category }
          end
        end
      end
    end

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @erased = true
    respond_to do |format|
      format.js
    end
  end

  def delete
      @category.destroy
      redirect_to categories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(
        :name
      )
    end
end
