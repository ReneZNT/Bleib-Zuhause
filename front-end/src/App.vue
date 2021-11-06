<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <h2>Bleib Zuhause</h2>
      <v-spacer/>
      <v-btn outlined class="mr-3" to="/">Inicio</v-btn>
      <v-btn outlined class="mr-3" to="/sobre">Sobre</v-btn>
      <v-app-bar-nav-icon v-show="false"/>
    </v-app-bar>

    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>
