using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Models;
public static class BD
{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-043;DataBase=Pokebae;Trusted_Connection=True";
    public static void AgregarPokemon(Pokemon Pokemon)
    {
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"INSERT INTO Pokemons(IdPokemon, Nombre, FechaCracion, Foto, Tipo1, Tipo2, Altura, Peso, Pokedex, Paparicion) VALUES(@pIdPokemon,@pNombre,@pFechaCreacion,@pFoto,@pTipo1,@pTipo2,@pAltura,@pPeso,@Pokedex,@pAparicion)";
            bd.Execute(sql, new { pIdPokemon = Pokemon.IdPokemon, pNombre = Pokemon.Nombre, pFechaCreacion = Pokemon.FechaCreacion, pFoto = "/bd/"+ Pokemon.Foto, pTipo1 = Pokemon.Tipo1, pTipo2 = Pokemon.Tipo2, pAltura = Pokemon.Altura, pPeso = Pokemon.Peso, pPokedex = Pokemon.Pokedex, pPaparicion = Pokemon.PAparicion });
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
}


    /*
    public static List<Equipo> ListarEquipos()
    {
        List<Equipo> ListaEquipos = new List<Equipo>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Equipos";
            ListaEquipos = bd.Query<Equipo>(sql).ToList();
        }
        return ListaEquipos;
    }
    public static List<Jugador> ListarJugadores(int IdEquipo)
    {
        List<Jugador> ListaJugadores = new List<Jugador>();
        using (SqlConnection bd = new SqlConnection(_connectionString))
        {
            string sql = $"SELECT * FROM Jugadores j WHERE j.IdEquipo = @pIdEquipo";
            ListaJugadores = bd.Query<Jugador>(sql, new { pIdEquipo = IdEquipo }).ToList();
        }
        return ListaJugadores;
    }
}
*/