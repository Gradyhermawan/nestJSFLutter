import 'dart:ui'as ui;

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintPage extends StatefulWidget {
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint=BluetoothPrint.instance;
  List<BluetoothDevice> _devices=[];
  String _deviceMsg="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){initPrinter()  ;});
  }
  // Future<void> initPrinter() async {
  //   bluetoothPrint.startScan(timeout: Duration(seconds: 4));
  //
  //   if(!mounted) return;
  //   bluetoothPrint.scanResults.listen((val){
  //     print("Scan results: $val");
  //     setState(() {
  //       _devices=val;
  //     });
  //     if(_devices.isEmpty){
  //       setState(() {
  //         _deviceMsg="No Device";
  //       });
  //     }
  //   });
  // }
  Future<void> initPrinter() async {
    if (await Permission.location.request().isGranted &&
        await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted) {
      bluetoothPrint.startScan(timeout: const Duration(seconds: 4));

      if (!mounted) return;

      bluetoothPrint.scanResults.listen((val) {
        setState(() {
          _devices = val;
        });
        if (_devices.isEmpty) {
          setState(() {
            _deviceMsg = "No Device";
          });
        }
      });
    } else {
      setState(() {
        _deviceMsg = "Bluetooth or Location permission denied";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Printer"),
      ),
      body: _devices.isEmpty?Center(child: Text(_deviceMsg??''),):
          ListView.builder(
            itemCount: _devices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_devices[index].name!),
                subtitle: Text(_devices[index].address!),
                onTap: () async {
                  _startPrint(_devices[index]);
                },
              );
            },
          )
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if(device!=null && device.address !=null){
      // await bluetoothPrint.connect(device);
      Map<String, dynamic> config = Map();
      List<LineText> list=[];
       list.add(
         LineText(
           type: LineText.TYPE_TEXT,
           content: "Test",
           weight: 2,
           width: 2,
           height: 2,
           align: LineText.ALIGN_CENTER,
           linefeed: 1
         )
       );
      list.add(
        LineText(
          type: LineText.TYPE_QRCODE,
          content: "123456789012",
          size: 10,
          align: LineText.ALIGN_CENTER,
          height: 50,
          width: 2,
          linefeed: 1,
        ),
      );
      await bluetoothPrint.printReceipt(config, list);
    }
  }

  // Future<ui.Image> generateQRCode(String data) async {
  //   final qrCode = QrPainter(
  //     data: data,
  //     version: QrVersions.auto,
  //     gapless: false,
  //   );
  //
  //   final pictureRecorder = ui.PictureRecorder();
  //   final canvas = Canvas(pictureRecorder);
  //
  //   const size = 200.0; // Size of the QR code
  //   qrCode.paint(canvas, Size(size, size));
  //
  //   final picture = pictureRecorder.endRecording();
  //   final image = await picture.toImage(size.toInt(), size.toInt());
  //
  //   return image;
  // }
  //
  // Future<List<int>> convertToBytes(ui.Image image) async {
  //   final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   return byteData!.buffer.asUint8List();
  // }
  //
  // void printQRCodeToBluetooth(String data) async {
  //   // Generate the QR code
  //   ui.Image qrImage = await generateQRCode(data);
  //
  //   // Convert the image to bytes
  //   List<int> qrBytes = await convertToBytes(qrImage);
  //
  //   // Send to Bluetooth printer
  //   // printQRCode(qrBytes);
  //   List<LineText> list=[];
  //   list.add(
  //       LineText(
  //           type: LineText.,
  //           content: "Test",
  //           weight: 2,
  //           width: 2,
  //           height: 2,
  //           align: LineText.ALIGN_CENTER,
  //           linefeed: 1
  //       )
  //   );
  // }
}
