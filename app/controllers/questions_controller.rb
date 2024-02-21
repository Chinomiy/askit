class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show update edit destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @answer = @question.answers.build
  end

  def create
    @question = Question.new qustion_params

    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update qustion_params
      flash[:success] = "Question update!"
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question destroy!"
    redirect_to questions_path
  end

  private

  def qustion_params
    params.required(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find(params[:id])
  end
end
