import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BarCodeScanPage(),
      ),
    );
  }
}

class BarCodeScanPage extends StatefulWidget {
  BarCodeScanPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BarcodeScanPageState();
  }
}

class _BarcodeScanPageState extends State<BarCodeScanPage> {
  var _currentTime = DateTime.now().hour;
  bool? flashLight = true;
  _doBarCodeScan() async {
    var options = ScanOptions(
        autoEnableFlash: flashLight!,
        strings: {'cancel': '取消', 'flash_on': '闪光灯开/关', 'flash_off': '闪光灯开/关'});

    var result = await BarcodeScanner.scan(options: options);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude.toString());
    print(position.longitude.toString());
    ShowScanResult(result.type, result.rawContent, result.format,
        position.latitude.toString(), position.longitude.toString());
  }

  Future<bool?> ShowScanResult(
      var type, var content, var format, var latitude, var longitude) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('扫描结果'),
              content: Column(
                children: [
                  Text(type.toString()),
                  Text(content.toString()),
                  Text(format.toString()),
                  Text(latitude),
                  Text(longitude),
                ],
              ));
        });
  }

  @override
  void initState() {
    if (_currentTime >= 7 && _currentTime <= 19) {
      setState(() {
        flashLight = false;
      });
    }
    super.initState();
  }

  void dispose() {
    super.dispose();
    // _doBarCodeScan()..cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _doBarCodeScan, child: Text('开始扫描')),
      ]),
    );
  }
}
