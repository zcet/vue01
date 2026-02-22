<template>
  <div class="login-wrapper">
    <div class="container">
      <div class="row justify-content-center align-items-center vh-100">
        <div class="col-md-5 col-lg-4">
          
          <div class="card login-card">
            <div class="card-body p-4">

              <div class="text-center mb-4">
                <div class="logo-circle mb-3">
                  <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h4 class="fw-bold">Admin Panel</h4>
                <small class="text-muted">user : aaww  pass : aaww</small>
              </div>

              <!-- Username -->
              <div class="mb-3">
                <label class="form-label">ชื่อผู้ใช้</label>
                <div class="input-group modern-input">
                  <span class="input-group-text">
                    <i class="bi bi-person"></i>
                  </span>
                  <input
                    v-model="username"
                    type="text"
                    class="form-control"
                    placeholder="กรอกชื่อผู้ใช้"
                    @keyup.enter="login"
                  />
                </div>
              </div>

              <!-- Password -->
              <div class="mb-3">
                <label class="form-label">รหัสผ่าน</label>
                <div class="input-group modern-input">
                  <span class="input-group-text">
                    <i class="bi bi-lock"></i>
                  </span>
                  <input
                    v-model="password"
                    type="password"
                    class="form-control"
                    placeholder="กรอกรหัสผ่าน"
                    @keyup.enter="login"
                  />
                </div>
              </div>

              <!-- Button -->
              <button
                @click="login"
                class="btn btn-login w-100"
                :disabled="loading"
              >
                <span
                  v-if="loading"
                  class="spinner-border spinner-border-sm me-2"
                ></span>
                เข้าสู่ระบบ
              </button>

              <!-- Error -->
              <div
                v-if="error"
                class="alert alert-danger mt-3 mb-0 text-center small"
              >
                {{ error }}
              </div>

            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      username: "",
      password: "",
      error: "",
      loading: false,
    };
  },

  methods: {
    async login() {
      this.error = "";

      if (!this.username || !this.password) {
        this.error = "กรุณากรอกข้อมูลให้ครบ";
        return;
      }

      try {
        this.loading = true;

        const res = await axios.post(
          "http://localhost/vue01/php_api/login.php",
          {
            username: this.username,
            password: this.password,
          }
        );

        if (res.data.success) {
          localStorage.setItem("adminLogin", "true");
          localStorage.setItem("user", JSON.stringify(res.data.user));
          this.$router.push("/product_crud");
        } else {
          this.error = res.data.message;
        }
      } catch (err) {
        this.error = "เกิดข้อผิดพลาดในการเชื่อมต่อ Server";
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped>
/* Background Gradient */
.login-wrapper {
  background: linear-gradient(135deg, #1e3c72, #2a5298);
}

/* Card Style */
.login-card {
  border-radius: 20px;
  border: none;
  backdrop-filter: blur(12px);
  background: rgba(255, 255, 255, 0.95);
  box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
  transition: 0.3s;
}

.login-card:hover {
  transform: translateY(-5px);
}

/* Logo Circle */
.logo-circle {
  width: 70px;
  height: 70px;
  background: linear-gradient(135deg, #4e73df, #1cc88a);
  color: white;
  font-size: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

/* Input */
.modern-input .form-control {
  border-left: 0;
  box-shadow: none;
}

.modern-input .input-group-text {
  background: #f8f9fc;
  border-right: 0;
}

.modern-input .form-control:focus {
  box-shadow: 0 0 0 2px rgba(78, 115, 223, 0.2);
  border-color: #4e73df;
}

/* Button */
.btn-login {
  background: linear-gradient(135deg, #4e73df, #1cc88a);
  border: none;
  border-radius: 10px;
  padding: 10px;
  font-weight: 600;
  color: white;
  transition: 0.3s;
}

.btn-login:hover {
  transform: scale(1.03);
  opacity: 0.95;
}
</style>