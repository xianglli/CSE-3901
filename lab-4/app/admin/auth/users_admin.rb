Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    if current_user.admin
      group :user_config, priority: :last do
        item :users, icon: "fas fa-users"
      end
    end
  end

  table do
    column :avator, header: false, align: :center, blank: nil do |user|
      avatar { image_tag(user.avator) if user.profile? }
    end
    column :email, link: true
    column :display_name
    column :osu_id, header: "OSU dot id"
    column :role
    column :admin
    actions
  end

  form do |user|
    text_field :email

    row do
      col(sm: 6) { text_field :osu_id, header: "OSU dot id" }
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
