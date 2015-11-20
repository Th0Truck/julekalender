class QuestionsOptionsController < ApplicationController
  # GET /questions_options
  # GET /questions_options.json
  def index
    @questions_options = QuestionsOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions_options }
    end
  end

  # GET /questions_options/1
  # GET /questions_options/1.json
  def show
    @questions_option = QuestionsOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questions_option }
    end
  end

  # GET /questions_options/new
  # GET /questions_options/new.json
  def new
    @questions_option = QuestionsOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questions_option }
    end
  end

  # GET /questions_options/1/edit
  def edit
    @questions_option = QuestionsOption.find(params[:id])
  end

  # POST /questions_options
  # POST /questions_options.json
  def create
    params[:questions_option][:correct].to_i
    @questions_option = QuestionsOption.new(params[:questions_option])

    respond_to do |format|
      if @questions_option.save
        format.html { redirect_to :back, notice: 'Questions option was successfully created.' }
        format.json { render json: :back, status: :created, location: @questions_option }
      else
        format.html { render action: "new" }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions_options/1
  # PUT /questions_options/1.json
  def update
    @questions_option = QuestionsOption.find(params[:id])

    respond_to do |format|
      if @questions_option.update_attributes(params[:questions_option])
        format.html { redirect_to @questions_option, notice: 'Questions option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questions_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions_options/1
  # DELETE /questions_options/1.json
  def destroy
    @questions_option = QuestionsOption.find(params[:id])
    @questions_option.destroy

    respond_to do |format|
      format.html { redirect_to questions_options_url }
      format.json { head :no_content }
    end
  end

  private

  def questions_option_params
    params.require(:questions_option).permit(:label, :question_id, :correct)
  end

end
