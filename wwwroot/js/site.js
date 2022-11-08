// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function MostrarInfoJuegos(Nombre)
{
    $.ajax(
        {
            type:'POST',
            dataType: 'json',
            url: 'Home/DevolverJuego',
            data:{nombreJuego: Nombre},
            success:
                function (response)
                {
                    $("#ModalTitulo").html(response.nombre);
                    $("#Nombre").html(response.nombre);
                    $("#Region").html("<br>" + response.region);
                    $("#FechaSalida").html("<br>" + response.fechaSalida);
                    $("#Generacion").html("<br>" + response.generacion);
                    $("#Pokedex").html("<br>" + response.pokedex);
                },
            complete:
                function(xhr, status){
                    console.log('Petición realizada');
                }
        }
    );
}