$(document).ready(function () {
    function cargarTabla() {
        $.ajax({
            type: "get",
            url: "./backend/mostrar-tabla.php",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    let filas = "";
                    response.tabla_vinilos.forEach(function (vinilo) {
                        let description = vinilo.description || "Descripción no disponible";
                        filas += `
                            <tr class="vinyl-item">
                                <td><img class="item img-disco" src="${vinilo.image}" alt="${vinilo.title}"></td>
                                <td class="item nombre-disco">${vinilo.title}</td>
                                <td class="item precio-disco">${vinilo.price} &euro;</td>
                                <td class="item descripcion-disco">${description}</td>
                                <td class="item autor-disco">${vinilo.artist}</td>
                                <td class="item genero-disco">${vinilo.genre}</td>
                                <td class="item publicado-disco">${vinilo.published}</td>
                            </tr>`;
                    });
                    $(".vinyl-table tbody").html(filas);
                } else {
                    $(".vinyl-table tbody").html("<tr><td colspan='7'>No se encontraron resultados.</td></tr>");
                }
            },
            error: function (xhr, status, error) {
                console.error("Error en la petición:", status, error);
                $(".vinyl-table tbody").html("<tr><td colspan='7'>Error al cargar los datos.</td></tr>");
            }
        });
    }

    cargarTabla();

    $(document).ajaxComplete(function () {
        $(".vinyl-table").css({
            "overflow-x": "hidden",
            "max-width": "100%"
        });
    });
});
