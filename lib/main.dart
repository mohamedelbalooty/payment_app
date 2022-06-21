import 'package:flutter/material.dart';
import 'package:payment_app/src/features/payment_feature/presentation_layer/pages/register_page.dart';
import 'src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment app',
      home:  RegisterPage(),
    );
  }
}
