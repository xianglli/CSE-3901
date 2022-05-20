Trestle.resource(:users, model: User, scope: Auth) do
  authorize do
    index? do
      current_user.admin?
    end

    show? do |app|
      (current_user.osu_id == app.osu_id) || current_user.admin
    end

    update? do |app|
      (current_user.osu_id == app.osu_id) || current_user.admin
    end

    edit? do |app|
      (current_user.osu_id == app.osu_id) || current_user.admin
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
    column :display_name, header: "名字"
    column :osu_id, header: "学工号"
    column :role, header: "职业"
    column :admin, header: "管理员"
    actions
  end

  form do |user|
    text_field :email

    row do
      col(sm: 6) { text_field :osu_id, label: "OSU dot id" }
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
