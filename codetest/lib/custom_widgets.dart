import 'package:flutter/material.dart';


class QuStoreFormeField extends StatelessWidget {
  
  final void Function(String) onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;
  bool obscureText;
  
 QuStoreFormeField({ Key? key, required this.onChanged, required this.textInputAction, required this.validator, required this.labelText, required this.prefixIcon, required this.suffixIcon, this.obscureText = false }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onChanged: onChanged,
      textInputAction: textInputAction,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        focusColor: Colors.black,
        
        // labelText: labelText,
      
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
      ),

    );
  }
}

class QuStorePasswordField extends StatelessWidget {
  
  final void Function(String) onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String labelText;
  final Icon prefixIcon;
  final IconButton suffixIcon;
  bool obscureText;
  
 QuStorePasswordField({ Key? key, required this.onChanged, required this.textInputAction, required this.validator, required this.labelText, required this.prefixIcon, required this.suffixIcon, this.obscureText = false }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onChanged: onChanged,
      textInputAction: textInputAction,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        focusColor: Colors.black,
        
        // labelText: labelText,
      
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
      ),

    );
  }
}

class QuStoreElevatedButton extends StatelessWidget {
  const QuStoreElevatedButton({ Key? key, required this.onPressed, required this.title, required this.icon }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffA95EF9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Row(
                              children:  [
                                const Spacer(),
                                Text(title),
                                const Spacer(),
                                Icon(icon)
                              ],
                            ));
  }
}