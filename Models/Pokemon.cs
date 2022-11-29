using System;
using System.Collections.Generic;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Models;

public class Pokemon{

private int _IdPokemon, _Pokedex;
private double _Peso, _Altura;
private string _Tipo1, _Tipo2, _Foto, _Nombre, _PAparicion;
private DateTime _FechaCreacion;


public Pokemon(int IdPokemon, string Nombre, DateTime FechaCreacion, string Foto, string Tipo1, string Tipo2, double Altura, double Peso, int Pokedex, string PAparicion)
{
        _IdPokemon = IdPokemon;
        _Nombre = Nombre;
        _FechaCreacion = FechaCreacion;
        _Foto = Foto; 
        _Tipo1 = Tipo1; 
        _Tipo2 = Tipo2; 
        _Altura = Altura;
        _Peso = Peso;
        _Pokedex = Pokedex;
        _PAparicion = PAparicion;
}
public Pokemon(){}
public int IdPokemon
{
    get{return _IdPokemon;}
    set{_IdPokemon = value;} 
}
public string Nombre
{
    get{return _Nombre;}
    set{_Nombre = value;} 
}
public DateTime FechaCreacion
{
    get{return _FechaCreacion;}
    set{_FechaCreacion = value;} 
}
public string Foto
{
    get{return _Foto;}
    set{_Foto = value;} 
}
public string Tipo1
{
    get{return _Tipo1;}
    set{_Tipo1 = value;} 
}
public string Tipo2
{
    get{return _Tipo2;}
    set{_Tipo2 = value;} 
}
public double Altura
{
    get{return _Altura;}
    set{_Altura = value;} 
}
public double Peso
{
    get{return _Peso;}
    set{_Peso = value;} 
}
public int Pokedex
{
    get{return _Pokedex;}
    set{_Pokedex = value;} 
}
public string PAparicion
{
    get{return _PAparicion;}
    set{_PAparicion = value;} 
}
}
