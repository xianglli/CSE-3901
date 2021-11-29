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

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |section|
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
  #   params.require(:section).permit(:name, ...)
  # end
end
