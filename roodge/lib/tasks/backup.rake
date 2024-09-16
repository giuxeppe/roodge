namespace :db do
  desc "Create a backup of the SQLite3 database"
  task backup: :environment do
    # Nome del file di backup con timestamp
    filename = "backup_#{Time.now.strftime('%Y%m%d%H%M%S')}.sqlite3"
    backup_path = Rails.root.join('db', 'backups', filename)

    # Crea la directory di backup se non esiste
    FileUtils.mkdir_p(File.dirname(backup_path))

    # Ottieni il percorso del database corrente
    db_config = Rails.configuration.database_configuration[Rails.env]
    db_file = db_config['database']

    # Comando per eseguire il backup
    cmd = "sqlite3 #{db_file} .dump > #{backup_path}"
    puts "Eseguendo: #{cmd}"
    system(cmd)

    puts "Backup completato: #{backup_path}"
  end
end
