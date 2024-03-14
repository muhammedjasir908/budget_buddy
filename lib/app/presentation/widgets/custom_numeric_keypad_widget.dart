import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNumericKeypadWidget extends StatefulWidget {
  const CustomNumericKeypadWidget({super.key,
    required this.controller,
    required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<CustomNumericKeypadWidget> createState() => _CustomNumericKeypadWidgetState();
}

class _CustomNumericKeypadWidgetState extends State<CustomNumericKeypadWidget> {
  TextEditingController? _controller;
  TextSelection? _selection;
  FocusNode? focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller;
    _selection = _controller?.selection;
    focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.removeListener(_onSelectionChanged);
    super.dispose();
  }

  void _onSelectionChanged(){
    setState(() {
      _selection = _controller?.selection;
    });
    print('Cursor position: ${_selection?.base.offset}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3')
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6')
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9')
          ],
        ),
        Row(
          children: [
            _buildButton('.'),
            _buildButton('0'),
            _buildButton('<', onPressed: _backspace)
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text,{VoidCallback? onPressed}){
    return Expanded(child: TextButton(
        onPressed: onPressed /*?? () => input(text)*/, child: Text(text, style: GoogleFonts.poppins(
      fontSize:26,
      color:Colors.white,
      fontWeight:FontWeight.bold
    ),)));
  }

  void _backspace(){
    int position = _selection!.base.offset;
    final value = _controller!.text;
    if(value.isNotEmpty && position != 0){
      var suffix = value.substring(position,value.length);
      _controller!.text = value.substring(0,position -1) + suffix;
      _controller?.selection = TextSelection.fromPosition(TextPosition(
        offset: position -1));
    }
  }
}
