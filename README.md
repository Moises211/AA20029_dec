                
*===============================================*
|           UNIVERSIDAD DE EL SALVADOR          |
|   DISEÑO Y ESTRUCTURAS DE LAS COMPUTADORAS    |
|                                               |
| NOMBRE:   MOISES AARON ALVARENGA ACOSTA       |
| CARNET:   AA20029                             |
|                                               |
|===============================================|
| EJERCICIO 1: RESTA CON REGISTROS DE 16 BITS   |
| Este ejercicio hace uso de registros de 16    |
| bits para el proceso de resta usando los      |
| registros: ax, bx y cx; el uso de los últimos |
| dos es para evitar usar solo ax, ya que bx es |
| usado para almacenar direcciones en memoria y |
| cx es para contar pasadas de un loop. Por     |
| último, convertimos el resultado a 32 bits    |
| para poder imprimir con la función            |
| printf de C.                                  |
|===============================================|
| EJERCICIO 2: MULTIPLICACIÓN CON REGISTROS     |
|                 DE 8 BITS                     |
| En este caso se multiplican dos cifras con    |
| registros al y bl, que serían para almacenar  |
| cadenas de los bits más significativos (bl) y |
| menos significativos (al); luego pasamos a un |
| registro de 16 bits (ax), ya que la           |
| multiplicación de 8 * 8 bits puede dar        |
| números de 16 bits y al final hacemos lo      |
| mismo de pasar a 32 bits para mostrar con     |
| printf de C.                                  |
|===============================================|
| EJERCICIO 3:DIVISIÓN CON REGISTROS DE 32 BITS |
| Se compara que no sea cero lo que             |
| vendría a ser el divisor. Al final hacemos lo |
| mismo de mostrar con printf lo que sería el   |
| residuo y el cociente del resultado de la     |
| división.                                     |
*===============================================*
