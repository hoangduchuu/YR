import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CommonButton extends StatefulWidget{
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double radiusValue;
  final double width;
  final Icon icon;
  final Text text;
  final double buttonPadding;
  CommonButton({Key key,@required this.onPressed,@required this.backgroundColor,@required this.textColor,@required this.buttonPadding,this.radiusValue,this.width,this.icon,this.text}):super(key:key);
  @override
  _CommonButtonState createState() => _CommonButtonState();
}
class _CommonButtonState extends State<CommonButton>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: widget.width!=null?widget.width:270,
        height: 75,
        child: Column(
          children: <Widget>[
            FlatButton(
              padding: widget.buttonPadding!=null? EdgeInsets.all(widget.buttonPadding):EdgeInsets.all(11),
              textColor: widget.textColor==null?Colors.white:widget.textColor,
              color: widget.backgroundColor==null?Color(0xFF3b5998):widget.backgroundColor,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(widget.radiusValue==null?20:widget.radiusValue)),
              onPressed: widget.onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.icon!=null?widget.icon:SizedBox.shrink(),
                  widget.icon!=null?SizedBox(width: 15,):SizedBox.shrink(),
                  widget.text==null?Text('Đăng nhập với facebook',style: TextStyle(fontSize: 15,fontFamily: 'oscinebold'),):widget.text,
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}