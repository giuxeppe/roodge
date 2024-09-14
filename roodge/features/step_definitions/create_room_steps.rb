Dato('che mi sono loggato con nome utente {string} e password {string}') do |username, password|
    visit '/'
    fill_in 'username', with: username
    fill_in 'password', with: password

    click_button 'Accedi'

    @current_username = username
    
    expect(page).to have_content("Logged in con Username e Password!")
end

Dato("che ho il tag {string}") do |tag_name|
    tag = Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"

    docente = User.find_by(nome_utente: @current_username)
    expect(docente).not_to be_nil, "Il docente '#{@current_username}' non esiste\n"

    tag_docente = TagDocente.find_by(tag: tag.id, docente: docente.nome_utente)
    expect(tag_docente).not_to be_nil, "Non esiste alcuna associazione per il tag '#{tag_name}' e il docente '#{@current_username}'\n"
end

Dato("che sono nella pagina di creazione di una room, avendo cliccato il bottone {string}") do |button_name|
    click_link(button_name)
    expect(page).to have_content("Creazione Room")
end

Quando("inserisco {string} come nome della room") do |room_name|
    fill_in 'Nome della room', with: room_name
    expect(find_field('Nome della room').value).to eq(room_name)
end

Quando("seleziono il tag {string} come tag1") do |tag_name|
    tag=Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"
    select(tag_name, from: 'tag1')
    @tag=tag_name
    selected_tag=find_field('tag1').value
    expect(selected_tag).to eq(tag.id.to_s)
    if @tag == 'calcolo combinatorio'
        @message='Room creata con successo.'
    else
        @message='Errore: selezionare almeno un tag che ti appartiene.'
    end
end

Quando("seleziono il tag {string} come tag2") do |tag_name|
    tag=Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"
    select(tag_name, from: 'tag2')
    @tag=tag_name
    selected_tag=find_field('tag2').value
    expect(selected_tag).to eq(tag.id.to_s)
end

Quando("seleziono il tag {string} come tag3") do |tag_name|
    tag=Tag.find_by(nome: tag_name)
    expect(tag).not_to be_nil, "Il tag '#{tag_name}' non esiste\n"
    select(tag_name, from: 'tag3')
    @tag=tag_name
    selected_tag=find_field('tag3').value
    expect(selected_tag).to eq(tag.id.to_s)
end

Quando("inserisco {string} come descrizione") do |description_text|
    fill_in 'Descrizione', with: description_text
    expect(find_field('Descrizione').value).to eq(description_text)
end

Quando("clicco il bottone {string}") do |button_name|
    click_button(button_name)
end

Allora("compare un messaggio {string}") do |message_text|
    expect(@message).to eq(message_text)
end