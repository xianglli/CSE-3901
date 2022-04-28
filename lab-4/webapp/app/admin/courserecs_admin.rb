Trestle.resource(:courserecs) do
  menu do
    item :courserecs, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
   table do
    column :rec_course, header: "Recommanded Courses" do |rec|
      Course.find(rec.courseId).title.to_s
    end
   end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |courserec|
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
  #   params.require(:courserec).permit(:name, ...)
  # end
end
