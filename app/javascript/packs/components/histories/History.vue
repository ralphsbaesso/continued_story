<template>
  <div>
<!--    <h1>{{ history }}</h1>-->
    <p>{{ firstChapter }}</p>

    <div class="history">
      <div class="head">
        <header>{{ history.title }}</header>
        <div class="subhead">
          {{ history.description }}
        </div>
      </div>

      <div v-if="firstChapter" class="chapter">
        <div class="title">
          {{ firstChapter.title}}
        </div>
        <div class="description">
          {{ firstChapter.description }}
        </div>
        <div class="content">
          {{ firstChapter.content }}
        </div>
      </div>
      <div v-else class="chapter">
        <div class="title">
          Nenhum captulo escrito
        </div>
      </div>

    </div>



  </div>
</template>

<script>

  export default {
    props: ['id'],
    data() {
      return {
        history: {}
      }
    },
    created() {
      this.$http.get(`histories/${this.id}`)
        .then(resp => this.history = resp.data)
    },
    computed: {
      firstChapter() {
        return this.history.chapter && this.history.chapter[0]
      }
    }
  }
</script>

<style scoped>

  .history {
    font-family: 'Droid Serif', serif;
    font-size: 14px;
    color: #2f2f2f;
    background-color: #f9f7f1;
    margin: 40px 40px 40px 40px;
    padding: 20px 20px 20px 20px;
    border-radius: 20px;
  }

  header {
    font-family: 'Playfair Display', serif;
    font-weight: 900;
    font-size: 50px;
    text-transform: uppercase;
    display: inline-block;
    line-height: 72px;
    margin-bottom: 20px;

  }

  .head{
    text-align: center;
    position: relative;
  }
  .subhead{
    text-transform: uppercase;
    border-bottom: 2px solid #2f2f2f;
    border-top: 2px solid #2f2f2f;
    padding: 12px 0 12px 0;
    margin-left: 20px;
    margin-right: 20px;
  }

  .chapter {

  }

  .chapter .content{
    display: inline-block;
    line-height: 20px;
    width: 100%;
    vertical-align: top;
    transition: all .7s;
    margin-bottom: 20px;
    font-size: 20px;
    margin-left: 20px;
    margin-right: 20px;
    text-align: justify;
  }

  .chapter .title{
    font-weight: 400;
    font-style: italic;
    font-size: 40px;
    box-sizing: border-box;
    text-align: center;
  }

  .chapter .description{
    font-weight: 300;
    font-style: italic;
    font-size: 30px;
    box-sizing: border-box;
    text-align: center;
    margin-bottom: 20px;
  }
</style>
