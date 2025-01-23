<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="./styles/gestor.css">
    <title>Vinyl Store Manager</title>
</head>
<body>
    <h1>Vinyl Store Manager</h1>

    <div class="buscador">
    <div class="search-container">
    <input type="text" id="search-input" placeholder="Buscar vinilos">
    <button>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
    </button>
</div>
<select name="publicados" id="publicados">
  <option value="1">
    publicado
  </option>
  <option value="0">
    no publicado
  </option>
  </select>
  <select name="genero" id="genero">
  <option value="">Selecciona un género</option>
  <option value="Rock">Rock</option>
<option value="Pop">Pop</option>
<option value="Indie">Indie</option>
<option value="Electrónica">Electrónica</option>
<option value="Jazz">Jazz</option>
<option value="Hip Hop">Hip Hop</option>
<option value="Reggae">Reggae</option>
<option value="Flamenco">Flamenco</option>
<option value="Folk">Folk</option>
<option value="Experimental">Experimental</option>
<option value="Punk">Punk</option>
<option value="Trap">Trap</option>
<option value="Soul">Soul</option>
<option value="R&B">R&B</option>
<option value="Fusión">Fusión</option>

  </select>

    </div>

    <table class="vinyl-table">
        <thead>
            <tr>
                <th>Imagen</th>
                <th class="nombre-disco">Nombre</th>
                <th class="precio-disco">Precio</th>
                <th class="descripcion-disco">Descripción</th>
                <th class="autor-disco">Autor</th>
                <th class="genero-disco">Género</th>
                <th class="publicado-disco">Publicado</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <div id="boton-add">
      +
    </div>

    <div id="modal-add">
    <div class="modal-content">
        <button class="close-button">&times;</button>
        <form class="add-album">
    <label for="titulo">Título del álbum</label>
    <input name="titulo" type="text" placeholder="Escribe el título del álbum" required>

    <label for="artista">Artista</label>
    <input name="artista" type="text" placeholder="Escribe el nombre del artista" required>

    <label for="genero">Género</label>
    <select name="genero" id="genero" required>
        <option value="">Selecciona un género</option>
        <option value="1">Rock</option>
        <option value="2">Pop</option>
        <option value="3">Indie</option>
        <option value="4">Electrónica</option>
        <option value="5">Jazz</option>
        <option value="6">Hip Hop</option>
        <option value="7">Reggae</option>
        <option value="8">Flamenco</option>
        <option value="9">Folk</option>
        <option value="10">Experimental</option>
        <option value="11">Punk</option>
        <option value="12">Trap</option>
        <option value="13">Soul</option>
        <option value="14">R&B</option>
        <option value="15">Fusión</option>
    </select>

    <label for="descripcion">Descripción</label>
    <input type="text" name="descripcion" placeholder="Añade una descripción" required>

    <label for="imagen">Subir imagen</label>
    <input type="file" name="imagen" id="imagen" accept="image/*" required>

    <button type="submit" id="add-album">Añadir Álbum</button>
</form>

    </div>
</div>


    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/mostrar-tabla.js"></script>
</body>
</html>