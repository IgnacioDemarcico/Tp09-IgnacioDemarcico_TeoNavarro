using System;
using System.Collections.Generic;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Models;

public class Juego{

private int _Generacion, _Pokedex;
private string _FotoJuego, _Nombre, _Region;
private DateTime _FechaSalida;


public Juego( string Nombre, DateTime FechaSalida, string Region, int Generacion, int Pokedex, string FotoJuego)
{
        _Nombre = Nombre;
        _FechaSalida = FechaSalida;
        _Region = Region;
        _Generacion = Generacion;
        _Pokedex = Pokedex;
        _FotoJuego = FotoJuego; 
}
public Juego(){}
public string Nombre
{
    get{return _Nombre;}
    set{_Nombre = value;} 
}
public DateTime FechaSalida
{
    get{return _FechaSalida;}
    set{_FechaSalida = value;} 
}
public string Region
{
    get{return _Region;}
    set{_Region = value;} 
}
public int Generacion
{
    get{return _Generacion;}
    set{_Generacion = value;} 
}
public int Pokedex
{
    get{return _Pokedex;}
    set{_Pokedex = value;} 
}
public string FotoJuego
{
    get{return _FotoJuego;}
    set{_FotoJuego = value;} 
}

}
