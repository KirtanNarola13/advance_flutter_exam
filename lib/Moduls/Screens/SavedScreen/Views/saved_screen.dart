import 'package:advance_flutter_exam/Components/Lists/all_list.dart';
import 'package:flutter/material.dart';

import '../../../../Components/Colors/color.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Country",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: favData
            .map(
              (e) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail_screen',
                          arguments: e.data![index]);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: primaryColor.withOpacity(0.2)),
                          image: DecorationImage(
                            image: NetworkImage(
                              e.data![index].flags['png'],
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.5,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e.data![index].name['common'],
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
