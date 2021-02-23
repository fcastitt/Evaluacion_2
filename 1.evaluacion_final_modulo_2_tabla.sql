--Script completo con la creaci�n de la base de datos

-- TABLAS
--DROP TABLE USUARIO;
CREATE TABLE USUARIO(   --CREANSDO TABLA USUARIO
    RUNUSUARIO NUMBER(9) CONSTRAINT USUARIO_PK PRIMARY KEY, 
	USNOMBRE VARCHAR2(30) CONSTRAINT USUARIO_nn1 NOT NULL, 
	USAPELLIDO VARCHAR2(50) CONSTRAINT USUARIO_nn2 NOT NULL, 
	USNACIMIENTO DATE
);

--DROP TABLE CLIENTE;
CREATE TABLE CLIENTE(   --CREANDO TABLA CLIENTE  perfil 1
    RUTCLIENTE NUMBER(9) CONSTRAINT CLIENTE_PK PRIMARY KEY, 
	CLITELEFONO VARCHAR2(20) CONSTRAINT CLIENTE_nn1 NOT NULL , 
	CLIAFP VARCHAR2(30), 
	CLISISTEMASALUD NUMBER(2), 
	CLIDIRECCION VARCHAR2(100)CONSTRAINT CLIENTE_nn2 NOT NULL, 
	CLICOMUNA VARCHAR2(50)CONSTRAINT CLIENTE_nn3 NOT NULL, 
	CLIEDAD NUMBER(3) CONSTRAINT CLIENTE_nn4 NOT NULL,
    USUARIO_RUNUSUARIO NUMBER(9) CONSTRAINT CLIENTE_nn5 NOT NULL
);

--DROP TABLE CAPACITACION;
CREATE TABLE CAPACITACION(   --CREANDO TABLA CAPACITACION
    IDCAPACITACION NUMBER(9) CONSTRAINT CAPACITACION_PK PRIMARY KEY,
    CAPFECHA DATE CONSTRAINT CAPACITACION_nn1 NOT NULL ,
    CAPHORA DATE,
    CAPLUGAR VARCHAR2(100) CONSTRAINT CAPACITACION_nn2 NOT NULL,
    CAPDURACION NUMBER(4),
    CLIENTE_RUTCLIENTE NUMBER(9) CONSTRAINT CAPACITACION_nn3 NOT NULL
);

--DROP TABLE ASISTENTES;
CREATE TABLE ASISTENTES (   --CREANDO TABLA ASISTENTES
    IDASISTENTE NUMBER(9) CONSTRAINT ASISTENTES_PK PRIMARY KEY,
    ASISTNOMBRECOMPLETO VARCHAR2(100) CONSTRAINT  ASISTENTES_NN1 NOT NULL,
    ASISTEDAD NUMBER(3) CONSTRAINT  ASISTENTES_NN2 NOT NULL,
    ASISTCORREO VARCHAR2(70),
    ASISTTELEFONO VARCHAR2(20),
    CAPACITACION_IDCAPACITACION NUMBER(9) CONSTRAINT ASISTENTES_NN3 NOT NULL
);

--DROP TABLE VISITA;
CREATE TABLE VISITA (   --CREANDO TABLA VISITA
    IDVISITA NUMBER(9) CONSTRAINT VISITA_PK PRIMARY KEY,
    VISFECHA DATE CONSTRAINT VISITA_NN1 NOT NULL,
    VISHORA DATE ,
    VISLUGAR VARCHAR2(50) CONSTRAINT VISITA_NN2 NOT NULL,
    VISCOMENTARIO VARCHAR2(250) CONSTRAINT VISITA_NN3 NOT NULL,
    CLIENTE_RUTCLIENTE NUMBER(9) CONSTRAINT VISITA_NN4 NOT NULL
);

--DROP TABLE CHEQUEO;
CREATE TABLE CHEQUEO (   --CREANDO TABLA REGISTROCHEQUEO
    IDCHEQUEO NUMBER(9) CONSTRAINT CHEQUEO_PK PRIMARY KEY,
    NOMBRE VARCHAR2(30) CONSTRAINT CHEQUEO_NN1 NOT NULL,
    DETALLE VARCHAR2(100) CONSTRAINT CHEQUEO_NN2 NOT NULL
);

--DROP TABLE REGISTROCHEQUEO;
CREATE TABLE REGISTROCHEQUEO (   --CREANDO TABLA REGISTROCHEQUEO
    VISITA_IDVISITA NUMBER(9),
    CHEQUEO_IDCHEQUEO NUMBER(9),
    CONSTRAINT REGISTROCHEQUEO_PK PRIMARY KEY(VISITA_IDVISITA,CHEQUEO_IDCHEQUEO),
    ESTADO NUMBER(3) CONSTRAINT REGISTROCHEQUEO_NN1 NOT NULL
);

