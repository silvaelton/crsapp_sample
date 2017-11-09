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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171109134302) do

  create_table "candidates", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "rg"
    t.integer  "gender"
    t.date     "born"
    t.string   "cpf"
    t.string   "uf"
    t.string   "address"
    t.string   "burgh"
    t.string   "city"
    t.string   "cep"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "email"
    t.string   "fantasy_name"
    t.string   "social_reason"
    t.string   "cnpj"
    t.string   "password"
    t.boolean  "terms_use"
    t.text     "observation"
    t.string   "document_one"
    t.string   "document_two"
    t.string   "document_number"
    t.integer  "status",          default: 0
    t.string   "token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "consults", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "content"
    t.integer  "situation",  default: 0
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "navs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "label"
    t.string   "url"
    t.integer  "page_id"
    t.integer  "order",         default: 0
    t.boolean  "active",        default: true
    t.boolean  "open_new_page", default: false
    t.integer  "page_type",     default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "participation_documents", force: :cascade do |t|
    t.integer  "participation_id"
    t.integer  "participation_type_id"
    t.string   "document"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "participation_teams", force: :cascade do |t|
    t.integer  "participation_id"
    t.string   "name"
    t.string   "job"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "participation_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.boolean  "closed",       default: false
    t.datetime "closed_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "mini_description"
    t.integer  "home_page_id"
    t.date     "start"
    t.date     "end"
    t.date     "subscribe_start"
    t.date     "subscribe_end"
    t.boolean  "allow_subscribe",  default: false
    t.date     "consult_start"
    t.date     "consult_end"
    t.boolean  "allow_consult",    default: false
    t.integer  "situation",        default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "question_ones", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "answer"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "question_twos", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "cpf"
    t.string   "name"
    t.boolean  "term_use"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "active",     default: true
    t.integer  "situation",  default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
