CREATE DATABASE API_PYTHON;
USE API_PYTHON;

/*
 * Create and config initial database.
 */

CREATE TABLE USER (
  ID             BIGINT(20)  NOT NULL AUTO_INCREMENT,
  USERNAME       VARCHAR(50) NOT NULL,
  FIRSTNAME      VARCHAR(50) NOT NULL,
  MIDDLEINITIALS VARCHAR(10)     NULL,
  LASTNAME       VARCHAR(50) NOT NULL,
  PASSWORD       VARCHAR(99) NOT NULL,
  GENDER         VARCHAR(1)      NULL,
  ACTIVE         VARCHAR(1)  NOT NULL,
  CONSTRAINT USER_PK PRIMARY KEY (ID),
  CONSTRAINT USER_UK UNIQUE KEY (USERNAME)
) ENGINE=InnoDB;

ALTER TABLE USER ADD INDEX ACTIVE_IDX (ACTIVE);

CREATE TABLE ELECTRONICADDRESSTYPE (
  ID          BIGINT(20)   NOT NULL AUTO_INCREMENT,
  ADDRESSTYPE VARCHAR(100) NOT NULL,
  ACTIVE      VARCHAR(1)   NOT NULL,
  CONSTRAINT ELECTRONICADDRESSTYPE_PK PRIMARY KEY (ID),
  CONSTRAINT ELECTRONICADDRESSTYPE_UK UNIQUE KEY (ADDRESSTYPE)
) ENGINE=InnoDB;

ALTER TABLE ELECTRONICADDRESSTYPE ADD INDEX ACTIVE_IDX (ACTIVE);

CREATE TABLE USERELECTRONICADDRESS (
  ID            BIGINT(20)   NOT NULL AUTO_INCREMENT,
  USERID        BIGINT(20)   NOT NULL,
  ADDRESSTYPEID BIGINT(20)   NOT NULL,
  ADDRESS       VARCHAR(400) NOT NULL,
  VISIBLE       VARCHAR(1)   NOT NULL,
  CONSTRAINT USERELECTRONICADDRESS_PK PRIMARY KEY (ID),
  CONSTRAINT USERELECTRONICADDRESS_UK UNIQUE KEY (USERID, ADDRESSTYPEID, ADDRESS)
) ENGINE=InnoDB;

ALTER TABLE USERELECTRONICADDRESS ADD CONSTRAINT USERELECTRONICADDRESS_USER_FK FOREIGN KEY (USERID) REFERENCES USER (ID) ON DELETE RESTRICT;
ALTER TABLE USERELECTRONICADDRESS ADD CONSTRAINT USERELECTRONICADDRESS_ELECTRONICADDRESSTYPE_FK FOREIGN KEY (ADDRESSTYPEID) REFERENCES ELECTRONICADDRESSTYPE (ID) ON DELETE RESTRICT;
ALTER TABLE USERELECTRONICADDRESS ADD INDEX ACTIVE_IDX (USERID);

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'E-MAIL' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'FACEBOOK' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'LINKEDIN' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'TWITTER' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'GOOGLE+' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'ABOUT.ME' ,'Y');

INSERT INTO ElectronicAddressType (Id ,AddressType ,Active)
                           VALUES ( 0 ,'INSTAGRAM' ,'Y');

/* Password is senha123 */
INSERT INTO USER VALUES ( 0     ,'SYSTEM' ,'SYSTEM' 
                         ,null  ,'ADMIN'  ,'sha256$Zy12okIT$0c64237f3b2ae892731a164098b3d56ab2412710c22da1f434cb086523b4ad5b'
                         ,null  ,'Y');

INSERT INTO USER VALUES ( 0     ,'JMICHEL' ,'JEAN' 
                         ,'J'   ,'MICHEL'  ,'sha256$Zy12okIT$0c64237f3b2ae892731a164098b3d56ab2412710c22da1f434cb086523b4ad5b'
                         ,'M'  ,'Y');

