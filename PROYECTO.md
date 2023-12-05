# MODELO RELACIONAL

<image src="./project_initial_r.png" alt="modelo relacional inicial">

# MODELO ENTIDAD RELACION

<image src="./project_initial_er.png" alt="modelo entidad relacion incial">

# MODIFICACIONES
**Desde el inciso 1 hasta el inciso 3**

1. Agregue un campo Estado_Matrícula a la tabla Matrícula que indique si el estudiante se encuentra “En Ejecución”, “Terminado” o “Cancelado” .

    ```sql
    ALTER TABLE Estudiante DROP fk_Estudiante_id_Ruta;

    CREATE TABLE IF NOT EXISTS Registro (
        id_Estudiante INT NOT NULL,
        id_Ruta INT NOT NULL,
        state ENUM('Activo', 'Terminado', 'Cancelado'),
        FOREIGN KEY (id_Ruta) REFERENCES Ruta(id),
        FOREIGN KEY (id_Estudiante) REFERENCES Estudiante(id)
    );
    ```

2. Agregue el campo edad a la tabla de Aprendices.

    ```sql
    // Agregamos la columna age a la tabla Estudiante
    ALTER TABLE Estudiante ADD COLUMN age INT NOT NULL;
    ```

3. Si suponemos que los cursos tienen una duración diferente dependiendo de la ruta que lo contenga ¿qué modificación haría a la estructura de datos ya planteada?


    ```sql
    // Agregamos la columna duration a la tabla Ruta_Curso
    ALTER TABLE Ruta_Curso ADD COLUMN duration INT NOT NULL;
    ```

# CONSULTAS
**Desde el inciso 4 hasta el inciso 10**

4. Seleccionar los nombres y edades de aprendices que están cursando la carrera de electrónica.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        age AS Edad
    FROM Estudiante
    INNER JOIN sena.Registro R on Estudiante.id = R.id_Estudiante
    INNER JOIN sena.Ruta R2 on R.id_Ruta = R2.id
    LEFT JOIN sena.Carrera C on R2.id_Carrera = C.id
    WHERE C.name = "Electrónica" AND R.state="Activo";
    ```

5. Seleccionar Nombres de Aprendices junto al nombre de la ruta de aprendizaje que cancelaron.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        C.name as Carrera
    FROM Estudiante
    INNER JOIN sena.Registro R on Estudiante.id = R.id_Estudiante
    INNER JOIN sena.Ruta R2 on R.id_Ruta = R2.id
    LEFT JOIN sena.Carrera C on R2.id_Carrera = C.id
    WHERE R.state="Cancelado";
    ```

6. Seleccionar Nombre de los cursos que no tienen un instructor asignado.

    ```sql
    SELECT
        name as Curso
    FROM Curso
    LEFT JOIN sena.CursoInstructor CT ON Curso.id = CT.id_Curso
    WHERE CT.id_Instructor IS NULL;
    ```

7. Seleccionar Nombres de los instructores que dictan cursos en la ruta de aprendizaje “Sistemas de Información Empresariales”.

    ```sql
    SELECT DISTINCT 
        T.name as Instructor
    FROM Instructor T
    INNER JOIN sena.CursoInstructor CT on T.id = CT.id_Instructor
    INNER JOIN sena.CursoRuta CR on CT.id_Curso = CR.id_Curso
    INNER JOIN sena.Ruta R on CR.id_Ruta = R.id
    WHERE R.name = "Sistemas de Información Empresariales";

    ```

8. Genere un listado de todos los aprendices que terminaron una Carrera mostrando el nombre del profesional, el nombre de la carrera y el énfasis de la carrera (Nombre de la Ruta de aprendizaje)

    ```sql
    SELECT
        CONCAT(first_name, ' ', last_name) as Profesional,
        C.name as Carrera,
        R.name as Enfasis
    FROM Estudiante T
    INNER JOIN sena.Registro Re on T.id = Re.id_Estudiante
    INNER JOIN sena.Ruta R on Re.id_Ruta = R.id
    INNER JOIN sena.Carrera C on R.id_Carrera = C.id
    WHERE Re.state = "Terminado";
    ```

9. Genere un listado de los aprendices matriculados en el curso “Bases de Datos Relacionales”.

    ```sql
    SELECT
        CONCAT(first_name, '', last_name) AS Nombre
    FROM EstudianteGroup
    INNER JOIN sena.GroupEstudiante GT on Estudiante.id = GT.id_Estudiante
    INNER JOIN sena.CursoInstructor CT on GT.id_group = CT.id
    INNER JOIN sena.Curso C on CT.id_Curso = C.id
    WHERE C.name = "Bases de Datos Relacionales";
    ```

10. Nombres de Instructores que no tienen curso asignado.

    ```sql
    SELECT
        T.name as Instructor
    FROM Instructor T
    LEFT JOIN sena.CursoInstructor CT on T.id = CT.id_Instructor
    WHERE CT.id_Curso IS NULL;
    ```