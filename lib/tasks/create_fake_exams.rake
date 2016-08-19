namespace :create_fake_exams do
  desc 'ダミーの問題データを作成します(生成数,ユーザーid)'
  task :create, [:create_count, :user_id] => :environment do |task, args|
    (1..args[:create_count].to_i).each {|idx|
      name = Faker::Name.title
      user_id = 1
      unless args[:user_id].nil?
        user_id = args[:user_id]
      end

      content = Faker::Lorem.paragraphs(5).join("\n")
      exam_type_id = ExamType.where(label: 'single_select').first.id

      e = Exam.new(name: name, user_id: user_id, exam_type_id: exam_type_id, content: content)
      e.save!
    }
  end
end
