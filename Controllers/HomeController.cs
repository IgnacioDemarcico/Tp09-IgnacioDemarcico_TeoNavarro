using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Tp09_IgnacioDemarcico_TeoNavarro.Models;

namespace Tp09_IgnacioDemarcico_TeoNavarro.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
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
    public IActionResult TierList1()
    {
        return View();
    }
        public IActionResult Tierlist2()
    {
        return View();
    }
        public IActionResult Tierlist3()
    {
        return View();
    }
        public IActionResult Tierlist4()
    {
        return View();
    }
    public IActionResult Juegos()
    {
        ViewBag.ListarJuegos = BD.ListarJuegos();
        return View();
    }
    public Juego DevolverJuego(string nombreJuego)
    {
        Juego juego = BD.VerInfoJuego(nombreJuego);
        return juego;
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
