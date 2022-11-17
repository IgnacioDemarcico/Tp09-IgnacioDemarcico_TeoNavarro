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