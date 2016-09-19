class MainframeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  def show

  end

  def index
    @products = Product.all
    @popproducts = PopProduct.limit(4).order('id desc')
    @company_news = CompanyNews.all.order("created_at desc").limit(8)
    @case_types = CaseType.all
  end
  
  def products
    @products = Product.all
    @popproducts = PopProduct.limit(4).order('id desc')
    @categories = Category.all
    @case_types = CaseType.all
  end
  
  def sitemap
    @categories = Category.all
  end
  
  def news
    # @industry_news = IndustryNews.all.reverse
    # @company_news = CompanyNews.all.reverse

    @company_news = CompanyNews.order("created_at desc").paginate :page => params[:page],:per_page => 6
  end
  
  def industrynews
     @industry_news = IndustryNews.order("created_at desc").paginate :page => params[:page], :per_page => 6
  end

  def new
  end
  
  def registrationsuccess
  end
  
  def create

  end

  def edit
  end

  def update

  end

  def destroy
  end
  

  
end
