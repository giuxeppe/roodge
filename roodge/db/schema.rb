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

ActiveRecord::Schema.define(version: 2024_09_14_180312) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bans", force: :cascade do |t|
    t.string "utente", null: false
    t.string "room", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commentis", force: :cascade do |t|
    t.string "room", null: false
    t.string "proprietario", null: false
    t.string "commentatore", null: false
    t.string "testo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "materiale"
    t.string "materiale"
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
    t.decimal "prezzo", precision: 10, scale: 2, default: "0.0", null: false
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
    t.string "nome", null: false
    t.string "creatore", null: false
    t.integer "post_utenti", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.string "tag1"
    t.string "tag2"
    t.string "tag3"
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

  create_table "user_providers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "fullname", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "avatar_url", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.datetime "expires_at"
    t.index ["email"], name: "index_user_providers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_providers_on_reset_password_token", unique: true
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
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest", null: false
    t.string "tag1"
    t.string "tag2"
    t.string "tag3"
    t.index ["nome_utente"], name: "index_users_on_nome_utente", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
