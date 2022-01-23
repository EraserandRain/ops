<template>
  <div>
    <div>{{ n }}</div>
    <div class="cell" v-on:click="clickSelf">
      <template v-if="a">{{ text }}</template>
      <template v-else></template>
    </div>
  </div>
</template>

    <script>
export default {
  props: ["n"],
  data: () => {
    return { a: false, text: "" };
  },
  methods: {
    clickSelf() {
      if (this.text !== "") {
        return;
      }
      this.a = true;
      this.$emit("click");
      this.text = this.n % 2 == 0 ? "x" : "o";
    },
  },
};
</script>

<style>
.cell {
  color: red;
  border: 1px solid #000;
  height: 100px;
  font-size: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
