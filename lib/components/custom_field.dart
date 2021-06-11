import "package:flutter/material.dart";

class CustomField extends StatelessWidget {
  final Function(String value) onValue;
  CustomField({this.onValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Enter City Name",
          icon: Icon(
            Icons.location_city,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        onChanged: onValue,
      ),
    );
  }
}
