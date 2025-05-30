class Validation{

  //-----------------------Name validation---------------------------
  String? validateName(String? name) {
    if(name == null || name.trim().isEmpty){
      return "Name is required";
    }
    else if(name.trim().length < 3){
      return "Name must be at last 3 characters";
    }
    else if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)){
      return "Name can only contain letters";
    }
    return null;
  }


  //--------------------------Validate Email-------------
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
//-----------------------------Validate password--------------
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$').hasMatch(value)) {
      return 'Password must contain upper, lower, and number';
    }
    return null;
  }



}