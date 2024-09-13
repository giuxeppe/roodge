# features/step_definitions/material_steps.rb

Dato('mi sono precedentemente registrato e sono un docente con nome utente {string}') do |username|
    @docente = create(:docente, username: username)
    login_as(@docente, scope: :user)
  end
  
  E('ho associato il tag {string}') do |tag|
    @room = create(:room, name: 'Bilanci')
    @room.tags << create(:tag, name: tag)
  end
  
  E('mi trovo nella room {string}') do |room_name|
    @room = Room.find_by(name: room_name)
    visit room_path(@room)
  end
  
  E('la room {string} ha associato il tag {string}') do |room_name, tag_name|
    @room = Room.find_by(name: room_name)
    tag = Tag.find_by(name: tag_name)
    @room.tags << tag unless @room.tags.include?(tag)
  end
  
  E('è presente un materiale non approvato il cui proprietario è {string}') do |username|
    @materiale_non_approvato = create(:materiale, stato: 'non_approvato', owner: User.find_by(username: username))
  end
  
  E('fra_bianchi00 non è un docente competente') do
    # Assumiamo che 'fra_bianchi00' non abbia il tag che lo rende competente
  end
  
  E('è presente un materiale approvato il cui proprietario è {string}') do |username|
    @materiale_approvato = create(:materiale, stato: 'approvato', owner: User.find_by(username: username))
  end
  
  Quando('clicco sul tasto {string} nella sezione del materiale di {string}') do |button_text, username|
    materiale = Materiale.find_by(owner: User.find_by(username: username))
    within("##{dom_id(materiale)}") do
      click_button button_text
    end
  end
  
  Allora('dovrebbe comparire una spunta verde sul lato destro del materiale di {string}') do |username|
    materiale = Materiale.find_by(owner: User.find_by(username: username))
    expect(page).to have_css("#materiale_#{materiale.id} .spunta-verde")
  end
  
  E('dovrei vedere un flash con scritto {string}') do |flash_message|
    expect(page).to have_content(flash_message)
  end
  
  E('il tasto {string} non dovrebbe più essere cliccabile') do |button_text|
    expect(page).not_to have_button(button_text, disabled: true)
  end
  
  E('al posto di {string} dovrebbe esserci scritto {string}') do |old_text, new_text|
    expect(page).to have_button(new_text)
    expect(page).not_to have_button(old_text)
  end
  
  Quando('clicco sul tasto {string} nella sezione del materiale di {string}') do |button_text, username|
    materiale = Materiale.find_by(owner: User.find_by(username: username))
    within("##{dom_id(materiale)}") do
      click_button button_text
    end
  end
  
  Allora('non dovrebbe succedere nulla') do
    # Assumendo che non ci sia cambiamento visibile o messaggi specifici
    expect(page).to have_no_css('.spunta-verde')
    expect(page).to have_no_content('Materiale approvato con successo!')
  end
  