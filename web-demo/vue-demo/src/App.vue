<template>
  <div class="wrapper">
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <Cell v-on:click="clickCell" v-bind:n="n" />
    <div>n 为 {{ n }}</div>
  </div>
</template>

<script>
import Cell from "./Cell";
export default {
  components: { Cell },
  data() {
    return { n: 0 };
  },
  methods: {
    clickCell() {
      console.log("halo");
      this.n += 1;
    },
  },
};
</script>

<style>
.wrapper {
  display: grid;
  width: 300px;
  grid-template-columns: 1fr 1fr 1fr;
}
</style>
