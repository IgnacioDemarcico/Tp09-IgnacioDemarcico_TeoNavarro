using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Models;
public static class BD
{
    private static string _connectionString = @"Server=A-PHZ2-LUM-13;DataBase=Pokebae;Trusted_Connection=True";
    public static void AgregarPokemon(Pokemon Pokemon)
    {
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"INSERT INTO Pokemons(IdPokemon, Nombre, FechaCracion, Foto, Tipo1, Tipo2, Altura, Peso) VALUES(@pIdPokemon,@pNombre,@pFechaCreacion,@pFoto,@pTipo1,@pTipo2,@pAltura,@pPeso)";
            bd.Execute(sql, new { pIdPokemon = Pokemon.IdPokemon, pNombre = Pokemon.Nombre, pFechaCreacion = Pokemon.FechaCreacion, pFoto = "/bd/"+ Pokemon.Foto, pTipo1 = Pokemon.Tipo1, pTipo2 = Pokemon.Tipo2, pAltura = Pokemon.Altura, pPeso = Pokemon.Peso});

        }
        
    }
    public static void EliminarPokemon(int IdPokemon)
    {
        int RegistrosEliminados = 0;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"DELETE FROM Pokemons j WHERE j.IdPokemon = {IdPokemon}";
            RegistrosEliminados = bd.Execute(sql);
        }
    }
   /* public static Equipo VerInfoEquipo(int IdEquipo)
    {
        Equipo equipo;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Equipos e WHERE e.IdEquipo = @pIdEquipo";
            equipo = bd.QueryFirstOrDefault<Equipo>(sql, new { pIdEquipo = IdEquipo });
        }
        return equipo;
    }*/
    public static Pokemon VerInfoPokemon(int IdPokemon)
    {
        Pokemon Pokemon;
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Pokemons j WHERE j.Nombre = @pNombre";
            Pokemon = bd.QueryFirstOrDefault<Pokemon>(sql, new { pNombre = "Metapod"});
        }
        return Pokemon;
    }
    public static Juego VerInfoJuego(string nombre)
    {
        Juego juego = new Juego();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Juegos WHERE Nombre = {nombre}";
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

