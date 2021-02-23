--agregando consultas de inserci�n de registros en cada tabla min.3
COMMIT;   --CONFIRMAR SINTAXIS ANTERIOR
SET AUTOCOMMIT 2;
--INGRESO DE DATOS DE USUARIO
--DELETE FROM USUARIO;
INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Cliente
VALUES ('11111111', 'MICHAEL', 'PEREZ JACKSON');
INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Cliente  
VALUES ('22222222', 'WILLY', 'SABOR');
INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Cliente
VALUES ('33333333', 'CHARLIE', 'VADULAQUE');

INSERT INTO USUARIO(RUNUSUARIO,USNOMBRE,USAPELLIDO,USNACIMIENTO)   --Administrativo
VALUES(44444444,'JAIME','CASAS',TO_DATE('1961-11-11', 'YYYY-MM-DD'));
INSERT INTO USUARIO(RUNUSUARIO,USNOMBRE,USAPELLIDO,USNACIMIENTO)   --Administrativo
VALUES(55555555,'JAVIERA','OSSANDON',TO_DATE('1962-02-22', 'YYYY-MM-DD'));
INSERT INTO USUARIO(RUNUSUARIO,USNOMBRE,USAPELLIDO,USNACIMIENTO)   --Administrativo
VALUES(66666666,'MARTIN','ARELLANO',TO_DATE('1963-03-30', 'YYYY-MM-DD'));

INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Profesional
VALUES ('77777777', 'RAMON', 'TORRES');
INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Profesional
VALUES ('88888888', 'FABIOLA', 'CASTILLO');
INSERT INTO USUARIO (RUNUSUARIO, USNOMBRE, USAPELLIDO)   --Profesional
VALUES ('99999999', 'PATRICIO', 'SANHUEZA');

--INGRESO DE DATOS DE CLIENTE
--DELETE FROM CLIENTE;
INSERT INTO CLIENTE (RUTCLIENTE, CLITELEFONO, CLIDIRECCION, CLICOMUNA, CLIEDAD, USUARIO_RUNUSUARIO)
VALUES ('114477', '912345678', 'LAS PARCELAS', 'PE�ALOLEN', '32', '11111111');
INSERT INTO CLIENTE (RUTCLIENTE, CLITELEFONO, CLIDIRECCION, CLICOMUNA, CLIEDAD, USUARIO_RUNUSUARIO)
VALUES ('113388', '945612378', 'JOSE ARRIETA', 'PE�ALOLEN', '40', '22222222');
INSERT INTO CLIENTE (RUTCLIENTE, CLITELEFONO, CLIDIRECCION, CLICOMUNA, CLIEDAD, USUARIO_RUNUSUARIO)
VALUES ('112299', '978912345', 'DOMINGO TOCORNAL', 'PUENTE ALTO', '32', '33333333');

--INGRESO DE DATOS DE CAPACITACION
--DELETE FROM CAPACITACION;
INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('1', TO_DATE('2021-02-21', 'YYYY-MM-DD'), 'SANTIAGO','114477');
INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('2', TO_DATE('2021-01-26', 'YYYY-MM-DD'), 'VI�A DEL MAR','113388');
INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('3', TO_DATE('2021-01-28', 'YYYY-MM-DD'), 'VALDIVIA','112299');

INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('4', TO_DATE('2021-01-30', 'YYYY-MM-DD'), 'LA FLORIDA','112299');

INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('5', TO_DATE('2021-01-26', 'YYYY-MM-DD'), 'VALDIVIA','112299');

INSERT INTO CAPACITACION (IDCAPACITACION, CAPFECHA, CAPLUGAR, CLIENTE_RUTCLIENTE)
VALUES ('6', TO_DATE('2021-01-27', 'YYYY-MM-DD'), 'PUERTO MONTT','112299');

--INGRESO DE DATOS DE ASISTENTES
--DELETE FROM ASISTENTES;
INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('111', 'Michael Perez Jackson', '32', '1');
INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('222', 'Willy Sabor', '40', '2');
INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('333', 'Charlie Vadulaque', '32', '3');

INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('444', 'ANTONIO Vadulaque', '20', '1');
INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('555', 'RICARDO Vadulaque', '22', '2');
INSERT INTO ASISTENTES (IDASISTENTE, ASISTNOMBRECOMPLETO, ASISTEDAD, CAPACITACION_IDCAPACITACION)
VALUES ('666', 'ROBERTO Vadulaque', '25', '3');

