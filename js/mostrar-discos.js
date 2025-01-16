$(document).ready(function () {
    function cargarVinyls() {
      $.ajax({
        type: "get",
        url: "./backend/mostrar-discos.php",
        dataType: "json",
        success: function (response) {
          if (response.success === true) {
            let vinyls = $(".vinyls"); 
            vinyls.empty(); 

            response.data.forEach((element) => {


              let vinylHTML = `
                <div class="container-vinyl">
                    <img class="cover-vinyl" alt="${element.title}" src="${element.image}">
                    <h3 class="titulo-vinyl">${element.title}</h3>
                    <p class="precio">${element.price}€</p>
                    <p class="artista">${element.artist}</p>
                    <button class="add" data-id="${element.id}">Add to cart</button>
                </div>
              `;
              
              vinyls.append(vinylHTML);

            });
          } else {
            alert("Error loading vinyls: " + response.message);
          }
        },
        error: function (xhr, status, error) {
          console.error("AJAX Error:", status, error);
        },
      });
    }
  

    cargarVinyls();
  });
  