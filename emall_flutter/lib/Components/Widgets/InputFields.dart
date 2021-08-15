import 'package:emall_proj/Components/CallBacks/Callbacks.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String? hint;
  final bool? obsecure ;
  final TextInputType? textInputType;
  final bool _validate = true;
  final BoolCallback? boolCallback;

  InputField(
      {required this.label,
      this.hint,
      this.obsecure,
      this.textInputType,
      this.boolCallback});

  @override
  _InputFieldState createState() => _InputFieldState();

  static _InputFieldState? of(BuildContext context) =>
      context.findAncestorStateOfType<_InputFieldState>();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                widget.label,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: 400,
              color: Colors.blue[50],
              child: TextField(
                onChanged: (str) => (str.length > 0)
                    ? widget.boolCallback!(true)
                    : widget.boolCallback!(false),
                keyboardType: (widget.textInputType != null)
                    ? widget.textInputType
                    : TextInputType.text,
                obscureText:
                    (widget.obsecure != null && widget.obsecure == true)
                        ? true
                        : false,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  errorText: widget._validate ? null : 'Value Can\'t Be Empty',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: (widget.hint != null) ? widget.hint : "",
                  fillColor: Colors.blue[50],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
