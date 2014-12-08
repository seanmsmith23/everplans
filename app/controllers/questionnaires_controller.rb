class QuestionnairesController < ApplicationController
  def index

  end

  def new
    @questionnaire = Questionnaire.new
    1.times { @questionnaire.questions.build }
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
    {
      name: params[:questionnaire][:name],
      questions_attributes: params[:questionnaire][:questions_attributes]
    }
  end
end
