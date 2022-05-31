import 'package:lora_location/widgets/amap_gridview.dart';
import 'package:flutter/material.dart';

class AMapRadioGroup<T> extends StatefulWidget {
  final String groupLabel;
  final T groupValue;
  final Map<String, T> radioValueMap;
  final ValueChanged<T> onChanged;
  AMapRadioGroup(
      {Key? key,
      required this.groupLabel,
      required this.groupValue,
      required this.radioValueMap,
      required this.onChanged})
      : super(key: key);

  @override
  _AMapRadioGroupState createState() => _AMapRadioGroupState();
}

class _AMapRadioGroupState extends State<AMapRadioGroup> {
  dynamic _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.groupValue ?? null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> radioList = [];
    _groupValue = widget.groupValue ?? null;
    Widget _myRadio(String label, dynamic radioValue) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          Radio<dynamic>(
            value: radioValue,
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value;
              });
              widget.onChanged(value);
            },
          ),
        ],
      );
    }

    widget.radioValueMap.forEach((key, value) {
      radioList.add(_myRadio(key, value));
    });
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.groupLabel,
                  style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: AMapGradView(
              key: Key('1'),
              childrenWidgets: radioList,
              childAspectRatio: 2,
              crossAxisCount: 4
            ),
          ),
        ],
      ),
    );
  }
}
