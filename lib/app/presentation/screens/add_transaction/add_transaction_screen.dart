import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    amountController.dispose();
    super.dispose();
  }

  // void _onFocusChanged(){
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add Transaction', style: GoogleFonts.poppins(
            fontSize:16,
            color:Colors.white,
            fontWeight:FontWeight.bold
        ),),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded, size: 25,color: Colors.white,)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              controller: amountController,
              keyboardType: TextInputType.none,
              textAlign: TextAlign.center,
              autofocus: true,
              showCursor: true,
              style: GoogleFonts.poppins(
                  fontSize:20,
                  color:Colors.white,
                  fontWeight:FontWeight.bold
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Colors.white
                  ),
                ),
                hintText: 'Amount',
                hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const Spacer(),
          _keypad(context),
        ],
      ),
    );
  }

  Widget _keypad(BuildContext context){
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
        onPressed: onPressed ?? () => input(text), child: Text(text, style: GoogleFonts.poppins(
        fontSize:26,
        color:Colors.white,
        fontWeight:FontWeight.bold
    ),)));
  }

  void input(String myText){
    final text = amountController.text;
    final textSelection = amountController.selection;
    final newText = text.replaceRange(textSelection.start, textSelection.end, myText);
    final myTextLength = myText.length;
    amountController.text = newText;
    amountController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace(){
    final text = amountController.text;
    final textSelection = amountController.selection;
    final selectionLength = textSelection.end - textSelection.start;
    if(selectionLength > 0){
      final newText = text.replaceRange(textSelection.start, textSelection.end, '');
      amountController.text = newText;
      amountController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start
      );
      return;
    }
    if(textSelection.start == 0){
      return;
    }
    final previousCodeUnit = text.codeUnitAt(textSelection.start -1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2: 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(newStart, newEnd, '');
    amountController.text = newText;
    amountController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value){
    return value & 0xF800 == 0xD800;
  }
}
