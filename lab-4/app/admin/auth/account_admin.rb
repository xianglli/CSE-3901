Trestle.resource(:account, model: User, scope: Auth, singular: true) do
  instance do
    current_user
  end

  remove_action :new, :edit, :destroy

  form do |user|
    text_field :email

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end

    row do
      col(sm: 6) {label :"Dangerous Action! Please make sure you need to process"}
    end
    row do
      link_to "Sync course list with OSU", "../../courses/sync" , { confirm: "Are you sure?", disable_with: "Processing..." }
    end
  end



  # Limit the parameters that are permitted to be updated by the user
  params do |params|
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
