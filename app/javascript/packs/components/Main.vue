<template>
  <div>
    <h2>Menu</h2>
    <p @click="changeName">Aqui</p>
  </div>

</template>

<script>

  export default {
    methods: {
      changeName() {
        this.$store.state.user.email = new Date().toDateString()
      }
    }

  }
</script>

<style>

</style>