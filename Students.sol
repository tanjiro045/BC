// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract Students {
struct student {
uint256 rollNo;
string name;
string placedCompany;
string degreeCourse;
}
student[] s;
function addStudent(
uint256 rollNo,
string memory name,
string memory placedCompany,
string memory degreeCourse
) public {
s.push(student(rollNo, name, placedCompany, degreeCourse));
}
function getStudentByRollNo(uint256 rollNumber)
public
view
returns (uint256, string memory)
{
uint256 i = 0;
for (i = 0; i < s.length; i++) {
if (s[i].rollNo == rollNumber) {
return (s[i].rollNo, s[i].name);
}
}
return (s[0].rollNo, s[0].name);
}
function getAllStudents() public view returns (student[] memory) {
return s;
}
}
