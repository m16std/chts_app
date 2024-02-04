import 'package:chts_app/pages/widgets/coin_page_widgets%20copy.dart';
import 'package:flutter/material.dart';

class BobrPage extends StatefulWidget {
  const BobrPage({super.key});

  @override
  State<BobrPage> createState() => _BobrPageState();
}

class _BobrPageState extends State<BobrPage> {
  String? bobrName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'BobrPage args kurwa');
    bobrName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 48),
      appBar: coinAppBar(context, bobrName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Text('Ja pierdolę, patrzcie co spotkałem. $bobrName, kurwa!'),
        ),
      ),
    );
  }
}
