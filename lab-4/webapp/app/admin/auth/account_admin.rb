Trestle.resource(:account, model: User, scope: Auth, singular: true) do
  instance do
    current_user
  end

  remove_action :new, :edit, :destroy

  form do |user|
    tab :personal_info do
      text_field :email

      row do
        col(sm: 6) { password_field :password }
        col(sm: 6) { password_field :password_confirmation }
      end

      divider

      row do
        link_to "获取推荐课程", "../../courses/rec" , { confirm: "Are you sure?", disable_with: "Processing..." }
      end

      divider
      
      if current_user.admin
      row do
        col(sm: 6) {label :"管理平台功能"}
      end

      row do
        link_to "与服务器同步课程", "../../courses/sync" , { confirm: "Are you sure?", disable_with: "Processing..." }
      end

      row do
        link_to "课程推荐系统", "http://172.17.0.1:5000"
      end
    end
    end

    tab :avaliable_time do
      row do
        col(sm: 6) {link_to "Click here to add a new avaliable time",new_student_avaliable_times_admin_path}
      end

      divider

      table StudentAvaliableTimesAdmin.table , collection: StudentAvaliableTime.where("\"osu_id\" = '#{user.osu_id}'")
    end

    tab :grader_preference do
      row do
        col(sm: 6) {link_to "Click here to add a new preference course",new_student_qualified_courses_admin_path}
      end

      divider

      table StudentQualifiedCoursesAdmin.table , collection: StudentQualifiedCourse.where("\"osu_id\" = '#{user.osu_id}'")
    end
  end



  # Limit the parameters that are permitted to be updated by the user
  params do |params|
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
