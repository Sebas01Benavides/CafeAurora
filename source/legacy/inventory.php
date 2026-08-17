<?php
header('Content-Type: application/json');
$mysqli = new mysqli("localhost", "legacy_user", "LegacyPass123!", "legacy_db");
if ($mysqli->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "DB Connection Failed"]);
    exit();
}
$result = $mysqli->query("SELECT id, name, stock, price FROM legacy_inventory");
$data = [];
while($row = $result->fetch_assoc()) {
    $data[] = $row;
}
echo json_encode($data);
?>
