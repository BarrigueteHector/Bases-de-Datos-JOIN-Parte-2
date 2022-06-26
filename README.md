# Bases de Datos: JOIN Parte 2

Definición
--------------------------------------------------------------------------------------------------------------------------------------------------------
Los tipos de JOIN que vamos a ver en este repositorio, igualmente que los de la primer parte, permiten unir tablas, sin embargo, estos estan mayormente relacionados al algebra booleana.

Antecedentes
--------------------------------------------------------------------------------------------------------------------------------------------------------


Desarrollo
--------------------------------------------------------------------------------------------------------------------------------------------------------
Si recordamos, en la primera parte de los **JOIN** se presentaron como una forma de unir tablas. Aunque los que veremos en este repositorio hacen lo mismo, estos se caracterizan por estar relacionados al algebra booleana.

Contamos con:
- **JOIN ON**
- **JOIN USING**
- **NATURAL JOIN**

Estos perimiten combinar los datos a partir de valores comunes (columnas comunes entre ambas tablas), típicamente los que son **PK** y **FK**.

Pensemos que vamos a hacer una consulta, pero a diferencia de las que hemos realizado anteriormente, necesitamos de una o más tablas para realizarla. 

Por ejemplo, tenemos una base de datos de un banco, contamos con las tablas **CLIENTE**, **CREDITO** y **SUCURSAL**. Supongamos que debemos mostrar a los clientes que tienen un credito y abrieron su cuenta en una sucursal por especifico. 
La tabla **CLIENTE** tiene la clave del cliente, su nombre, domicilio y telefono. 
La tabla **CREDITO**, tiene el numero de cuenta, clave del cliente, saldo, fecha de apertura y número de sucursal.
Y la tabla **SUCURSAL** tiene el número de sucursal, nombre de la sucursal y el activo.

Solo con la tabla **CLIENTE** es imposible realizar la consulta, por lo que necesitamos de las otras tres tablas para realizarla.

El **JOIN** que nosotros usemos es indistinto, cualquiera nos puede ayudar a dar con el resultado.

Las diferencias principales son la forma de escribirlo y la naturaleza de los mismos, algunos funcionan para otras bases de datos que no sean de ORACLE y otros son exclusivos de este.

El archivo [Instrucciones](https://github.com/BarrigueteHector/Bases-de-Datos-JOIN-Parte-2/blob/main/instrucciones.sql) presenta las guías para cada **JOIN**.

El archivo [Ejemplo](https://github.com/BarrigueteHector/Bases-de-Datos-JOIN-Parte-2/blob/main/ejemplo.sql) cuenta con un ejemplo de cada uno de los **JOIN**.

NOTAS
--------------------------------------------------------------------------------------------------------------------------------------------------------
**NOTA #1**: Los repositorios **Bases de Datos** están hechos con base en el curso de Bases de Datos de la Facultad de Ingeniería de la UNAM. 
