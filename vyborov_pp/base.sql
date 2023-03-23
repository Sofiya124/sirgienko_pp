USE [service_base]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [int] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 20.03.2023 1:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Казаков', N'Дмитрий', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Андреев', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Корнилова', N'Анэля', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Горбачёв', N'Давид', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Комиссарова', N'Амалия', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'2017-08-04T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Журавлёв', N'Леонтий', N'Яковлевич', CAST(N'2000-03-02' AS Date), CAST(N'2018-01-15T00:00:00.000' AS DateTime), N'cmdrgravy@me.com', N'7(4403)308-56-96 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Селиверстов', N'Глеб', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Зуев', N'Матвей', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Бобылёв', N'Георгий', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Евсеев', N'Макар', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Бобров', N'Агафон', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Гущина', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Калинин', N'Петр', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Агафонов', N'Юстиниан', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Мамонтова', N'Марфа', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'1', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Куликова', N'Эвелина', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'2', N'default.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Егорова', N'Амалия', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26 ', N'2', N'default.png')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 49, 10, CAST(N'2023-03-19T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 37, 41, CAST(N'2023-03-20T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 37, 19, CAST(N'2023-03-21T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 37, 28, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 20, 30, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 48, 26, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 24, 92, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 21, 20, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 16, 52, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 30, 34, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 3, 52, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 26, 41, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 6, 64, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 33, 32, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 35, 52, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 43, 80, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 48, 48, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 33, 64, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 30, 63, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 17, 83, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 9, 50, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 43, 12, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 38, 18, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 17, 67, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 35, 13, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 35, 92, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 1, 77, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 22, 76, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 48, 97, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 24, 50, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 46, 23, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 6, 83, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 25, 20, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 42, 66, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 30, 13, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 22, 27, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 50, 69, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 27, 3, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 30, 64, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 32, 29, CAST(N'2019-11-15T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 12, 9, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 21, 41, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 35, 80, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 24, 62, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 23, 69, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 13, 23, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 36, 10, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 16, 27, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 21, 13, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 8, 41, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 43, 29, CAST(N'2019-08-27T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 18, 66, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 4, 80, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 14, 34, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 11, 7, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 47, 13, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 46, 98, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 32, 89, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 5, 7, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 15, 92, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 10, 80, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 3, 60, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 27, 27, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 28, 92, CAST(N'2019-08-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 7, 13, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 33, 64, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 41, 20, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 13, 19, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 14, 30, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 27, 12, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 2, 19, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 46, 69, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 11, 14, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 10, 83, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 37, 40, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 23, 69, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 2, 60, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 29, 83, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 21, 14, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 32, 7, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 14, 51, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 33, 69, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 10, 10, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 48, 10, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 23, 48, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 5, 40, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 29, 18, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 31, 41, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 49, 67, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 34, 13, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 4, 48, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 45, 48, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 27, 52, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 40, 83, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 8, 18, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 41, 77, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 35, 14, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 40, 49, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 28, 98, CAST(N'2019-12-05T10:20:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 20, 48, CAST(N'2019-04-05T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1005, 2, 1, CAST(N'2023-02-03T12:55:00.000' AS DateTime), N'text')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'М')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Ж')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N' Услуги школы', 2500, 120, N'Занятие с репетитором-носителем китайского языка', 5, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N' Услуги школы', 1340, 110, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', 0, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N' Услуги школы', 1990, 100, N'Киноклуб китайского языка для студентов', 0, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N' Услуги школы', 1000, 80, N'Индивидуальный онлайн-урок японского языка по Skype', 20, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N' Услуги школы', 1050, 40, N'Киноклуб испанского языка для студентов', 10, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N' Услуги школы', 1450, 50, N'Занятие с русскоязычным репетитором испанского языка', 15, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N' Услуги школы', 1290, 40, N'Урок в группе итальянского языка для взрослых', 0, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N' Услуги школы', 1180, 40, N'Интенсивный онлайн-курс французского языка для компаний по Skype', 10, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N' Услуги школы', 1410, 40, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 20, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N' Услуги школы', 1970, 100, N'Урок в группе французского языка для школьников', 0, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N' Услуги школы', 910, 110, N'Занятие с репетитором-носителем английского языка', 0, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N' Услуги школы', 1770, 90, N'Киноклуб французского языка для взрослых', 10, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N' Услуги школы', 1560, 100, N'Киноклуб немецкого языка для взрослых', 10, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N' Услуги школы', 1300, 80, N'Урок в группе японского языка для школьников', 5, N'Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N' Услуги школы', 1790, 60, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', 15, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N' Услуги школы', 1230, 70, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', 10, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N' Услуги школы', 1860, 50, N'Урок в группе японского языка для студентов', 0, N'Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N' Услуги школы', 1670, 110, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 10, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N' Услуги школы', 1760, 30, N'Киноклуб итальянского языка для студентов', 0, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N' Услуги школы', 1730, 30, N'Урок в группе испанского языка для взрослых', 5, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N' Услуги школы', 1310, 100, N'Урок в группе испанского языка для студентов', 20, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N' Услуги школы', 1510, 120, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N' Услуги школы', 900, 110, N'Урок в группе английского языка для школьников', 0, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N' Услуги школы', 1090, 50, N'Занятие с репетитором-носителем испанского языка', 5, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N' Услуги школы', 1190, 40, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', 20, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N' Услуги школы', 2000, 40, N'Урок в группе китайского языка для студентов', 20, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N' Услуги школы', 1200, 90, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 10, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N' Услуги школы', 1610, 70, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 5, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N' Услуги школы', 1440, 50, N'Подготовка к экзамену ACT', 0, N'Подготовка к экзамену ACT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N' Услуги школы', 1730, 70, N'Урок в группе китайского языка для взрослых', 25, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N' Услуги школы', 1160, 50, N'Интенсивный онлайн-курс английского языка для компаний по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N' Услуги школы', 1070, 100, N'Подготовка к экзамену TOEFL', 5, N'Подготовка к экзамену TOEFL.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N' Услуги школы', 1370, 120, N'Занятие с репетитором-носителем итальянского языка', 5, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N' Услуги школы', 1010, 50, N'Урок в группе английского языка для взрослых', 25, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N' Услуги школы', 1250, 70, N'Киноклуб английского языка для взрослых', 5, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N' Услуги школы', 1630, 70, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', 15, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N' Услуги школы', 1910, 120, N'Урок в группе испанского языка для школьников', 0, N'Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N' Услуги школы', 1300, 80, N'Подготовка к экзамену GRE', 20, N'Подготовка к экзамену GRE.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N' Услуги школы', 960, 80, N'Урок в группе английского языка для студентов', 25, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N' Услуги школы', 1260, 40, N'Занятие с русскоязычным репетитором японского языка', 10, N'Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N' Услуги школы', 970, 90, N'Индивидуальный онлайн-урок немецкого языка по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N' Услуги школы', 1500, 80, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N' Услуги школы', 1800, 70, N'Киноклуб китайского языка для взрослых', 25, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N' Услуги школы', 1860, 120, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', 10, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N' Услуги школы', 1150, 70, N'Подготовка к экзамену GMAT', 5, N'Подготовка к экзамену GMAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N' Услуги школы', 1730, 120, N'Подготовка к экзамену IELTS', 0, N'Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N' Услуги школы', 1560, 40, N'Подготовка к экзамену SAT', 0, N'Подготовка к экзамену SAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N' Услуги школы', 1180, 50, N'Урок в группе китайского языка для школьников', 15, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N' Услуги школы', 980, 80, N'Киноклуб английского языка для студентов', 0, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N' Услуги школы', 1170, 30, N'Киноклуб португальского языка для студентов', 15, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N' Услуги школы', 1120, 100, N'Киноклуб китайского языка для детей', 10, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N' Услуги школы', 1570, 30, N'Урок в группе немецкого языка для школьников', 15, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N' Услуги школы', 1780, 70, N'Индивидуальный онлайн-урок испанского языка по Skype', 5, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N' Услуги школы', 930, 60, N'Урок в группе немецкого языка для взрослых', 5, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N' Услуги школы', 1480, 90, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', 20, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N' Услуги школы', 1970, 50, N'Занятие с русскоязычным репетитором португальского языка', 10, N'Португальский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N' Услуги школы', 1470, 110, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N' Услуги школы', 1420, 30, N'Занятие с русскоязычным репетитором немецкого языка', 0, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N' Услуги школы', 1280, 40, N'Киноклуб английского языка для детей', 5, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N' Услуги школы', 1120, 120, N'Занятие с репетитором-носителем немецкого языка', 0, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N' Услуги школы', 1410, 70, N'Индивидуальный онлайн-урок китайского языка по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N' Услуги школы', 1300, 120, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 0, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N' Услуги школы', 1180, 120, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 20, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N' Услуги школы', 1840, 70, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 10, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N' Услуги школы', 1410, 100, N'Урок в группе итальянского языка для школьников', 15, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N' Услуги школы', 1330, 30, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 20, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N' Услуги школы', 1760, 120, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 15, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N' Услуги школы', 1870, 100, N'Занятие с русскоязычным репетитором французского языка', 20, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N' Услуги школы', 990, 30, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 5, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N' Услуги школы', 1880, 100, N'Индивидуальный онлайн-урок английского языка по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N' Услуги школы', 1390, 70, N'Индивидуальный урок французского языка с русскоязычным преподавателем', 0, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N' Услуги школы', 2010, 60, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', 25, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N' Услуги школы', 2010, 120, N'Индивидуальный онлайн-урок французского языка по Skype', 0, N'online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N' Услуги школы', 1210, 80, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N' Услуги школы', 960, 120, N'Урок в группе французского языка для взрослых', 15, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N' Услуги школы', 1430, 90, N'Подготовка к экзамену IELTS Speaking Club', 20, N'Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N' Услуги школы', 1480, 70, N'Киноклуб итальянского языка для детей', 0, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N' Услуги школы', 1020, 110, N'Урок в группе итальянского языка для студентов', 0, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N' Услуги школы', 1690, 80, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', 0, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N' Услуги школы', 1670, 120, N'Киноклуб немецкого языка для детей', 5, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N' Услуги школы', 1760, 110, N'Киноклуб итальянского языка для взрослых', 0, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N' Услуги школы', 950, 30, N'Киноклуб португальского языка для взрослых', 5, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N' Услуги школы', 1710, 90, N'Киноклуб португальского языка для детей', 15, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N' Услуги школы', 1600, 90, N'Киноклуб французского языка для детей', 10, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N' Услуги школы', 1420, 80, N'Урок в группе японского языка для взрослых', 5, N'Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N' Услуги школы', 1940, 40, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N' Услуги школы', 1620, 70, N'Занятие с русскоязычным репетитором итальянского языка', 20, N'Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N' Услуги школы', 1910, 30, N'Индивидуальный урок английского языка с русскоязычным преподавателем', 10, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N' Услуги школы', 1580, 30, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N' Услуги школы', 1000, 90, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', 25, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N' Услуги школы', 1140, 50, N'Киноклуб немецкого языка для студентов', 15, N'киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N' Услуги школы', 2040, 50, N'Занятие с репетитором-носителем французского языка', 0, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N' Услуги школы', 1240, 70, N'Урок в группе немецкого языка для студентов', 0, N'Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N' Услуги школы', 940, 110, N'Занятие с русскоязычным репетитором китайского языка', 15, N'Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N' Услуги школы', 1100, 50, N'Занятие с репетитором-носителем японского языка', 25, N'Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N' Услуги школы', 1910, 30, N'Урок в группе французского языка для студентов', 0, N'Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N' Услуги школы', 900, 110, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 0, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N' Услуги школы', 1950, 90, N'Занятие с русскоязычным репетитором английского языка', 15, N'Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N' Услуги школы', 1660, 90, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', 0, N'for company.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N' Услуги школы', 1380, 70, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', 20, N'for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (102, N'Услуги школы', 6000, 100, N'Тестовая услуга', 10, N'Подготовка к экзамену GMAT.png')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicePhoto] ON 

INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (1, 102, N'Испанский язык.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (2, 102, N'Подготовка к экзамену TOEFL.jpg')
SET IDENTITY_INSERT [dbo].[ServicePhoto] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
