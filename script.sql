create table CHAMPS
(
   ID                   tinyint unsigned AUTO_INCREMENT PRIMARY KEY,
   NOM                  varchar(50) not null,
   VILLE                varchar(50) not null
);

create table CHEVAL
(
   ID                   int unsigned AUTO_INCREMENT PRIMARY KEY,
   ID_JOCKEY            int unsigned,
   ID_PARENT            int unsigned,
   NOM                  varchar(50) not null,
   SEXE                 enum('f', 'm') not null,
   DATE_NAISSANCE       date
);

create table COURSE
(
   ID                   int unsigned AUTO_INCREMENT PRIMARY KEY,
   ID_CHAMPS            tinyint unsigned not null,
   ID_TYPE_COURSE       tinyint unsigned not null,
   NOM                  varchar(50) not null,
   DATE_DEBUT           datetime not null
);

create table JOCKEY
(
   ID                   int unsigned AUTO_INCREMENT PRIMARY KEY,
   PRENOM               varchar(50) not null,
   NOM                  varchar(50) not null
);

create table PARTICIPE
(
   ID_COURSE            int unsigned,
   ID_JOCKEY            int unsigned,
   ID_CHEVAL            int unsigned,
   POSITION             tinyint unsigned not null
);
alter table PARTICIPE add constraint primary key (ID_COURSE, ID_JOCKEY, ID_CHEVAL);

create table PEUT_ACCUEILLIR
(
   ID_CHAMPS            tinyint unsigned,
   ID_TYPE_COURSE       tinyint unsigned
);
alter table PEUT_ACCUEILLIR add constraint primary key (ID_CHAMPS, ID_TYPE_COURSE);

create table TYPE_COURSE
(
   ID                   tinyint unsigned auto_increment PRIMARY KEY,
   NOM                  varchar(50) not null
);

## Foreign keys
alter table CHEVAL add constraint FK_CHEVAL_EST_FILS_CHEVAL foreign key (ID_PARENT)
      references CHEVAL (ID) on delete restrict on update restrict;

alter table CHEVAL add constraint FK_CHEVAL_EST_PROPR_JOCKEY foreign key (ID_JOCKEY)
      references JOCKEY (ID) on delete restrict on update restrict;

alter table COURSE add constraint FK_COURSE_EST_DE_TYPE foreign key (ID_TYPE_COURSE)
      references TYPE_COURSE (ID) on delete restrict on update restrict;

alter table COURSE add constraint FK_COURSE_SE_DEROUL_CHAMPS foreign key (ID_CHAMPS)
      references CHAMPS (ID) on delete restrict on update restrict;

alter table PARTICIPE add constraint FK_PARTICIP_PARTICIPE_COURSE foreign key (ID_COURSE)
      references COURSE (ID) on delete restrict on update restrict;

alter table PARTICIPE add constraint FK_PARTICIP_PARTICIPE_JOCKEY foreign key (ID_JOCKEY)
      references JOCKEY (ID) on delete restrict on update restrict;

alter table PARTICIPE add constraint FK_PARTICIP_PARTICIPE_CHEVAL foreign key (ID_CHEVAL)
      references CHEVAL (ID) on delete restrict on update restrict;

alter table PEUT_ACCUEILLIR add constraint FK_PEUT_ACC_PEUT_ACCU_CHAMPS foreign key (ID_CHAMPS)
      references CHAMPS (ID) on delete restrict on update restrict;

alter table PEUT_ACCUEILLIR add constraint FK_PEUT_ACCEUILLIR_TYPE_COURSE foreign key (ID_TYPE_COURSE)
      references TYPE_COURSE (ID) on delete restrict on update restrict;