import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './assets/global.css'
import request from "@/utils/request";
import  * as locale from 'element-ui/lib/locale/lang/en'

Vue.config.productionTip = false

Vue.use(ElementUI, {locale});
Vue.use(ElementUI, { size: "mini" });
Vue.prototype.request=request

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')