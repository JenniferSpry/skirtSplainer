<template>
  <div id="app">
    <v-app>
      <v-app-bar app dense>
        <v-toolbar-title>SVG Playground</v-toolbar-title>
      </v-app-bar>

      <v-main>
        <v-container>
          <HomePage/>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import HomePage from './components/HomePage.vue';

export default {
  name: 'App',
  components: {
    HomePage,
  },
};
</script>
