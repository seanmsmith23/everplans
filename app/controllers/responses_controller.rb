class ResponsesController < ApplicationController
  def create
    name = params[:name]
    create_responses(name)
    redirect_to root_path, notice: "Thank you for your response!"
  end

  private

  def create_responses(name)
    params[:responses].each do |question_id, answer|
      Response.create(
        name: name,
        question_id: question_id.to_i,
        answer: answer
      )
    end
  end

end
