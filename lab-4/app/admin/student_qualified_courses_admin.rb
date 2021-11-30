Trestle.resource(:student_qualified_courses) do
  authorize do
    scope do |collection|
      if current_user.admin?
        collection.all
      else
        collection.where(osu_id: current_user.osu_id)
      end
    end
    
    access! do |collection|
      true
    end
  end

  menu do
    
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :osu_id, header: "OSU dot id"
    column :courseId, header: "CSE course" do |course|
      "#{Course.find(course.courseId).shortDescription.to_s}"
    end
    column :preference, align: :center do |course|
      status_tag(StudentQualifiedCourse::PREFERENCE[course.preference])
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |student_qualified_course|
    row do
      col { select :osu_id, [current_user.osu_id], label: "OSU dot id" }
    end

    row do
      col {select :courseId, Course.all, label: "CSE course name"}
    end
  
    row do
      col {select :preference, Hash["qualified" => 1, "willingly" => 5, "strongly willingly" => 10]}
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
  #   params.require(:student_qualified_course).permit(:name, ...)
  # end
end
