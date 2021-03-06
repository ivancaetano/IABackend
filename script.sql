USE [ALLDB001]
GO
/****** Object:  UserDefinedFunction [dbo].[carfn001_nota_economia]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[carfn001_nota_economia](@vr_economia decimal(10,2))
returns int
as
begin
	return case 
	when @vr_economia<=9.4 then 21
	when @vr_economia<=9.875 then 20
	when @vr_economia<=10.35 then 19
	when @vr_economia<=10.825 then 18
	when @vr_economia<=11.3 then 17
	when @vr_economia<=11.775 then 16
	when @vr_economia<=12.25 then 15
	when @vr_economia<=12.725 then 14
	when @vr_economia<=13.2 then 13
	when @vr_economia<=13.675 then 12
	when @vr_economia<=14.15 then 11
	when @vr_economia<=14.625 then 10
	when @vr_economia<=15.1 then 9
	when @vr_economia<=15.575 then 8
	when @vr_economia<=16.05 then 7
	when @vr_economia<=16.525 then 6
	when @vr_economia<=17 then 5
	when @vr_economia<=17.475 then 4
	when @vr_economia<=17.95 then 3
	when @vr_economia<=18.425 then 2
	else 1


	end
	
end

GO
/****** Object:  UserDefinedFunction [dbo].[carfn002_nota_conforto]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[carfn002_nota_conforto](@vr_conforto decimal(10,2))
returns int
as
begin
	return case 
	when @vr_conforto<=2305 then 21
	when @vr_conforto<=2326.2 then 20
	when @vr_conforto<=2347.4 then 19
	when @vr_conforto<=2368.6 then 18
	when @vr_conforto<=2389.8 then 17
	when @vr_conforto<=2411 then 16
	when @vr_conforto<=2432.2 then 15
	when @vr_conforto<=2453.4 then 14
	when @vr_conforto<=2474.6 then 13
	when @vr_conforto<=2495.8 then 12
	when @vr_conforto<=2517 then 11
	when @vr_conforto<=2538.2 then 10
	when @vr_conforto<=2559.4 then 9
	when @vr_conforto<=2580.6 then 8
	when @vr_conforto<=2601.8 then 7
	when @vr_conforto<=2623 then 6
	when @vr_conforto<=2644.2 then 5
	when @vr_conforto<=2665.4 then 4
	when @vr_conforto<=2686.6 then 3
	when @vr_conforto<=2707.8 then 2
	else 1


	end
	
end

GO
/****** Object:  UserDefinedFunction [dbo].[carfn003_nota_potencia]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[carfn003_nota_potencia](@vr_peso_potencia decimal(10,2),@vr_peso_torque decimal(10,2))
returns int
as
begin
	declare @nu_pp int=case when @vr_peso_potencia<=4.63 then 1
	when @vr_peso_potencia<=5.116 then 2
	when @vr_peso_potencia<=5.602 then 3
	when @vr_peso_potencia<=6.088 then 4
	when @vr_peso_potencia<=6.574 then 5
	when @vr_peso_potencia<=7.06 then 6
	when @vr_peso_potencia<=7.546 then 7
	when @vr_peso_potencia<=8.032 then 8
	when @vr_peso_potencia<=8.518 then 9
	when @vr_peso_potencia<=9.004 then 10
	when @vr_peso_potencia<=9.49 then 11
	when @vr_peso_potencia<=9.976 then 12
	when @vr_peso_potencia<=10.462 then 13
	when @vr_peso_potencia<=10.948 then 14
	when @vr_peso_potencia<=11.434 then 15
	when @vr_peso_potencia<=11.92 then 16
	when @vr_peso_potencia<=12.406 then 17
	when @vr_peso_potencia<=12.892 then 18
	when @vr_peso_potencia<=13.378 then 19
	when @vr_peso_potencia<=13.864 then 20
	else 21 end
	declare @nu_pt int=case when @vr_peso_potencia<=30.88 then 1
when @vr_peso_potencia<=34.6115 then 2
when @vr_peso_potencia<=38.343 then 3
when @vr_peso_potencia<=42.0745 then 4
when @vr_peso_potencia<=45.806 then 5
when @vr_peso_potencia<=49.5375 then 6
when @vr_peso_potencia<=53.269 then 7
when @vr_peso_potencia<=57.0005 then 8
when @vr_peso_potencia<=60.732 then 9
when @vr_peso_potencia<=64.4635 then 10
when @vr_peso_potencia<=68.195 then 11
when @vr_peso_potencia<=71.9265 then 12
when @vr_peso_potencia<=75.658 then 13
when @vr_peso_potencia<=79.3895 then 14
when @vr_peso_potencia<=83.121 then 15
when @vr_peso_potencia<=86.8525 then 16
when @vr_peso_potencia<=90.584 then 17
when @vr_peso_potencia<=94.3155 then 18
when @vr_peso_potencia<=98.047 then 19
when @vr_peso_potencia<=101.7785 then 20
	else 21 end
	return (@nu_pp+@nu_pt)/2


	
end

GO
/****** Object:  Table [dbo].[cartb001_modelo]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartb001_modelo](
	[nu_modelo] [int] IDENTITY(1,1) NOT NULL,
	[no_modelo] [varchar](200) NOT NULL,
	[nu_marca] [int] NOT NULL,
 CONSTRAINT [PK_cartb001_modelo] PRIMARY KEY CLUSTERED 
(
	[nu_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cartb002_marca]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartb002_marca](
	[nu_marca] [int] IDENTITY(1,1) NOT NULL,
	[no_marca] [varchar](200) NOT NULL,
 CONSTRAINT [PK_cartb002_marca] PRIMARY KEY CLUSTERED 
(
	[nu_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cartb003_categoria]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartb003_categoria](
	[nu_categoria] [int] IDENTITY(1,1) NOT NULL,
	[no_categoria] [varchar](200) NULL,
 CONSTRAINT [PK_cartb003_categoria] PRIMARY KEY CLUSTERED 
(
	[nu_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cartb004_versao]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartb004_versao](
	[nu_versao] [int] IDENTITY(1,1) NOT NULL,
	[no_versao] [varchar](200) NOT NULL,
	[nu_modelo] [int] NOT NULL,
	[nu_categoria] [int] NOT NULL,
	[vr_peso_potencia] [decimal](10, 2) NOT NULL,
	[vr_peso_torque] [decimal](10, 2) NOT NULL,
	[vr_economia] [decimal](10, 2) NOT NULL,
	[vr_conforto] [decimal](10, 2) NOT NULL,
	[nu_economia]  AS ([dbo].[carfn001_nota_economia]([vr_economia])),
	[nu_conforto]  AS ([dbo].[carfn002_nota_conforto]([vr_conforto])),
	[nu_potencia]  AS ([dbo].[carfn003_nota_potencia]([vr_peso_potencia],[vr_peso_torque])),
	[ic_nacionalidade] [char](1) NOT NULL,
	[ic_combustivel] [char](1) NOT NULL,
	[ic_cambio] [char](1) NOT NULL,
 CONSTRAINT [PK_cartb004_versao] PRIMARY KEY CLUSTERED 
(
	[nu_versao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cartb005_ano_versao]    Script Date: 23/05/2019 17:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartb005_ano_versao](
	[nu_versao] [int] NOT NULL,
	[aa_versao] [smallint] NOT NULL,
	[vr_preco] [decimal](10, 2) NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cartb001_modelo] ON 

INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (1, N'Onix', 13)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (2, N'HB20', 17)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (3, N'Ka', 11)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (4, N'Polo', 1)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (5, N'Kwid', 7)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (6, N'Argo', 4)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (7, N'Golf', 1)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (8, N'Cruze Sport6', 13)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (9, N'Focus', 11)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (10, N'208', 10)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (11, N'A250', 8)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (12, N'V40', 9)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (13, N'A3', 6)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (14, N'Sandero', 7)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (15, N'March', 5)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (16, N'Mobi', 4)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (17, N'Yaris', 2)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (18, N'Prius', 2)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (19, N'Serie 1', 3)
INSERT [dbo].[cartb001_modelo] ([nu_modelo], [no_modelo], [nu_marca]) VALUES (20, N'Up', 1)
SET IDENTITY_INSERT [dbo].[cartb001_modelo] OFF
SET IDENTITY_INSERT [dbo].[cartb002_marca] ON 

INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (6, N'Audi')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (3, N'BMW')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (13, N'Chevrolet')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (4, N'Fiat')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (11, N'Ford')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (17, N'Hyundai')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (8, N'Mercedes-Benz')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (5, N'Nissan')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (10, N'Peugeot')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (7, N'Renault')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (2, N'Toyota')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (1, N'Volkswagen')
INSERT [dbo].[cartb002_marca] ([nu_marca], [no_marca]) VALUES (9, N'Volvo')
SET IDENTITY_INSERT [dbo].[cartb002_marca] OFF
SET IDENTITY_INSERT [dbo].[cartb003_categoria] ON 

INSERT [dbo].[cartb003_categoria] ([nu_categoria], [no_categoria]) VALUES (1, N'Hatch')
SET IDENTITY_INSERT [dbo].[cartb003_categoria] OFF
SET IDENTITY_INSERT [dbo].[cartb004_versao] ON 

INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (2, N'Onix Joy', 1, 1, CAST(12.64 AS Decimal(10, 2)), CAST(103.16 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (3, N'Onix LT 1.0', 1, 1, CAST(12.93 AS Decimal(10, 2)), CAST(105.51 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (4, N'Onix LT 1.4', 1, 1, CAST(9.75 AS Decimal(10, 2)), CAST(74.39 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (5, N'Onix LT 1.4 AT', 1, 1, CAST(10.07 AS Decimal(10, 2)), CAST(76.76 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (6, N'Onix Advantage', 1, 1, CAST(10.07 AS Decimal(10, 2)), CAST(76.76 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (7, N'Onix Activ', 1, 1, CAST(10.02 AS Decimal(10, 2)), CAST(76.40 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (8, N'Onix Activ AT', 1, 1, CAST(10.30 AS Decimal(10, 2)), CAST(78.56 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (9, N'Onix LTZ 1.4', 1, 1, CAST(9.83 AS Decimal(10, 2)), CAST(74.96 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (10, N'Onix LTZ 1.4 AT', 1, 1, CAST(10.13 AS Decimal(10, 2)), CAST(77.27 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (11, N'Onix Effect', 1, 1, CAST(9.83 AS Decimal(10, 2)), CAST(74.96 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(2528.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (32, N'HB20 Kappa 1.0 Unique Manual', 2, 1, CAST(12.38 AS Decimal(10, 2)), CAST(97.06 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (33, N'HB20 Kappa 1.0 Comfort Plus Manual', 2, 1, CAST(12.38 AS Decimal(10, 2)), CAST(97.06 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (34, N'HB20 Kappa 1.0 Turbo Manual', 2, 1, CAST(10.03 AS Decimal(10, 2)), CAST(70.20 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (35, N'HB20 Gamma 1.6 Comfort Plus Manual', 2, 1, CAST(8.13 AS Decimal(10, 2)), CAST(63.03 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (36, N'HB20 Gamma 1.6 Comfort Plus Automática', 2, 1, CAST(8.37 AS Decimal(10, 2)), CAST(64.91 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (37, N'HB20 Gamma 1.6 Premium Automática', 2, 1, CAST(8.37 AS Decimal(10, 2)), CAST(64.91 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (38, N'HB20X Gamma 1.6 Style Manual', 2, 1, CAST(8.05 AS Decimal(10, 2)), CAST(62.48 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (39, N'HB20X Gamma 1.6 Style Automática', 2, 1, CAST(8.27 AS Decimal(10, 2)), CAST(64.12 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (40, N'HB20X Gamma 1.6 Premium Automática', 2, 1, CAST(8.27 AS Decimal(10, 2)), CAST(64.12 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (42, N'Ka S 1.0', 3, 1, CAST(12.15 AS Decimal(10, 2)), CAST(96.54 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (43, N'Ka SE 1.0', 3, 1, CAST(12.20 AS Decimal(10, 2)), CAST(96.92 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (44, N'Ka SE Plus 1.0', 3, 1, CAST(12.20 AS Decimal(10, 2)), CAST(96.92 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (45, N'Ka SE 1.5 MT', 3, 1, CAST(7.82 AS Decimal(10, 2)), CAST(66.09 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (46, N'Ka SE Plus 1.5 MT', 3, 1, CAST(7.82 AS Decimal(10, 2)), CAST(66.09 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (47, N'Ka Freestyle 1.5 MT', 3, 1, CAST(7.99 AS Decimal(10, 2)), CAST(67.45 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (48, N'Ka SE 1.5 AT', 3, 1, CAST(8.15 AS Decimal(10, 2)), CAST(68.82 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (49, N'Ka SE Plus 1.5 AT', 3, 1, CAST(8.15 AS Decimal(10, 2)), CAST(68.82 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (50, N'Ka Freestyle 1.5 AT', 3, 1, CAST(8.35 AS Decimal(10, 2)), CAST(70.50 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (51, N'Ka Titanium 1.5 AT', 3, 1, CAST(8.35 AS Decimal(10, 2)), CAST(70.50 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(2491.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (52, N'Polo 1.0', 4, 1, CAST(12.60 AS Decimal(10, 2)), CAST(101.73 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2565.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (53, N'Polo 1.6 MSI Manual', 4, 1, CAST(9.26 AS Decimal(10, 2)), CAST(65.64 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(2565.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (54, N'Polo 1.6 MSI Automático', 4, 1, CAST(9.43 AS Decimal(10, 2)), CAST(66.85 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(2565.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (55, N'Polo Comfortline 200 TSI', 4, 1, CAST(8.96 AS Decimal(10, 2)), CAST(56.23 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2565.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (56, N'Polo Highline 200 TSI', 4, 1, CAST(8.96 AS Decimal(10, 2)), CAST(56.23 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(2565.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (57, N'Kwid Life', 5, 1, CAST(10.83 AS Decimal(10, 2)), CAST(77.35 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(2423.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (58, N'Kwid Zen', 5, 1, CAST(11.13 AS Decimal(10, 2)), CAST(79.49 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(2423.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (59, N'Kwid Intense', 5, 1, CAST(11.23 AS Decimal(10, 2)), CAST(80.20 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(2423.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (60, N'Argo 1.0', 6, 1, CAST(14.35 AS Decimal(10, 2)), CAST(101.38 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (61, N'Argo Drive 1.0', 6, 1, CAST(14.35 AS Decimal(10, 2)), CAST(101.38 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (62, N'Argo Drive 1.3', 6, 1, CAST(10.46 AS Decimal(10, 2)), CAST(80.28 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (63, N'Argo Drive 1.3 GSR', 6, 1, CAST(10.53 AS Decimal(10, 2)), CAST(80.85 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (64, N'Argo Treeking', 6, 1, CAST(10.37 AS Decimal(10, 2)), CAST(79.58 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (65, N'Argo Precision', 6, 1, CAST(9.09 AS Decimal(10, 2)), CAST(65.49 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (66, N'Argo HGT', 6, 1, CAST(9.20 AS Decimal(10, 2)), CAST(66.27 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(2521.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (67, N'Golf GTI', 7, 1, CAST(5.73 AS Decimal(10, 2)), CAST(36.89 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(2631.00 AS Decimal(10, 2)), N'I', N'G', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (68, N'Cruze Sport6 LT', 8, 1, CAST(8.56 AS Decimal(10, 2)), CAST(53.47 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(2700.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (69, N'Cruze Sport6 LTZ', 8, 1, CAST(8.70 AS Decimal(10, 2)), CAST(54.33 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(2700.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (70, N'Focus SE 1.6', 9, 1, CAST(9.70 AS Decimal(10, 2)), CAST(78.44 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (71, N'Focus SE 2.0 AT', 9, 1, CAST(7.72 AS Decimal(10, 2)), CAST(61.11 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (72, N'Focus SE 2.0 AT com SYNC', 9, 1, CAST(7.72 AS Decimal(10, 2)), CAST(61.11 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (73, N'Focus SE Plus 1.6', 9, 1, CAST(9.70 AS Decimal(10, 2)), CAST(78.44 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (74, N'Focus SE Plus 2.0 AT', 9, 1, CAST(7.72 AS Decimal(10, 2)), CAST(61.11 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (75, N'Focus Titanium 2.0 AT', 9, 1, CAST(7.86 AS Decimal(10, 2)), CAST(62.18 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (77, N'208 Active', 10, 1, CAST(11.62 AS Decimal(10, 2)), CAST(80.46 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (78, N'208 Active Pack 1.2', 10, 1, CAST(11.70 AS Decimal(10, 2)), CAST(81.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (79, N'208 Active Pack 1.6', 10, 1, CAST(10.03 AS Decimal(10, 2)), CAST(73.48 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (80, N'208 Allure', 10, 1, CAST(11.92 AS Decimal(10, 2)), CAST(82.54 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (81, N'208 Griffe', 10, 1, CAST(10.17 AS Decimal(10, 2)), CAST(74.53 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (82, N'208 GT', 10, 1, CAST(6.91 AS Decimal(10, 2)), CAST(48.82 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(2541.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (83, N'A250 Hatch Vision', 11, 1, CAST(6.45 AS Decimal(10, 2)), CAST(40.48 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(2729.00 AS Decimal(10, 2)), N'N', N'G', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (84, N'V40 Kinetic', 12, 1, CAST(8.18 AS Decimal(10, 2)), CAST(50.78 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(2647.00 AS Decimal(10, 2)), N'N', N'G', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (85, N'V40 Momentum', 12, 1, CAST(8.18 AS Decimal(10, 2)), CAST(50.78 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(2647.00 AS Decimal(10, 2)), N'N', N'G', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (86, N'V40 R-Design', 12, 1, CAST(6.45 AS Decimal(10, 2)), CAST(44.26 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2647.00 AS Decimal(10, 2)), N'N', N'G', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (87, N'A3 Sportback Prestige Plus', 13, 1, CAST(10.04 AS Decimal(10, 2)), CAST(60.05 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2636.00 AS Decimal(10, 2)), N'N', N'G', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (88, N'Sandero Authentique', 14, 1, CAST(12.33 AS Decimal(10, 2)), CAST(96.29 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2590.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (89, N'Sandero Expression', 14, 1, CAST(12.33 AS Decimal(10, 2)), CAST(96.29 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2590.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (90, N'Sandero GT Line', 14, 1, CAST(12.33 AS Decimal(10, 2)), CAST(96.29 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2590.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (91, N'Sandero Stepway Dynamique', 14, 1, CAST(9.34 AS Decimal(10, 2)), CAST(68.88 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(2590.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (92, N'Sandero R.S. 2.0', 14, 1, CAST(7.74 AS Decimal(10, 2)), CAST(55.55 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(2590.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (93, N'March 1.0 S', 15, 1, CAST(12.34 AS Decimal(10, 2)), CAST(95.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2450.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (94, N'March 1.0 SV', 15, 1, CAST(12.52 AS Decimal(10, 2)), CAST(96.40 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(2450.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (95, N'March 1.6 SV', 15, 1, CAST(8.83 AS Decimal(10, 2)), CAST(64.90 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(2450.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (96, N'March 1.6 SV CVT', 15, 1, CAST(9.00 AS Decimal(10, 2)), CAST(66.16 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(2450.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (97, N'March 1.6 SL CVT', 15, 1, CAST(9.00 AS Decimal(10, 2)), CAST(66.16 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(2450.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (98, N'Mobi Easy', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (99, N'Mobi Easy Comfort', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (100, N'Mobi Like', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (101, N'Mobi Way', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (102, N'Mobi.Drive', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (103, N'Mobi Drive GSR', 16, 1, CAST(12.09 AS Decimal(10, 2)), CAST(91.62 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2305.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (104, N'Yaris 1.3 XL Manual', 17, 1, CAST(10.99 AS Decimal(10, 2)), CAST(86.05 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (105, N'Yaris 1.3 XL', 17, 1, CAST(10.99 AS Decimal(10, 2)), CAST(86.05 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (106, N'Yaris 1.3 XL Plus Tech', 17, 1, CAST(10.99 AS Decimal(10, 2)), CAST(86.05 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (107, N'Yaris XS', 17, 1, CAST(10.32 AS Decimal(10, 2)), CAST(76.17 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (108, N'Yaris X Way 1.5', 17, 1, CAST(10.32 AS Decimal(10, 2)), CAST(76.17 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (109, N'Yaris XLS 1.5', 17, 1, CAST(10.45 AS Decimal(10, 2)), CAST(77.18 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(2550.00 AS Decimal(10, 2)), N'N', N'F', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (110, N'Prius 1.8', 18, 1, CAST(14.29 AS Decimal(10, 2)), CAST(98.59 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(2700.00 AS Decimal(10, 2)), N'N', N'H', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (112, N'120i Sport GP', 19, 1, CAST(7.50 AS Decimal(10, 2)), CAST(50.18 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(2690.00 AS Decimal(10, 2)), N'N', N'F', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (113, N'125i M Sport', 19, 1, CAST(6.25 AS Decimal(10, 2)), CAST(44.30 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(2690.00 AS Decimal(10, 2)), N'N', N'F', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (114, N'M140i', 19, 1, CAST(4.63 AS Decimal(10, 2)), CAST(30.88 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(2690.00 AS Decimal(10, 2)), N'N', N'F', N'I')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (115, N'Up! Move Up! Aspirado Manual', 20, 1, CAST(11.22 AS Decimal(10, 2)), CAST(88.46 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(2421.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (116, N'Up! Move Up! Aspirado Automatizada', 20, 1, CAST(11.26 AS Decimal(10, 2)), CAST(88.46 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(2421.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (117, N'Up! Move Up! TSI', 20, 1, CAST(9.44 AS Decimal(10, 2)), CAST(58.99 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(2421.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (118, N'Up! Cross Up! TSI', 20, 1, CAST(9.44 AS Decimal(10, 2)), CAST(58.99 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(2421.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (119, N'Up! Pepper TSI', 20, 1, CAST(9.44 AS Decimal(10, 2)), CAST(58.99 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(2421.00 AS Decimal(10, 2)), N'N', N'F', N'M')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (129, N'HB20 R spec Automática', 2, 1, CAST(8.37 AS Decimal(10, 2)), CAST(64.91 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (164, N'Focus Titanium Plus 2.0 AT', 9, 1, CAST(7.86 AS Decimal(10, 2)), CAST(62.18 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(2648.00 AS Decimal(10, 2)), N'N', N'F', N'A')
INSERT [dbo].[cartb004_versao] ([nu_versao], [no_versao], [nu_modelo], [nu_categoria], [vr_peso_potencia], [vr_peso_torque], [vr_economia], [vr_conforto], [ic_nacionalidade], [ic_combustivel], [ic_cambio]) VALUES (199, N'120i Sport', 19, 1, CAST(7.50 AS Decimal(10, 2)), CAST(50.18 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(2690.00 AS Decimal(10, 2)), N'N', N'F', N'M')
SET IDENTITY_INSERT [dbo].[cartb004_versao] OFF
GO
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (2, 2019, CAST(46590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (3, 2019, CAST(47490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (4, 2019, CAST(54590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (5, 2019, CAST(59990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (6, 2019, CAST(55390.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (7, 2019, CAST(62990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (8, 2019, CAST(67990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (9, 2019, CAST(59190.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (10, 2019, CAST(64990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (11, 2019, CAST(57390.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (32, 2019, CAST(44490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (33, 2019, CAST(48990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (34, 2019, CAST(53190.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (35, 2019, CAST(55590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (36, 2019, CAST(59990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (37, 2019, CAST(68990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (38, 2019, CAST(63990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (39, 2019, CAST(67990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (40, 2019, CAST(72590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (42, 2019, CAST(44950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (43, 2019, CAST(45550.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (44, 2019, CAST(49050.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (45, 2019, CAST(52440.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (46, 2019, CAST(54940.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (47, 2019, CAST(64090.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (48, 2019, CAST(56940.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (49, 2019, CAST(59440.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (50, 2019, CAST(67840.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (51, 2019, CAST(68640.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (52, 2019, CAST(52360.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (53, 2019, CAST(59150.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (54, 2019, CAST(64850.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (55, 2019, CAST(70480.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (56, 2019, CAST(75820.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (57, 2019, CAST(32790.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (58, 2019, CAST(38490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (59, 2019, CAST(40990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (60, 2019, CAST(48990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (61, 2019, CAST(52690.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (62, 2019, CAST(53690.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (63, 2019, CAST(61790.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (64, 2019, CAST(58990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (65, 2019, CAST(63590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (66, 2019, CAST(69990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (67, 2019, CAST(151530.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (68, 2019, CAST(97790.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (69, 2019, CAST(109290.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (70, 2019, CAST(68990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (71, 2019, CAST(75990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (72, 2019, CAST(77490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (73, 2019, CAST(77990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (74, 2019, CAST(84990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (75, 2019, CAST(94990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (77, 2019, CAST(57490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (78, 2019, CAST(58990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (79, 2019, CAST(66990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (80, 2019, CAST(64490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (81, 2019, CAST(74990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (82, 2019, CAST(87290.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (83, 2019, CAST(201900.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (84, 2019, CAST(114950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (85, 2019, CAST(129950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (86, 2019, CAST(149950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (87, 2019, CAST(142990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (88, 2019, CAST(45290.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (89, 2019, CAST(45640.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (90, 2019, CAST(49190.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (91, 2019, CAST(60790.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (92, 2019, CAST(65300.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (93, 2019, CAST(47690.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (94, 2019, CAST(48690.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (95, 2019, CAST(53690.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (96, 2019, CAST(59390.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (97, 2019, CAST(64490.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (98, 2019, CAST(32990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (99, 2019, CAST(36990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (100, 2019, CAST(40590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (101, 2019, CAST(41990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (102, 2019, CAST(44990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (103, 2019, CAST(47590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (104, 2019, CAST(63090.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (105, 2019, CAST(68590.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (106, 2019, CAST(71790.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (107, 2019, CAST(75890.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (108, 2019, CAST(78990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (109, 2019, CAST(81990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (110, 2019, CAST(125450.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (112, 2019, CAST(149950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (113, 2019, CAST(194950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (114, 2019, CAST(275950.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (115, 2019, CAST(52860.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (116, 2019, CAST(55680.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (117, 2019, CAST(58800.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (118, 2019, CAST(62430.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (119, 2019, CAST(62830.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (129, 2019, CAST(64990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (164, 2019, CAST(99990.00 AS Decimal(10, 2)))
INSERT [dbo].[cartb005_ano_versao] ([nu_versao], [aa_versao], [vr_preco]) VALUES (199, 2019, CAST(139950.00 AS Decimal(10, 2)))
ALTER TABLE [dbo].[cartb004_versao] ADD  CONSTRAINT [DF_cartb004_versao_ic_nacional]  DEFAULT ('N') FOR [ic_nacionalidade]
GO
ALTER TABLE [dbo].[cartb004_versao] ADD  CONSTRAINT [DF_cartb004_versao_ic_combustivel]  DEFAULT ('F') FOR [ic_combustivel]
GO
ALTER TABLE [dbo].[cartb004_versao] ADD  CONSTRAINT [DF_cartb004_versao_ic_cambio]  DEFAULT ('M') FOR [ic_cambio]
GO
ALTER TABLE [dbo].[cartb001_modelo]  WITH CHECK ADD  CONSTRAINT [FK_cartb001_modelo_cartb002_marca] FOREIGN KEY([nu_marca])
REFERENCES [dbo].[cartb002_marca] ([nu_marca])
GO
ALTER TABLE [dbo].[cartb001_modelo] CHECK CONSTRAINT [FK_cartb001_modelo_cartb002_marca]
GO
ALTER TABLE [dbo].[cartb004_versao]  WITH CHECK ADD  CONSTRAINT [FK_cartb004_versao_cartb001_modelo] FOREIGN KEY([nu_modelo])
REFERENCES [dbo].[cartb001_modelo] ([nu_modelo])
GO
ALTER TABLE [dbo].[cartb004_versao] CHECK CONSTRAINT [FK_cartb004_versao_cartb001_modelo]
GO
ALTER TABLE [dbo].[cartb004_versao]  WITH CHECK ADD  CONSTRAINT [FK_cartb004_versao_cartb003_categoria] FOREIGN KEY([nu_categoria])
REFERENCES [dbo].[cartb003_categoria] ([nu_categoria])
GO
ALTER TABLE [dbo].[cartb004_versao] CHECK CONSTRAINT [FK_cartb004_versao_cartb003_categoria]
GO
ALTER TABLE [dbo].[cartb005_ano_versao]  WITH CHECK ADD  CONSTRAINT [FK_cartb005_ano_versao_cartb004_versao] FOREIGN KEY([nu_versao])
REFERENCES [dbo].[cartb004_versao] ([nu_versao])
GO
ALTER TABLE [dbo].[cartb005_ano_versao] CHECK CONSTRAINT [FK_cartb005_ano_versao_cartb004_versao]
GO
