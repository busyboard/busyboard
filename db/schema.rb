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

ActiveRecord::Schema.define(:version => 20110912171919) do

  create_table "affaires", :force => true do |t|
    t.string   "reference"
    t.decimal  "total"
    t.string   "phase"
    t.boolean  "etat"
    t.datetime "date_debut"
    t.integer  "duree"
    t.boolean  "receptioner"
    t.string   "nom"
    t.integer  "phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "rue"
    t.integer  "numero"
    t.string   "ville"
    t.string   "pay"
    t.string   "fixe"
    t.string   "mobile"
    t.string   "autre"
    t.string   "email"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text     "note"
    t.integer  "affaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
