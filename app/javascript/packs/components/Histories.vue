<template>
  <div>
    <p>Quantidade de Historias: {{ total }}</p>
    <b-container>
      <b-row>
        <b-col cols="3" v-for="history in histories">
          <router-link :to="`histories/${history.id}`" class="btn btn-info btn-sm">
            <b-card text-variant="black" :title="history.title">
              <b-card-text>
                {{ history.description }}
              </b-card-text>
            </b-card>
          </router-link>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        total: 0,
        histories: []
      }
    },
    mounted() {
      this.$http.get('histories')
        .then(resp => {
          this.total = resp.data.length
          this.histories = resp.data
        })
    }
  }
</script>

<style>
  .card-body {
    color: black;
  }

</style>
