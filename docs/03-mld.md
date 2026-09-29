----------------------
MVP
----------------------

LIEU
-----------
id_lieu PK,
nom
adresse

EVENEMENT
-----------
id_event PK,
nom
regle
description
date_event
id_lieu FK → LIEU(id_lieu)
(BONUS) auteur_id FK → PARTICIPANT(id_participant)

PARTICIPANT
-----------
id_participant PK
email UNIQUE


----------------------
BONUS
----------------------

USER
-----------
id_user PK
role
nom 
email UNIQUE
id_user FK → PARTICIPANT(id_participant)

PARTICIPER
-----------
id_event PK
id_event FK → PARTICIPANT(id_participant),
id_event FK → EVENEMENT(id_event)
