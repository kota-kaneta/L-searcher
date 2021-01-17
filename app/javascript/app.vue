<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>