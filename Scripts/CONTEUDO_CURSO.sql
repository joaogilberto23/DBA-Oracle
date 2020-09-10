--UTILIZANDO O SQL DEVELOPER-----------------------------------------------------

--CRIAÇÃO DE TABLESPACE-----------------------------------------------------
CREATE TABLESPACE RECURSOS_HUMANOS
DATAFILE 'C:/DATA/RH_01.DBF'
SIZE 10M AUTOEXTEND
ON NEXT 10M
MAXSIZE 50M;

--AUMENTO DE TABLESPACE-----------------------------------------------------
ALTER TABLESPACE RECURSOS_HUMANOS
ADD DATAFILE 'C:/DATA/RH_02.DBF'
SIZE 5M AUTOEXTEND
ON NEXT 5M
MAXSIZE 50M;

--
SELECT TABLESPACE_NAME, FILE_NAME FROM DBA_DATA_FILES;

/*
--SEQUENCES-----------------------------------------------------

Enquanto no SQL Server(IDENTITY) ou no MySQL(AUTO_INCREMENT) a coluna de incremento está restrita a tabela,
no Oracle, a SEQUENCE faz parte do Banco de Dados inteiro.
*/
CREATE SEQUENCE SEQ_GERAL
START WITH 100
INCREMENT BY 10;

--CRIANDO UMA TABELA NA TABLESPACE-----------------------------------------------------
CREATE TABLE FUNCIONARIOS(
    IDFUNCIONARIO INT PRIMARY KEY,
    NOME VARCHAR2(30)
)TABLESPACE RECURSOS_HUMANOS;

/*
OBS: O tipo VARCHAR2 é o mesmo que o VARCHAR nas demais lingagens de banco; se utilizado no Oracle significa apenas
um apontamento do VRACHAR para o tipo VARCHAR2, logo, o mais indicado e para evitar erros e perda de performance
é utilizar a nomenclatura específica do Oracle.
*/

INSERT INTO FUNCIONARIOS VALUES (SEQ_GERAL.NEXTVAL, 'JOÃO');
INSERT INTO FUNCIONARIOS VALUES (SEQ_GERAL.NEXTVAL, 'CLARA');
INSERT INTO FUNCIONARIOS VALUES (SEQ_GERAL.NEXTVAL, 'LILIAN');

SELECT * FROM FUNCIONARIOS;

--EFETUANDO O COMMIT-----------------------------------------------------
--NO ATALHO F11 OU ÍCONE NA BARRA PARA SALVAR AS ALTERAÇÕES FEITAS

/*
No Oracle é possível realizar a manutenção/backup em parte de um banco de dados
sem que os demais usuários percam acesso ao sistema.
*/

--CRIANDO DE TABLESPACE MARKETING-----------------------------------------------------
CREATE TABLESPACE MARKETING
DATAFILE 'C:/DATA/MKT_01.DBF'
SIZE 10M AUTOEXTEND
ON NEXT 10M
MAXSIZE 50M;

CREATE TABLE CAMPANHA(
    IDCAMPANHA INT PRIMARY KEY,
    NOME VARCHAR2(30)
)TABLESPACE MARKETING;

INSERT INTO CAMPANHA VALUES (SEQ_GERAL.NEXTVAL, 'PRIMAVERA');
INSERT INTO CAMPANHA VALUES (SEQ_GERAL.NEXTVAL, 'VERAO');
INSERT INTO CAMPANHA VALUES (SEQ_GERAL.NEXTVAL, 'INVERNO');

SELECT * FROM CAMPANHA;

--COLOCANDO A TABLESPACE OFFLINE-----------------------------------------------------
ALTER TABLESPACE RECURSOS_HUMANOS OFFLINE;

--APONTANDO O DICIONARIO DE DADOS-----------------------------------------------------
ALTER TABLESPACE RECURSOS_HUMANOS
RENAME DATAFILE 'C:/DATA/RH_01.DBF' --LOCAL DE ORIGEM
TO 'C:/PRODUCAO/RH_01.DBF';  --LOCAL DESTINO

ALTER TABLESPACE RECURSOS_HUMANOS
RENAME DATAFILE 'C:/DATA/RH_02.DBF'
TO 'C:/PRODUCAO/RH_02.DBF';
--Desta forma apontamos o novo local FÍSICO do arquivo DBF onde está a Tablespace

--COLOCANDO A TABLESPACE ONLINE-----------------------------------------------------
ALTER TABLESPACE RECURSOS_HUMANOS ONLINE;

--PSEUDO COLUNAS-----------------------------------------------------

--Criando tabela aluno
CREATE TABLE ALUNO(
    IDALUNO INT PRIMARY KEY,
    NOME VARCHAR2(30),
    EMAIL VARCHAR2(30),
    SALARIO NUMBER(10,2)
);

--Criando sequence exemplo
CREATE SEQUENCE SEQ_EXEMPLO;

--Ligando a tabela a sequence criada
INSERT INTO ALUNO VALUES(SEQ_EXEMPLO.NEXTVAL,'JOAO','JOAO@GMAIL.COM',1000.00);
INSERT INTO ALUNO VALUES(SEQ_EXEMPLO.NEXTVAL,'CLARA','CLARA@GMAIL.COM',2000.00);
INSERT INTO ALUNO VALUES(SEQ_EXEMPLO.NEXTVAL,'CELIA','CELIA@GMAIL.COM',3000.00);

SELECT * FROM ALUNO;

/*
Existem duas pseudo colunas, são elas:
ROWID - Endereço FÍSICO do registro no Banco de Dados, ELE É SEMPRE ÚNICO!
ROWNUM - É utilizado para paginar registros.
*/

SELECT ROWID, IDALUNO, NOME, EMAIL, SALARIO FROM ALUNO;
SELECT ROWID, ROWNUM, IDALUNO, NOME, EMAIL, SALARIO FROM ALUNO;
SELECT IDALUNO, NOME, EMAIL, SALARIO FROM ALUNO WHERE ROWNUM <=2; --COMANDO PARA PAGINAR

-----------------------------------------------------
