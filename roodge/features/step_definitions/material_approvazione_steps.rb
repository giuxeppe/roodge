# features/step_definitions/material_steps.rb

Dato("che mi sono precedentemente loggato con nome utente {string} e password {string}") do |username, password|
    visit '/index'
    
    fill_in 'username', with: username
    fill_in 'password', with: password
    
    click_button 'Accedi'

    @current_username = username
    
    expect(page).to have_content("Loggato - Room Recenti")
end

Dato("che ho associato il tag {string}") do |tag_name|
    tag = Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"

    docente = Docente.find_by(nome_utente: @current_username)
    expect(docente).not_to be_nil, "Il docente '#{@current_username}' non esiste\n"

    tag_docente = TagDocente.find_by(tag: tag.id, docente: docente.nome_utente)
    expect(tag_docente).not_to be_nil, "Non esiste alcuna associazione per il tag '#{tag_name}' e il docente '#{@current_username}'\n"
end

Dato("che mi trovo nella room {string}") do |nome_room|
    click_link nome_room
    @current_room = nome_room
    expect(page).to have_content(nome_room)
end

Dato("che la room {string} ha associato il tag {string}") do |nome_room, nome_tag|
    tag = Tag.find_by(nome: nome_tag)
    expect(tag).not be_nil, "Il tag '#{nome_tag}' non esiste\n"

    room = Room.find_by(nome: nome_room)
    expect(room).not_to be_nil, "La room '#{nome_room}' non esiste\n"

    tag_room = TagRoom.find_by(room: room.nome, tag: tag.id)
    expect(tag_room).not_to be_nil, "La room '#{nome_room}' non ha associato il tag '#{nome_tag}'\n"
end

Dato("che è presente un materiale non approvato il cui proprietario è {string} con titolo {string}") do |nome_prop, titolo|
    expect(page).to have_content(titolo), "Il materiale con titolo '#{titolo}' non esiste\n"
    expect(page).to have_link(nome_prop), "Il proprietario '#{nome_prop}' non è presente nella pagina\n"
    expect(page).to have_button("Approva materiale"), "Il bottone 'Approva materiale' non esiste\n"
end


Quando("clicco sul bottone {string}") do |nome_bottone|
    click_button(nome_bottone)
end

Allora("dovrebbe comparire una spunta verde") do
    expect(page).to have_css('.green-pin', visible: true)
end

Allora("dovrei vedere un flash con scritto {string}") do |flash_text|
    expect(page).to have_selector('.alert.alert-info', text: flash_text)
end

Allora("il tasto {string} non ci deve più essere") do |button_text|
    expect(page).to have_no_button(button_text)
end