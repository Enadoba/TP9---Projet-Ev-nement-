-- ⚠️ RELATION(S) NON CONVERTIE(S) EN FOREIGN KEY (colonnes introuvables) :

--   • ? ↔ ?

--   • ? ↔ ?

--   • ? ↔ ?

--   • ? ↔ ?

-- Ces relations existent dans le diagramme mais ne sont pas exprimées ci-dessous.



CREATE EXTENSION IF NOT EXISTS "pgcrypto"; -- nécessaire pour gen_random_uuid()



CREATE TABLE "user" (
  id_user INT NOT NULL,
  role ENUM NOT NULL,
  nom VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (id_user)
);

CREATE TABLE lieu (
  id_lieu INT NOT NULL,
  nom VARCHAR(50) NOT NULL,
  adresse VARCHAR(150) NOT NULL,
  PRIMARY KEY (id_lieu)
);

CREATE TABLE evenement (
  id_event INT NOT NULL,
  nom VARCHAR(100) NOT NULL,
  regle TEXT,
  description TEXT,
  date_event DATE NOT NULL,
  auteur_id INT NOT NULL,
  id_lieu INT,
  PRIMARY KEY (id_event),
  CONSTRAINT fk_evenement_user FOREIGN KEY (auteur_id) REFERENCES "user"(id_user) ON DELETE CASCADE,
  CONSTRAINT fk_evenement_lieu FOREIGN KEY (id_lieu) REFERENCES lieu(id_lieu) ON DELETE CASCADE
);

CREATE TABLE participer (
  id_event INT NOT NULL,
  PRIMARY KEY (id_event),
  CONSTRAINT fk_participer_user FOREIGN KEY (id_event) REFERENCES "user"(id_user) ON DELETE CASCADE,
  CONSTRAINT fk_participer_evenement FOREIGN KEY (id_event) REFERENCES evenement(id_event) ON DELETE CASCADE
);

CREATE TABLE nouvelle_table (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid()
);