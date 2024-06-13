Create table claustro (
	EmpleadoID SERIAL PRIMARY KEY,
	Nombre Varchar(100) NOT NULL,
	Rol Varchar(50) NOT NULL
);

CREATE TABLE promocion (
    promocion_id SERIAL PRIMARY KEY,
    vertical VARCHAR(100) NOT NULL,
    mes_promo VARCHAR(50) NOT NULL,
    campus VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE alumnos (
    alumnos_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE notas (
    Notas_id SERIAL PRIMARY KEY,
    notas TEXT NOT NULL
);

CREATE TABLE proyectos (
    proyecto_ID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE claustro_promocion (
    EmpleadoID INT NOT NULL,
    promocion_id INT NOT NULL,
    PRIMARY KEY (EmpleadoID, promocion_id),
    FOREIGN KEY (EmpleadoID) REFERENCES claustro(EmpleadoID),
    FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id)
);

ALTER TABLE alumnos
ADD COLUMN promocion_id INT,
ADD CONSTRAINT fk_alumnos_promocion
    FOREIGN KEY (promocion_id)
    REFERENCES promocion(promocion_id)
;

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