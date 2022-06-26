SQL> -- Tenemos las siguientes tablas:
SQL> DESCRIBE CLIENTE;
 Nombre                                                ¿Nulo?   Tipo
 ----------------------------------------------------- -------- ------------------------------------
 CLAVECTE                                              NOT NULL CHAR(4)
 NOMCTE                                                NOT NULL VARCHAR2(40)
 DOMCTE                                                NOT NULL VARCHAR2(40)
 TELCTE                                                NOT NULL CHAR(8)

SQL> DESCRIBE SUCURSAL;
 Nombre                                                ¿Nulo?   Tipo
 ----------------------------------------------------- -------- ------------------------------------
 NUMSUC                                                NOT NULL CHAR(2)
 NOMSUC                                                NOT NULL VARCHAR2(15)
 ACTIVO                                                NOT NULL NUMBER(12,2)

SQL> DESCRIBE CREDITO;
 Nombre                                                ¿Nulo?   Tipo
 ----------------------------------------------------- -------- ------------------------------------
 NUMCTA                                                NOT NULL CHAR(4)
 CLAVECTE                                              NOT NULL CHAR(4)
 SALDO                                                 NOT NULL NUMBER(10,2)
 FECHACTA                                                       DATE
 NUMSUC                                                NOT NULL CHAR(2)

SQL> -- con los siguientes registros:
SQL> SELECT * FROM CLIENTE;

CLAV NOMCTE                                   DOMCTE                                   TELCTE       
---- ---------------------------------------- ---------------------------------------- --------     
1325 JuanPerez                                San Angel 17                             54983726     
1215 Pedro Gonzalez                           Xoquipa 25                               57612947     
2343 Miriam Zaragoza                          San Pablo 18                             38929837     
2574 Jose Rubalcaba                           Convento 97                              56481635     
1234 Rosa Ramirez                             Xoquipa 28                               57897657     

SQL> SELECT * FROM SUCURSAL;

NU NOMSUC              ACTIVO                                                                       
-- --------------- ----------                                                                       
1  Insurgentes       50000000                                                                       
2  Plateros         368945800                                                                       
3  Coyoacan         857000000                                                                       
4  Division          10255844                                                                       
5  Ermita           658720000                                                                       
8  Del Valle        269875120                                                                       

6 filas seleccionadas.

SQL> SELECT * FROM CREDITO;

NUMC CLAV      SALDO FECHACTA NU                                                                    
---- ---- ---------- -------- --                                                                    
2342 1325      10500 15/01/05 4                                                                     
2846 1215      15734 05/02/06 4                                                                     
9847 2343      12865 17/10/05 5                                                                     
3726 2574      11923 25/12/05 8                                                                     
4321 1234       7894 02/06/06 1                                                                     

SQL> 
SQL> -- Vamos a mostrar el nombre de la sucursal y activo de aquellos clientes que vivan en Xoquipa
SQL> 
SQL> -- El problema nos dice que necesitamos el nombre de la sucursal (SUCURSAL) y su activo (SUCURSAL) de los clientes (CLIENTE) que vivan en Xoquipa.
SQL> -- Debido a que nuestra condici¢n se encuentra en la CLIENTE, esta sera nuestra tabla de inicio.
SQL> -- Para acceder al nombre y activo de la sucursal, la PK es NUMSUC, pero la tabla con la que podemos acceder a SUCURSAL es CREDITO.
SQL> -- Para acceder a CREDITO lo podemos hacer desde CLIENTE.
SQL> 
SQL> -- Con lo anterior nos damos cuenta que existe un orden en el que hay que colocar los JOIN, primero va el de CREDITO y despues el de SUCURSAL. De hacerlo al reves, la consulta no serviria.
SQL> -- Entonces, veamos como se realizan estas consultas:
SQL> 
SQL> -- ************ JOIN USING ************
SQL> -- En el SELECT no es necesario indicar la tabla de la que provienen las columnas
SQL> SELECT NOMSUC, ACTIVO FROM CLIENTE
  2  JOIN CREDITO USING (CLAVECTE)
  3  JOIN SUCURSAL USING (NUMSUC)
  4  WHERE DOMCTE LIKE 'Xoquipa%';

NOMSUC              ACTIVO                                                                          
--------------- ----------                                                                          
Division          10255844                                                                          
Insurgentes       50000000                                                                          

SQL> 
SQL> -- ************ JOIN ON ************
SQL> -- En el SELECT es necesario indicar la tabla de la que provienen las columnas
SQL> SELECT SUCURSAL.NOMSUC, SUCURSAL.ACTIVO FROM CLIENTE
  2  JOIN CREDITO ON CLIENTE.CLAVECTE = CREDITO.CLAVECTE
  3  JOIN SUCURSAL ON CREDITO.NUMSUC = SUCURSAL.NUMSUC
  4  WHERE DOMCTE LIKE 'Xoquipa%';

NOMSUC              ACTIVO                                                                          
--------------- ----------                                                                          
Division          10255844                                                                          
Insurgentes       50000000                                                                          

SQL> 
SQL> -- *********** NATURAL JOIN ************
SQL> -- En el SELECT no es necesario indicar la tabla de la que provienen las columnas
SQL> SELECT NOMSUC, ACTIVO FROM CLIENTE
  2  NATURAL JOIN CREDITO
  3  NATURAL JOIN SUCURSAL
  4  WHERE DOMCTE LIKE 'Xoquipa%';

NOMSUC              ACTIVO                                                                          
--------------- ----------                                                                          
Division          10255844                                                                          
Insurgentes       50000000                                                                          

SQL> 
SQL> -- Como vemos, obtenemos el mismo resultado. Depende de nosotros escoger uno y al menos en ORACLE, es posible utilizar estos tres tipos de JOIN.
SQL> SPOOL OFF;
