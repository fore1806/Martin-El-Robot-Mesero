:robot: # Martin-El-Robot-Mesero

## Autores

|              Nombre              |GitHub nickname|
|----------------------------------|---------------|
|   Gabriel Eduardo Bojacá Munar   |[GabrielBojaca](https://github.com/GabrielBojaca)|
|    Andrés Felipe Forero Salas    |[fore1806](https://github.com/fore1806)|
|    Carlos Mario Jiménez Novoa    |[cajimn](https://github.com/cajimn)|
|   Oscar Julián Olivos Aguirre    |[oolivos27](https://github.com/oolivos27)|
|   Andrés Felipe Zuleta Romero    |[felipeZuleta](https://github.com/felipeZuleta)|

## Introducción

La automatización de procesos se está convirtiendo en una realidad cada vez más latente e importante para las tareas y oficios repetitivos que se realizan por periodos largos de tiempo y se ha visto que la alternativa más frecuente parar automatizar este tipo de procesos es llevada a cabo mediante robots debido a su excelente desempeño y eficiencia. Sin embargo, esto es una realidad que se ha implementado en solo algunos sectores comerciales tales como en la industria ensambladora, operadoras de instalaciones y maquinaria, empresas encargadas de almacenar, preparar y despachar mercancía o inventarios, etc.

Debido a lo anterior, este proyecto pretende aportar al desarrollo de este fenómeno, automatizando uno los oficios más comunes alrededor del mundo: el servicio que presta un conjunto de meseros en un restaurante.

## Problema

Al programar un conjunto de robots para que cumplan la función de camarero no es conveniente analizar cada robot como una unidad, por el contrario, se debe pensar en un sistema madre que tenga en cuenta todos los robots presentes en el restaurante. Dicho sistema debe recibir retroalimentación continua del estado de los robots y del cliente para coordinar de forma armónica y ordenada las trayectorias que debe seguir cada robot en cada instante de operación. 

Implementar dicho sistema es esencial para el funcionamiento del restaurante porque la ausencia de este puede conducir a fallas en el sistema, como por ejemplo mesas sin atender traducido a tiempos de espera largos para el consumidor, aglomeraciones innecesarias entre varios robots en una misma mesa, entregas de pedidos erróneos y trayectorias ineficientes del robot.

Se busca como principal objetivo, implementar un software que brinde por una parte funciones de control y monitoreo al encargado o dueño del restaurante al permitirle verificar el estado de cada robot, el estado de las mesas y distintos pedidos. Y por otra parte que le permita al usuario llevar a cabo solicitudes de órdenes, consultas al menú y mostrarle las opciones de pago disponibles.

## Requerimientos del Software

El software estará enfocado principalmente en facilitar procesos de administración, visualización y compra de los productos. Por esta razón se deben determinar ciertos requerimientos funcionales que se deben cumplir para que el programa logre desarrollar todas sus funciones satisfactoriamente y se comporte de manera deseada sin importar la entrada de datos.

Los principales requerimientos funcionales del programa son: 

- Almacenamiento de datos de productos.

- Almacenamiento de información de mesas.

- Almacenamiento de datos de los robots.

- Monitoreo de la información en tiempo real.

- Diferenciación de tareas para Administrador y Cliente.

- Facilidad de uso.

- Minimizar tiempos de atención.

- Asignación de robots de manera eficiente.

## Implementación

Para el desarrollo de la primera fase, se hace un uso primordial de estructuras de datos lineales, tales como listas enlazadas y colas, a continuación se describe brevemente su utilización en el proyecto.

### Listas Enlazadas

Se implementa una lista a través de arreglos que permite el facil almacenamiento y acceso de pocos elementos tales como los botones de una pantalla de la interfaz; por otro lado se utiliza una implementación con referencias para almacenar robots, pedidos y demás elementos con tamaño variable que puede exceder los miles con la facilidad de utilizar la misma implementación, esta decisión será explicada en la sección de pruebas del presente informe.

### Colas

Se realiza su implementación a través de referencia, y se utiliza para almacenar los robots que se encuentran en la zona de espera de pedidos.

## Dificultades y Lecciones aprendidas

- El equipo de trabajo encontró en la comunicación, la principal herramienta para realizar un trabajo efectivo y de esta manera evitar errores de sincronización del repositorio remoto. Esto después de que en dos ocasiones se presentaran problemas al trabajar conjuntamente en la misma sección del código.

- El trabajo en equipo fue satisfactorio debido a la división de tareas, a la coordinación entre los integrantes y a la colaboración entre cada uno de ellos al momento de solucionar dudas o considerar otras posibilidades de solución.

- Realizar un cronograma de trabajo para las siguientes entregas, es indispensable para optimizar el tiempo de trabajo de los integrantes.

- Realizar los métodos que utilizan el tiempo de ejecución del programa fue una tarea complicada de desarrollar.