--DROP TABLE ACCIDENTE;
CREATE TABLE ACCIDENTE (   --CREANDO TABLA ACCIDENTE
    IDACCIDENTE NUMBER(9) CONSTRAINT ACCIDENTE_PK PRIMARY KEY,
    ACCIFECHA DATE CONSTRAINT ACIDENTE_NN1 NOT NULL,
    ACCIHORA DATE CONSTRAINT ACIDENTE_NN2 NOT NULL,
    ACCILUGAR VARCHAR2(150),
    ACCIORIGEN VARCHAR2(100) CONSTRAINT ACIDENTE_NN3 NOT NULL,
    ACCICONSECUENCIAS VARCHAR2(100),
    CLIENTE_RUTCLIENTE NUMBER (9) CONSTRAINT ACIDENTE_NN4 NOT NULL
);

--DROP TABLE ADMINISTRATIVO;
CREATE TABLE ADMINISTRATIVO (   --CREANDO TABLA ADMINISTRATIVO PERFIL 2
    USUARIO_RUNUSUARIO NUMBER(9) CONSTRAINT ADMINISTRATIVO_PK PRIMARY KEY,
    ADCORREO VARCHAR2(70),
    ADAREA VARCHAR2(20) CONSTRAINT ADMINISTRATIVO_NN1 NOT NULL
);

--DROP TABLE PROFESIONAL;
CREATE TABLE PROFESIONAL(   --Creando Tabla PROFESIONAL perfil 3
    USUARIO_RUNUSUARIO NUMBER(9) CONSTRAINT PROFESIONAL_PK PRIMARY KEY,
    PROTELEFONO NUMBER(20),
    PROTITULO VARCHAR(50)CONSTRAINT PROFESIONAL_nn1 NOT NULL,
    PROPROYECTO VARCHAR(50)
);

--DROP TABLE ASESORIAS;
CREATE TABLE ASESORIAS(
    IDASESORIA NUMBER(9) CONSTRAINT ASESORIAS_PK PRIMARY KEY, 
    ASFECHA DATE CONSTRAINT ASESORIAS_nn1 NOT NULL,
    ASMOTIVO VARCHAR2(100) CONSTRAINT ASESORIAS_nn2 NOT NULL,
    PROFESIONAL_USUARIO_RUNUSUARIO NUMBER(9) CONSTRAINT ASESORIAS_nn3 NOT NULL,
    CLIENTE_RUTCLIENTE NUMBER(9) CONSTRAINT ASESORIAS_nn4 NOT NULL
);    

--DROP TABLE MEJORAS;
CREATE TABLE MEJORAS(
    IDMEJORA NUMBER(9) CONSTRAINT MEJORAS_PK PRIMARY KEY,
    METITULO VARCHAR2(50) CONSTRAINT MEJORAS_nn1 NOT NULL, 
    MEDESCRIPCION VARCHAR2(250) CONSTRAINT MEJORAS_nn2 NOT NULL,
    MEPLAZO NUMBER(9) CONSTRAINT MEJORAS_nn3 NOT NULL,
    ASESORIAS_IDASESORIA NUMBER(9) CONSTRAINT MEJORAS_nn4 NOT NULL
);

--DROP TABLE PAGO;
CREATE TABLE PAGO(
    IDPAGO NUMBER(9) CONSTRAINT PAGO_PK PRIMARY KEY,
    PAGFECHA DATE CONSTRAINT PAGO_NN1  NOT NULL,
    PAGMONTO NUMBER(12) CONSTRAINT PAGO_NN2 NOT NULL,
    PAGMES VARCHAR2(2) CONSTRAINT PAGO_NN3 NOT NULL,
    PAGANYO VARCHAR2(4) CONSTRAINT PAGO_NN4 NOT NULL,
    CLIENTE_RUTCLIENTE NUMBER(9) CONSTRAINT PAGO_NN5 NOT NULL
);

-- CREANDO FOREIGN KEY
ALTER TABLE CLIENTE   --LLAVE FORANEA  CLIENTE
ADD CONSTRAINT CLIENTE_USUARIO_FK
FOREIGN KEY(USUARIO_RUNUSUARIO)
REFERENCES USUARIO(RUNUSUARIO); 

ALTER TABLE CAPACITACION   --LLAVE FORANEA  CAPACITACION
ADD CONSTRAINT CAPACITACION_CLIENTE_FK
FOREIGN KEY(CLIENTE_RUTCLIENTE)
REFERENCES CLIENTE(RUTCLIENTE);

