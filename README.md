# 6Car - Aplicación web de gestión de coches

6Car es una aplicación web desarrollada en Java utilizando Servlets, JSP y MariaDB. El objetivo del proyecto es simular un sistema básico de gestión de coches de alquiler, permitiendo administrar coches y marcas con operaciones completas de creación, lectura, actualización y eliminación.

El proyecto está enfocado en el aprendizaje del desarrollo web con Java, aplicando arquitectura MVC y conexión a base de datos relacional.

## Descripción general

La aplicación gestiona dos entidades principales:

- Coches
- Marcas

Cada coche está asociado a una marca mediante una relación en base de datos. Esta relación se resuelve mediante consultas SQL con JOIN, lo que permite mostrar la información de forma más completa en la interfaz.

## Tecnologías utilizadas

- Java 17
- Servlets (Jakarta EE)
- JSP (Java Server Pages)
- MariaDB
- JDBC
- Maven
- Bootstrap 5
- HTML y CSS

## Arquitectura del proyecto

El proyecto sigue el patrón MVC (Modelo-Vista-Controlador), separando claramente responsabilidades:

- Modelo: clases Java que representan las entidades (Car y Brand)
- Vista: páginas JSP encargadas de la interfaz
- Controlador: servlets que gestionan la lógica de la aplicación
- Acceso a datos: repositorios que realizan las consultas a la base de datos mediante JDBC

## Funcionalidades

### Gestión de coches

- Listado de todos los coches disponibles
- Visualización del detalle de cada coche
- Creación de nuevos coches
- Edición de coches existentes
- Eliminación de coches
- Asociación con marcas mediante JOIN, mostrando el nombre de la marca en lugar del ID

### Gestión de marcas

- Listado de marcas
- Visualización del detalle de cada marca
- Creación de nuevas marcas
- Edición de marcas existentes
- Eliminación de marcas

## Base de datos

El sistema utiliza dos tablas principales:

# cars y # brands

Relación:
- La columna brand_id de la tabla cars hace referencia al id de la tabla brands

## Interfaz de usuario

La interfaz está desarrollada con Bootstrap 5 y tiene un diseño oscuro para mantener coherencia visual en toda la aplicación.

Incluye:

- Tarjetas para mostrar coches y marcas
- Navegación entre secciones
- Botones para editar y eliminar registros
- Confirmación antes de eliminar elementos
- Diseño responsive adaptado a distintos tamaños de pantalla

---

## Cómo ejecutar el proyecto

Para ejecutar la aplicación correctamente, sigue estos pasos:

1. Clona el repositorio en tu equipo:
git clone https://github.com/6Carros/6car.git

2. Importa el proyecto en tu entorno de desarrollo (por ejemplo IntelliJ IDEA o Eclipse) como un proyecto Maven.
  
3. Asegúrate de tener configurado un servidor Tomcat 10 o superior.

4. Configura la conexión a la base de datos MariaDB en la clase DatabaseConnection, ajustando la URL, usuario y contraseña según tu entorno local.

5. Ejecuta el script de base de datos (si es necesario) para crear las tablas cars y brands.

6. Despliega el proyecto en el servidor Tomcat desde el IDE o generando el archivo WAR.

7. Una vez desplegado, accede a la aplicación desde el navegador: http://localhost:8080/6car/cars
