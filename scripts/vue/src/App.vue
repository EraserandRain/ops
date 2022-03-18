<template>
  <div id="app">
    <ul>
      <li v-for="(item, index) in items" :key="item.message">
        {{ item.message + " and " + index }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [{ message: "foo1" }, { message: "foo2" }],
    };
  },
};

</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
#app {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  row-gap: 10px;
  margin: 20px;
}
.isFoo {
  color: red;
}
</style>
