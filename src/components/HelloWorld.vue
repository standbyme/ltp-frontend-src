<template>
<div>
  <el-row>
    <el-col :span="12" :offset="6">
      <el-form ref="form" :model="form">
        <el-form-item label="提取三元组">
          <el-input type="textarea" v-model="form.UserInput"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button class="bg" type="primary" @click="relation_triple_extraction_RULE">立即创建</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </el-row>
  <el-row>
    <el-col :span="12" :offset="6">
      <ResultList />
    </el-col>
  </el-row>
</div>
</template>

<script>
/* eslint-disable */
import axios from "axios";
import ResultList from './ResultList'
const ENDPOINT = "http://127.0.0.1:5000/";


export default {
  name: "HelloWorld",
  components: {
    ResultList
  },
  data() {
    return {
      form: {
        UserInput: ""
      }
    };
  },
  methods: {
    relation_triple_extraction_RULE: function(event) {
      axios
        .post(ENDPOINT, {
          UserInput: encodeURI(this.form.UserInput)
        })
        .then(function(response) {
          console.log(response.data.Result);
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
a {
  color: #42b983;
}

.bg {
  width: 100%;
}
</style>
