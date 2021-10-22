
----------------------------------MOSTRAR--------------------------------------
--MOSTRAR PRESENTACION
CREATE PROC SP_MOSTRAR_PRESENTACION
AS 
SELECT TOP 200 * FROM PRESENTACION
ORDER BY [ID_Presentacion] DESC 
GO

------ARTICULO
CREATE PROC SP_MOSTRAR_ART
AS
SELECT TOP 200 * FROM ARTICULO
ORDER BY [ID_Art] DESC


---MOSTRAR INGRESO
CREATE PROC SP_MOSTRAR_INGRESO
AS
SELECT TOP 200 * FROM INGRESO
ORDER BY [ID_Ingreso] DESC



-----MOSTRAR PRESENTACION
CREATE PROC	SP_PRESENTACION
AS
SELECT TOP 200 * FROM PRESENTACION
ORDER BY [ID_Presentacion] DESC


----MOSTRAR PROVEEDOR
CREATE PROC SP_PROVEEDOR
AS
SELECT TOP 200 * FROM PROVEEDOR
ORDER BY [ID_Proveedor] DESC



----MOSTRAR TRABAJADOR
CREATE PROC SP_TRABAJADOR
AS
SELECT TOP 200 * FROM TRABAJADOR
ORDER BY [ID_Trabajador] DESC



----PROC VENTA
CREATE PROC SP_VENTA
AS
SELECT TOP 200 * FROM VENTA
ORDER BY [ID_Venta] DESC



------------------------------------BUSCAR------------------------------------------
--BUSQUEDA PRESENTACION
CREATE PROC SP_BUSCAR_PRESENTACION
@BusquedaTexto VARCHAR(60)
AS 
SELECT * FROM PRESENTACION
WHERE [Nombre_Presentacion] LIKE @BusquedaTexto + '%'
GO

--BUSCAR ARTICULO
CREATE PROC SP_BUSCAR_ART
@BusquedaTexto VARCHAR(60)
AS
SELECT * FROM ARTICULO
WHERE [Nombre_Art] LIKE @BusquedaTexto + '%'
GO

---BUSCAR PROVEEDOR
CREATE PROC SP_BUSCAR_PROVEEDOR
@BusquedaTexto VARCHAR(60)
AS
SELECT * FROM PROVEEDOR
WHERE [Razon_Social] LIKE @BusquedaTexto + '%'
GO

---BUSCAR TRABAJADOR
CREATE PROC SP_BUSCAR_TRABAJADOR
@BusquedaTexto VARCHAR(60)
AS
SELECT * FROM TRABAJADOR
WHERE [Nombre_Trabajador] LIKE @BusquedaTexto + '%'
GO

---BUSCAR USUARIO
CREATE PROC SP_BUSCAR_USUARIO
@BusquedaTexto VARCHAR(60)
AS
SELECT * FROM USUARIO
WHERE [Usuario] LIKE @BusquedaTexto + '%'
GO



-------------------------INSERTAR--------------------------------------

--INSERTAR PRESENTACION
CREATE PROC SP_INSERTAR_PRESENTACION
@idpresentacion INT OUTPUT,
@nombre VARCHAR(60),
@descripcion VARCHAR(1024),
@estado VARCHAR(10)
AS
INSERT INTO PRESENTACION([Nombre_Presentacion],[Descripcion_Presentacion],[Estado_Pre])
VALUES (@nombre,@descripcion,@estado)
GO


---INSERTAR ARTICULO
CREATE PROC SP_INSERTAR_ART
@idart INT OUTPUT,
@categoriaID INT,
@presentacionID INT,
@nombre VARCHAR(60),
@descripcion VARCHAR(1024),
@imagen IMAGE,
@estado VARCHAR(10)
AS
INSERT INTO
ARTICULO([Categoria_ID],[Presentacion_ID],[Nombre_Art],[Descripcion_Art],[Imagen],[Estado_Art])
VALUES (@categoriaID,@presentacionID,@nombre,@descripcion,@imagen,@estado)



----INSERTAR PROVEEDOR
CREATE PROC SP_INSERTAR_PROVEEDOR 
@idproveedor INT OUTPUT,
@razon_Social VARCHAR(30),
@sector_Comercial VARCHAR(30),
@tipo_Documento VARCHAR(20),
@direccion VARCHAR(100),
@telefono VARCHAR(8),
@email VARCHAR(60),
@url VARCHAR(1024),
@estado VARCHAR(10)
AS
INSERT INTO
PROVEEDOR([Razon_Social],[Sector_Comercial],[Tipo_Documento],[Direccion_P],[Telefono_P],[Email_P],[url],[Estado_Pro])
VALUES (@razon_Social,@sector_Comercial,@tipo_Documento,@direccion,@telefono,@email,@url,@estado)
GO


