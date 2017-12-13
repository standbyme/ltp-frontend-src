<template>
<div v-if="ScoreData">
  {{ScoreData}}
</div>
<div v-else>
  <i class="el-icon-loading"></i>
</div>
</template>

<script>
/* eslint-disable */

export default {
  name: "Score",
  props: ["ScoreData"],
  data() {
    return {};
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
