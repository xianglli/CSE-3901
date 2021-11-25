Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :user_config, priority: :last do
      item :users, icon: "fas fa-users"
    end
  end

  table do
    column :avatar, header: false do |user|
      avatar_for(user)
    end
    column :email, link: true
    column :display_name
    column :osu_id
    column :admin
    actions do |a|
      a.delete unless current_user.admin
    end
  end

  form do |user|
    text_field :email

    row do
      col(sm: 6) { text_field :osu_id }
    end

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end

    row do
      col(sm: 6) { password_field :password }
    end

    row do
      col(sm: 6) { check_box :admin }
    end
  end
end
