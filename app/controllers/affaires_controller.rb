class AffairesController < ApplicationController
  # GET /affaires
  # GET /affaires.json
  def index
    @affaires = Affaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @affaires }
    end
  end

  # GET /affaires/1
  # GET /affaires/1.json
  def show
    @affaire = Affaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @affaire }
    end
  end

  # GET /affaires/new
  # GET /affaires/new.json
  def new
    @affaire = Affaire.new
    
    if request.xhr?
        render @affaire
    end
  end

  # GET /affaires/1/edit
  def edit
    @affaire = Affaire.find(params[:id])
  end

  # POST /affaires
  # POST /affaires.json
  def create
    @affaire = Affaire.new(params[:affaire])

    respond_to do |format|
      if @affaire.save
        format.html { redirect_to @affaire, :notice => 'Affaire was successfully created.' }
        format.json { render :json => @affaire, :status => :created, :location => @affaire }
      else
        format.html { render :action => "new" }
        format.json { render :json => @affaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affaires/1
  # PUT /affaires/1.json
  def update
    @affaire = Affaire.find(params[:id])

    respond_to do |format|
      if @affaire.update_attributes(params[:affaire])
        format.html { redirect_to @affaire, :notice => 'Affaire was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @affaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /affaires/1
  # DELETE /affaires/1.json
  def destroy
    @affaire = Affaire.find(params[:id])
    @affaire.destroy

    respond_to do |format|
      format.html { redirect_to affaires_url }
      format.json { head :ok }
    end
  end
end
