<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <h1 v-if="$fetchState.pending">Fetching beers...</h1>
      <p v-else-if="$fetchState.error">An error occurred :(</p>
      <div v-else>
        <h1>Nuxt Beers</h1>
        <ul class="beers">
          <li class="beer" v-for="beer of beers">
            <img class="beer-image" :src="beer.image_url">
            {{ beer.name }}
            ${{ beer.price }}
          </li>
        </ul>
        <button @click="$fetch">Refresh</button>
        <p>Fetched @ {{$fetchState.timestamp}}</p>
      </div>
    </v-col>
  </v-row>
</template>

<script>
  export default {
    head: {
      title: 'Hello World',
    },
    data() {
      return {
        beers: []
      }
    },
    async fetch() {
      this.beers = await fetch(
        'https://api.nuxtjs.dev/beers'
      ).then(res => res.json())
    }
  }
</script>

<style>
.beer-image {
  width: 8em;
}
.beers {
  list-style: none;
}
.beer {
  margin-left: 0;
  padding-left: 0;
}
</style>