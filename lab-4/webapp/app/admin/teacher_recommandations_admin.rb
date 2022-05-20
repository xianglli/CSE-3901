Trestle.resource(:teacher_recommandations) do
  menu do
    unless current_user.role == "student"
      group :course do
        item :recommandations, icon: "fa fa-star"
      end
    end
  end

  #Customize the table columns shown on the index view.
  
  table do
    column :teacher_osu_id, header: "教师名"
    column :student_osu_id, header: "学生名"
    column :content, header: "推荐内容"
    column :created_at, header: "创建时间"
    column :updated_at, header: "修改时间"
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |teacher_recommandation|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:teacher_recommandation).permit(:name, ...)
  # end
end
