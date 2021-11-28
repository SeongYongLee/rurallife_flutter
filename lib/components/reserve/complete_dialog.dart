import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/state/app.dart';

class CompleteDialog extends StatefulWidget {
  const CompleteDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CompleteDialogState createState() => _CompleteDialogState();
}

class _CompleteDialogState extends State<CompleteDialog> {
  void _backToHome() async {
    Provider.of<AppStateManager>(context, listen: false).backToHome();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          width: 330,
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "신청이 완료되었습니다!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "인원",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 9),
                  Text(
                    "2명",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF67B3FA),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "2021.02.30 - 2021.02.31",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF888E93),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 130, height: 42),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFe5e8eb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '내역 보기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 130, height: 42),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFf76e22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    _backToHome();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '홈으로 가기',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
