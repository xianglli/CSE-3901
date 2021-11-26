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
    column :role
    column :admin
  end

  form do |user|
    text_field :email

    row do
      col(sm: 6) { text_field :osu_id }
      col(sm: 6) { text_field :display_name }
    end

    row do
      col(sm: 6) { select :role, %w[student teacher] }
    end

    row do
      col(sm: 6) { check_box :admin }
    end
  end
end
