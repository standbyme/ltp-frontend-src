<template>
<div>
  <ol>
    <li v-for="ResultData in ResultListData">
      233
    </li>
  </ol>
</div>
</template>

<script>
/* eslint-disable */
import Result from './Result'

export default {
  name: "ResultList",
  components: {
    Result
  },
  data() {
    return {
      ResultListData: []
    };
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
