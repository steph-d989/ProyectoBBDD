![logotipo de The Bridge](https://user-images.githubusercontent.com/27650532/77754601-e8365180-702b-11ea-8bed-5bc14a43f869.png "logotipo de The Bridge")

# **Esquema de la Base de Datos para The Bridge**

En este documento proporcionamos una visión general del esquema de la base de datos para The Bridge, detallando el propósito y la estructura de cada tabla y las relaciones entre ellas.
---
**Diagrama ER**
---
![Diagrama ER](https://github.com/steph-d989/ProyectoBBDD/blob/main/ER%20DIAGRAM%20PROYECTO%20BBDD.png)
---
<br>**Diagrama Logico**
---
![Diagrama Logico](https://github.com/steph-d989/ProyectoBBDD/blob/main/MODELO%20LOGICO%20PROYECTO%20BBDD.png)
---

**Tablas**

**1. Claustro**
   
   Esta tabla almacena información sobre los empleados (personal docente: LI, TA) de la institución.

        - EmpleadoID: Identificador único para cada empleado (Clave Primaria).
        - Nombre: Nombre del empleado.
        - Rol: Rol del empleado (por ejemplo, LI, TA).

                CREATE TABLE claustro (
                    EmpleadoID SERIAL PRIMARY KEY,
                    Nombre VARCHAR(100) NOT NULL,
                    Rol VARCHAR(50) NOT NULL
                );

**2. Promoción**
   
   Esta tabla almacena información sobre las diferentes promociones o programas académicos ofrecidos por The Bridge.

        - Promocion_id: Identificador único para cada promoción (Clave Primaria).
        - Vertical: Especialización.
        - Mes_promo: Mes de la promoción.
        - Campus: Campus donde se ofrece la promoción.
        - Modalidad: Modalidad de la promoción (por ejemplo, En línea, Presencial).
        - Fecha: Fecha de la promoción.

                CREATE TABLE promocion (
                    promocion_id SERIAL PRIMARY KEY,
                    vertical VARCHAR(100) NOT NULL,
                    mes_promo VARCHAR(50) NOT NULL,
                    campus VARCHAR(100) NOT NULL,
                    modalidad VARCHAR(50) NOT NULL,
                    fecha DATE NOT NULL
                );
   
**3. Alumnos**
   
   Esta tabla almacena información sobre los estudiantes matriculados en la institución.

        - Alumnos_id: Identificador único para cada estudiante (Clave Primaria).
        - Nombre: Nombre del estudiante.
        - Email: Dirección de correo electrónico del estudiante.
        - Promocion_id: Clave foránea que referencia promocion(promocion_id).

                CREATE TABLE alumnos (
                    alumnos_id SERIAL PRIMARY KEY,
                    nombre VARCHAR(100) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    promocion_id INT,
                    CONSTRAINT fk_alumnos_promocion FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id)
                );
   
**4. Notas**
   
   Esta tabla almacena notas o comentarios relacionados con los estudiantes y sus proyectos.

        - Notas_id: Identificador único para cada nota (Clave Primaria).
        - Notas: Texto de la nota.
        - Alumnos_id: Clave foránea que referencia alumnos(alumnos_id).
        - Proyecto_id: Clave foránea que referencia proyectos(proyecto_id).

                CREATE TABLE notas (
                    Notas_id SERIAL PRIMARY KEY,
                    notas TEXT NOT NULL,
                    alumnos_id INT,
                    proyecto_id INT,
                    CONSTRAINT fk_alumnos_id FOREIGN KEY (alumnos_id) REFERENCES alumnos(alumnos_id),
                    CONSTRAINT fk_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
                );
   
**5. Proyectos**
   
   Esta tabla almacena información sobre los diferentes proyectos realizados por los estudiantes.

        - Proyecto_ID: Identificador único para cada proyecto (Clave Primaria).
        - Nombre: Nombre del proyecto.

                CREATE TABLE proyectos (
                    proyecto_ID SERIAL PRIMARY KEY,
                    nombre VARCHAR(100) NOT NULL
                );
   
**6. Claustro_promoción**
   
   Esta tabla define la relación muchos a muchos entre claustro y promocion.

        - EmpleadoID: Clave foránea que referencia claustro(EmpleadoID).
        - Promocion_id: Clave foránea que referencia promocion(promocion_id).
        - Clave Primaria: Clave compuesta de EmpleadoID y promocion_id.

                CREATE TABLE claustro_promocion (
                    EmpleadoID INT NOT NULL,
                    promocion_id INT NOT NULL,
                    PRIMARY KEY (EmpleadoID, promocion_id),
                    FOREIGN KEY (EmpleadoID) REFERENCES claustro(EmpleadoID),
                    FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id)
                );
   
**Alteraciones de Tablas**

- Alterar tabla alumnos para agregar columna promocion_id:

        ALTER TABLE alumnos
        ADD COLUMN promocion_id INT,
        ADD CONSTRAINT fk_alumnos_promocion
            FOREIGN KEY (promocion_id)
            REFERENCES promocion(promocion_id)
        ;
        
- Alterar tabla notas para agregar columnas alumnos_id y proyecto_id:

        ALTER TABLE notas
        ADD COLUMN alumnos_id INT,
        ADD CONSTRAINT fk_alumnos_id
            FOREIGN KEY (alumnos_id)
            REFERENCES alumnos(alumnos_id)
        ;

        ALTER TABLE notas
        ADD COLUMN proyecto_id INT,
        ADD CONSTRAINT fk_proyecto_id
            FOREIGN KEY (proyecto_id)
            REFERENCES proyectos(proyecto_id)
        ;
        
Este esquema de base de datos organiza la información de The Bridge de manera estructurada, permitiendo gestionar datos de empleados, promociones, estudiantes, notas y proyectos de forma eficiente.







