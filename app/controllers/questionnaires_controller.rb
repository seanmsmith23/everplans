class QuestionnairesController < ApplicationController
  def index

  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(allowed_params)
    if @questionnaire.save
      redirect_to root_path, notice: "Questionnaire created successfully!"
    else
      render 'new'
    end
  end

  private

  def allowed_params
    params.require(:questionnaire).permit(:name)
  end
end
