class InitialTables < ActiveRecord::Migration[7.0]
  def change
    create_table 'breeds', force: :cascade do |t|
      t.string 'name'
      t.string 'bred_for'
      t.string 'breed_group'
      t.string 'facts'
      t.text 'temperament', default: [], array: true
      t.string 'image_url'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['name'], name: 'index_breeds_on_name', unique: true
    end

    create_table 'channels', force: :cascade do |t|
      t.string 'name'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.boolean 'group', default: true
    end

    create_table 'comments', force: :cascade do |t|
      t.string 'body'
      t.integer 'likes', default: 0
      t.bigint 'user_id', null: false
      t.bigint 'post_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['post_id'], name: 'index_comments_on_post_id'
      t.index ['user_id'], name: 'index_comments_on_user_id'
    end

    create_table 'friends', force: :cascade do |t|
      t.string 'nickname'
      t.boolean 'is_approver'
      t.boolean 'is_friends'
      t.integer 'user_id'
      t.integer 'friend_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end

    create_table 'messages', force: :cascade do |t|
      t.bigint 'user_id', null: false
      t.bigint 'channel_id', null: false
      t.text 'body'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['channel_id'], name: 'index_messages_on_channel_id'
      t.index ['user_id'], name: 'index_messages_on_user_id'
    end

    create_table 'participants', force: :cascade do |t|
      t.bigint 'user_id', null: false
      t.bigint 'channel_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['channel_id'], name: 'index_participants_on_channel_id'
      t.index ['user_id'], name: 'index_participants_on_user_id'
    end

    create_table 'posts', force: :cascade do |t|
      t.bigint 'user_id', null: false
      t.bigint 'breed_id', null: false
      t.text 'body'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.integer 'likes', default: 0
      t.index ['breed_id'], name: 'index_posts_on_breed_id'
      t.index ['user_id'], name: 'index_posts_on_user_id'
    end
  
    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "first_name"
      t.string "last_name"
      t.bigint "mobile_number"
      t.date "birthdate"
      t.string "sex"
      t.integer "login_count", default: 0
      t.boolean "admin", default: false
      t.boolean "banned", default: false
      t.string "image_url"
      t.text "user_preferences", default: [], array: true
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key 'comments', 'posts'
    add_foreign_key 'comments', 'users'
    add_foreign_key 'messages', 'channels'
    add_foreign_key 'messages', 'users'
    add_foreign_key 'participants', 'channels'
    add_foreign_key 'participants', 'users'
    add_foreign_key 'posts', 'breeds'
    add_foreign_key 'posts', 'users'
  end
end
