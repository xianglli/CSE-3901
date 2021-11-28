Trestle.resource(:student_avaliable_times) do
  menu do
    
  end

  # Customize the table columns shown on the index view.
  
  table do
    column :day_of_week
    column :start_time
    column :end_time
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |student_avaliable_time|
    select :day_of_week, %w[Mon Tue Wed Thurs Fri Sat Sun]
  
    row do
      col { time_field :start_time }
      col { time_field :end_time }
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
  #   params.require(:student_avaliable_time).permit(:name, ...)
  # end
end
