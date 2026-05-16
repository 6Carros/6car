### 6CAR - Aplicación web de gestión de coches
6Car es una aplicación web desarrollada en Java utilizando Servlets, JSP y MariaDB. El objetivo del proyecto es simular un sistema básico de gestión de coches de alquiler, permitiendo administrar coches y marcas con operaciones completas de creación, lectura, actualización y eliminación.

El proyecto está enfocado en el aprendizaje del desarrollo web con Java, aplicando arquitectura MVC y conexión a base de datos relacional.

### Descripción general
La aplicación gestiona dos entidades principales:

    •  Coches 
    
    •  Marcas 
    
Cada coche está asociado a una marca mediante una relación en base de datos. Esta relación se resuelve mediante consultas SQL con JOIN, lo que permite mostrar el nombre de la marca en lugar del identificador numérico (brand_id) en la interfaz.

### Tecnologías utilizadas
    • Java 17 
    • Servlets (Jakarta EE) 
    • JSP (Java Server Pages) 
    • Apache Tomcat 10+ 
    • MariaDB 
    • JDBC 
    • Maven 
    • Bootstrap 5 
    • HTML5 y CSS3 

### Arquitectura del proyecto
El proyecto sigue el patrón MVC (Modelo-Vista-Controlador):

    • Modelo: clases Java que representan las entidades (Car, Brand) 
    
    • Vista: páginas JSP encargadas de la interfaz de usuario 
    
    • Controlador: servlets que gestionan la lógica de la aplicación 
    
    • Acceso a datos: repositorios que realizan consultas SQL mediante JDBC 
    
Esta separación permite una estructura organizada, escalable y fácil de mantener.

### Funcionalidades

Gestión de coches
  
    • Listado de coches disponibles
  
    • Visualización del detalle de cada coche
  
    • Creación de nuevos coches
  
    • Edición de coches existentes
  
    • Eliminación de coches
  
    • Asociación con marcas mediante JOIN (se muestra el nombre de la marca en lugar del ID) 

Gestión de marcas
  
    • Listado de marcas
  
    • Visualización del detalle de cada marca
  
    • Creación de nuevas marcas
  
    • Edición de marcas existentes
  
    • Eliminación de marcas


### Base de datos
El sistema utiliza dos tablas principales:

    • cars 
    
    • brands 
    
Relación:
  
    • La columna brand_id en la tabla cars hace referencia al id de la tabla brands
  
Esto permite establecer una relación 1:N (una marca puede tener muchos coches).

### Interfaz de usuario
La interfaz está desarrollada con Bootstrap 5, utilizando un diseño oscuro para mantener coherencia visual en toda la aplicación.

Incluye:

    • Tarjetas para mostrar coches y marcas 

    • Navegación entre secciones 
    
    • Botones para editar y eliminar registros 
    
    • Confirmación antes de eliminar elementos 
    
    • Diseño responsive adaptado a distintos tamaños de pantalla 

### Cómo ejecutar el proyecto

Para ejecutar la aplicación correctamente:

    1. Clonar el repositorio:  git clone https://github.com/6Carros/6car.git

    2. Importar el proyecto en un IDE (IntelliJ IDEA o Eclipse) como proyecto Maven 
    
    3. Asegurarse de tener configurado: 
        ◦ Java 17 
        ◦ Apache Tomcat 10 o superior 
        
    4. Configurar la conexión a la base de datos en la clase:
    
       DatabaseConnection
       
       Ajustando:
        ◦ URL de la base de datos 
        ◦ Usuario 
        ◦ Contraseña 
        
    5. Ejecutar el script SQL para crear las tablas cars y brands (si es necesario) 
    
    6. Desplegar el proyecto en Tomcat desde el IDE o generando un archivo .war 

### Acceso a la aplicación
Una vez desplegado en Tomcat:
http://localhost:8080/6car_war_exploded/index.jsp
