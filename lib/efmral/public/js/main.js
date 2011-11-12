/*
  This javascript file belongs to the efmral codebase.
  Copyright (C) 2011, Ali Abbas <ali@alouche.net>

  efmral is licensed under the GNU General Public License, version 3. A copy of
  the license text can be found in the file COPYING in the source distribution.
*/

function validateNewFrm(event) {
  var new_msg = document.forms["new_handler"]["new_msg"].value;
  var default_msg_value = document.forms["new_handler"]["new_msg"].defaultValue;
  var new_key = document.forms["new_handler"]["new_key"].value;
  var default_key_value = document.forms["new_handler"]["new_key"].defaultValue;
  var white_space_count = new_key.replace(/^\s+|\s+$/g, '');
  if (new_msg == default_msg_value) {
    return false;
  }
  if (new_key != default_key_value) {
    if (white_space_count.length == 0) {
      alert("the encryption key cannot only contain spaces");
      return false;
    } else
        document.forms["new_handler"]["new_msg"].value = Tea.encrypt(new_msg,new_key);
  }
}

function decryptMessage(event) {
  var secret_msg = document.forms["secret_handler"]["secret_msg"].value;
  var secret_key = document.forms["secret_handler"]["secret_key"].value;
  document.forms["secret_handler"]["secret_msg"].value = Tea.decrypt(secret_msg,secret_key);
  return false;
}
