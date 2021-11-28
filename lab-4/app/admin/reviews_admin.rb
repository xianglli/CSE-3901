Trestle.resource(:reviews) do
  menu do
    item :reviews, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :osu_id, header: "OSU dot id"
    column :classNumber, header: "Class Number"
    column :reliable, header: "Reliale"
    column :knowledgeable, header: "Knowledgeable"
    column :friendly, header: "Frendly"
    column :leadership, header: "Leadership"
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |review|
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
  #   params.require(:review).permit(:name, ...)
  # end
end
