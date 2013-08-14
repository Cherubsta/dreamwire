class DreamsController < ApplicationController
  before_filter :signed_in_user, except: [:index]
                                 #could also do-> only: [:create, :destroy, etc] 

  # GET /dreams, GET /dreams.json
  def index
    @dreams = Dream.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dreams }
    end
  end

  # GET /dreams, GET /dreams.json
  def show #DreamView
    @dream = Dream.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dream }
    end
    session[:last_show_page] = request.env['HTTP_REFERER']
  end

  # GET /dreams, GET /dreams.json
  def new
    @dream = current_user.dreams.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dream }
    end
    session[:last_new_page] = request.env['HTTP_REFERER'] || root_path
  end

  def detail
    @dream = Dream.find(params[:id])
  end

  # GET /dreams/1/edit
  def edit
    @dream = current_user.dreams.find(params[:id])
  end

  # POST /dreams, POST /dreams.json
  def create
    @dream = current_user.dreams.new(params[:dream])
    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream Saved!' }
        format.json { render json: @dream, status: :created, location: @dream }
      else
        format.html { render action: "new" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dreams/1, PUT /dreams/1.json
  def update
    @dream = current_user.dreams.find(params[:id])
    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to @dream, notice: 'Dream updated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream = current_user.dreams.find(params[:id])
    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end
end