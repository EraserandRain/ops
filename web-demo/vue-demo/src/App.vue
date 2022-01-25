<template>
  <div class="container">
    <div>第 {{ n }} 手</div>
    <div class="wrapper">
      <Cell @click="ClickCell(0, $event)" :n="n" />
      <Cell @click="ClickCell(1, $event)" :n="n" />
      <Cell @click="ClickCell(2, $event)" :n="n" />
      <Cell @click="ClickCell(3, $event)" :n="n" />
      <Cell @click="ClickCell(4, $event)" :n="n" />
      <Cell @click="ClickCell(5, $event)" :n="n" />
      <Cell @click="ClickCell(6, $event)" :n="n" />
      <Cell @click="ClickCell(7, $event)" :n="n" />
      <Cell @click="ClickCell(8, $event)" :n="n" />
    </div>
    <div>{{ result == null ? "胜负未分" : `胜方为${result}` }}</div>
  </div>
</template>
<script>
import Cell from "./Cell.vue";
export default {
  components: { Cell },
  data() {
    return {
      n: 0,
      map: [
        [null, null, null],
        [null, null, null],
        [null, null, null],
      ],
      result: null,
    };
  },
  methods: {
    ClickCell(i, text) {
      this.n += 1;
      this.map[Math.floor(i / 3)][i % 3] = text;
      this.win();
    },
    win() {
      const map = this.map;
      for (let j = 0; j <= 2; j++) {
        if (
          map[j][0] !== null &&
          map[j][0] == map[j][1] &&
          map[j][1] == map[j][2]
        ) {
          this.result = map[j][0];
        } else if (
          map[0][j] !== null &&
          map[0][j] == map[1][j] &&
          map[1][j] == map[2][j]
        ) {
          this.result = map[0][j];
        } else if (
          map[0][0] !== null &&
          map[0][0] == map[1][1] &&
          map[1][1] == map[2][2]
        ) {
          this.result = map[0][0];
        } else if (
          map[0][2] !== null &&
          map[0][2] == map[1][1] &&
          map[1][1] == map[2][0]
        ) {
          this.result = map[0][2];
        }
      }
    },
  },
};
</script>
<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  width: 300px;
}
</style>
