import 'dart:io';
import 'dart:typed_data';

import 'package:ninghao/proto/Student.pb.dart';

Future<void> main(List argument) async {
  var netWorkManage = NetWorkManager("127.0.0.1", 6668);
netWorkManage.init();
  Student student = Student();
  student.id = 1;
  student.name = "leo";
  netWorkManage.writeMessage(student);
}



class NetWorkManager {
  final String host;
  final int port;
  Socket socket;

  NetWorkManager(this.host, this.port);

  void init() async {
    try {
      socket = await Socket.connect(host, port, timeout: Duration(seconds: 2));
    } catch (e) {
      print("连接socket出现异常, e=${e.toString()}");
    }
    socket.listen(onData,
        onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }

  void onData(data) {
    print(data);
    print("收到数据!!!");
    Student student = Student.fromBuffer(data);
    print(student.toString());
  }

  void errorHandler(error, StackTrace trace) {
    print("捕获socket异常信息：error=$error，trace=${trace.toString()}");
    socket.close();
  }

  void doneHandler() {
    socket.destroy();
    print("socket关闭处理");
  }

  void writeMessage(Student student) {
    Uint8List byteStu = student.writeToBuffer();
    int len = byteStu.length;
    ByteData byteData = ByteData(4);
    byteData.setInt32(0, len);
    var message = byteData.buffer.asUint8List() + byteStu;
    socket.add(message);
  }
}
