USE [master]
GO
/****** Object:  Database [Pokebae]    Script Date: 25/10/2022 11:03:06 ******/
CREATE DATABASE [Pokebae]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pokebae', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pokebae.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pokebae_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pokebae_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pokebae] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pokebae].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pokebae] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pokebae] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pokebae] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pokebae] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pokebae] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pokebae] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pokebae] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pokebae] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pokebae] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pokebae] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pokebae] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pokebae] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pokebae] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pokebae] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pokebae] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pokebae] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pokebae] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pokebae] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pokebae] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pokebae] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pokebae] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pokebae] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pokebae] SET RECOVERY FULL 
GO
ALTER DATABASE [Pokebae] SET  MULTI_USER 
GO
ALTER DATABASE [Pokebae] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pokebae] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pokebae] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pokebae] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pokebae] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pokebae', N'ON'
GO
ALTER DATABASE [Pokebae] SET QUERY_STORE = OFF
GO
USE [Pokebae]
GO
/****** Object:  User [alumno]    Script Date: 25/10/2022 11:03:06 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 25/10/2022 11:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[Nombre] [varchar](50) NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[Region] [varchar](50) NOT NULL,
	[Generacion] [int] NOT NULL,
	[Pokedex] [int] NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pokemons]    Script Date: 25/10/2022 11:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokemons](
	[IdPokemon] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Foto] [varchar](500) NOT NULL,
	[Tipo1] [varchar](50) NOT NULL,
	[Tipo2] [varchar](50) NULL,
	[Altura] [float] NOT NULL,
	[Peso] [float] NOT NULL,
	[Pokedex] [int] NOT NULL,
	[PAparicion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pokemons] PRIMARY KEY CLUSTERED 
(
	[IdPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 25/10/2022 11:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[IdPokemon] [int] NOT NULL,
	[HP] [int] NOT NULL,
	[Ataque] [int] NOT NULL,
	[Defensa] [int] NOT NULL,
	[Atq_sp] [int] NOT NULL,
	[Def_sp] [int] NOT NULL,
	[Velocidad] [int] NOT NULL,
 CONSTRAINT [PK_Stats] PRIMARY KEY CLUSTERED 
(
	[IdPokemon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Alfa Zafiro', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'Hoenn', 6, 719)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Amarillo', CAST(N'1998-09-12T00:00:00.000' AS DateTime), N'Kanto', 1, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Azul', CAST(N'1996-02-27T00:00:00.000' AS DateTime), N'Kanto', 1, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Blanco', CAST(N'2010-09-18T00:00:00.000' AS DateTime), N'Unova', 5, 155)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Blanco 2', CAST(N'2012-06-23T00:00:00.000' AS DateTime), N'Unova', 5, 300)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Cristal', CAST(N'2000-12-14T00:00:00.000' AS DateTime), N'Johto', 2, 251)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Diamante', CAST(N'2006-09-28T00:00:00.000' AS DateTime), N'Sinnoh', 4, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Diamante Brillante', CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'Sinnoh', 8, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Escudo', CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Galar', 8, 480)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Esmeralda', CAST(N'2004-09-16T00:00:00.000' AS DateTime), N'Hoenn', 3, 386)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Espada', CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Galar', 8, 480)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Heartgold', CAST(N'2009-09-12T00:00:00.000' AS DateTime), N'Johto', 4, 251)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Lets Go Eevee', CAST(N'2018-11-16T00:00:00.000' AS DateTime), N'Kanto', 7, 153)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Lets Go Pikachu', CAST(N'2018-11-16T00:00:00.000' AS DateTime), N'Kanto', 7, 153)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Leyedas: Arceus', CAST(N'2022-01-28T00:00:00.000' AS DateTime), N'Sinnoh', 8, 242)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Luna', CAST(N'2016-11-18T00:00:00.000' AS DateTime), N'Alola', 7, 302)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Negro', CAST(N'2010-09-18T00:00:00.000' AS DateTime), N'Unova', 5, 155)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Negro 2', CAST(N'2012-06-23T00:00:00.000' AS DateTime), N'Unova', 5, 300)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Omega Rubí', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'Hoenn', 6, 719)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Oro', CAST(N'1999-11-21T00:00:00.000' AS DateTime), N'Johto', 2, 251)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Perla', CAST(N'2006-09-28T00:00:00.000' AS DateTime), N'Sinnoh', 4, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Perla Reluciente', CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'Sinnoh', 8, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Plata', CAST(N'1999-11-21T00:00:00.000' AS DateTime), N'Johto', 2, 251)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Platino', CAST(N'2008-09-13T00:00:00.000' AS DateTime), N'Sinnoh', 4, 210)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Rojo', CAST(N'1996-02-27T00:00:00.000' AS DateTime), N'Kanto', 1, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Rojo Fuego', CAST(N'2004-01-29T00:00:00.000' AS DateTime), N'Kanto', 3, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Rubí', CAST(N'2002-11-21T00:00:00.000' AS DateTime), N'Hoenn', 3, 386)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Sol', CAST(N'2016-11-18T00:00:00.000' AS DateTime), N'Alola', 7, 302)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Soulsilver', CAST(N'2009-09-12T00:00:00.000' AS DateTime), N'Johto', 4, 251)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Ultra Luna', CAST(N'2017-11-17T00:00:00.000' AS DateTime), N'Alola', 7, 403)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Ultra Sol', CAST(N'2017-11-17T00:00:00.000' AS DateTime), N'Alola', 7, 403)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Verde Hoja', CAST(N'2004-01-29T00:00:00.000' AS DateTime), N'Kanto', 3, 151)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon X', CAST(N'2013-10-12T00:00:00.000' AS DateTime), N'Kalos', 6, 457)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Y', CAST(N'2013-10-12T00:00:00.000' AS DateTime), N'Kalos', 6, 457)
INSERT [dbo].[Juegos] ([Nombre], [FechaSalida], [Region], [Generacion], [Pokedex]) VALUES (N'Pokemon Zafiro', CAST(N'2002-11-21T00:00:00.000' AS DateTime), N'Hoenn', 3, 386)
GO
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (1, N'Bulbasaur', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://oyster.ignimgs.com/mediawiki/apis.ign.com/pokemon-lets-go-pikachu-eevee/5/51/Bulbasaur.jpg', N'Planta', N'Veneno', 0.7, 6.9, 1, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (2, N'Ivysaur', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png', N'Planta', N'Veneno', 1, 13, 2, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (3, N'Venusaur', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://oyster.ignimgs.com/mediawiki/apis.ign.com/pokemon-omega-ruby-and-alpha-sapphire/1/13/Mega_venusaur.jpg', N'Planta', N'Veneno', 2, 100, 3, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (4, N'Charmander', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://www.pngmart.com/files/13/Pokemon-Charmander-PNG-Pic.png', N'Fuego', NULL, 0.6, 8.5, 4, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (5, N'Charmeleon', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/f/fb/Charmeleon.png/revision/latest?cb=20140207202536', N'Fuego', NULL, 1.1, 19, 5, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (6, N'Charizard', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/9/95/Charizard.png/revision/latest?cb=20180325003352', N'Fuego', NULL, 1.7, 90.5, 6, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (7, N'Squirtle', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.stickpng.com/images/580b57fcd9996e24bc43c32a.png', N'Agua', NULL, 0.5, 9, 7, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (8, N'Wartortle', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://e7.pngegg.com/pngimages/570/842/png-clipart-pikachu-pokemon-firered-and-leafgreen-pokemon-go-wartortle-pikachu-mammal-carnivoran.png', N'Agua', NULL, 1, 22.5, 8, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (9, N'Blastoise', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/4/41/Blastoise.png/revision/latest?cb=20220608115725', N'Agua', NULL, 1.6, 85.5, 9, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (10, N'Caterpie', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/0/05/Caterpie.png/revision/latest?cb=20170615202446', N'Bicho', NULL, 0.3, 2.9, 10, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (11, N'Metapod', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://images.wikidexcdn.net/mwuploads/wikidex/6/6b/latest/20200307022334/Metapod.png', N'Bicho', NULL, 0.7, 9.9, 11, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (12, N'Butterfree', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/9/96/Butterfree.png/revision/latest?cb=20160703192952', N'Bicho', N'Volador', 1.1, 32, 12, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (13, N'Weedle', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png', N'Bicho', N'Veneno', 0.3, 3.2, 13, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (14, N'Kakuna', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png', N'Bicho', N'Veneno', 0.6, 10, 14, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (15, N'Beedrill', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://images.wikidexcdn.net/mwuploads/wikidex/0/0d/latest/20200307022638/Beedrill.png', N'Bicho', N'Veneno', 1, 29.5, 15, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (16, N'Pidgey', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/016.png', N'Normal', N'Volador', 0.3, 1.8, 16, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (17, N'Pidgeotto', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/017.png', N'Normal', N'Volador', 1.1, 30, 17, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (18, N'Pidgeot', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/a/a9/Pidgeot.png/revision/latest?cb=20141214190416', N'Normal', N'Volador', 1.5, 39.5, 18, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (19, N'Rattata', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://assets.pokemon.com/assets/cms2/img/pokedex/full/019.png', N'Normal', NULL, 0.3, 3.5, 19, N'Pokemon Azul')
INSERT [dbo].[Pokemons] ([IdPokemon], [Nombre], [FechaCreacion], [Foto], [Tipo1], [Tipo2], [Altura], [Peso], [Pokedex], [PAparicion]) VALUES (20, N'Raticate', CAST(N'2014-11-21T00:00:00.000' AS DateTime), N'https://static.wikia.nocookie.net/espokemon/images/d/d6/Raticate.png/revision/latest?cb=20080723091809', N'Noraml', NULL, 0.7, 18.5, 20, N'Pokemon Azul')
GO
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (1, 45, 49, 49, 65, 65, 45)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (2, 60, 62, 63, 80, 80, 60)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (3, 80, 82, 83, 100, 100, 80)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (4, 39, 52, 43, 60, 50, 65)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (5, 58, 64, 58, 80, 65, 80)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (6, 78, 84, 78, 109, 85, 100)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (7, 44, 48, 65, 50, 64, 43)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (8, 59, 63, 80, 65, 80, 58)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (9, 79, 83, 100, 85, 105, 78)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (10, 45, 30, 35, 20, 20, 45)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (11, 50, 20, 55, 25, 25, 30)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (12, 60, 45, 50, 90, 80, 70)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (13, 40, 35, 30, 20, 20, 50)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (14, 45, 25, 50, 25, 25, 35)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (15, 65, 90, 40, 45, 80, 75)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (16, 40, 45, 40, 35, 35, 56)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (17, 63, 60, 55, 50, 50, 71)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (18, 83, 80, 75, 70, 70, 101)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (19, 30, 56, 35, 25, 35, 72)
INSERT [dbo].[Stats] ([IdPokemon], [HP], [Ataque], [Defensa], [Atq_sp], [Def_sp], [Velocidad]) VALUES (20, 55, 81, 60, 50, 70, 97)
GO
ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons_Juegos1] FOREIGN KEY([PAparicion])
REFERENCES [dbo].[Juegos] ([Nombre])
GO
ALTER TABLE [dbo].[Pokemons] CHECK CONSTRAINT [FK_Pokemons_Juegos1]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [FK_Stats_Pokemons1] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([IdPokemon])
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [FK_Stats_Pokemons1]
GO
USE [master]
GO
ALTER DATABASE [Pokebae] SET  READ_WRITE 
GO
