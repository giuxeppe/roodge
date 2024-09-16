#language: it

Funzionalità: Approvazione materiale 

    US: Come docente competente, voglio poter approvare il materiale di un non docente competente in una room

Contesto: Il docente competente ha un account, ha effettuato l'accesso ed è nella pagina della room
Dato che mi sono precedentemente loggato con nome utente "alerossi" e password "P562NDj!"
Dato che ho associato il tag "analisi di mercato"
Dato che mi trovo nella room "Bilanci"
Dato che la room "Bilanci" ha associato il tag "analisi di mercato"
Dato che è presente un materiale non approvato il cui proprietario è "fra_bianchi00" con titolo "Studio del bilancio di una azienda"

Scenario: Il docente competente approva il materiale cliccando il bottone
Quando clicco sul bottone "Approva materiale"
Allora dovrebbe comparire una spunta verde
Allora dovrei vedere un flash con scritto "Materiale approvato con successo!"
Allora il tasto "Approva materiale" non ci deve più essere