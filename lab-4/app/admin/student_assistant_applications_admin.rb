Trestle.resource(:student_assistant_applications) do
  menu do
    unless current_user.role == "teacher"
      item :student_assistant_applications, icon: "fa fa-star"
    end
  end

  collection do
    unless current_user.admin
      StudentAssistantApplication.where("\"osu_id\" = '#{current_user.osu_id}'")
    else
      StudentAssistantApplication.all
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :osu_id, header: "OSU dot id"
    column :courseId, header: "CSE course" do |course|
      "#{Course.find(course.courseId).shortDescription.to_s}"
    end
    column :created_at
    column :updated_at
    column :status, header: "Application status" , sort: :status, align: :center do |app|
      status_tag(app.status, {"approved" => :success, "denied" => :danger, "pending" => :warning}[app.status] || :default)
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |student_assistant_application|
    select :courseId, Course.all
    select :osu_id, [current_user.osu_id] 
    text_area :content, row: 8

    row do
      if current_user.admin
        col { select :status, %w[pending approved denied]}
        if student_assistant_application.status == "approved" 
          col { select :section, Section.where("\"courseId\" = '#{Course.find(student_assistant_application.courseId).courseId}'")}
        end
      else
        col { select :status, %w[pending]}
      end
    end

    if student_assistant_application.status == "approved" 
      row do 
        table SectionsAdmin.table , collection: Section.where("\"courseId\" = '#{Course.find(student_assistant_application.courseId).courseId}'")
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:student_assistant_application).permit(:name, ...)
  # end
end
