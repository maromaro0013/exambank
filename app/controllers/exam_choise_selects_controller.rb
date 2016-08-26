class ExamChoiseSelectsController < ApplicationController
  def index
    respond_to do |format|
      format.json {
        render :json => Exam.find(params[:exam_id]).exam_choise_selects.order(:id).select('id, text, is_correct').to_json
      }
    end
  end

  def create
    select = ExamChoiseSelect.new(exam_id: params[:exam_id], is_correct: false, text: '')
    select.save!
    respond_to do |format|
      format.json {
        render :json => select.to_json
      }
    end
  end

  def update
    select = ExamChoiseSelect.find(params[:id])
    select.update(params[:p].permit(:text, :is_correct))
  end

  def destroy
    respond_to do |format|
      ExamChoiseSelect.find(params[:id]).delete
      format.json {
        render :json => {:result => true}.to_json
      }
    end
  end
end
