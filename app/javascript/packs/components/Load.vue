<template>
  <div>
    <transition name="fade">
      <div v-if="load" class="load">
        <div class="lds-ripple">
          <strong>{{ getMessage() }}</strong>
        </div>
        <div class="lds-ripple"><div></div><div></div><div></div></div>
      </div>
    </transition>
  </div>
</template>

<script>
  export default {
    name: "Load",
    props: ['message', 'load'],
    methods: {
      getMessage() {
        return this.message || 'Carregando'
      }
    }
  }
</script>

<style scoped>
  .load {
    background-color: midnightblue;
    opacity: 0.3;
    width: 100%;
    height: 100%;
    top: 0;
    position: absolute;
    left: 0;
  }

  .lds-ripple {
    display: inline-block;
    position: absolute;
    width: 100px;
    height: 100px;
    top: 50%;
    left: 50%;
    text-align: center;
  }
  .lds-ripple div:nth-child(1){
    position: relative;
  }
  .lds-ripple div:nth-child(2) {
    position: absolute;
    border: 4px solid #fff;
    opacity: 1;
    border-radius: 50%;
    animation: lds-ripple 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
  }
  .lds-ripple div:nth-child(3) {
    animation-delay: -0.2s;
  }
  @keyframes lds-ripple {
    0% {
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      opacity: 1;
    }
    100% {
      top: 1px;
      left: 1px;
      width: 100%;
      height: 100%;
      opacity: 0;
    }
  }
  .fade-enter-to, .fade-leave {
    transition: 1s ease-out;
    opacity: 0.3;
   }
  .fade-enter, .fade-leave-to {
    transition: 1s ease-out;
    opacity: 0;
  }
</style>