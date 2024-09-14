Dato('che mi sono precedentemente loggato con nome utente {string} e password {string}') do |username, password|
    visit '/'
    fill_in 'username', with: username
    fill_in 'password', with: password

    click_button 'Accedi'

    @current_username = username
    
    expect(page).to have_content("Logged in con Username e Password!")
end

Dato("che ho associato il tag {string}") do |tag_name|
    tag = Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"

    docente = User.find_by(nome_utente: @current_username)
    expect(docente).not_to be_nil, "Il docente '#{@current_username}' non esiste\n"

    tag_docente = TagDocente.find_by(tag: tag.id, docente: docente.nome_utente)
    expect(tag_docente).not_to be_nil, "Non esiste alcuna associazione per il tag '#{tag_name}' e il docente '#{@current_username}'\n"
end

Dato("che sono nella pagina di creazione di una room, avendo cliccato il bottone {string}") do |button_name|
    click_button(button_name)
    expect(page).to have_content("Creazione Room")
end

Quando("inserisco {string} come nome della room") do |room_name|
    fill_in 'nome', with: room_name
end

Quando("seleziono il tag {string} come tag1") do |tag_name|
    select(tag_name, from: 'tag1')
    @tag=tag_name
    if @tag == 'analisi di mercato'
        @message='Room creata con successo.'
    else
        @message='Errore: selezionare almeno un tag che ti appartiene.'
end

Quando("seleziono il tag {string} come tag2") do |tag_name|
    select(tag_name, from: 'tag2')
end

Quando("seleziono il tag {string} come tag3") do |tag_name|
    select(tag_name, from: 'tag3')
end

Quando("inserisco {string} come descrizione") do |description_text|
    fill_in 'description', with: description_text
end

Quando("clicco il bottone {string}") do |button_name|
    click_button(button_name)
end

Allora("compare un messaggio {string}") do |message_text|
    expect(@message).to eq(message_text)
end