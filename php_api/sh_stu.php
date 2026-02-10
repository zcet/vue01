<?php
include 'condb.php';
header("Content-Type: application/json; charset=UTF-8");

try {
    $method = $_SERVER['REQUEST_METHOD'];

    // 🔹 GET : ดึงข้อมูลนักเรียนทั้งหมด
    if ($method === "GET") {
        $stmt = $conn->prepare("SELECT * FROM student ORDER BY student_id DESC");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "data" => $result]);
    }

    // 🔹 POST : เพิ่มข้อมูลนักเรียน
    elseif ($method === "POST") {

        $contentType = $_SERVER["CONTENT_TYPE"] ?? '';
        if (stripos($contentType, "application/json") !== false) {
            $data = json_decode(file_get_contents("php://input"), true);
        } else {
            $data = $_POST;
        }

        if (empty($data["first_name"]) || empty($data["last_name"])) {
            echo json_encode(["success" => false, "message" => "กรุณากรอกชื่อและนามสกุล"]);
            exit;
        }

        $stmt = $conn->prepare("
            INSERT INTO student (first_name, last_name, phone, email)
            VALUES (:first_name, :last_name, :phone, :email)
        ");

        $stmt->bindParam(":first_name", $data["first_name"]);
        $stmt->bindParam(":last_name", $data["last_name"]);
        $stmt->bindParam(":phone", $data["phone"]);
        $stmt->bindParam(":email", $data["email"]);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "เพิ่มข้อมูลนักเรียนเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถเพิ่มข้อมูลได้"]);
        }
    }

    // 🔹 PUT : แก้ไขข้อมูลนักเรียน
    elseif ($method === "PUT") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["student_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบ student_id"]);
            exit;
        }

        $stmt = $conn->prepare("
            UPDATE student 
            SET first_name = :first_name,
                last_name  = :last_name,
                phone      = :phone,
                email      = :email
            WHERE student_id = :id
        ");

        $stmt->bindParam(":first_name", $data["first_name"]);
        $stmt->bindParam(":last_name", $data["last_name"]);
        $stmt->bindParam(":phone", $data["phone"]);
        $stmt->bindParam(":email", $data["email"]);
        $stmt->bindParam(":id", $data["student_id"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "แก้ไขข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถแก้ไขข้อมูลได้"]);
        }
    }

    // 🔹 DELETE : ลบข้อมูลนักเรียน
    elseif ($method === "DELETE") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["student_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบ student_id"]);
            exit;
        }

        $stmt = $conn->prepare("DELETE FROM student WHERE student_id = :id");
        $stmt->bindParam(":id", $data["student_id"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "ลบข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถลบข้อมูลได้"]);
        }
    }

    else {
        echo json_encode(["success" => false, "message" => "Method ไม่ถูกต้อง"]);
    }

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
