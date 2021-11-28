Trestle.resource(:student_assistant_applications) do
  menu do
    item :student_assistant_applications, icon: "fa fa-star"
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
      col { select :status, %w[pending approved denied]}
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
