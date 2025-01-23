<?php
header('Content-Type: application/json');

require_once __DIR__ . '/db.php';

$response = [
    'success' => false,
    'message' => ''
];

if (!isset($conn) || !$conn instanceof mysqli) {
    $response['message'] = 'Error: Conexión a la base de datos no disponible.';
    echo json_encode($response);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombreAlbum = isset($_POST['titulo']) ? trim($_POST['titulo']) : '';
    $nombreArtista = isset($_POST['artista']) ? trim($_POST['artista']) : '';
    $genero = isset($_POST['genero']) ? intval($_POST['genero']) : 0;
    $precio = isset($_POST['precio']) ? floatval($_POST['precio']) : 0;
    $descripcion = isset($_POST['descripcion']) ? trim($_POST['descripcion']) : '';

    if (!$nombreAlbum || !$nombreArtista || !$genero || !$precio || !isset($_FILES['imagen'])) {
        $response['message'] = 'Todos los campos son obligatorios.';
        echo json_encode($response);
        exit;
    }

    $uploadDir = '../uploads/';
    $imageName = basename($_FILES['imagen']['name']);
    $uploadFile = $uploadDir . $imageName;

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    if (move_uploaded_file($_FILES['imagen']['tmp_name'], $uploadFile)) {
        $conn->begin_transaction();
        $stmt = null;

        try {
            // Verificar si el artista ya existe
            $stmt = $conn->prepare("SELECT id_artista FROM artistas WHERE nombre_artista = ?");
            $stmt->bind_param('s', $nombreArtista);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $artistaId = $result->fetch_assoc()['id_artista'];
            } else {
                // Insertar nuevo artista
                $stmt = $conn->prepare("INSERT INTO artistas (nombre_artista) VALUES (?)");
                $stmt->bind_param('s', $nombreArtista);
                $stmt->execute();
                $artistaId = $stmt->insert_id;
            }

            // Insertar el álbum
            $stmt = $conn->prepare(
                "INSERT INTO albums (nombre_album, artista, genero, precio, descripcion, publicado, img) VALUES (?, ?, ?, ?, ?, 0, ?)"
            );
            $stmt->bind_param('siidss', $nombreAlbum, $artistaId, $genero, $precio, $descripcion, $imageName);

            if ($stmt->execute()) {
                $conn->commit();
                $response['success'] = true;
                $response['message'] = 'Álbum añadido correctamente.';
            } else {
                throw new Exception('Error al insertar el álbum: ' . $stmt->error);
            }
        } catch (Exception $e) {
            $conn->rollback();
            $response['message'] = $e->getMessage();
        } finally {
            if ($stmt) {
                $stmt->close();
            }
        }
    } else {
        $response['message'] = 'Error al subir la imagen.';
    }
} else {
    $response['message'] = 'Método no permitido.';
}

echo json_encode($response);
