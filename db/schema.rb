# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120712235509) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "school_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "compliments", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_votes_total", :default => 0
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "message"
    t.boolean  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contents", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "school_id"
    t.string   "title"
    t.time     "total_running_time"
    t.text     "show_text"
    t.text     "index_text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "description"
    t.decimal  "price"
    t.integer  "user_id"
    t.string   "pro"
    t.string   "subtitle"
    t.datetime "released"
    t.boolean  "available"
    t.string   "producer"
    t.integer  "credits"
    t.text     "teaser"
    t.integer  "pro_id"
  end

  add_index "courses", ["index_text"], :name => "index_courses_on_index_text"
  add_index "courses", ["show_text"], :name => "index_courses_on_show_text"
  add_index "courses", ["title"], :name => "index_courses_on_title"

  create_table "courses_tags", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "tag_id"
  end

  add_index "courses_tags", ["course_id", "tag_id"], :name => "index_courses_tags_on_course_id_and_tag_id"
  add_index "courses_tags", ["tag_id", "course_id"], :name => "index_courses_tags_on_tag_id_and_course_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "ideas", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_votes_total", :default => 0
  end

  create_table "ideas_tags", :id => false, :force => true do |t|
    t.integer "idea_id"
    t.integer "tag_id"
  end

  add_index "ideas_tags", ["idea_id", "tag_id"], :name => "index_ideas_tags_on_idea_id_and_tag_id"
  add_index "ideas_tags", ["tag_id", "idea_id"], :name => "index_ideas_tags_on_tag_id_and_idea_id"

  create_table "images", :force => true do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
    t.boolean  "processing",          :default => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["content"], :name => "index_microposts_on_content"

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "index_text"
    t.text     "show_text"
    t.datetime "created_date"
    t.datetime "edited_date"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["created_date"], :name => "index_posts_on_created_date"
  add_index "posts", ["edited_date"], :name => "index_posts_on_edited_date"
  add_index "posts", ["index_text"], :name => "index_posts_on_index_text"
  add_index "posts", ["show_text"], :name => "index_posts_on_show_text"
  add_index "posts", ["title"], :name => "index_posts_on_title"

  create_table "praises", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "problems", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_votes_total", :default => 0
  end

  create_table "problems_tags", :id => false, :force => true do |t|
    t.integer "problem_id"
    t.integer "tag_id"
  end

  add_index "problems_tags", ["problem_id", "tag_id"], :name => "index_problems_tags_on_problem_id_and_tag_id"
  add_index "problems_tags", ["tag_id", "problem_id"], :name => "index_problems_tags_on_tag_id_and_problem_id"

  create_table "pros", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.text     "teaser"
    t.string   "location"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pros_tags", :id => false, :force => true do |t|
    t.integer "pro_id"
    t.integer "tag_id"
  end

  add_index "pros_tags", ["pro_id", "tag_id"], :name => "index_pros_tags_on_pro_id_and_tag_id"
  add_index "pros_tags", ["tag_id", "pro_id"], :name => "index_pros_tags_on_tag_id_and_pro_id"

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_votes_total", :default => 0
  end

  create_table "questions_tags", :id => false, :force => true do |t|
    t.integer "question_id"
    t.integer "tag_id"
  end

  add_index "questions_tags", ["question_id", "tag_id"], :name => "index_questions_tags_on_question_id_and_tag_id"
  add_index "questions_tags", ["tag_id", "question_id"], :name => "index_questions_tags_on_tag_id_and_question_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "who"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_votes_total", :default => 0
  end

  create_table "requests_tags", :id => false, :force => true do |t|
    t.integer "request_id"
    t.integer "tag_id"
  end

  add_index "requests_tags", ["request_id", "tag_id"], :name => "index_requests_tags_on_request_id_and_tag_id"
  add_index "requests_tags", ["tag_id", "request_id"], :name => "index_requests_tags_on_tag_id_and_request_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "schools", ["description"], :name => "index_schools_on_description"
  add_index "schools", ["name"], :name => "index_schools_on_name"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags_videos", :id => false, :force => true do |t|
    t.integer "video_id"
    t.integer "tag_id"
  end

  add_index "tags_videos", ["tag_id", "video_id"], :name => "index_tags_videos_on_tag_id_and_video_id"
  add_index "tags_videos", ["video_id", "tag_id"], :name => "index_tags_videos_on_video_id_and_tag_id"

  create_table "topics", :force => true do |t|
    t.integer  "community_id"
    t.integer  "school_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.string   "name"
    t.boolean  "terms"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.text     "html_embed_for_video"
    t.time     "running_time"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "videos", ["description"], :name => "index_videos_on_description"
  add_index "videos", ["title"], :name => "index_videos_on_title"

  create_table "votes", :force => true do |t|
    t.integer "voter_id"
    t.integer "votable_id"
    t.string  "votable_type"
    t.string  "voter_type"
    t.integer "value"
  end

  add_index "votes", ["votable_id"], :name => "index_votes_on_votable_id"
  add_index "votes", ["voter_id"], :name => "index_votes_on_voter_id"

end