ALTER TABLE ASISTENTES   --LLAVE FORANEA  ASISTENTES
ADD CONSTRAINT ASISTENTES_CAPACITACION_FK
FOREIGN KEY(CAPACITACION_IDCAPACITACION)
REFERENCES CAPACITACION(IDCAPACITACION); 

ALTER TABLE VISITA   --LLAVE FORANEA  VISITA
ADD CONSTRAINT VISITA_CLIENTE_FK
FOREIGN KEY (CLIENTE_RUTCLIENTE)
REFERENCES CLIENTE(RUTCLIENTE);

ALTER TABLE REGISTROCHEQUEO   --LLAVE FORANEA REGISTROCHEQUEO CON VISITA
ADD CONSTRAINT REGISTROCHEQUEO_VISITA_FK
FOREIGN KEY (VISITA_IDVISITA)
REFERENCES VISITA(IDVISITA);

ALTER TABLE REGISTROCHEQUEO   --LLAVE FORANEA REGISTROCHEQUEO CON CHEQUEO
ADD CONSTRAINT REGISTROCHEQUEO_CHEQUEO_FK
FOREIGN KEY (CHEQUEO_IDCHEQUEO)
REFERENCES CHEQUEO(IDCHEQUEO);

ALTER TABLE ACCIDENTE   --LLAVE FORANEA  ACCIDENTE
ADD CONSTRAINT ACCIDENTE_CLIENTE_FK
FOREIGN KEY (CLIENTE_RUTCLIENTE)
REFERENCES CLIENTE(RUTCLIENTE);

ALTER TABLE ADMINISTRATIVO   --LLAVE FORANEA  ADMINISTRATIVO
ADD CONSTRAINT ADMINISTRATIVO_USUARIO_FK
FOREIGN KEY (USUARIO_RUNUSUARIO)
REFERENCES USUARIO(RUNUSUARIO);

ALTER TABLE PROFESIONAL   --LLAVE FORANEA  PROFESIONAL 
ADD CONSTRAINT PROFESIONAL_USUARIO_FK
FOREIGN KEY(USUARIO_RUNUSUARIO)
REFERENCES USUARIO(RUNUSUARIO);

ALTER TABLE ASESORIAS   --LLAVE FORANEA  ASESORIAS con PROFESIONAL
ADD CONSTRAINT ASESORIAS_PROFESIONAL_FK
FOREIGN KEY(PROFESIONAL_USUARIO_RUNUSUARIO)
REFERENCES PROFESIONAL(USUARIO_RUNUSUARIO);

ALTER TABLE ASESORIAS   --LLAVE FORANEA  ASESORIAS con CLIENTE
ADD CONSTRAINT ASESORIAS_CLIENTE_FK
FOREIGN KEY(CLIENTE_RUTCLIENTE)
REFERENCES CLIENTE(RUTCLIENTE);

ALTER TABLE MEJORAS   --LLAVE FORANEA  MEJORAS 
ADD CONSTRAINT MEJORAS_ASESORIAS_FK
FOREIGN KEY(ASESORIAS_IDASESORIA)
REFERENCES ASESORIAS(IDASESORIA);

ALTER TABLE PAGO   --lLLAVE FORANEA  PAGO
ADD CONSTRAINT PAGO_CLIENTE_FK
FOREIGN KEY(CLIENTE_RUTCLIENTE)
REFERENCES CLIENTE(RUTCLIENTE);

--CREAR SECUENCIAS 

--IDENTIFICADOR CORRELATIVO AUINCREMENTAL - TABLA PAGO
CREATE SEQUENCE IDPAGO_SEQ;   --SECUENCIA 

CREATE OR REPLACE TRIGGER IDPAGO_TRIGGER --DISPARADOR 
BEFORE INSERT ON PAGO 
FOR EACH ROW
WHEN(NEW.IDPAGO IS NULL)
BEGIN
SELECT IDPAGO_SEQ.NEXTVAL
INTO:NEW.IDPAGO
FROM dual;
END;
/

--IDENTIFICADOR CORRELATIVO AUTOINCREMENTAL - TABLA ASESORIAS
CREATE SEQUENCE IDASESORIA_SEQ; --SECUENCIA 

CREATE OR REPLACE TRIGGER IDASESORIA_TRIGGER  -- DISPARADOR
BEFORE INSERT ON ASESORIAS
FOR EACH ROW
WHEN(NEW.IDASESORIA IS NULL)
BEGIN
SELECT IDASESORIA_SEQ.NEXTVAL
INTO:NEW.IDASESORIA
FROM dual;
END;
/