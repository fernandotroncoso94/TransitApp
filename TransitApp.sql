Drop table Alumno;
drop table Guardia;
Drop table Administrador;
Drop table usuario;
drop table Alumno;
drop table Bicicleta;

GO
/****** Object:  Table [dbo].[Bicicleta]    Script Date: 07/13/2018 02:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bicicleta](
	[IDBicicleta] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](15) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Imagen] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBicicleta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/13/2018 02:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Rol] [nchar](15) NOT NULL,
	[RutU] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RutU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guardia]    Script Date: 07/13/2018 02:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardia](
	[RutG] [nchar](20) NOT NULL,
	[Clave] [nchar](30) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RutG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 07/13/2018 02:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[RutA] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Carrera] [varchar](250) NOT NULL,
	[Jornada] [varchar](15) NOT NULL,
	[IDBicicleta] [int] NOT NULL,
	[IDBicicletaAnterior] [int] NULL,
	[HoraIngreso] [datetime] NULL,
	[HoraSalida] [datetime] NULL,
	[Comentario] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RutA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 07/13/2018 02:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[RutA] [nchar](20) NOT NULL,
	[Clave] [nchar](30) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RutA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__Administra__RutA__108B795B]    Script Date: 07/13/2018 02:28:51 ******/
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD FOREIGN KEY([RutA])
REFERENCES [dbo].[Usuario] ([RutU])
GO
/****** Object:  ForeignKey [FK__Alumno__IDBicicl__117F9D94]    Script Date: 07/13/2018 02:28:51 ******/
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([IDBicicleta])
REFERENCES [dbo].[Bicicleta] ([IDBicicleta])
GO
/****** Object:  ForeignKey [FK__Guardia__RutG__1273C1CD]    Script Date: 07/13/2018 02:28:51 ******/
ALTER TABLE [dbo].[Guardia]  WITH CHECK ADD FOREIGN KEY([RutG])
REFERENCES [dbo].[Usuario] ([RutU])
GO
