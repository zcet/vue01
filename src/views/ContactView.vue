<template>
  <div id="contact">
    <div class="contact-card">
      <img src="../assets/2.jpg" alt="Profile" />
      <h1> Concact Sirawit Hongsa</h1>
      <p class="subtitle">The test page</p>

      <div class="contact-info">
        <p>📧 sirawit@email.com</p>
        <p>📞 09x-xxx-xxxx</p>
      </div>

      <button class="contact-btn">Contact Me</button>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
#contact {
  min-height: 100vh;
  background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.contact-card {
  background: #ffffff;
  padding: 30px;
  border-radius: 20px;
  text-align: center;
  width: 350px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
  transition: transform 0.3s;
}

.contact-card:hover {
  transform: translateY(-5px);
}

.contact-card img {
  width: 180px;
  height: 180px;
  object-fit: cover;
  border-radius: 50%;
  margin-bottom: 20px;
  border: 5px solid #fbc2eb;
}

h1 {
  margin: 0;
  font-size: 24px;
  color: #333;
}

.subtitle {
  color: #777;
  margin: 10px 0 20px;
}

.contact-info p {
  margin: 5px 0;
  color: #555;
}

.contact-btn {
  margin-top: 20px;
  padding: 10px 25px;
  border: none;
  border-radius: 25px;
  background: #a6c1ee;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  transition: background 0.3s;
}

.contact-btn:hover {
  background: #8aa7e0;
}
</style>
