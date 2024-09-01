class User < ApplicationRecord
  has_secure_password
  has_one_attached :propic
  
  # Validazioni per garantire che i campi siano compilati correttamente
  validates :nome_utente, presence: true, uniqueness: true
  validates :nome, :cognome, :cf, :data_nascita, :citta_nascita, :indirizzo_residenza, :mail, :ruolo, :propic, presence: true
  validates :mail, format: { with: /\A[A-Za-z0-9\.]+@[A-Za-z0-9]+\.[A-Za-z]{2,}\z/ }
  validates :cf, format: { with: /\A[A-Za-z]{6}[0-9]{2}[A-Za-z][0-9]{2}[A-Za-z][0-9]{3}[A-Za-z]\z/ }
  validates :ruolo, inclusion: { in: ['s', 'd'] }
end