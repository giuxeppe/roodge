# language: it

Funzionalità: Approvazione materiale

US: Come docente competente, voglio poter approvare il materiale di un non docente competente in una room

Contesto: Il docente competente ha un account, ha effettuato l'accesso ed è nella pagina della room
Dato che mi sono precedentemente registrato e sono un docente con nome utente "alerossi"
E ho associato il tag "analisi di mercato"
E mi trovo nella room "Bilanci"
E la room "Bilanci" ha associato il tag "analisi di mercato"
E è presente un materiale non approvato il cui proprietario è fra_bianchi00
E fra_bianchi00 non è un docente competente
E è presente un materiale approvato il cui proprietario è riccardo_mantegazza

Scenario: Il docente competente approva un materiale non ancora approvato
Quando clicco sul tasto "Approva materiale" nella sezione del materiale di fra_bianchi00
Allora dovrebbe comparire una spunta verde sul lato destro del materiale di fra_bianchi00
E dovrei vedere un flash con scritto "Materiale approvato con successo!"
E il tasto "Approva materiale" non dovrebbe più essere cliccabile
E al posto di "Approva materiale" dovrebbe esserci scritto "Materiale già approvato"

Scenario: Il docente competente tenta di approvare un materiale già approvato
Quando clicco sul tasto "Approva materiale" nella sezione del materiale di riccardo_mantegazza
Allora non dovrebbe succedere nulla