INSERT INTO UserElectronicAddress VALUES ( 0 ,1 ,1 /* E-mail */
                                          ,'sysadmin@collectionscatalog.com' ,'N');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,1 /* E-mail */
                                          ,'jeanjmichel@mail.com' ,'Y');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,2 /* Facebook */
                                          ,'jeanjmichel' ,'N');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,3 /* LinkedIn */
                                          ,'jeanjmichel' ,'Y');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,4 /* Twitter */
                                          ,'jeanjmichel' ,'Y');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,6 /* About.me */
                                          ,'jeanjmichel' ,'Y');

INSERT INTO UserElectronicAddress VALUES ( 0 ,2 ,7 /* Instagram */
                                          ,'jeanjmichel' ,'Y');

CREATE TABLE POMODOROACTIVITIES (
  ID            BIGINT(20)   NOT NULL AUTO_INCREMENT,
  USERID        BIGINT(20)   NOT NULL,
  ACTIVITY      VARCHAR(400) NOT NULL,
  CYCLE         INT          NOT NULL,
  PAUSED        INT              NULL,
  STARTDATE     DATETIME     NOT NULL,
  ENDDATE       DATETIME     NOT NULL,
  NOTE          VARCHAR(1000)    NULL,
  CONSTRAINT POMODOROACTIVITIES_PK PRIMARY KEY (ID)
) ENGINE=InnoDB;

ALTER TABLE POMODOROACTIVITIES ADD CONSTRAINT POMODOROACTIVITIES_USER_FK FOREIGN KEY (USERID) REFERENCES USER (ID) ON DELETE RESTRICT;
ALTER TABLE POMODOROACTIVITIES ADD INDEX USERID_IDX (USERID);
ALTER TABLE POMODOROACTIVITIES ADD INDEX STARTDATE_IDX (STARTDATE);
ALTER TABLE POMODOROACTIVITIES ADD INDEX ENDDATE_IDX (ENDDATE);

INSERT INTO POMODOROACTIVITIES ( USERID ,ACTIVITY ,CYCLE
                                ,PAUSED ,STARTDATE ,ENDDATE
                                ,NOTE)
                        VALUES ( 2    ,'Create SQL script to create all Pomodoro feature' ,1
                                ,0    ,'2018-10-27 09:25:33'                              ,'2018-10-27 09:50:33'
                                ,NULL);

INSERT INTO POMODOROACTIVITIES ( USERID ,ACTIVITY  ,CYCLE
                                ,PAUSED ,STARTDATE ,ENDDATE
                                ,NOTE)
                        VALUES ( 2    ,'Create SQL script to create all Pomodoro feature' ,2
                                ,0    ,'2018-10-27 10:02:27'                              ,'2018-10-27 10:27:27'
                                ,'Was created an script with the statements to create the table, indexes, foreign keys and insert master data.');

  SELECT  pdac.Id      ,pdac.UserId ,pdac.Activity 
         ,pdac.Cycle   ,pdac.Paused ,pdac.StartDate 
         ,pdac.EndDate ,pdac.Note     
    FROM PomodoroActivities pdac
   WHERE pdac.UserId = 2
ORDER BY pdac.Id;

SELECT u.Username ,u.FirstName ,u.LastName ,u.Active ,u.password
  FROM User u
 WHERE u.UserName = 'JMICHEL';                                       

  SELECT Id, AddressType, Active
    FROM ElectronicAddressType eat
   WHERE eat.Active = 'Y'
ORDER BY Id;

  SELECT  uea.Id            ,uea.UserId      ,u.Username
         ,uea.AddressTypeId ,eat.AddressType ,uea.Address
         ,uea.Visible
    FROM UserElectronicAddress uea 
    JOIN User                  u   ON uea.UserId = u.Id
    JOIN ElectronicAddressType eat ON uea.AddressTypeId = eat.Id
ORDER BY u.Id ,uea.Id ,eat.Id;
