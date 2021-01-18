<template>
  <div>
    <div>
      <h4>Create</h4>
      <form>
        <input type="text" v-model="name" />
        <button @click.prevent="addUser">Add User</button>
      </form>
    </div>
    <div>
      <h4>Read</h4>
      <form>
        <input type="text" v-model="userId" placeholder="enter user id" />
        <button @click.prevent="findUser">
          Find
        </button>
      </form>
      <p>{{ userResponse }}</p>
    </div>

    <div>
      <h4>Update</h4>
      <form>
        <input type="text" v-model="updateId" placeholder="enter user id" />
        <input type="text" v-model="updateName" placeholder="enter new name" />
        <button @click.prevent="updateUser">
          Update
        </button>
      </form>
    </div>

    <div>
      <h4>Delete</h4>
      <form>
        <input type="text" v-model="deleteId" placeholder="enter user id" />
        <button @click.prevent="deleteUser">
          Delete
        </button>
      </form>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
const args = {
  contractName: "Crud",
  method: "read",
  methodArgs: [],
};
export default {
  name: "Crud",
  data: () => ({
    name: "",
    userId: "",
    updateId: "",
    deleteId: "",
    updateName: "",
    userResponse: "",
  }),
  computed: {
    ...mapGetters("contracts", ["getContractData"]),
    ...mapGetters("drizzle", ["drizzleInstance"]),
    contractData() {
      return this.getContractData({
        contract: args.contractName,
        method: args.method,
      });
    },
  },
  methods: {
    addUser() {
      this.drizzleInstance.contracts["Crud"].methods["create"](this.name)
        .send()
        .then((res) => {
          if (res.status === true) {
            this.name = "";
          }
        });
    },
    findUser() {
      this.drizzleInstance.contracts["Crud"].methods["read"](this.userId)
        .call()
        .then((res) => {
          this.userResponse = `id: ${res[0]} Name: ${res[1]}`;
        })
        .catch(() => {
          this.userResponse = "";
        });
    },
    updateUser() {
      this.drizzleInstance.contracts["Crud"].methods["update"](
        this.updateId,
        this.updateName
      )
        .send()
        .then(() => {
          this.updateId = "";
          this.updateName = "";
        })
        .catch(() => {});
    },
    deleteUser() {
      this.drizzleInstance.contracts["Crud"].methods["destroy"](this.deleteId)
        .send()
        .then(() => {
          this.deleteId = "";
        })
        .catch(() => {});
    },
  },
};
</script>
