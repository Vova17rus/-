USE [Diplom]
GO
/****** Object:  Table [dbo].[Mesto]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naimenov] [nvarchar](50) NULL,
 CONSTRAINT [PK_Место] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naimenov] [nvarchar](50) NULL,
 CONSTRAINT [PK_Предмет] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rezyl_Sobit]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezyl_Sobit](
	[ID_] [int] IDENTITY(1,1) NOT NULL,
	[ID_Fail] [int] NULL,
	[ID_Sobit] [int] NULL,
 CONSTRAINT [PK_Результат_событий] PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rezylitat]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezylitat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naimenov] [nvarchar](50) NULL,
 CONSTRAINT [PK_Результат] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sobit]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sobit](
	[ID_Sobit] [int] IDENTITY(1,1) NOT NULL,
	[Data_Nachal] [datetime] NULL,
	[Data_Okonchan] [datetime] NULL,
	[ID_Naimenov] [int] NULL,
	[ID_Rezyl] [int] NULL,
	[ID_Mesto] [int] NOT NULL,
	[ID_Predmet] [int] NULL,
	[Ychast] [nvarchar](50) NULL,
 CONSTRAINT [PK_Событие] PRIMARY KEY CLUSTERED 
(
	[ID_Sobit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ychast_Sobit]    Script Date: 08.04.2023 6:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ychast_Sobit](
	[ID_Наименование] [int] IDENTITY(1,1) NOT NULL,
	[ID_Событий] [int] NULL,
	[ID_Участника] [int] NULL,
 CONSTRAINT [PK_Участинк_событий] PRIMARY KEY CLUSTERED 
(
	[ID_Наименование] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Rezyl_Sobit]  WITH CHECK ADD  CONSTRAINT [FK_Результат_событий_Событие] FOREIGN KEY([ID_Sobit])
REFERENCES [dbo].[Sobit] ([ID_Sobit])
GO
ALTER TABLE [dbo].[Rezyl_Sobit] CHECK CONSTRAINT [FK_Результат_событий_Событие]
GO
ALTER TABLE [dbo].[Sobit]  WITH CHECK ADD  CONSTRAINT [FK_Событие_Место] FOREIGN KEY([ID_Mesto])
REFERENCES [dbo].[Mesto] ([ID])
GO
ALTER TABLE [dbo].[Sobit] CHECK CONSTRAINT [FK_Событие_Место]
GO
ALTER TABLE [dbo].[Sobit]  WITH CHECK ADD  CONSTRAINT [FK_Событие_Предмет] FOREIGN KEY([ID_Predmet])
REFERENCES [dbo].[Predmet] ([ID])
GO
ALTER TABLE [dbo].[Sobit] CHECK CONSTRAINT [FK_Событие_Предмет]
GO
ALTER TABLE [dbo].[Sobit]  WITH CHECK ADD  CONSTRAINT [FK_Событие_Результат] FOREIGN KEY([ID_Rezyl])
REFERENCES [dbo].[Rezylitat] ([ID])
GO
ALTER TABLE [dbo].[Sobit] CHECK CONSTRAINT [FK_Событие_Результат]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[ychast_Sobit]  WITH CHECK ADD  CONSTRAINT [FK_Участинк_событий_Событие] FOREIGN KEY([ID_Событий])
REFERENCES [dbo].[Sobit] ([ID_Sobit])
GO
ALTER TABLE [dbo].[ychast_Sobit] CHECK CONSTRAINT [FK_Участинк_событий_Событие]
GO
