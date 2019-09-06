<template>
  <div v-if="permited">
    <slot></slot>
  </div>
  
</template>

<script>
  export default {
    name: 'AllowedFor',
    props: {
      roles: { type: Array, default: () => [] }
    },
    computed: {
      permited() {
        if(!this.$store.state.user)
          return false

        if(this.roles.length === 0)
          return true

        return this.roles.includes(this.$store.state.user.roles)
      }
    }
  }
</script>

<style scoped>

</style>