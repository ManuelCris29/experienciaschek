# Checklist de Experiencias (Flask + MySQL)

Aplicación web para gestionar checklists de experiencias por salas. Permite:
- Administrar salas (altas/bajas).
- Registrar experiencias y su checklist diario (estado y comentario).
- Consultar por fecha y exportar informe en PDF.
- Visualizar gráficos agregados por estado.

## Requisitos
- Python 3.12 (recomendado)
- MySQL 8.x

Instalar dependencias:
```bash
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

## Configuración de Base de Datos
Editar `src/database.py` con tus credenciales MySQL (host, user, password, database). Ejemplo:
```python
return mysql.connector.connect(
    host='127.0.0.1',
    user='root',
    password='TU_PASSWORD',
    database='check',
    ssl_disabled=True,
    use_pure=True
)
```

Al iniciar la app se crea (si no existe) la tabla `salas` y se puebla con los valores distintos de `experiencias.NombreSala`.

Tablas usadas:
- `experiencias(Activo, NombreSala, NombreExperiencia, ...)`
- `cheklist(Activo, NombreSala, Fecha, NombreExperiencia, Estado, Comentario)`
- `salas(id, nombre UNIQUE, activo)`

## Ejecutar en desarrollo
Desde `src/`:
```bash
venv\Scripts\python.exe guardar.py
```
La app levanta en `http://10.1.0.24:5000` (ajústalo en `guardar.py` si lo deseas).

## Rutas principales
- `/` Lista de Chequeo (selección de sala, ingreso de checklist)
- `/CRUD` Gestión de experiencias (CRUD)
- `/mostrarchek` Consulta por fecha y actualización de estado
- `/exportar?fecha_inicial=YYYY-MM-DD&fecha_final=YYYY-MM-DD` Exporta PDF
- `/mostrar_grafico` Gráficos (GET muestra UI, POST devuelve imagen base64)
- `/salas` Administración de salas (GET lista, POST crea, POST `/salas/delete/<id>` elimina)

## Notas técnicas
- Exportación PDF con ReportLab.
- Gráficos con Matplotlib (backend Agg).
- Se removieron listas quemadas de salas en consultas; se ordena por `NombreSala, fecha`.
- La exportación de PDF normaliza fechas con `STR_TO_DATE('%Y-%m-%d')` para evitar resultados vacíos.

## Próximas mejoras sugeridas
- Variables de entorno para `SECRET_KEY` y credenciales MySQL.
- CSRF (Flask-WTF) y autenticación para módulos de administración.
- Integridad referencial: migrar `experiencias.NombreSala` a `experiencias.sala_id` (FK a `salas`).
- Datepicker unificado y tablas con paginación/búsqueda.
- Docker Compose para app + MySQL y Alembic para migraciones.


