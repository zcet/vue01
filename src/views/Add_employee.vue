<template>
  <div class="container mt-4 col-md-4 bg-body-secondary ">
    <h2 class="text-center mb-3">เพิ่มพนักงาน</h2>
    <form @submit.prevent="addData">
      <div class="mb-2">
        <input v-model="employees.full_name" class="form-control" placeholder="ชื่อ-สกุล" required />
      </div>
      <div class="mb-2">
        <input v-model="employees.department" class="form-control" placeholder="แผนก" required />
      </div>
      <div class="mb-2">
        <input  v-model="employees.salary" class="form-control" placeholder="เงินเดือน" required />
      </div>
     
      <div class="text-center mt-4 ">
      <button type="submit" class="btn btn-primary mb-4">บันทึก</button> &nbsp;
      <button type="reset" class="btn btn-secondary mb-4">ยกเลิก</button>
      </div>
    </form>

    <div v-if="message" class="alert alert-info mt-3">
      {{ message }}
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      employees: {
        full_name: "",
        department: "",
        salary: "",
        active: "1",
        
      },
      message: ""
    };
  },
  methods: {
    async addData() {
      try {
        const res = await fetch("http://127.0.0.1/vue01/php_api/add_employee.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.employees)
        });
        const data = await res.json();
        this.message = data.message;

        if (data.success) {
          // ✅ เคลียร์ข้อมูลใน textbox หลังบันทึกสำเร็จ
          this.employees = { full_name: "", department: "", salary: "", active: "", };
        }

      } catch (err) {
        this.message = "เกิดข้อผิดพลาด: " + err.message;
      }
    }
  }
}
</script>
