<template>
  <el-row>
  <el-col :span="12" :offset="6">
    <el-form ref="form" :model="form">
      <el-form-item label="提取三元组">
        <el-input type="textarea" v-model="form.UserInput"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button class="bg" type="primary" @click="greet">立即创建</el-button>
      </el-form-item>
    </el-form>
  </el-col>
</el-row>
</template>

<script>
/* eslint-disable */
import axios from "axios";

export default {
  name: "HelloWorld",
  data() {
    return {
      form: {
        UserInput: ""
      }
    };
  },
  methods: {
    greet: function(event) {
      console.log(this.form.UserInput)
      axios
        .post("http://127.0.0.1:5000/", {
          idd: this.form.UserInput
        })
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
      console.log("Hello !");
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
