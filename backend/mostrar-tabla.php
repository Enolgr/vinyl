<?php
header('Content-Type: application/json; charset=utf-8');

include_once "./db.php";

// Realizar la consulta SQL
$sql = "SELECT id_album, img, nombre_album, nombre_artista, descripcion, genero ,precio,publicado FROM albums a JOIN artistas ar ON a.id_album = ar.id_artista JOIN genero ON id_genero = a.genero";

$result = $conn->query($sql);
$vinilos = array();

if ($result && $result->num_rows > 0) {
    // Almacenar cada fila de resultados en un array
    while ($row = $result->fetch_assoc()) {
        // Preparar los datos para enviar en el formato adecuado
        $vinilos[] = array(
            'id' => $row['id_album'],
            'title' => $row['nombre_album'],
            'image' => $row['img'],
            'price' => $row['precio'],
            'artist' => $row['nombre_artista']
        );
    }
    
    // Responder con los datos como JSON
    echo json_encode(array("success" => true, "vinilos" => $vinilos));
} else {
    // Si no hay registros, devolver respuesta vacía
    echo json_encode(array("success" => false, "vinilos" => []));
}

// Cerrar la conexión
$conn->close();
?>
