<template>
  <div class="cell" v-on:click="ClickSelf">
    <div v-if="a">{{ text }}</div>
    <div v-else></div>
  </div>
</template>
<script>
export default {
  props: ["n"],
  data() {
    return { a: false, text: "" };
  },
  methods: {
    ClickSelf() {
      if (this.text !== "") {
        return;
      }
      this.a = true;
      this.text = this.n % 2 == 0 ? "x" : "o";
      this.$emit("click",this.text);
    },
  },
};
</script>
<style>
.cell {
  height: 100px;
  border: 3px solid #000;
  font-size: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>