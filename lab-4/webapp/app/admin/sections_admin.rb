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
    column :classNumber, header: "课程号"
    column :section, header: "课号"
    column :component, header: "课程类别"
    column :instructionMode, header: "授课方式"
    column :ta_num, header: "TA number", header: "助教需求"
    column :ta_num_remain, header: "空余助教" do |sec|
      status_tag((sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s,{ "0" => :danger}[(sec.ta_num - StudentAssistantApplication.where("\"section\"='#{sec.id}'").count).to_s] || :success)
    end
    column :career, header: "授课对象"
    column :buildingDescription, header: "授课地点"
    column :monday, header: "星期一"
    column :tuesday, header: "星期二"
    column :wednesday, header: "星期三"
    column :thursday, header: "星期四"
    column :friday, header: "星期五"
    column :saturday, header: "星期六"
    column :sunday, header: "星期天"
    column :instructors, header: "教师"
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
