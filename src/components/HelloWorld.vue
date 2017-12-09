<template>
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
</template>

<script>
/* eslint-disable */
import axios from "axios";
const ENDPOINT = "http://127.0.0.1:5000/";
function utf16to8(str) {
  var out, i, len, c;
  out = "";
  len = str.length;
  for (i = 0; i < len; i++) {
    c = str.charCodeAt(i);
    if (c >= 0x0001 && c <= 0x007f) {
      out += str.charAt(i);
    } else if (c > 0x07ff) {
      out += String.fromCharCode(0xe0 | ((c >> 12) & 0x0f));
      out += String.fromCharCode(0x80 | ((c >> 6) & 0x3f));
      out += String.fromCharCode(0x80 | ((c >> 0) & 0x3f));
    } else {
      out += String.fromCharCode(0xc0 | ((c >> 6) & 0x1f));
      out += String.fromCharCode(0x80 | ((c >> 0) & 0x3f));
    }
  }
  return out;
}

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
