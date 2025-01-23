<?php
header('Content-Type: application/json; charset=utf-8');

include_once "./db.php";

$sql = "SELECT id_album, img, nombre_album, nombre_artista, descripcion, genero, precio, publicado FROM albums a JOIN artistas ar ON a.id_album = ar.id_artista JOIN genero ON id_genero = a.genero";

$result = $conn->query($sql);
$tabla_vinilos = array();

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $tabla_vinilos[] = array(
            'id' => $row['id_album'],
            'title' => $row['nombre_album'],
            'image' => $row['img'],
            'price' => $row['precio'],
            'artist' => $row['nombre_artista'],
            'description' => $row['descripcion'],
            'genre' => $row['genero'],
            'published' => $row['publicado']
        );
    }
    echo json_encode(array("success" => true, "tabla_vinilos" => $tabla_vinilos));
} else {
    echo json_encode(array("success" => false, "tabla_vinilos" => []));
}

$conn->close();
?>
