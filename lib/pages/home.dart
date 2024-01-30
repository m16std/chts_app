import 'package:chts_app/pages/bobr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invert_colors/invert_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        appBar: appBar(context),
        body: homeBody());
  }

  Column homeBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //searchField(),
      //const SizedBox(height: 20,),
      listField()
    ]);
  }

  Container listField() {
    return Container(
        height: 690,
        child: ListView.separated(
            itemCount: 20,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              const bobrName = 'Samuel';
              return ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                leading: Image.asset(
                  "assets/images/bobr.jpg",
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  '$bobrName kurwa',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'bydle jebane',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/bobr', arguments: bobrName);
                },
              );
            }));
  }

  AppBar appBar(context) {
    return AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        title: Text(
          'ej kurwa bober',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.arrow_back_ios)),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 37,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: const Icon(Icons.more_horiz)),
          ),
        ]);
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor:
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Ja pierdolę',
            hintStyle:
                const TextStyle(color: Color.fromARGB(220, 255, 255, 255)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
              ),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/icons/Filter.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
