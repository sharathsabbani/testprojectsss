<?php
class User
{
	var $name;
	var $dob;
	var $age;
	var $gender;
	var $mothertongue;
	var $maritialstatus;
	var $relegion;
	var $caste;
	var $subcaste;
	var $castnobar;
	var $citizenship;
	var $countrylivingin;
	var $employedin;
	var $contactnumber;
	var $mobilenumber;
	var $email;
	var $password;
	
			function set_name($new_name) {
				$this->name = $new_name;
			}
			function get_name() {
				return $this->name;
			}
	
		
}
?>
