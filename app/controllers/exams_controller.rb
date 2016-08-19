class ExamsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to "/exams/#{@exam.id}/edit"
    else
      raise 'e'
    end
  end

  def show
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def list
    respond_to do |format|
      format.json {
        ret = Exam.order(:id).map {|e|
          ret = {}
          attributes = e.attributes
          ret['name'] = attributes['name']
          ret['id'] = attributes['id']
          ret['type'] = ExamType.find(attributes['exam_type_id']).name
          ret
        }
        render :json => ret.to_json
      }
    end
  end

  private
  def exam_params
    params.require(:exam).permit(:name, :exam_type_id, :content)
  end
end
