# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100128141052) do

  create_table "aankoops", :force => true do |t|
    t.integer  "product_id"
    t.integer  "klant_id"
    t.float    "prijs"
    t.datetime "datum"
    t.boolean  "betaald"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", :force => true do |t|
    t.integer  "product_id"
    t.string   "genre"
    t.integer  "nummer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commentaars", :force => true do |t|
    t.integer  "product_id"
    t.integer  "klant_id"
    t.text     "text"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "titel"
    t.string   "prijs"
    t.date     "jaar"
    t.string   "artiest"
    t.string   "genre"
    t.string   "lengte"
    t.string   "coverart"
    t.integer  "album_id"
    t.integer  "tracknr"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uitgelichts", :force => true do |t|
    t.integer  "album_id"
    t.text     "omschrijving"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "remember_token"
    t.string   "crypted_password",          :limit => 40
    t.string   "password_reset_code",       :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "activation_code",           :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                                   :default => "passive"
    t.string   "voornaam"
    t.string   "achternaam"
    t.boolean  "geslacht"
    t.date     "geboortedatum"
    t.string   "creditcard"
    t.string   "postcode"
    t.string   "huisnummer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