--INGRESO DE DATOS DE VISITA
--DELETE FROM VISITA;
INSERT INTO VISITA (IDVISITA, VISFECHA, VISHORA, VISLUGAR, VISCOMENTARIO, CLIENTE_RUTCLIENTE)
VALUES ('111', TO_DATE('2021-02-21', 'YYYY-MM-DD'), TO_DATE('09:30:00', 'HH24:MI:SS'), 'PROVIDENCIA', 'inspeccion', 114477);
INSERT INTO VISITA (IDVISITA, VISFECHA, VISHORA, VISLUGAR, VISCOMENTARIO, CLIENTE_RUTCLIENTE)
VALUES ('222', TO_DATE('2021-02-22', 'YYYY-MM-DD'), TO_DATE('09:30:00', 'HH24:MI:SS'), 'VALPARAISO', 'inspeccion', 113388);
INSERT INTO VISITA (IDVISITA, VISFECHA, VISHORA, VISLUGAR, VISCOMENTARIO, CLIENTE_RUTCLIENTE) 
VALUES ('333', TO_DATE('2021-02-23', 'YYYY-MM-DD'), TO_DATE('09:30:00', 'HH24:MI:SS'), 'LA REINA, 'inspeccion', 112299);

INSERT INTO VISITA (IDVISITA, VISFECHA, VISHORA, VISLUGAR, VISCOMENTARIO, CLIENTE_RUTCLIENTE)
VALUES ('444', TO_DATE('2021-02-22', 'YYYY-MM-DD'), TO_DATE('09:30:00', 'HH24:MI:SS'), 'VALPARAISO', 'revision', 113388);
INSERT INTO VISITA (IDVISITA, VISFECHA, VISHORA, VISLUGAR, VISCOMENTARIO, CLIENTE_RUTCLIENTE)
VALUES ('555', TO_DATE('2021-02-22', 'YYYY-MM-DD'), TO_DATE('09:30:00', 'HH24:MI:SS'), 'VALPARAISO', 'supervicion', 113388);

--INGRESO DE DATOS DE CHEQUEO
--DELETE FROM CHEQUEO;
INSERT INTO CHEQUEO (IDCHEQUEO, NOMBRE, DETALLE) VALUES ('20211', 'Norma 1', 'revisar cumplimiento');
INSERT INTO CHEQUEO (IDCHEQUEO, NOMBRE, DETALLE) VALUES ('20212', 'Norma 2', 'revisar cumplimiento');
INSERT INTO CHEQUEO (IDCHEQUEO, NOMBRE, DETALLE) VALUES ('20213', 'Norma 3', 'revisar cumplimiento');

INSERT INTO CHEQUEO (IDCHEQUEO, NOMBRE, DETALLE) VALUES ('20214', 'Norma 3', 'revisar cumplimiento');
INSERT INTO CHEQUEO (IDCHEQUEO, NOMBRE, DETALLE) VALUES ('20215', 'Norma 3', 'revisar cumplimiento');

--INGRESO DE DATOS DE REGISTROCHEQUEO
--DELETE FROM REGISTROCHEQUEO;
INSERT INTO REGISTROCHEQUEO (VISITA_IDVISITA, CHEQUEO_IDCHEQUEO, ESTADO) VALUES ('111', '20211', '1');
INSERT INTO REGISTROCHEQUEO (VISITA_IDVISITA, CHEQUEO_IDCHEQUEO, ESTADO) VALUES ('222', '20212', '2');
INSERT INTO REGISTROCHEQUEO (VISITA_IDVISITA, CHEQUEO_IDCHEQUEO, ESTADO) VALUES ('333', '20213', '3');

INSERT INTO REGISTROCHEQUEO (VISITA_IDVISITA, CHEQUEO_IDCHEQUEO, ESTADO) VALUES ('444', '20214', '3');
INSERT INTO REGISTROCHEQUEO (VISITA_IDVISITA, CHEQUEO_IDCHEQUEO, ESTADO) VALUES ('555', '20215', '3');

--INGRESO DE DATOS DE ACCIDENTE
--DELETE FROM ACCIDENTE;
INSERT INTO ACCIDENTE (IDACCIDENTE, ACCIFECHA, ACCIHORA, ACCILUGAR, ACCIORIGEN, ACCICONSECUENCIAS, CLIENTE_RUTCLIENTE) 
VALUES ('111', TO_DATE('2021-02-25', 'YYYY-MM-DD'), TO_DATE('11:30:00', 'HH24:MI:SS'), 'TRABAJO', 'CAIDA', 'LESION LEVE', '114477');
INSERT INTO ACCIDENTE (IDACCIDENTE, ACCIFECHA, ACCIHORA, ACCILUGAR, ACCIORIGEN, ACCICONSECUENCIAS, CLIENTE_RUTCLIENTE) 
VALUES ('222', TO_DATE('2021-02-26', 'YYYY-MM-DD'), TO_DATE('09:45:00', 'HH24:MI:SS'), 'TRANSCURSO AL TRABAJO', 'CAIDA', 'FRACTURA', '113388');
INSERT INTO ACCIDENTE (IDACCIDENTE, ACCIFECHA, ACCIHORA, ACCILUGAR, ACCIORIGEN, ACCICONSECUENCIAS, CLIENTE_RUTCLIENTE) 
VALUES ('333', TO_DATE('2021-02-27', 'YYYY-MM-DD'), TO_DATE('16:30:00', 'HH24:MI:SS'), 'FUERA DEL TRABAJO', 'CHOQUE', 'LESION GRAVE', '112299');

--INGRESO DE DATOS DE ADMINISTRATIVO
--DELETE FROM ADMINISTRATIVO;
INSERT INTO ADMINISTRATIVO (USUARIO_RUNUSUARIO, ADCORREO, ADAREA ) VALUES ('44444444', 'A1@GMAIL.COM', 'INFORMATICA');
INSERT INTO ADMINISTRATIVO (USUARIO_RUNUSUARIO, ADCORREO, ADAREA) VALUES ('55555555', 'A2@GMAIL.COM', 'LOGISTICA');
INSERT INTO ADMINISTRATIVO (USUARIO_RUNUSUARIO, ADCORREO, ADAREA) VALUES ('66666666', 'A3@GMAIL.COM', 'DESARROLLO');

--INGRESO DE DATOS DE PROFESIONAL
--DELETE FROM PROFESIONAL;
INSERT INTO PROFESIONAL(USUARIO_RUNUSUARIO,PROTELEFONO,PROTITULO,PROPROYECTO)
VALUES(77777777,'59678451258','SOCIOLOGIA','NOMBREPROYECTO1');
INSERT INTO PROFESIONAL(USUARIO_RUNUSUARIO,PROTELEFONO,PROTITULO,PROPROYECTO)
VALUES(88888888,'56978561252','LICENCIATURA EN HISTORIA','NOMBREPORYECTO2');
INSERT INTO PROFESIONAL(USUARIO_RUNUSUARIO,PROTELEFONO,PROTITULO,PROPROYECTO)
VALUES(99999999,'56978231565','PSICOLOGIA SOCIAL','NOMBREPROYECTO3');

--INGRESO DE DATOS DE ASESORIAS
--DELETE FROM ASESORIAS;
INSERT INTO ASESORIAS(IDASESORIA,ASFECHA,ASMOTIVO,PROFESIONAL_USUARIO_RUNUSUARIO,CLIENTE_RUTCLIENTE)
VALUES('111',TO_DATE('2021-07-07', 'YYYY-MM-DD'),'MOTIVO FOME 1','77777777','114477');
INSERT INTO ASESORIAS(IDASESORIA,ASFECHA,ASMOTIVO,PROFESIONAL_USUARIO_RUNUSUARIO,CLIENTE_RUTCLIENTE)
VALUES('222',TO_DATE('2021-08-08', 'YYYY-MM-DD'),'MOTIVO FOME 2','88888888','113388');
INSERT INTO ASESORIAS(IDASESORIA,ASFECHA,ASMOTIVO,PROFESIONAL_USUARIO_RUNUSUARIO,CLIENTE_RUTCLIENTE)
VALUES('333',TO_DATE('2021-09-09', 'YYYY-MM-DD'),'MOTIVO FOME 3','99999999','112299');

--INGRESO DE DATOS DE MEJORAS
--DELETE FROM MEJORAS;
INSERT INTO MEJORAS(IDMEJORA,METITULO,MEDESCRIPCION,MEPLAZO,ASESORIAS_IDASESORIA)
VALUES(111,'TITULO MEJORAS 1','DESCRIPCION ASESORIA 1','250','111');  
INSERT INTO MEJORAS(IDMEJORA,METITULO,MEDESCRIPCION,MEPLAZO,ASESORIAS_IDASESORIA)
VALUES(222,'TITULO MEJORAS 2','DESCRIPCION ASESORIA 2','15','222');
INSERT INTO MEJORAS(IDMEJORA,METITULO,MEDESCRIPCION,MEPLAZO,ASESORIAS_IDASESORIA)
VALUES(333,'TITULO MEJORAS 3','DESCRIPCION ASESORIA 3','600', '333');

--INGRESO DE DATOS DE PAGOS
--DELETE FROM PAGO;
INSERT INTO PAGO (PAGFECHA, PAGMONTO, PAGMES, PAGANYO, CLIENTE_RUTCLIENTE) 
VALUES (TO_DATE('2021-02-21 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), '100000', '03', '2021', '114477');
INSERT INTO PAGO (PAGFECHA, PAGMONTO, PAGMES, PAGANYO, CLIENTE_RUTCLIENTE) 
VALUES (TO_DATE('2021-02-21 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), '200000', '04', '2021', '113388');
INSERT INTO PAGO (PAGFECHA, PAGMONTO, PAGMES, PAGANYO, CLIENTE_RUTCLIENTE) 
VALUES (TO_DATE('2021-02-21 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), '300000', '05', '2021', '112299');
 
 --CONFIRMAR SINTAXIS ANTERIOR
COMMIT;

