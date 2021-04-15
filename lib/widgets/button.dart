import 'package:flutter/material.dart';
class DesignButton extends StatefulWidget {
  final String description;
  final Function function;
  final bool isActive;

  DesignButton({
    this.description, this.function, this.isActive
  });

  @override
  _DesignButtonState createState() => _DesignButtonState();
}

class _DesignButtonState extends State<DesignButton> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        width: deviceSize.width,
        height: 55,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 10,
            color: widget.isActive ? Theme.of(context).accentColor : Colors.grey,
            textColor: Theme.of(context).primaryColor,
            splashColor: Theme.of(context).primaryColor,
            child: Text(
              widget.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Quicksand', fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.bold, color: widget.isActive ? Theme.of(context).primaryColor : Colors.black26),
            ),
            onPressed: widget.isActive ? widget.function : () {}
        )
    );
  }
}

