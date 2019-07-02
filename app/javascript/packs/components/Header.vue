<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto justify-content-end">
          <b-nav-item-dropdown v-if="user" right>
            <!-- Using 'button-content' slot -->
            <template slot="button-content">
              <em>{{ user.email }}</em>
            </template>
            <b-dropdown-item href="#">{{ user }}</b-dropdown-item>
            <b-dropdown-item data-method="DELETE" href="users/sign_out">Sair</b-dropdown-item>
          </b-nav-item-dropdown>
          <b-nav-item-dropdown v-else right>
            <!-- Using 'button-content' slot -->
            <template slot="button-content">
              <em>Entrar</em>
            </template>
            <b-dropdown-item href="user/sign_in">Entrar</b-dropdown-item>
            <b-dropdown-item href="users/sign_up">Registrar</b-dropdown-item>
          </b-nav-item-dropdown>

        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>

  export default {
    data: function () {
      return {
        title: "Meu NNNNNNNNNNN Título"
      }
    },
    computed: {
      user() { return this.$store.state.user }
    }
  }
</script>

<style>

</style>
