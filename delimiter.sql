

DELIMITER @
DROP PROCEDURE if exists changeEtat;
CREATE PROCEDURE changeEtat()
LANGUAGE SQL
DETERMINISTIc
BEGIN 
		ALTER TABLE commande
		MODIFY etat varchar(1);
		insert into commande values(10193, 17, 60, '2008/11/10', '2008/11/20', 250.00 , 50.00 , '0');
		UPDATE commande
		SET etat = 'P'
		WHERE etat = '1';
		UPDATE commande
		SET etat = 'L'
		WHERE etat = '0';		
END;
@
DELIMITER ;





DELIMITER @
DROP PROCEDURE if exists creerNbLigne;
CREATE PROCEDURE creerNbLigne()
LANGUAGE SQL
DETERMINISTIc
BEGIN 
	ALTER TABLE commande
	ADD nBLigne INT(3);
	UPDATE commande
	SET nbLigne =(SELECT COUNT(numero)
	FROM ligne_commande
	where ligne_commande.numero=commande.numero);
END;
@
DELIMITER ;




DELIMITER @
DROP PROCEDURE if exists currentDate;
CREATE PROCEDURE currentDate()
LANGUAGE SQL
DETERMINISTIC
BEGIN 
	DECLARE jour_fr varchar(15) ;
	CASE(dayname(current_date))	
		WHEN 'Monday' Then set jour_fr= 'lundi';
		WHEN 'Thusday' Then set jour_fr= 'mardi';
		WHEN 'Wednesday' Then set jour_fr= 'mercredi';
		WHEN 'Thursday' Then set jour_fr= 'jeudi';
		WHEN 'Friday' Then set jour_fr= 'vendredi';
		WHEN 'Saturday' Then set jour_fr= 'samedi';
		WHEN 'Sunday' Then set jour_fr= 'dimanche';
	END CASE;
	SELECT CONCAT('Nous sommes : ' , jour_fr);
END;
@
DELIMITER ;





DELIMITER @
DROP PROCEDURE if exists nomFonction;
CREATE FUNCTION  nomFonction(uneDate DATE)
RETURNS VARCHAR(20)
LANGUAGE SQL
DETERMINISTIC
BEGIN 
	DECLARE jour_fr varchar(15) ;
	
	SELECT CONCAT('Nous sommes : ' , jour_fr);
END;
@
DELIMITER ;




1) ecrire une  procedure qui affiche "paire" ou "impaire"

DELIMITER @
DROP PROCEDURE if exists jourPaireImpaire;
CREATE PROCEDURE jourPaireImpaire()
LANGUAGE SQL
DETERMINISTIC
BEGIN 
	DECLARE nbJour VARCHAR(15);
	IF DAYOFMONTH(current_date) mod 2=1
		THEN set nbJour ='impair';
	ELSE 
		 set nbjour='pair';
	END IF;
		SELECT CONCAT ('nous somme un jour : ',nbJour);
	END;
@
DELIMITER ;


DELIMITER @
DROP FUNCTION if exists afficherPaireImpaire;
CREATE FUNCTION afficherPaireImpaire(maDate DATE)
RETURNS VARCHAR(6)
LANGUAGE SQL
DETERMINISTIC
BEGIN 
	DECLARE res VARCHAR(6);
	DECLARE j INTEGER;
	SET j=DAYOFMONTH(maDate);
	IF j%2=0 THEN SET res='pair';
	ELSE SET res='impaire';
	END IF;
	RETURN res;
	END;
@
DELIMITER ;








