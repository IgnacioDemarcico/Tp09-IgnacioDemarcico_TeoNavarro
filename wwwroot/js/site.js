// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function MostrarInfoJuegos(Nombre)
{
    $.ajax(
        {
            type:'POST',
            dataType: 'JSON',
            url: '/Home/DevolverJuego',
            data:{nombreJuego: Nombre},
            success:
                function (response)
                {
                    $("#ModalTitulo").html(response.nombre);
                    $("#FotoJuego").attr("src", response.fotoJuego)
                    $("#Nombre").html("<br>" + "Nombre: " +response.nombre);
                    $("#Region").html("Region: " + response.region);
                    $("#FechaSalida").html("Fecha de salida: " + response.fechaSalida.split('T')[0].replace('-','/').replace('-','/'));
                    $("#Generacion").html("Generacion: " + response.generacion);
                    $("#Pokedex").html("Cantidad pokemons: " + response.pokedex);
                },
            complete:
                function(xhr, status){
                    console.log('Petición realizada');
                }
        }
    );
}
function VerInfoPokemonXnombre()
{
    var nom = $("#PokemonBusqueda").val();
    $.ajax(
        {
            type:'POST',
            dataType: 'JSON',
            url: '/Home/MostrarInfoPokemon',
            data:{Nombre: nom},
            success:
                function (response)
                {
                    $("#modalP-ModalTitulo").html(response.nombre);
                    $("#modalP-Foto").attr("src", response.foto)
                    $("#modalP-Nombre").html("<br>" + "Nombre: " +response.nombre);
                    $("#modalP-Tipo1").html("Tipo 1: " + response.tipo1);
                    if (response.tipo2 != null) $("#modalP-Tipo2").html("Tipo 2: " + response.tipo2);
                    $("#modalP-FechaCreacion").html("Fecha de creacion: " + response.fechaCreacion.split('T')[0].replace('-','/').replace('-','/'));
                    $("#modalP-paparicion").html("Primera aparicion: " + response.pAparicion);
                    $("#modalP-Altura").html("Altura: " + response.altura);
                    $("#modalP-Peso").html("Peso: " + response.peso);
                    if (response.pokedex != 0) $("#modalP-Pokedex").html("Numero de pokedex: " + response.pokedex);
                },
            complete:
                function(xhr, status){
                    console.log('Petición realizada');
                }
        }
    );
}
