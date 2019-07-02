<template>
  <div>
    <p>Quantidade de Historias: {{ total }}</p>
    <hr>
    <ul>
      <li v-for="history in histories">
        <History :history="history" />
      </li>
    </ul>
  </div>
</template>

<script>
  import History from './histories/History'
  export default {
    components: { History },
    data: function () {
      return {
        total: 0,
        histories: []
      }
    },
    created() {
      this.$http.get('histories')
        .then(resp => {
          this.total = resp.data.length
          this.histories = resp.data
          console.log(resp.data)
        })
    }
  }
</script>

<style>

</style>
