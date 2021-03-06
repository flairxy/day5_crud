import Crud from "./contracts/Crud.json";

const options = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:9545",
    },
  },
  contracts: [Crud],
  events: {
    Crud: ["UserEvent"],
  },
  polls: {
    accounts: 15000,
  },
};

export default options;
