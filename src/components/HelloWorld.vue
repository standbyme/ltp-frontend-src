<template>
<div>
  <el-row>
    <el-col :span="12" :offset="6">
      <el-form ref="form" :model="form">
        <el-form-item label="提取三元组">
          <el-input autosize type="textarea" v-model="form.UserInput"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button class="bg" type="primary" @click="relation_triple_extraction_RULE">立即创建</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </el-row>
  <el-row>
    <el-col :span="12" :offset="6">
      <ResultList :ResultListData="ResultListData"/>
    </el-col>
  </el-row>
</div>
</template>

<script>
/* eslint-disable */
import axios from "axios";
import ResultList from "./ResultList";
const EXTRACT_ENDPOINT = "http://127.0.0.1:1234/";
const SCORE_ENDPOINT = "http://127.0.0.1:8080/rest/score/post";

export default {
  name: "HelloWorld",
  components: {
    ResultList
  },
  data() {
    return {
      form: {
        UserInput: `新华社俄罗斯喀山3月23日电（记者 魏良磊）中俄执政党对话机制第六次会议和第五届中俄政党论坛23日在俄罗斯喀山举行。中共中央总书记习近平和俄罗斯联邦总统普京分别致贺信。
习近平举行仪式欢迎马尔代夫总统访华
然而，继冬奥运动强国俄罗斯被禁赛后，美国方面也一度传出可能不参加平昌冬奥会。白宫发言人莎拉-桑德斯(Sarah Sanders)7日在例行新闻发布会上表示，美国可能不参加韩国平昌冬奥会，但尚未做出决定。这也是美国政府首次作出如此表态。此前一天，美国驻联合国大使妮基·黑莉也表示，“目前为止尚未听到参加奥运会的消息”，她还表示朝鲜目前每天都在在发生变化，届时会视朝鲜的动向决定。
美国奥委会7日确认，美国代表团将不参加平昌冬奥会。`
      },
      ResultListData: []
    };
  },
  methods: {
    relation_triple_extraction_RULE: async function(event) {
      try {
        const triple_with_S_S__list = (await axios.post(EXTRACT_ENDPOINT, {
          UserInput: encodeURI(this.form.UserInput)
        })).data.Result;
        const triple_with_S_S_with_id__list = triple_with_S_S__list.map(
          (m, index) => {
            return { id: index, ...m };
          }
        );
        this.ResultListData = triple_with_S_S_with_id__list;
        const score_list = await axios.post(SCORE_ENDPOINT, {
          triple_with_ssid_s: triple_with_S_S__list.map(m => {
            return { triple: m.Triple, SSID: m.SSID };
          })
        });
        score_list.forEach((element, index) => {
          this.ResultListData[index]["score"] = element;
        });
      } catch (error) {
        console.log(error);
      }
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
