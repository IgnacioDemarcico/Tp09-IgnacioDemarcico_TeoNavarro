// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function MostrarInfoJuegos(Nombre)
{
    $.ajax(
        {
            type:'POST',
            dataType: 'json',
            url: 'Home/Juegos',  
            data:{Nombre: Nombre},
            success:
                function (response)
                {
                    $("#ModalTitulo").html(response.Nombre);
                    $("#Nombre").html(response.Nombre);
                    $("#Region").html("<br>" +response.Region);
                    $("#FechaSalida").html("<br>" + response.FechaSalida);
                    $("#Generacion").html("<br>" + response.Generacion);
                    $("#Pokedex").html("<br>" + response.Pokedex);
                },
            complete:
                function(xhr, status){
                    console.log('Petición realizada');
                }
        }
    );
}