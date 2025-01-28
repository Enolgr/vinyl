<?php
header('Content-Type: application/json');

// Incluir archivo de conexión a la base de datos
include_once 'db.php';

try {
    // Verificar si los datos necesarios están presentes
    if (!isset($_POST['id'], $_POST['estado'])) {
        echo json_encode([
            'success' => false,
            'message' => 'Datos incompletos proporcionados.',
        ]);
        exit;
    }

    $id = intval($_POST['id']);
    $estado = intval($_POST['estado']);

    // Validar el estado (solo 0 o 1)
    if (!in_array($estado, [0, 1], true)) {
        echo json_encode([
            'success' => false,
            'message' => 'El estado proporcionado no es válido.',
        ]);
        exit;
    }

    // Preparar la consulta para actualizar el estado del vinilo
    $sql = "UPDATE albums SET publicado = ? WHERE id_album = ?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("ii", $estado, $id);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            echo json_encode([
                'success' => true,
                'message' => 'Estado actualizado correctamente.',
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'No se pudo actualizar el estado del vinilo.',
            ]);
        }
        $stmt->close();
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Error al preparar la consulta.',
        ]);
    }

    // Cerrar conexión
    $conn->close();
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error del servidor: ' . $e->getMessage(),
    ]);
}
?>
