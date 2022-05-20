Trestle.resource(:reviews) do
  menu do
    item :courses, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :osu_id, header: "学号"
    column :classNumber, header: "课程" do |course|
      "#{Course.find(course.classNumber).shortDescription.to_s}"
    end
    column :reliable, header: "可信度"
    column :knowledgeable, header: "技能"
    column :friendly, header: "亲和力"
    column :leadership, header: "领导力"
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |review|
    row do
      col(sm: 6) {select :classNumber, Course.all, label: "Course name"}
      col(sm: 6) {select :osu_id, User.joins("INNER JOIN student_assistant_applications ON student_assistant_applications.osu_id = users.osu_id AND student_assistant_applications.\"courseId\" = '#{review.classNumber}'"), label: "OSU dot id" }
    end
  
    row do
      col(sm: 6) {select :reliable, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
      col(sm: 6) {select :knowledgeable, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
      col(sm: 6) {select :friendly, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
      col(sm: 6) {select :leadership, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
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
  #   params.require(:review).permit(:name, ...)
  # end
end
