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
    @exam = Exam.find(params[:id])
    qiita = Qiita::Markdown::Processor.new
    @content = qiita.call(@exam.content)[:output].to_s.html_safe
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def list
    my_exam = Exam.where(user_id: current_user.id)
    respond_to do |format|
      format.json {
        ret = my_exam.order(:id).select(:id, :name, :exam_type_id).map {|e|
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
