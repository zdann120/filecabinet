class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  def index
    @docs = Doc.where(user_id: current_user)
  end
  
  def show
    @doc.punch(request)
  end
  
  def new
    @doc = Doc.new
  end
  
  def create
    @doc = current_user.docs.build(doc_params)
    @doc.uuid = SecureRandom.uuid
    
    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end
  
  def destroy
    @doc.destroy
    redirect_to docs_url
  end
  
  private
    def find_doc
      @doc = Doc.friendly.find(params[:id])
    end
  
    def doc_params
      params.require(:doc).permit(:title, :content, :user_id)
    end
end
