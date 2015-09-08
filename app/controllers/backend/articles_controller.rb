class Backend::ArticlesController < ApplicationController
  before_action :set_backend_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @backend_articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @backend_article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @backend_article = Article.new(article_params)

    respond_to do |format|
      if @backend_article.save
        format.html { redirect_to @backend_article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend_article }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @backend_article.update(article_params)
        format.html { redirect_to @backend_article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @backend_article.destroy
    respond_to do |format|
      format.html { redirect_to backend_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_article
      @backend_article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:backend_article).permit(:title, :content)
    end
end
