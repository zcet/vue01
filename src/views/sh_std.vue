<template>
  <div class="container mt-4">
    <h2 class="mb-3">รายชื่อนักเรียน</h2>

    <div class="mb-3">
      <button class="btn btn-primary" @click="openAddModal">
        เพิ่มนักเรียน <i class="bi bi-plus-circle"></i>
      </button>
    </div>

    <table class="table table-bordered table-striped">
      <thead class="table-primary">
        <tr>
          <th>รหัสนักเรียน</th>
          <th>ชื่อ</th>
          <th>นามสกุล</th>
          <th>เบอร์โทร</th>
          <th>Email</th>
          <th>แก้ไข / ลบ</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="stu in students" :key="stu.student_id">
          <td>{{ stu.student_id }}</td>
          <td>{{ stu.first_name }}</td>
          <td>{{ stu.last_name }}</td>
          <td>{{ stu.phone }}</td>
          <td>{{ stu.email }}</td>
          <td>
            <button class="btn btn-warning btn-sm" @click="openEditModal(stu)">
              แก้ไข
            </button>
            |
            <button class="btn btn-danger btn-sm" @click="deleteStudent(stu.student_id)">
              ลบ
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    <div v-if="loading" class="text-center">กำลังโหลดข้อมูล...</div>
    <div v-if="error" class="alert alert-danger">{{ error }}</div>

    <!-- Modal เพิ่ม / แก้ไข -->
    <div class="modal fade" id="editModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">
              {{ isEditMode ? "แก้ไขข้อมูลนักเรียน" : "เพิ่มนักเรียนใหม่" }}
            </h5>
            <button class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <div class="modal-body">
            <form @submit.prevent="saveStudent">
              <div class="mb-3">
                <label class="form-label">ชื่อ</label>
                <input v-model="editStudent.first_name" class="form-control" required />
              </div>
              <div class="mb-3">
                <label class="form-label">นามสกุล</label>
                <input v-model="editStudent.last_name" class="form-control" required />
              </div>
              <div class="mb-3">
                <label class="form-label">เบอร์โทร</label>
                <input v-model="editStudent.phone" class="form-control" />
              </div>
              <div class="mb-3">
                <label class="form-label">Email</label>
                <input v-model="editStudent.email" type="email" class="form-control" />
              </div>

              <button type="submit" class="btn btn-success">
                {{ isEditMode ? "บันทึกการแก้ไข" : "เพิ่มนักเรียน" }}
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import { ref, onMounted } from "vue";

export default {
  name: "StudentList",
  setup() {
    const students = ref([]);
    const loading = ref(true);
    const error = ref(null);
    const editStudent = ref({});
    const isEditMode = ref(false);
    let editModal = null;

    const API_URL = "http://127.0.0.1/vue01/php_api/sh_stu.php";

    const fetchStudents = async () => {
      try {
        const res = await fetch(API_URL);
        const result = await res.json();
        if (result.success) students.value = result.data;
        else error.value = result.message;
      } catch (err) {
        error.value = err.message;
      } finally {
        loading.value = false;
      }
    };

    onMounted(() => {
      fetchStudents();
      editModal = new window.bootstrap.Modal(
        document.getElementById("editModal")
      );
    });

    const openAddModal = () => {
      isEditMode.value = false;
      editStudent.value = {
        first_name: "",
        last_name: "",
        phone: "",
        email: ""
      };
      editModal.show();
    };

    const openEditModal = (stu) => {
      isEditMode.value = true;
      editStudent.value = { ...stu };
      editModal.show();
    };

    const saveStudent = async () => {
      const method = isEditMode.value ? "PUT" : "POST";

      const res = await fetch(API_URL, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(editStudent.value)
      });

      const result = await res.json();
      alert(result.message);
      if (result.success) {
        fetchStudents();
        editModal.hide();
      }
    };

    const deleteStudent = async (id) => {
      if (!confirm("ยืนยันการลบข้อมูล?")) return;

      const res = await fetch(API_URL, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ student_id: id })
      });

      const result = await res.json();
      alert(result.message);
      if (result.success) {
        students.value = students.value.filter(s => s.student_id !== id);
      }
    };

    return {
      students,
      loading,
      error,
      editStudent,
      isEditMode,
      openAddModal,
      openEditModal,
      saveStudent,
      deleteStudent
    };
  }
};
</script>
