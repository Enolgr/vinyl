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
                        let publicadoCheckbox = vinilo.published == 1
                            ? '<input type="checkbox" class="publicado-checkbox" checked disabled>'
                            : '<input type="checkbox" class="publicado-checkbox" disabled>';
                        filas += `
                            <tr class="vinyl-item" data-publicado="${vinilo.published}">
                                <td><img class="item img-disco" src="${vinilo.image}" alt="${vinilo.title}"></td>
                                <td class="item nombre-disco">${vinilo.title}</td>
                                <td class="item precio-disco">${vinilo.price} &euro;</td>
                                <td class="item descripcion-disco">${description}</td>
                                <td class="item autor-disco">${vinilo.artist}</td>
                                <td class="item genero-disco">${vinilo.genre}</td>
                                <td class="item publicado-disco">${publicadoCheckbox}</td>
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

    function filtrarPublicado() {
        const publicado = $("#publicados").val();
        $(".vinyl-item").each(function () {
            const filaPublicado = $(this).data("publicado").toString();
            if (publicado === "all" || filaPublicado === publicado) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

    cargarTabla();

    $("#search-input").on("keyup", function () {
        const query = $(this).val().toLowerCase();
        $(".vinyl-item").each(function () {
            const textoFila = $(this).text().toLowerCase();
            if (textoFila.includes(query)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

    $("#publicados").on("change", function () {
        filtrarPublicado();
    });

    // Abre la modal al hacer clic en el botón
    $("#boton-add").on("click", function () {
        $("#modal-add").addClass("active");
    });

    // Cierra la modal al hacer clic en el botón de cerrar
    $(document).on("click", "#modal-add .close-button", function () {
        $("#modal-add").removeClass("active");
    });

    $(document).ajaxComplete(function () {
        $(".vinyl-table").css({
            "overflow-x": "hidden",
            "max-width": "100%"
        });
    });

    $("#add-album").click(function (e) {
        e.preventDefault(); // Evita el envío predeterminado del formulario
    
        // Verifica si todos los campos del formulario están llenos
        let isValid = true;
        $(".add-album input, .add-album select").each(function () {
            if ($(this).val().trim() === "") {
                isValid = false;
                $(this).addClass("input-error"); // Añade una clase para resaltar el error
            } else {
                $(this).removeClass("input-error"); // Remueve el error si el campo es válido
            }
        });
    
        if (isValid) {
            const formData = new FormData($(".add-album")[0]); // Captura los datos del formulario
            $.ajax({
                type: "POST",
                url: "subir-vinilo",
                data: formData,
                processData: false, 
                contentType: false, 
                success: function (response) {
                    // Manejar la respuesta del servidor
                    alert("Álbum añadido con éxito");
                    $(".add-album")[0].reset(); // Resetea el formulario
                },
                error: function (xhr, status, error) {
                    // Manejar errores
                    alert("Error al añadir el álbum: " + error);
                },
            });
        } else {
            alert("Por favor, completa todos los campos del formulario.");
        }
    });
    
});
