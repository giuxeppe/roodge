# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_08_16_092828) do

  create_table "bans", force: :cascade do |t|
    t.string "utente", null: false
    t.string "room", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commentis", force: :cascade do |t|
    t.integer "codice", null: false
    t.string "room", null: false
    t.string "proprietario", null: false
    t.string "titolo", null: false
    t.string "commentatore", null: false
    t.string "testo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cronologia_visitates", force: :cascade do |t|
    t.string "utente", null: false
    t.integer "numero_ord", default: 0, null: false
    t.string "room", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materiales", force: :cascade do |t|
    t.string "titolo", null: false
    t.string "proprietario", null: false
    t.string "room", null: false
    t.string "descrizione"
    t.string "allegato"
    t.integer "approvato", default: 0, null: false
    t.integer "prezzo", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risposta", force: :cascade do |t|
    t.integer "codice", null: false
    t.string "commento", null: false
    t.string "room", null: false
    t.string "proprietario", null: false
    t.string "titolo", null: false
    t.string "utente", null: false
    t.string "testo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "codice", null: false
    t.string "nome", null: false
    t.string "creatore", null: false
    t.integer "post_utenti", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "studente_rooms", force: :cascade do |t|
    t.string "studente", null: false
    t.string "room", null: false
    t.integer "approvazioni", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_docentes", force: :cascade do |t|
    t.string "docente", null: false
    t.string "tag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_rooms", force: :cascade do |t|
    t.string "room", null: false
    t.string "tag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome_utente", null: false
    t.string "nome", null: false
    t.string "cognome", null: false
    t.string "cf", null: false
    t.date "data_nascita", null: false
    t.string "citta_nascita", null: false
    t.string "indirizzo_residenza", null: false
    t.string "mail", null: false
    t.string "ruolo", default: "s", null: false
    t.string "propic", null: false
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nome_utente"], name: "index_users_on_nome_utente", unique: true
  end

end
