using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Models;
public static class BD
{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-028;DataBase=Pokebae;Trusted_Connection=True";
    public static void AgregarPokemon(Pokemon Pokemon)
    {
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"INSERT INTO Pokemons(Nombre, FechaCreacion, Foto, Tipo1, Tipo2, Altura, Peso) VALUES(@pNombre,@pFechaCreacion,@pFoto,@pTipo1,@pTipo2,@pAltura,@pPeso)";
            bd.Execute(sql, new {pNombre = Pokemon.Nombre, pFechaCreacion = Pokemon.FechaCreacion, pFoto = "/bd/"+ Pokemon.Foto, pTipo1 = Pokemon.Tipo1, pTipo2 = Pokemon.Tipo2, pAltura = Pokemon.Altura, pPeso = Pokemon.Peso});
        }
    }
    public static void EliminarPokemon(int IdPokemon)
    {
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"DELETE FROM Pokemons WHERE IdPokemon = {IdPokemon}";
            bd.Execute(sql);
        }
    }

    public static Pokemon VerInfoPokemon(int IdPokemon)
    {
        Pokemon Pokemon;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Pokemons j WHERE j.IdPokemon = @pId";
            Pokemon = bd.QueryFirstOrDefault<Pokemon>(sql, new { pId = IdPokemon});
        }
        return Pokemon;
    }

    public static Pokemon VerInfoPokemonXnombre(string nombre)
    {
        Pokemon Pokemon;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Pokemons j WHERE j.Nombre = @pnombre";
            Pokemon = bd.QueryFirstOrDefault<Pokemon>(sql, new { pnombre =nombre});
        }
        return Pokemon;
    }
    public static Juego VerInfoJuego(string nombre)
    {
        Juego juego;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Juegos WHERE Nombre = '{nombre}'";
            juego = bd.QueryFirstOrDefault<Juego>(sql);
        }
        return juego;
    }
    public static List<Juego> ListarJuegos()
    {
        List<Juego> ListaJuegos = new List<Juego>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Juegos";
            ListaJuegos = bd.Query<Juego>(sql).ToList();
        }
        return ListaJuegos;
    }

    public static List<Pokemon> ListarPokemonsComunidad()
    {
        List<Pokemon> Listapokemons = new List<Pokemon>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"Select * from pokemons where Pokedex is NULL";
            Listapokemons = bd.Query<Pokemon>(sql).ToList();
        }
        return Listapokemons;
    }
        public static List<Pokemon> ListarPokemonsOficiales()
    {
        List<Pokemon> Listapokemons = new List<Pokemon>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"Select * from pokemons where Pokedex is not NULL";
            Listapokemons = bd.Query<Pokemon>(sql).ToList();
        }
        return Listapokemons;
    }
        public static List<Pokemon> ListarPokemons()
    {
        List<Pokemon> Listapokemons = new List<Pokemon>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"Select * from pokemons";
            Listapokemons = bd.Query<Pokemon>(sql).ToList();
        }
        return Listapokemons;
    }
}


    

    /*public static List<Jugador> ListarJugadores(int IdEquipo)
    {
        List<Jugador> ListaJugadores = new List<Jugador>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Jugadores j WHERE j.IdEquipo = @pIdEquipo";
            ListaJugadores = bd.Query<Jugador>(sql, new { pIdEquipo = IdEquipo }).ToList();
        }
        return ListaJugadores;
    }*/

