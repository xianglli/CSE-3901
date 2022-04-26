Trestle.resource(:sections) do
  authorize do
    index? do
      true
    end

    show? do
      true
    end

    update? do
      current_user.admin?
    end

    edit? do
      current_user.admin?
    end

    new? do
      current_user.admin?
    end

    destroy? do
      current_user.admin?
    end
  end

  menu do
    if current_user.admin
      group :course do
        item :sections, icon: "fa fa-book"
      end
    end
  end

  search do |query|
    query ? collection.pg_search(query) : collection
  end

  # Customize the table columns shown on the index view.
  #
  table do |section|
    column :id
    column :classNumber
    column :section
    column :component
    column :instructionMode
    column :ta_num, header: "TA number"
    column :ta_num_remain, header: "Avaliable Position" do |sec|
      status_tag((sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s,{ "0" => :danger}[(sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s] || :success)
    end
    column :career
    column :buildingDescription, header: "Address"
    column :monday
    column :tuesday
    column :wednesday
    column :thursday
    column :friday
    column :saturday
    column :sunday
    column :instructors
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |section|
    tab :section do
      text_field :classNumber
      text_field :section
      text_field :component
      text_field :instructionMode
      text_field :ta_num, label: "TA number"
      text_field :career
      text_field :buildingDescription, label: "Address"
      check_box :monday
      check_box :tuesday
      check_box :wednesday
      check_box :thursday
      check_box :friday
      check_box :saturday
      check_box :sunday
      text_field :instructors
    end

    tab :Teaching_assistants do
      table Auth::UsersAdmin.table, collection: User.joins("INNER JOIN student_assistant_applications ON student_assistant_applications.osu_id = users.osu_id AND student_assistant_applications.section = '#{section.id}'")
    end

    tab :Evaluate_students do
      row do
        col(sm: 6) {link_to "Click here to start a new evaluation",new_reviews_admin_path}
      end
      # row do
      #    col(sm: 6) {label "Your existing application of this course"}
      #  end
      # table ReviewsAdmin.table, collection: Review.joins("INNER JOIN student_assistant_applications ON student_assistant_applications.osu_id = reviews.osu_id AND student_assistant_applications.section = '#{section.id}'")
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
  #   params.require(:section).permit(:name, ...)
  # end
end