---- INSERTAR TRABAJADOR
CREATE PROC SP_INSERTAR_TRABAJADOR
@idtrabajador INT OUTPUT,
@nombre VARCHAR(30),
@apellido VARCHAR(30),
@fecha_nac DATE,
@genero VARCHAR(2),
@tipo_Doc VARCHAR(20),
@direccion VARCHAR(100),
@telefono VARCHAR(8),
@email VARCHAR(60),
@estado VARCHAR(10)
AS
INSERT INTO
TRABAJADOR([Nombre_Trabajador],[Apellido_Trabajador],[Fecha_Nacimiento],[Genero],[Tipo_Documento],[Direccion_T],[Telefono_T],[Email_T],[Estado_Tr])
VALUES (@nombre,@apellido,@fecha_nac,@genero,@tipo_Doc,@direccion,@telefono,@email,@estado)
GO

---- INSERTAR USUARIO
CREATE PROC SP_INSERTAR_USUARIO
@idusuario INT OUTPUT,
@trabajadorID INT,
@acceso VARCHAR(20),
@usuario VARCHAR(20),
@contrasena VARCHAR(20),
@estado VARCHAR(10)
AS
INSERT INTO
USUARIO([Trabajador_ID],[Acceso],[Usuario],[Contrasena],[Estado_Us])
VALUES(@trabajadorID,@acceso,@usuario,@contrasena,@estado)


---------------------------- EDITAR --------------------------------------

---EDITAR PRESENTACION
CREATE PROC SP_EDITAR_PRESENTACION
@idpresentacion INT,
@nombre VARCHAR(60),
@descripcion VARCHAR(1024),
@estado VARCHAR(10)
AS
UPDATE PRESENTACION SET [Nombre_Presentacion]= @nombre, [Descripcion_Presentacion]= @descripcion, [Estado_Pre] = @estado
WHERE [ID_Presentacion]= @idpresentacion 
GO

---EDITAR ARTICULO
CREATE PROC SP_EDITAR_ART
@idart INT OUTPUT,
@categoriaID INT,
@presentacionID INT,
@nombre VARCHAR(60),
@descripcion VARCHAR(1024),
@imagen IMAGE,
@estado VARCHAR(10)
AS
UPDATE ARTICULO SET [Categoria_ID]=@categoriaID, [Presentacion_ID]=@presentacionID, [Nombre_Art]=@nombre, [Descripcion_Art]=@descripcion,
[Imagen]=@imagen, [Estado_Art] = Estado
WHERE [ID_Art]=@idart
GO

---EDITAR PROVEEDOR
CREATE PROC SP_EDITAR_PROVEEDOR
@idproveedor INT OUTPUT,
@razon_Social VARCHAR(30),
@sector_comercial VARCHAR(30),
@tipo_documento VARCHAR(20),
@direccion VARCHAR(100),
@telefono VARCHAR(8),
@email VARCHAR(60),
@url VARCHAR(1024),
@estado VARCHAR(10)
AS
UPDATE PROVEEDOR SET [Razon_Social]=@razon_Social, [Sector_Comercial]=@sector_Comercial, [Tipo_Documento]=@tipo_documento, [Direccion_P]=@direccion,
[Telefono_P]=@telefono,[Email_P]=@email,[url]=@url, [Estado_Pro]=@estado
WHERE [ID_Proveedor]=@idproveedor
GO

--- EDITAR TRABAJADOR
CREATE PROC SP_EDITAR_TRABAJADOR
@idtrabajador INT OUTPUT,
@nombre VARCHAR(30),
@apellido VARCHAR(30),
@fecha_nac DATE,
@genero VARCHAR(2),
@tipo_Doc VARCHAR(20),
@direccion VARCHAR(100),
@telefono VARCHAR(8),
@email VARCHAR(60),
@estado VARCHAR(10)
AS
UPDATE TRABAJADOR SET [Nombre_Trabajador]=@nombre, [Apellido_Trabajador]=@apellido, [Fecha_Nacimiento]=@fecha_nac, [Genero]=@genero, [Tipo_Documento] =@tipo_Doc,
[Direccion_T]= @direccion, [Telefono_T]=@telefono, [Email_T]=@email, [Estado_Tr]=@estado
WHERE [ID_Trabajador]= @idtrabajador


--- EDITAR USUARIO
CREATE PROC SP_EDITAR_USUARIO
@idusuario INT OUTPUT,
@trabajadorID INT,
@acceso VARCHAR(20),
@usuario VARCHAR(20),
@contrasena VARCHAR(20),
@estado VARCHAR(10)
AS
UPDATE USUARIO SET [Trabajador_ID]=@trabajadorID, [Acceso]=@acceso, [Usuario]=@usuario, [Contrasena]=@contrasena, [Estado_Us]=@estado
WHERE [ID_Usuario]= @idusuario