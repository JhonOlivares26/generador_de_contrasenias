import 'package:flutter/material.dart';

class RoundedCheckboxWithText extends StatefulWidget {
  final String text;
  final bool initialValue;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  RoundedCheckboxWithText({
    required this.text,
    required this.initialValue,
    this.enabled = true, 
    this.onChanged,
  });

  @override
  _RoundedCheckboxWithTextState createState() =>
      _RoundedCheckboxWithTextState();
}

class _RoundedCheckboxWithTextState extends State<RoundedCheckboxWithText> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.enabled) {
          setState(() {
            _value = !_value;
            if (widget.onChanged != null) {
              widget.onChanged!(_value);
            }
          });
        }
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.enabled ? Colors.black : Colors.grey,
              ),
            ),
            child: _value
                ? Icon(
                    Icons.check,
                    size: 20.0,
                    color: widget.enabled ? Colors.black : Colors.grey,
                  )
                : Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: widget.enabled ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
          ),
          SizedBox(width: 8.0),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.enabled ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}



