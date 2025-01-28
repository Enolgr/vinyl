<?php
header('Content-Type: application/json');

require_once __DIR__ . '/db.php';

$response = [
    'success' => false,
    'message' => ''
];

// Verifica conexión a la base de datos
if (!isset($conn) || !$conn instanceof mysqli) {
    $response['message'] = 'Error: Conexión a la base de datos no disponible.';
    echo json_encode($response);
    exit;
}

// Verifica si la solicitud es POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recoge los datos enviados
    $nombreAlbum = isset($_POST['titulo']) ? trim($_POST['titulo']) : '';
    $nombreArtista = isset($_POST['artista']) ? trim($_POST['artista']) : '';
    $genero = isset($_POST['genero']) ? intval($_POST['genero']) : 0;
    $precio = isset($_POST['precio']) ? floatval($_POST['precio']) : 0;
    $descripcion = isset($_POST['descripcion']) ? trim($_POST['descripcion']) : '';

    // Depuración de los datos recibidos
    error_log("Datos recibidos: Título: $nombreAlbum, Artista: $nombreArtista, Género: $genero, Precio: $precio, Descripción: $descripcion");

    if (!$nombreAlbum || !$nombreArtista || !$genero || !$precio || !isset($_FILES['imagen'])) {
        $response['message'] = 'Todos los campos son obligatorios.';
        echo json_encode($response);
        exit;
    }

    // Configuración de subida con ruta relativa
    $uploadDir = "./backend/uploads/"; // Ruta relativa
    $imageName = basename($_FILES['imagen']['name']);
    $uploadFile = $uploadDir . $imageName;

    // Depuración de la imagen recibida
    error_log("Subiendo imagen: Nombre original: $imageName, Ruta temporal: {$_FILES['imagen']['tmp_name']}");

    // Verificar si la carpeta de destino existe
    if (!is_dir($uploadDir)) {
        error_log("La carpeta de destino no existe. Intentando crearla...");
        if (!mkdir($uploadDir, 0755, true)) {
            $response['message'] = 'Error al crear el directorio de uploads.';
            echo json_encode($response);
            exit;
        }
    }

    // Verificar permisos de escritura en la carpeta
    if (!is_writable($uploadDir)) {
        error_log("La carpeta $uploadDir no tiene permisos de escritura.");
        $response['message'] = 'El directorio de uploads no tiene permisos de escritura.';
        echo json_encode($response);
        exit;
    }

    // Subir la imagen al servidor
    if (move_uploaded_file($_FILES['imagen']['tmp_name'], $uploadFile)) {
        error_log("Imagen subida correctamente a: $uploadFile");
        $conn->begin_transaction();
        $stmt = null;

        try {
            // Buscar o insertar el artista
            $stmt = $conn->prepare("SELECT id_artista FROM artistas WHERE nombre_artista = ?");
            $stmt->bind_param('s', $nombreArtista);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $artistaId = $result->fetch_assoc()['id_artista'];
                error_log("Artista encontrado: ID $artistaId");
            } else {
                error_log("Artista no encontrado. Insertando nuevo artista...");
                $stmt = $conn->prepare("INSERT INTO artistas (nombre_artista) VALUES (?)");
                $stmt->bind_param('s', $nombreArtista);
                $stmt->execute();
                $artistaId = $stmt->insert_id;
                error_log("Nuevo artista insertado: ID $artistaId");
            }

            // Insertar álbum
            error_log("Insertando álbum...");
            $stmt = $conn->prepare(
                "INSERT INTO albums (nombre_album, artista, genero, precio, descripcion, publicado, img) 
                VALUES (?, ?, ?, ?, ?, 0, ?)"
            );
            $stmt->bind_param('siidss', $nombreAlbum, $artistaId, $genero, $precio, $descripcion, $uploadFile);

            if ($stmt->execute()) {
                $conn->commit();
                error_log("Álbum insertado correctamente.");
                $response['success'] = true;
                $response['message'] = 'Álbum añadido correctamente.';
            } else {
                throw new Exception('Error al insertar el álbum: ' . $stmt->error);
            }
        } catch (Exception $e) {
            $conn->rollback();
            // Eliminar imagen si falla la transacción
            if (file_exists($uploadFile)) {
                unlink($uploadFile);
                error_log("Imagen eliminada debido a un error en la transacción.");
            }
            error_log("Error: " . $e->getMessage());
            $response['message'] = $e->getMessage();
        } finally {
            if ($stmt) {
                $stmt->close();
            }
        }
    } else {
        $error = $_FILES['imagen']['error'];
        error_log("Error al subir la imagen: $error");
        $response['message'] = "Error al subir la imagen. Código de error: $error.";
    }
} else {
    $response['message'] = 'Método no permitido.';
    error_log("Método no permitido.");
}

echo json_encode($response);
