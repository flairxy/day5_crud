// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract Crud {
    event UserEvent(string _message);
    struct User {
        uint id;
        string name;
    }
    User[] public users;
    uint public nextId = 1;

    // function getUsers() view public returns(User[] memory){
    function getAllUsers() view public returns(string memory){
      return 'hello';
    }

    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
        emit UserEvent('User created successfully');
    }

  function read(uint id) view public returns(uint, string memory) {
    uint i = find(id);
    return(users[i].id, users[i].name);
  }

    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
        emit UserEvent('User updated successfully');
    }

    function destroy(uint id) public {
        uint i = find(id);
        delete users[i];
        emit UserEvent('User deleted successfully');
    }

    function find(uint id) view internal returns(uint) {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
              return i;
            }
        }
        revert('User does not exist!');
    }
}
