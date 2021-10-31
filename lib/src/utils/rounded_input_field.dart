import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final Function(String) textValidate;
  final int maxLine;

  // final FocusNode focusNode;
  final bool readOnly;
  final bool obscureText;
  final VoidCallback onTextTap;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    required this.textValidate,
    this.maxLine = 1,
    // this.focusNode = FocusNode(),
    this.readOnly = false,
    this.obscureText = false,
    required this.onTextTap,
    // this.focusNode,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  // bool focused = focusNode != null && focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        // TextFieldContainer(
        //   child:

        Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // width: double.maxFinite,
      width: size.width * 0.8,
      child: TextFormField(
        obscureText: widget.obscureText,
        // focusNode: widget.focusNode,
        onTap: (widget.onTextTap == null) ? () {} : widget.onTextTap,
        decoration: new InputDecoration(
          // icon: Icon(
          //   widget.icon,
          //   color: (valid) ? kPrimaryColor : Colors.red,
          // ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          labelText: null,
          // labelStyle: TextStyle(color: Colors.black, fontSize: 15),
          // errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          // fillColor: Colors.black,
          hintStyle: TextStyle(color: Theme.of(context).canvasColor),
          fillColor: Theme.of(context).primaryColor,
          prefixIcon: Icon(
            widget.icon,
            color: Theme.of(context).selectedRowColor,
          ),
          filled: true,
          // borderRadius: BorderRadius.circular(29),

          //fillColor: Colors.green
        ),
        validator: widget.textValidate(widget.textEditingController.text),
        keyboardType: widget.keyboardType,
        controller: widget.textEditingController,
        onChanged: widget.onChanged,
        cursorColor: Theme.of(context).selectedRowColor,
        maxLines: widget.maxLine,
        readOnly: widget.readOnly,

        // decoration: InputDecoration(
        //   icon: Icon(
        //     widget.icon,
        //     color: (valid) ? kPrimaryColor : Colors.red,
        //   ),
        //   hintText: widget.hintText,
        //   border: InputBorder.none,
        // ),
        // ),
      ),
    );
  }
}
