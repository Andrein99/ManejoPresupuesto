## Proyecto
Aplicación para el manejo de finanzas personales desarrollada en ASP.NET Core con Dapper y SQL Server como base de datos. 
La aplicación fue desarrollada teniendo presentes los principios SOLID, y contiene sistema de usuarios (Identity), paginación, exportación a Excel, calendario con ventana modal para ver a detalle las transacciones del día, entre otras funcionalidades.

## 📐 Estructura de la Base de Datos (SQL Server)

Se incluye un script con la estructura (sin datos) de la base de datos en `BaseDeDatos/estructura_base_de_datos.sql`.

### Cómo usarlo

1. Abre **SQL Server Management Studio (SSMS)**.
2. Conéctate a tu servidor SQL.
3. Crea una nueva base de datos vacía.
4. Abre el script `estructura_base_de_datos.sql` y ejecútalo.

Esto generará todas las tablas y procedimientos almacenados necesarios para trabajar con el proyecto.
