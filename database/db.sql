CREATE DATABASE schedulebuilder;
USE schedulebuilder;
CREATE TABLE User (
	iduser INT(11) PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(50) NOT NULL,
    pass VARCHAR(50) NOT NULL
);

CREATE TABLE Minor (
	idminor INT(11) PRIMARY KEY AUTO_INCREMENT,
    minorName VARCHAR(50) NOT NULL
);

CREATE TABLE Friend (
	idfriend INT(11) PRIMARY KEY AUTO_INCREMENT,
    iduser1 INT(11) NOT NULL,
    iduser2 INT(11) NOT NULL,
    FOREIGN KEY(iduser1) REFERENCES User(iduser),
    FOREIGN KEY(iduser2) REFERENCES User(iduser)
    idmajor INT(11),
    idminor INT(11),
    FOREIGN KEY(idmajor) REFERENCES Major(idmajor),
    FOREIGN KEY(idminor) REFERENCES Minor(idminor)
);

CREATE TABLE Major (
	idmajor INT(11) PRIMARY KEY AUTO_INCREMENT,
    majorName VARCHAR(50) NOT NULL
);

CREATE TABLE Course (
	idcourse INT(11) PRIMARY KEY AUTO_INCREMENT,
    courseName VARCHAR(50) NOT NULL,
    idmajor INT(11) NOT NULL,
    FOREIGN KEY(idmajor) REFERENCES Major(idmajor)
);


CREATE TABLE CourseTaken (
	idct INT(11) PRIMARY KEY AUTO_INCREMENT,
    iduser INT(11) NOT NULL,
    idcourse INT(11) NOT NULL,
    FOREIGN KEY(iduser) REFERENCES User(iduser),
    FOREIGN KEY(idcourse) REFERENCES Course(idcourse)
);
