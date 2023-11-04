// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract ElectricBill {
struct Consumer {
uint256 units;
string name;
string addr;
uint256 consumerID;
uint256 amount;
}
Consumer[] consumer;
function addConsumerInfo(
uint256 units,
string memory name,
string memory addr,
uint256 consumerID
) public {
consumer.push(Consumer(units, name, addr, consumerID, 0));
}
function getBillAmount() public {
uint256 i = 0;
uint256 amount = 0;
uint256 surcharge = 0;
uint256 units = 0;
for (i = 0; i < consumer.length; i++) {
units = consumer[i].units;
if (units <= 50) {
amount = ((units * 1) / 2);
} else if (units <= 150) {
amount = 25 + (((units - 50) * 3) / 4);
} else if (units <= 250) {
amount = 100 + (((units - 150) * 6) / 5);
} else {
amount = 220 + (((units - 250) * 3) / 2);
}
surcharge = (amount * 20) / 100;
amount = amount + surcharge;
consumer[i].amount = amount;
}}
function displayConsumerInfo(uint256 consumerID)
public
view
returns (
uint256,
string memory,
string memory,
uint256,
uint256
)
{
uint256 i = 0;
for (i = 0; i < consumer.length; i++) {
if (consumer[i].consumerID == consumerID) {
return (
consumer[i].units,
consumer[i].name,
consumer[i].addr,
consumer[i].consumerID,
consumer[i].amount
);
}
}
return (
consumer[0].units,
consumer[0].name,
consumer[0].addr,
consumer[0].consumerID,
consumer[0].amount
);
}
function displayAllInfo() public view returns (Consumer[] memory) {
return consumer;
}
}
