Trestle.resource(:courses) do
  menu do
    group :course do
      item :courses, icon: "fa fa-book"
    end
  end

  # Customize the table columns shown on the index view.

  table do
    column :subject, align: :center
    column :catalogNumber, align: :center
    column :title, align: :center
    column :campus, align: :center
    actions
  end

  #Customize the form fields shown on the new/edit views.
  form do |course|
    # Organize fields into tabs and sidebars
    if current_user.admin
      tab :course do
        text_field :title
        text_field :shortDescription
        text_field :component
        text_field :subject
        text_field :catalogNumber
        text_field :campus
        text_field :courseId
        text_area :description, rows: 5
      end
    end

    unless current_user.admin
      tab :course_info do
        text_field :title, disabled: true
        text_field :shortDescription, disabled: true
        text_field :component, disabled: true
        text_field :subject, disabled: true
        text_field :catalogNumber, disabled: true
        text_field :campus, disabled: true
        text_field :courseId, disabled: true
        text_area :description, rows: 5, disabled: true
      end
    end

    tab :section do
      table SectionsAdmin.table , collection: Section.where("\"courseId\" = '#{course.courseId}'")
    end

    tab :TA_application do
      row do
        col(sm: 6) {link_to "Click here to start a new application",new_student_assistant_applications_admin_path}
      end
      row do
        col(sm: 6) {label "Your existing application of this course"}
      end
      if current_user.admin
        table StudentAssistantApplicationsAdmin.table , collection: StudentAssistantApplication.where("\"courseId\" = '#{course.id}'")
      else
        table StudentAssistantApplicationsAdmin.table , collection: StudentAssistantApplication.where("\"courseId\" = '#{course.id}' and \"osu_id\" = '#{current_user.osu_id}'")
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
  #   params.require(:course).permit(:name, ...)
  # end
end
