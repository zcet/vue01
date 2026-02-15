<?php
include 'condb.php';

$action = $_POST['action'] ?? null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action) {

    switch ($action) {

        /* ================= ADD ================= */
        case 'add':
            $full_name  = $_POST['full_name'];
            $department = $_POST['department'];
            $salary     = $_POST['salary'];
            $active     = $_POST['active'] ?? 1;

            // upload image
            $filename = null;
            if (!empty($_FILES['image']['name'])) {
                $dir = "uploads/";
                if (!is_dir($dir)) mkdir($dir, 0777, true);

                $filename = time() . '_' . $_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'], $dir . $filename);
            }

            $sql = "INSERT INTO employees
                    (full_name, department, salary, active, image)
                    VALUES
                    (:full_name, :department, :salary, :active, :image)";

            $stmt = $conn->prepare($sql);
            $stmt->execute([
                ':full_name'  => $full_name,
                ':department' => $department,
                ':salary'     => $salary,
                ':active'     => $active,
                ':image'      => $filename
            ]);

            echo json_encode(["message" => "เพิ่มพนักงานสำเร็จ"]);
            break;

        /* ================= UPDATE ================= */
        case 'update':
            $emp_id     = $_POST['emp_id'];
            $full_name  = $_POST['full_name'];
            $department = $_POST['department'];
            $salary     = $_POST['salary'];
            $active     = $_POST['active'];

            $imageSQL = "";
            $params = [
                ':emp_id'     => $emp_id,
                ':full_name'  => $full_name,
                ':department' => $department,
                ':salary'     => $salary,
                ':active'     => $active
            ];

            if (!empty($_FILES['image']['name'])) {
                $dir = "uploads/";
                if (!is_dir($dir)) mkdir($dir, 0777, true);

                $filename = time() . '_' . $_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'], $dir . $filename);

                $imageSQL = ", image = :image";
                $params[':image'] = $filename;
            }

            $sql = "UPDATE employees SET
                        full_name = :full_name,
                        department = :department,
                        salary = :salary,
                        active = :active
                        $imageSQL
                    WHERE emp_id = :emp_id";

            $stmt = $conn->prepare($sql);
            $stmt->execute($params);

            echo json_encode(["message" => "แก้ไขข้อมูลสำเร็จ"]);
            break;

        /* ================= DELETE ================= */
        case 'delete':
            $emp_id = $_POST['emp_id'];
            $stmt = $conn->prepare("DELETE FROM employees WHERE emp_id = :emp_id");
            $stmt->execute([':emp_id' => $emp_id]);

            echo json_encode(["message" => "ลบข้อมูลสำเร็จ"]);
            break;

        default:
            echo json_encode(["error" => "action ไม่ถูกต้อง"]);
    }

} else {

    /* ================= GET ================= */
    $stmt = $conn->query("SELECT * FROM employees ORDER BY emp_id DESC");
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "success" => true,
        "data" => $data
    ]);
}
?>
