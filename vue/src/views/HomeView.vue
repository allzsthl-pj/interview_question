<template>
  <el-container style="min-height: 100vh">

    <el-aside :width="sideWidth + 'px'" style="box-shadow: 2px 0 6px rgb(0 21 41 / 35%);">
      <el-menu :default-openeds="['1', '3']" style="min-height: 100%; overflow-x: hidden"
               background-color="rgb(48, 65, 86)"
               text-color="#fff"
               active-text-color="#ffd04b"
               :collapse-transition="false"
               :collapse="isCollapse"
      >
        <div style="height: 60px; line-height: 60px; text-align: center">
          <img src="../assets/logo.png" alt="" style="width: 20px; position: relative; top: 5px; right: 5px">
          <b style="color: white" v-show="logoTextShow"></b>
        </div>
      </el-menu>
    </el-aside>

    <el-container>
      <el-header style="font-size: 12px; border-bottom: 1px solid #ccc; line-height: 60px; display: flex">
        <div style="flex: 1; font-size: 20px">
          <span :class="collapseBtnClass" style="cursor: pointer" @click="collapse"></span>
        </div>
        <el-dropdown style="width: 70px; cursor: pointer">
          <span>Peng</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item style="font-size: 14px; padding: 5px 0">info</el-dropdown-item>
            <el-dropdown-item style="font-size: 14px; padding: 5px 0">quit</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>

      </el-header>

      <el-main>
        <div style="margin-bottom: 30px">
          <el-breadcrumb separator="/">
            <el-breadcrumb-item :to="{ path: '/' }">Index</el-breadcrumb-item>
            <el-breadcrumb-item>User Management</el-breadcrumb-item>
          </el-breadcrumb>
        </div>

        <div style="margin: 10px 0">
          <el-input style="width: 200px" placeholder="enter username" suffix-icon="el-icon-search" v-model="username"></el-input>
          <el-input style="width: 200px" placeholder="enter email" suffix-icon="el-icon-message" class="ml-5"
                    v-model="email"></el-input>
          <el-input style="width: 200px" placeholder="enter address" suffix-icon="el-icon-position" class="ml-5"
                    v-model="address"></el-input>
          <el-button class="ml-5" type="primary" @click="load">search</el-button>
          <el-button type="warning" @click="reset">reset</el-button>
        </div>

        <div style="margin: 10px 0">
          <el-button type="primary" @click="handleAdd">add <i class="el-icon-circle-plus-outline"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='confirm'
              cancel-button-text='think it again'
              icon="el-icon-info"
              icon-color="red"
              title="sure?"
              @confirm="delBatch"
          >
            <el-button type="danger" slot="reference">delBatch <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </div>

        <el-table :data="tableData" border stripe :header-cell-class-name="headerBg"
                  @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="id" label="ID" width="80"></el-table-column>
          <el-table-column prop="username" label="Username" width="140"></el-table-column>
          <el-table-column prop="nickname" label="Nickname" width="120"></el-table-column>
          <el-table-column prop="email" label="Email"></el-table-column>
          <el-table-column prop="phone" label="Phone"></el-table-column>
          <el-table-column prop="address" label="Address"></el-table-column>
          <el-table-column label="operation" width="200" align="center">
            <template slot-scope="scope">
              <el-button type="success" @click="handleEdit(scope.row)" size="mini">edit <i class="el-icon-edit"></i></el-button>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='confirm'
                  cancel-button-text='think it again'
                  icon="el-icon-info"
                  icon-color="red"
                  title="Are you sure?"
                  @confirm="del(scope.row.id)"
              >
                <el-button type="danger" slot="reference" size="mini">delete <i class="el-icon-remove-outline"></i></el-button>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
        <div style="padding: 10px 0">
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[2, 5, 10, 20]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
          </el-pagination>
        </div>

        <el-dialog title="user info" :visible.sync="dialogFormVisible" width="30%">
          <el-form label-width="80px" size="small" :model="form" :rules="formRules">
            <el-form-item label="username" prop="username">
              <el-input v-model="form.username" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="nickname">
              <el-input v-model="form.nickname" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="email" prop="email">
              <el-input v-model="form.email" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="phone">
              <el-input v-model="form.phone" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="address">
              <el-input v-model="form.address" autocomplete="off"></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">cancel</el-button>
            <el-button type="primary" @click="save()">confirm</el-button>
          </div>
        </el-dialog>
      </el-main>

    </el-container>
  </el-container>
</template>

<script>

import request from "@/utils/request";

export default {
  name: 'Home',
  data() {
    var checkUsername = (rule, value, callback) => {//用户名校验
      const usernameReg = /^[a-zA-Z0-9_-]/;
      if (!value) {
        return callback(new Error('username can not be null'))
      }
      setTimeout(() => {
        if (usernameReg.test(value)) {
          return callback()
        } else {
          return callback(new Error('username can only contain characters and numbers'))
        }
      }, 100)
    };
    var checkEmail = (rule, value, callback) => {//邮箱校验
      const mailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
      if (!value) {
        return callback(new Error('email can not be null'))
      }
      setTimeout(() => {
        if (mailReg.test(value)) {
          return callback()
        } else {
          return callback(new Error('please enter email in a correct form'))
        }
      }, 100)
    };
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 2,
      username: "",
      nickname: "",
      address: "",
      form: {
        username: null,
        email: null
      },
      formRules: {
        username: [
          {required: true, validator: checkUsername, trigger: 'blur'},
        ],
        email: [
          {required: true, validator: checkEmail, trigger: 'blur'},
        ],
      },
      dialogFormVisible: false,
      multipleSelection: [],
      msg: "hello",
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,
      headerBg: 'headerBg',
    }
  },
  created() {
    // 请求分页查询数据
    this.load()
  },
  methods: {
    collapse() {  // 点击收缩按钮触发
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) {  // 收缩
        this.sideWidth = 64
        this.collapseBtnClass = 'el-icon-s-unfold'
        this.logoTextShow = false
      } else {   // 展开
        this.sideWidth = 200
        this.collapseBtnClass = 'el-icon-s-fold'
        this.logoTextShow = true
      }
    },
    load() {
      request.get("/user/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          address: this.address,
        }
      }).then(res => {
        console.log(res)

        this.tableData = res.records
        this.total = res.total

      })
    },
    save() {
      const usernameReg = /^[a-zA-Z0-9_-]/;
      const mailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
      let isDisabled = this.form.username != null && this.form.email != null
          && usernameReg.test(this.form.username) && mailReg.test(this.form.email);
      if (isDisabled) {
        request.post("/user", this.form).then(res => {
          if (res) {
            this.$message.success("保存成功")
            this.dialogFormVisible = false
            this.load()
          } else {
            this.$message.error("保存失败")
          }
        })
      }
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    del(id) {
      request.delete("/user/" + id).then(res => {
        if (res) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      request.post("/user/del/batch", ids).then(res => {
        if (res) {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.username = ""
      this.email = ""
      this.address = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
  }
}
</script>

<style>
.headerBg {
  background: #eee !important;
}
</style>