Trestle.resource(:courses) do
  menu do
    group :course do
      item :courses, icon: "fa fa-book"
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :subject, align: :center
    column :catalogNumber, align: :center
    column :title, align: :center
    column :campus, align: :center
    actions
  end

  #Customize the form fields shown on the new/edit views.
  form do
    # Organize fields into tabs and sidebars
    tab :course do
      text_field :title
      text_field :shortDescription
      text_field :component
      text_field :subject
      text_field :catalogNumber
      text_field :campus
      text_field :courseId
      # Define custom form fields for easy re-use
      text_area :description, rows: 5
    end

    tab :section do
      #table Section.table
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
