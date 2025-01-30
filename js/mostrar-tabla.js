$(document).ready(function () {
    function cargarTabla() {
        $.ajax({
            type: "GET",
            url: "./backend/mostrar-tabla.php",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    let filas = "";
                    response.tabla_vinilos.forEach(function (vinilo) {
                        let description = vinilo.description || "Descripción no disponible";
                        let publicadoCheckbox = vinilo.published == 1
                            ? `<input type="checkbox" class="publicado-checkbox" data-id="${vinilo.id}" checked>`
                            : `<input type="checkbox" class="publicado-checkbox" data-id="${vinilo.id}">`;
                        filas += `
                            <tr class="vinyl-item" data-publicado="${vinilo.published}" data-genero="${vinilo.genre}">
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

                    // Añadir evento a los checkboxes
                    $(".publicado-checkbox").on("click", function () {
                        const id = $(this).data("id");
                        const nuevoEstado = $(this).is(":checked") ? 1 : 0;

                        // Mostrar el modal de confirmación
                        $(".modal-backdrop").addClass("active");
                        $("#modal-confirm-state").addClass("active");

                        // Confirmar la acción
                        $("#confirm-state-button").off("click").on("click", function () {
                            cambiarEstado(id, nuevoEstado);
                            cerrarModalConfirmacion();
                        });

                        // Cancelar la acción
                        $("#cancel-state-button").off("click").on("click", function () {
                            cerrarModalConfirmacion();
                            cargarTabla(); // Restablecer el estado original
                        });
                    });
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

    function cambiarEstado(id, estado) {
        $.ajax({
            type: "post",
            url: "./backend/estado.php",
            data: { id: id, estado: estado },
            success: function () {
                cargarTabla();
            },
            error: function (xhr, status, error) {
                console.error("Error al actualizar el estado:", status, error);
                alert("No se pudo actualizar el estado.");
                cargarTabla();
            }
        });
    }

    function cerrarModalConfirmacion() {
        $(".modal-backdrop").removeClass("active");
        $("#modal-confirm-state").removeClass("active");
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

    function filtrarGenero() {
        const generoSeleccionado = $("#genero").val();
        $(".vinyl-item").each(function () {
            const filaGenero = $(this).data("genero").toString();
            if (generoSeleccionado === "" || filaGenero === generoSeleccionado) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

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

    $("#genero").on("change", function () {
        filtrarGenero();
    });

    $("#boton-add").on("click", function () {
        $("#modal-add").addClass("active");
        $(".modal-backdrop").addClass("active");
    });

    $(document).on("click", "#modal-add .close-button", function () {
        $("#modal-add").removeClass("active");
        $(".modal-backdrop").removeClass("active");
    });

    $("#add-album").click(function (e) {
        e.preventDefault();
        let isValid = true;

        $(".add-album input, .add-album select").each(function () {
            if ($(this).val().trim() === "") {
                isValid = false;
                $(this).addClass("input-error");
            } else {
                $(this).removeClass("input-error");
            }
        });

        if (isValid) {
            const formData = new FormData($(".add-album")[0]);
            $.ajax({
                type: "POST",
                url: "./backend/subir-vinilo.php",
                data: formData,
                processData: false,
                contentType: false,
                success: function () {
                    $(".add-album")[0].reset();
                    cargarTabla(); // Recargar la tabla después de añadir
                    $("#modal-add").removeClass("active");
                    $(".modal-backdrop").removeClass("active");
                },
                error: function (xhr, status, error) {
                    alert("Error al añadir el álbum: " + error);
                },
            });
        } else {
            alert("Por favor, completa todos los campos del formulario.");
        }
    });

    // Cargar tabla al iniciar
    cargarTabla();
});
