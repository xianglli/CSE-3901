Trestle.resource(:student_assistant_applications) do
  menu do
    item :student_assistant_applications, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :osu_id, header: "OSU dot id"
    column :courseId, header: "CSE course number"
    column :status, header: "Application status"
    column :created_at
    column :updated_at
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |student_assistant_application|
    select :courseId, Course.all
    select :osu_id, [current_user.osu_id] 
    text_area :content, row: 8

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
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
