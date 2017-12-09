<template>
<div>
  <Result v-for="(ResultData,id) in ResultListData" :key="id" :ResultData="ResultData" />
</div>
</template>

<script>
/* eslint-disable */
import Result from "./Result";

export default {
  name: "ResultList",
  components: {
    Result
  },
  props: ["ResultListData"],
  data() {
    return {};
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
