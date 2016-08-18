class ExamsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def list
    respond_to do |format|
      format.json {
        ret = Exam.all.map {|e|
          ret = e.attributes
          ret['type'] = ExamType.find(ret['exam_type_id']).name
          ret
        }
        render :json => ret.to_json
      }
    end
  end
end
