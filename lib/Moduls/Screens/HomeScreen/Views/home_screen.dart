import 'package:advance_flutter_exam/Components/Colors/color.dart';
import 'package:advance_flutter_exam/Utils/Helper/api_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Country",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.FetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail_screen',
                        arguments: snapshot.data![index]);
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: primaryColor.withOpacity(0.2)),
                        image: DecorationImage(
                          image: NetworkImage(
                            snapshot.data![index].flags['png'],
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
                              snapshot.data![index].name['common'],
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
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        },
      ),
    );
  }
}
