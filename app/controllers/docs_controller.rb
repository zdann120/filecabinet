class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  def index
    @docs = Doc.where(user_id: current_user).order('created_at DESC')
  end
  
  def show
    @doc.punch(request)
  end
  
  def new
    @doc = Doc.new
  end
  
  def create
    @doc = current_user.docs.build(doc_params)
    @doc.uuid = SecureRandom.base64(11)
    
    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end
  
  def edit
    if current_user != @doc.user
      flash.notice = "You can't do that!"
      redirect_to @doc
    end
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
  
  def version
    @doc = Doc.friendly.find(params[:doc_id])
    @version = @doc.versions.find(params[:version_id])
  end
  
  private
    def find_doc
      @doc = Doc.friendly.find(params[:id])
    end
  
    def doc_params
      params.require(:doc).permit(:title, :content, :user_id, :file)
    end
end
