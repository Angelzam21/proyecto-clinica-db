# Base de Datos de la Clínica 

Este repositorio contiene todos los scripts necesarios para crear, poblar y gestionar la base de datos de nuestro proyecto.

---

## FAQ: Cómo Usar Este Rep repositorio

### 1. EMPEZANDO
Necesitamos
- **DBeaver**.
- **archivos SQL** de este repositorio.

### 2. CREANDO LA DB
Hay que seguir **en orden**. los siguientes pasos para que funcione.

1.  **Crea una base de datos vacía:** En DBeaver, crea una nueva conexión a una base de datos SQLite. Puede ser `Clinica.db`.
2.  **Ejecuta el script de creación (`Clinica-SQL.sql`):** Abre este archivo en DBeaver y ejecútalo. Esto construirá todas las tablas, pero estarán vacías.
3.  **Ejecuta el script para poblar (`PoblarDB.sql`):** Ahora, abre este archivo y ejecútalo. Esto poblara las tablas.

¡Listo!

### 3. ¿Cómo verifico que se poblaron correctamente las tablas?
Ejecuta el script **`ChequeoTablas.sql`**. Este comando te mostrará una lista de todas las tablas y la cantidad de registros en cada una.

### 4. REINICIANDO TODO
para esto esta el script **`VaciarDatosDB.sql`**.
- **No necesitamos borrar la base de datos completa.** solo ejecutamos este script.
- Borrará **todos los datos** de todas las tablas, pero dejará la estructura intacta.
- Después de ejecutarlo, podemos volver a correr `PoblarDB.sql` para tener los datos originales nuevamente

