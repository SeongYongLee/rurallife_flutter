import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/common/bottom_button.dart';
import 'package:rurallife_flutter/components/reserve/complete_dialog.dart';

class ReserveConfirm extends StatefulWidget {
  const ReserveConfirm({
    Key? key,
  }) : super(key: key);

  @override
  _ReserveConfirmState createState() => _ReserveConfirmState();
}

class _ReserveConfirmState extends State<ReserveConfirm> {
  void showCompleteDialog() {
    showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CompleteDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24.0,
            0.0,
            24.0,
            60.0,
          ),
          child: BottomButton(
            label: '예약완료',
            click: showCompleteDialog,
          ),
        ),
      ],
    );
  }
}
