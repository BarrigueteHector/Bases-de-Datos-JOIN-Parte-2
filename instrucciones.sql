-- Estos JOIN se usan en las consultas.
-- TABLE1 corresponde a la del SELECT y es de la cual vamos a poder partir. 

-- Para poder acceder a una tabla, necesitamos una forma de hacerlo (las PK o algun otro campo que nos permita identificarla). A partir de nuestro problema, nosotros debemos saber que tablas necesitamos y cual de todas es nuestra tabla de inicio y apartir de dicha tabla debemos de poder acceder a las demas, o partir de una segunda tabla, debemos de poder acceder a una tercera, cuarta, etc.

-- ************ JOIN ON *****************
JOIN <TABLE2> ON <CONDITION>
-- La condición debe ser la igualdad de PK de TABLE1 y PK/FK de TABLE2. Dicha igualdad permite saber que registro de TABLE1 está relacionado con el registro de TABLE2.

-- ************ JOIN USING ***************
JOIN <TABLE2> USING (<COLUMN>)
-- Solo se indica el campo de TABLE2 con el que se van a igualar ambas tablas.

-- ************ NATURAL JOIN **************
NATURAL JOIN <TABLE2>
-- En este solo se indica la tabla con la que se va a comparar.