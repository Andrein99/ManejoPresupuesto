USE [master]
GO
/****** Object:  Database [ManejoPresupuesto]    Script Date: 1/07/2025 6:54:40 p. m. ******/
CREATE DATABASE [ManejoPresupuesto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManejoPresupuesto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ManejoPresupuesto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManejoPresupuesto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ManejoPresupuesto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ManejoPresupuesto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManejoPresupuesto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManejoPresupuesto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManejoPresupuesto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManejoPresupuesto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET RECOVERY FULL 
GO
ALTER DATABASE [ManejoPresupuesto] SET  MULTI_USER 
GO
ALTER DATABASE [ManejoPresupuesto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManejoPresupuesto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManejoPresupuesto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManejoPresupuesto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManejoPresupuesto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManejoPresupuesto', N'ON'
GO
ALTER DATABASE [ManejoPresupuesto] SET QUERY_STORE = ON
GO
ALTER DATABASE [ManejoPresupuesto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ManejoPresupuesto]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoOperacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoCuentaId] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentas]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_TiposCuentas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposOperaciones]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposOperaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nchar](50) NOT NULL,
 CONSTRAINT [PK_TiposOperaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Nota] [nvarchar](1000) NULL,
	[CuentaId] [int] NOT NULL,
	[CategoriaId] [int] NOT NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailNormalizado] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_TiposOperaciones] FOREIGN KEY([TipoOperacionId])
REFERENCES [dbo].[TiposOperaciones] ([Id])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_TiposOperaciones]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_Usuarios]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_TiposCuentas] FOREIGN KEY([TipoCuentaId])
REFERENCES [dbo].[TiposCuentas] ([Id])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_TiposCuentas]
GO
ALTER TABLE [dbo].[TiposCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TiposCuentas_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TiposCuentas] CHECK CONSTRAINT [FK_TiposCuentas_Usuarios]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Categorias] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Categorias]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Cuentas] FOREIGN KEY([CuentaId])
REFERENCES [dbo].[Cuentas] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Cuentas]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[CrearDatosUsuarioNuevo]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andrés C.
-- Create date: 30-06-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearDatosUsuarioNuevo]
	-- Add the parameters for the stored procedure here
	@UsuarioId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Efectivo nvarchar(50) = 'Efectivo';
	DECLARE @CuentasDeBanco nvarchar(50) = 'Cuentas de banco';
	DECLARE @Tarjetas nvarchar(50) = 'Tarjetas';

	INSERT INTO TiposCuentas (Nombre, UsuarioId, Orden)
	VALUES 
	(@Efectivo, @UsuarioId, 1),
	(@CuentasDeBanco, @UsuarioId, 2),
	(@Tarjetas, @UsuarioId, 3);

	INSERT INTO Cuentas (Nombre, Balance, TipoCuentaId)
	SELECT Nombre, 0, Id
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId;

	INSERT INTO Categorias (Nombre, TipoOperacionId, UsuarioId)
	VALUES
	('Libros', 2, @UsuarioId),
	('Salario', 1, @UsuarioId),
	('Mesada', 1, @UsuarioId),
	('Comida', 2, @UsuarioId)
END
GO
/****** Object:  StoredProcedure [dbo].[TiposCuentas_Insertar]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andrés C
-- Create date: 06/06/2025
-- Description:	Procedimiento para insertar datos en la base de datos desde los tipos de cuenta.
-- =============================================
CREATE PROCEDURE [dbo].[TiposCuentas_Insertar]
	@Nombre nvarchar(50),
	@UsuarioId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Orden int;
	SELECT @Orden = COALESCE(MAX(Orden), 0) + 1
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId

	INSERT INTO TiposCuentas(Nombre, UsuarioId, Orden)
	VALUES (@Nombre, @UsuarioId, @Orden);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Actualizar]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andrés C.
-- Create date: 12-06-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Actualizar]
	-- Add the parameters for the stored procedure here
	@Id int,
	@FechaTransaccion datetime,
	@Monto decimal(18,2),
	@MontoAnterior decimal(18,2),
	@CuentaId int,
	@CuentaAnteriorId int,
	@CategoriaId int,
	@Nota nvarchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Revertir transacción anterior
	UPDATE Cuentas
	SET Balance -= @MontoAnterior 
	WHERE Id = @CuentaAnteriorId;

	-- Realizar nueva transacción
	UPDATE Cuentas
	SET Balance += @Monto
	WHERE Id = @CuentaId;

	UPDATE Transacciones
	SET Monto = ABS(@Monto), FechaTransaccion = @FechaTransaccion,
	CategoriaId = @CategoriaId, CuentaId = @CuentaId, Nota = @Nota
	WHERE Id = @Id;
	
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Borrar]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andrés C
-- Create date: 12-06-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Monto decimal(18,2);
	DECLARE @CuentaId int;
	DECLARE @TipoOperacionId int;

	SELECT @Monto = Monto, @CuentaId = CuentaId, @TipoOperacionId = cat.TipoOperacionId
	FROM Transacciones
	INNER JOIN Categorias cat
	ON cat.Id = Transacciones.CategoriaId
	WHERE Transacciones.Id = @Id;

	DECLARE @FactorMultiplicativo int = 1;
	IF (@TipoOperacionId = 2)
		SET @FactorMultiplicativo = -1;
	SET @Monto = @Monto * @FactorMultiplicativo;

	UPDATE Cuentas
	SET Balance -= @Monto
	WHERE Id = @CuentaId;

	DELETE Transacciones
	WHERE Id = @Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Insertar]    Script Date: 1/07/2025 6:54:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andrés C
-- Create date: 12/06/2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Insertar]
	-- Add the parameters for the stored procedure here
	@UsuarioId int,
	@FechaTransaccion date,
	@Monto decimal(18,2),
	@CategoriaId int,
	@CuentaId int,
	@Nota nvarchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Transacciones(UsuarioId, FechaTransaccion, Monto, CategoriaId, CuentaId, Nota)
	VALUES (@UsuarioId, @FechaTransaccion, ABS(@Monto), @CategoriaId, @CuentaId, @Nota)

	UPDATE Cuentas 
	SET Balance += @Monto
	WHERE Id = @CuentaId;

	SELECT SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [ManejoPresupuesto] SET  READ_WRITE 
GO
