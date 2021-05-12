import 'package:flutter/material.dart';

///自定义Dialog
// ignore: must_be_immutable
class CustomDialog extends StatefulWidget {

  //------------------不带图片的dialog------------------------
  late String title; //弹窗标题
  late String content; //弹窗内容
  late String confirmContent; //按钮文本
  late Color confirmTextColor; //确定按钮文本颜色
  late bool isCancel; //是否有取消按钮，默认为true true：有 false：没有
  late Color confirmColor; //确定按钮颜色
  late Color cancelColor; //取消按钮颜色
  late bool outsideDismiss; //点击弹窗外部，关闭弹窗，默认为true true：可以关闭 false：不可以关闭
  late Function confirmCallback; //点击确定按钮回调
  late Function dismissCallback; //弹窗关闭回调

  //------------------带图片的dialog------------------------
  late String image;//dialog添加图片
  late String imageHintText; //图片下方的文本提示

  CustomDialog({Key? key, this.title = "", this.content = "", this.confirmContent = "", 
      this.isCancel = true, this.outsideDismiss = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomDialogState();
  }

}

class _CustomDialogState extends State<CustomDialog> {

  _confirmDialog() {
    _dismissDialog();
    // ignore: unnecessary_null_comparison
    if (widget.confirmCallback != null) {
      widget.confirmCallback();
    }
  }

  _dismissDialog() {
    // ignore: unnecessary_null_comparison
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _columnText = Column(
      children: <Widget>[
        SizedBox(
            // ignore: unnecessary_null_comparison
            height: widget.title == null ? 0 : 16.0
        ),
        Text(
            // ignore: unnecessary_null_comparison
            widget.title == null ? '' : widget.title,
            style: TextStyle(fontSize: 16.0)
        ),
        Expanded(
            child: Center(
              child: Text(
                  // ignore: unnecessary_null_comparison
                  widget.content == null ? '' : widget.content,
                  style: TextStyle(fontSize: 14.0)
              ),
            ),
            flex: 1
        ),
        SizedBox(
            height: 1.0,
            child: Container(color: Color(0xDBDBDBDB))
        ),
        Container(
            height: 45,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: widget.isCancel ? Container(
                      decoration: BoxDecoration(
                          color: widget.cancelColor == null ? Color(0xFFFFFFFF) : widget.cancelColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        child: Text(
                            '取消',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: widget.cancelColor == null ? Colors.black87 : Color(0xFFFFFFFF),
                            )
                        ),
                        onPressed: _dismissDialog,
                        splashColor: widget.cancelColor == null ? Color(0xFFFFFFFF) : widget.cancelColor,
                        highlightColor: widget.cancelColor == null ? Color(0xFFFFFFFF) : widget.cancelColor,
                      ),
                    ) : Text(''),
                    flex: widget.isCancel ? 1 : 0
                ),
                SizedBox(width: widget.isCancel ? 1.0 : 0,child: Container(color: Color(0xDBDBDBDB))),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.confirmColor == null ? Color(0xFFFFFFFF) : widget.confirmColor,
                          borderRadius: widget.isCancel ? BorderRadius.only(bottomRight: Radius.circular(12.0)) : BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0))
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: _confirmDialog,
                        child: Text(
                            widget.confirmContent == null ? '确定' : widget.confirmContent,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: widget.confirmColor == null ? (widget.confirmTextColor == null ? Colors.black87 : widget.confirmTextColor) : Color(0xFFFFFFFF),
                            )
                        ),
                        splashColor: widget.confirmColor == null ? Color(0xFFFFFFFF) : widget.confirmColor,
                        highlightColor: widget.confirmColor == null ? Color(0xFFFFFFFF) : widget.confirmColor,
                      ),
                    ),
                    flex: 1
                ),
              ],
            )
        )
      ],
    );

    Column _columnImage = Column(
      children: <Widget>[
        SizedBox(
          // ignore: unnecessary_null_comparison
          height: widget.imageHintText == null ? 35.0 : 23.0,
        ),
        Image(
          // ignore: unnecessary_null_comparison
          image: AssetImage(widget.image == null ? '' : widget.image),
          width: 72.0,
          height: 72.0
        ),
        SizedBox(
            height: 10.0
        ),
        Text(
            // ignore: unnecessary_null_comparison
            widget.imageHintText == null ? "" : widget.imageHintText,
            style: TextStyle(fontSize: 16.0)
        ),
      ],
    );


    return WillPopScope(
      child: GestureDetector(
        onTap: () => {
        widget.outsideDismiss ? _dismissDialog() : null
        },
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              // ignore: unnecessary_null_comparison
              width: widget.image == null ? width - 100.0 : width - 150.0,
              height: 150.0,
              alignment: Alignment.center,
              // ignore: unnecessary_null_comparison
              child: widget.image == null ? _columnText : _columnImage,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12.0)
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return widget.outsideDismiss;
      }
    );
  }
}