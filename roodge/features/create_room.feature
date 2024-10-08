#language: it

Funzionalità: Creazione della room

    US: Come docente voglio creare una room che abbia almeno un tag in comune con i miei

Contesto: Il docente ha un account, ha effettuato l'accesso ed è nella pagina di creazione delle room
Dato che mi sono loggato con nome utente "ALESSIO_DOC" e password "PY/4PcqE"
Dato che ho il tag "calcolo combinatorio"
Dato che sono nella pagina di creazione di una room, avendo cliccato il bottone "CREA UNA ROOM"

Scenario: Il docente crea una room con successo
Quando inserisco "Room per il test" come nome della room
Quando seleziono il tag "calcolo combinatorio" come tag1
Quando seleziono il tag "trigonometria" come tag2
Quando seleziono il tag "risorgimento" come tag3
Quando inserisco "Prova descrizione" come descrizione
Quando clicco il bottone "Avanti"
Allora compare un messaggio "Room creata con successo."

Scenario: Il docente non riesce a creare una room
Quando inserisco "Room per il test errore" come nome della room
Quando seleziono il tag "storia romana" come tag1
Quando seleziono il tag "psicologia" come tag2
Quando seleziono il tag "teologia" come tag3
Quando inserisco "Prova descrizione" come descrizione
Quando clicco il bottone "Avanti"
Allora compare un messaggio "Errore: selezionare almeno un tag che ti appartiene."