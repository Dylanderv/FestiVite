------------------------------------------------------------
--      Script MySQL.
------------------------------------------------------------


------------------------------------------------------------
-- Table: Utilisateur
------------------------------------------------------------

CREATE TABLE Utilisateur(
        Adresse_mail Varchar (255) NOT NULL ,
        Mot_de_passe Varchar (42) NOT NULL,
        Nom          Varchar (255) ,
        Prenom       Varchar (255) ,
        DateNaissance    date NOT NULL,
        Adresse      Varchar (255) ,
        PRIMARY KEY (Adresse_mail )
)----ENGINE=InnoDB;
;


--------------------------------------------------------------
-- Table: Utilisateur professionnel
--------------------------------------------------------------

CREATE TABLE Utilisateur_professionnel(
        IdProfessionnel     numeric(9) NOT NULL ,
        Mot_de_passe        Varchar (255) NOT NULL ,
        Adresse             Varchar (255) NOT NULL ,
        Numero_de_telephone Varchar (14) ,
        Nom_Societe         Varchar (255) NOT NULL ,
        Date_Creation       Date NOT NULL ,
        Adresse_mail        Varchar (255) NOT NULL ,
        PRIMARY KEY (IdProfessionnel )
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: Soirée
--------------------------------------------------------------

CREATE TABLE Soiree(
        IdSoiree   numeric(9) NOT NULL ,
        Nom           Varchar (255) ,
        Adresse       Varchar (255) NOT NULL ,
        Prix          Int ,
        Type          Varchar (255) ,
        Date_Creation Date NOT NULL ,
        Adresse_mail  Varchar (255)
          CONSTRAINT FK_Soiree_Adresse_mail
          REFERENCES Utilisateur(Adresse_mail),
        PRIMARY KEY (IdSoiree )
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: Offres
--------------------------------------------------------------

CREATE TABLE Offre(
        IdOffre         numeric(9) NOT NULL ,
        Type            Varchar (255) ,
        Prix            Int NOT NULL ,
        Description     Varchar NOT NULL ,
        IdProfessionnel Int
          CONSTRAINT FK_Offres_IdProfessionnel
          REFERENCES Utilisateur_professionnel(IdProfessionnel),
        PRIMARY KEY (IdOffre )
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: Lieu
--------------------------------------------------------------

CREATE TABLE Lieu(
        IdLieu       numeric(9) NOT NULL ,
        TarifHoraire numeric(6) ,
        Prix_Initial numeric(6) ,
        Description  Varchar(8192) ,
        PRIMARY KEY (IdLieu )
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: Invité Classique
--------------------------------------------------------------

CREATE TABLE Invite(
        Adresse_mail Varchar (255) NOT NULL
          CONSTRAINT FK_Invite_Classique_Adresse_mail
          REFERENCES Utilisateur(Adresse_mail),
        IdSoiree  numeric(9) NOT NULL
          CONSTRAINT FK_Invite_Classique_IdClassique
          REFERENCES Soiree(IdSoiree),
        PRIMARY KEY (Adresse_mail ,IdSoiree )
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: est ami
--------------------------------------------------------------

CREATE TABLE Est_Ami(
        Adresse_mail_1 Varchar (255) NOT NULL
          CONSTRAINT FK_est_ami_Adresse_mail_1
          REFERENCES Utilisateur(Adresse_mail),
        Adresse_mail_2 Varchar (255) NOT NULL
          CONSTRAINT FK_est_ami_Adresse_mail_2
          REFERENCES Utilisateur(Adresse_mail),
        PRIMARY KEY (Adresse_mail_1 ,Adresse_mail_2)
)--ENGINE=InnoDB;
;

--------------------------------------------------------------
-- Table: Classique Offre
--------------------------------------------------------------

CREATE TABLE Select_Offre(
        IdSoiree numeric(9) NOT NULL
          CONSTRAINT FK_Classique_Offre_IdClassique
          REFERENCES Soiree(IdSoiree),
        IdOffre     numeric(9) NOT NULL
          CONSTRAINT FK_Classique_Offre_IdOffre
          REFERENCES Offre(IdOffre),
        PRIMARY KEY (IdSoiree ,IdOffre )
)--ENGINE=InnoDB;
;



--------------------------------------------------------------
-- Table: Select_Lieu
--------------------------------------------------------------

CREATE TABLE Select_Lieu(
        IdSoiree numeric(9) NOT NULL
          CONSTRAINT FK_Classique_Lieu_IdSoiree
          REFERENCES Soiree(IdSoiree),
        IdLieu      numeric(9) NOT NULL
          CONSTRAINT FK_Select_Lieu_IdLieu
          REFERENCES Lieu(IdLieu),
        PRIMARY KEY (IdSoiree ,IdLieu )
)--ENGINE=InnoDB;
;


--ALTER TABLE Soiree ADD CONSTRAINT FK_Soiree_Adresse_mail FOREIGN KEY (Adresse_mail) REFERENCES Utilisateur(Adresse_mail);
--ALTER TABLE Offre ADD CONSTRAINT FK_Offre_IdProfessionnel FOREIGN KEY (IdProfessionnel) REFERENCES Utilisateur_professionnel(IdProfessionnel);
--ALTER TABLE Lieu ADD CONSTRAINT FK_Lieu_IdProfessionnel FOREIGN KEY (IdProfessionnel) REFERENCES Utilisateur_professionnel(IdProfessionnel);
--ALTER TABLE Invite ADD CONSTRAINT FK_Invite_Adresse_mail FOREIGN KEY (Adresse_mail) REFERENCES Utilisateur(Adresse_mail);
--ALTER TABLE Invite ADD CONSTRAINT FK_Invite_IdSoiree FOREIGN KEY (IdSoiree) REFERENCES Soiree(IdSoiree);
--ALTER TABLE Est_Ami ADD CONSTRAINT FK_Est_Ami_Adresse_mail FOREIGN KEY (Adresse_mail) REFERENCES Utilisateur(Adresse_mail);
--ALTER TABLE Est_Ami ADD CONSTRAINT FK_Est_Ami_Adresse_mail_Utilisateur FOREIGN KEY (Adresse_mail_Utilisateur) REFERENCES Utilisateur(Adresse_mail);
--ALTER TABLE Select_Offre ADD CONSTRAINT FK_Select_Offre_IdSoiree FOREIGN KEY (IdSoiree) REFERENCES Soiree(IdSoiree);
--ALTER TABLE Select_Offre ADD CONSTRAINT FK_Select_Offre_IdOffre FOREIGN KEY (IdOffre) REFERENCES Offre(IdOffre);
--ALTER TABLE Select_Lieu ADD CONSTRAINT FK_Select_Lieu_IdSoiree FOREIGN KEY (IdSoiree) REFERENCES Soiree(IdSoiree);
--ALTER TABLE Select_Lieu ADD CONSTRAINT FK_Select_Lieu_IdLieu FOREIGN KEY (IdLieu) REFERENCES Lieu(IdLieu);
