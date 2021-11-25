Trestle.resource(:courses) do
  menu do
    group :course do
      item :courses, icon: "fa fa-book"
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :subject
    column :catalogNumber
    column :title
    column :campus
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
      editor :description
    end

    tab :section do
      # Layout fields based on a 12-column grid
      row do
        col(sm: 6) { select :author, Section.all }
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
