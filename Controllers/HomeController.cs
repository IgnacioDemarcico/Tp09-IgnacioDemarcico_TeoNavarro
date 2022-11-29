using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Tp09_IgnacioDemarcico_TeoNavarro.Models;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private IWebHostEnvironment _environment;
    public HomeController(ILogger<HomeController> logger, IWebHostEnvironment environment)
    {
        _logger = logger;
        _environment = environment;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Compe()
    {
        return View();
    }

    public IActionResult Tierlist()
    {
        return View();
    }
    
    public IActionResult Comunidad()
    {
        return View();
    }
   
    public IActionResult Juegos()
    {
        ViewBag.ListarJuegos = BD.ListarJuegos();
        return View();
    }
    [HttpPost] public IActionResult GuardarPokemon(Pokemon pokemon, IFormFile MyFile)
    {
        List<Pokemon> ListaPokemons = BD.ListarPokemons();
        foreach (Pokemon item in ListaPokemons){ // Acá devuelve la view sin agregar el pokemon, xq el nombre ya existe
            if (item.Nombre == pokemon.Nombre) return RedirectToAction("Comunidad");
        }
        
        if(!Directory.Exists(this._environment.WebRootPath + @"\img\pokemons\"))
        {
            Directory.CreateDirectory(this._environment.WebRootPath + @"\img\pokemons");
        }
        string wwwRootPath = this._environment.WebRootPath + @"\img\pokemons\" + MyFile.FileName;
        using(var stream = System.IO.File.Create(wwwRootPath)) MyFile.CopyTo(stream);
        pokemon.Foto = MyFile.FileName;

        BD.AgregarPokemon(pokemon);
        return RedirectToAction("Comunidad");
    }
    [HttpPost] public IActionResult EliminarPokemon(string nombre)
    {
        List<Pokemon> ListaPokemons = BD.ListarPokemons();
        foreach (Pokemon item in ListaPokemons){
            if (item.Nombre == nombre)
            {
                BD.EliminarPokemon(item.IdPokemon);
                return RedirectToAction("Comunidad"); // Termina la función y elimina el pokemon con el nombre ingresado
            }
        }
        
        // Termina la función y sin eliminar nada porque no se encontró el pokemon con el nombre ingresado
        return RedirectToAction("Comunidad");
    }
    public Juego DevolverJuego(string nombreJuego)
    {
        Juego juego = BD.VerInfoJuego(nombreJuego);
        return juego;
    }

    public Pokemon MostrarInfoPokemon(string nombre)
    {
        Pokemon pokemon = BD.VerInfoPokemon(nombre);
        return pokemon;
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
