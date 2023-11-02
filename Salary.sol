// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Salary {
function gross_salary(uint256 basic_salary) public view returns (uint256) {
if(basic_salary<=10000)
{
uint256 hra = basic_salary * 20/100;
uint256 da = basic_salary * 80/100;
uint256 gross_salary_total = basic_salary + hra + da;
return gross_salary_total;
}
else if((basic_salary>=10001) && (basic_salary<=20000))
{
uint256 hra = basic_salary * 25/100;
uint256 da = basic_salary * 90/100;
uint256 gross_salary_total = basic_salary + hra + da;
return gross_salary_total;
}
else if(basic_salary>=20001)
{
uint256 hra = basic_salary * 30/100;
uint256 da = basic_salary * 95/100;
uint256 gross_salary_total = basic_salary + hra + da;
return gross_salary_total;
}
}
}
