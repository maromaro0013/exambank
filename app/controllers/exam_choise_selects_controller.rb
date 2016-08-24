class ExamChoiseSelectsController < ApplicationController
  def index
    respond_to do |format|
      format.json {
        render :json => Exam.find(params[:exam_id]).exam_choise_selects.select('id, text, is_correct').to_json
      }
    end
  end

  def create
    ExamChoiseSelect.new(exam_id: params[:exam_id], is_correct: false, text: '').save!
    respond_to do |format|
      format.json {
        render :json => {:result => 'success'}.to_json
      }
    end
  end

  def update
  end
end
