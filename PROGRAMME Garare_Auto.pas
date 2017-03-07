PROGRAMME Garage_Auto

CONST	
	MaxGarage=2
	MaxVoiture=15

TYPE
	Garage = ENREGISTREMENT
		nom:CHAINE
		adresse:Information
		CapVoiture:ENTIER
	FINENREGISTREMENT

TYPE
	information = ENREGISTREMENT
		NumVoie:ENTIER
		voie:CHAINE
		CP:ENTIER
		Ville:CHAINE
		pays:CHAINE
		NumTel:ENTIER
		email:CHAINE

	FINENREGISTREMENT

TYPE
	voiture = ENREGISTREMENT
		Marque:brand
		modele:CHAINE
		Energie:huile
		PuisFiscale:ENTIER
		PuisDYN:ENTIER
		couleur:CHAINE
		options:CHAINE
		AnneeMod:ENTIER
		PrixMod:ENTIER
		argus:ENTIER
		DateCircu:date
		Age:ENTIER
		plaque:CHAINE
	FINENREGISTREMENT

TYPE	brand=(Mercedez,Audi,BMW,Porsche,Chevrolet)

TYPE	huile=(Essence,Diesel,GPL,Electrique,Hybride)

TYPE
	date = ENREGISTREMENT
		jour:ENTIER
		mois:ENTIER
		annee:ENTIER
	FINENREGISTREMENT

TYPE
	TabGarage=TABLEAU [1..MaxGarage] de Garage
	TabVoiture=TABLEAU [1..MaxVoiture] de voiture


Procédure Init_Garage(VAR TabGar:TabGarage)

VAR i:ENTIER

DEBUT
	
	POUR i DE 1 A MaxGarage FAIRE
		ECRIRE "Saisir les informations du garage "+i

		ECRIRE "Quel est le nom du garage ?"
		LIRE TabGar[i].nom

		
		ECRIRE "Ou se trouve le garage ?"

		ECRIRE "Dans quel pays est le garage ?"
		LIRE TabGar[i].information.pays
		
		ECRIRE "Quelle est la voie"
		LIRE TabGar[i].information.voie

		ECRIRE "Quel est le numéro de voie"
		LIRE TabGar[i].information.NumVoie

		ECRIRE "Dans quelle ville est le garage ?"
		LIRE TabGar[i].information.Ville

		ECRIRE "Entrer le code postal"
		LIRE TabGar[i].information.CP

		ECRIRE "Saisir le numéro de téléphone"
		LIRE TabGar[i].information.NumTel

		ECRIRE "Saisir l'email"
		LIRE TabGar[i].information.email


		REPETER
		ECRIRE "Combien de voiture possède le garage ? (Min 6, max 15)"
		LIRE TabGar[i].CapVoiture
		JUSQU'A (TabGar[i].CapVoiture < 16) ET (TabGar[i].CapVoiture > 5)


	FINPOUR

FINPROCEDURE

Prodécure Init_Voiture(VAR TabVoi:TabVoiture)

VAR inOut:ENTIER
	ChoixGar:ENTIER

DEBUT

REPETER
	
	ECRIRE "Voulez vous créer les voitures d'un garage ? (1 oui. 0 Quitter)"
	LIRE InOut

	REPETER
		ECRIRE "Choisissez le garage où créer la voiture. (1 ou 2)"
		LIRE ChoixGar	
	JUSQU'A (ChoixGar=1) OU (ChoixGar=2)

	POUR i DE 1 A TabGar[ChoixGar].CapVoiture FAIRE

		ECRIRE "Quelle est la marque de la voiture ?"
		LIRE TabVoi[i].Marque

		ECRIRE "Quel est le modèle"
		LIRE TabVoi[i].modele

		ECRIRE "A quoi tourne-t'elle ?"
		LIRE TabVoi[i].Energie

		ECRIRE "Quelle est sa puissance fiscale ?"
		LIRE TabVoi[i].PuisFiscale

		ECRIRE "Quelle est sa puissance DYN"
		LIRE TabVoi[i].PuisDYN

		ECRIRE "Quelles sont les options ? (Séparer les options par #)"
		LIRE TabVoi[i].options

		ECRIRE "Quelle est la couleur de la voiture ?"
		LIRE TabVoi[i].couleur

		ECRIRE "Quelle est l'année du modèle ?"
		LIRE TabVoi[i].AnneeMod

		ECRIRE "Quelle est le prix de la voiture à neuve ?"
		LIRE TabVoi[i].PrixMod

		TabVoi[i].argus <- CalculArgus(voiture,i) // Fonction qui calcule la Cote argus

		ECRIRE "Quelle est le jour de mise en circulation ?"
		LIRE TabVoi[i].DateCircu.jour
		ECRIRE "Quelle est le mois de mise en circulation ?"
		LIRE TabVoi[i].DateCircu.mois
		ECRIRE "Quelle est l'année de mise en circulation ?"
		LIRE TabVoi[i].DateCircu.annee

		TabVoi[i].Age <- Aujourdhui - TabVoi[i].AnneeMod // Calcul l'age de la voiture en fonction de la date de jour et de la date de l'année du modèle

		TabVoi[i].plaque <- Init_Plaque // Fonction qui permet de créer une plaque d'imatriculation


JUSQU'A InOUT=0