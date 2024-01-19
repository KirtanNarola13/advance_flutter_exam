import 'package:advance_flutter_exam/Components/Colors/color.dart';
import 'package:advance_flutter_exam/Moduls/Model/ApiModel/api_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    final data = ModalRoute.of(context)?.settings.arguments as ApiModel?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data?.name['common'],
          style: const TextStyle(
            fontSize: 22,
            letterSpacing: 5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        data!.flags['png'],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: h * 0.4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: primaryColor, spreadRadius: 2, blurRadius: 30),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Common Name Of Country",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  data!.name['common'] + data.flag,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: primaryColor.withOpacity(0.2),
                ),
                const Text(
                  "Official Name Of Country",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  data!.name['official'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: primaryColor.withOpacity(0.2),
                ),
                const Text(
                  "Region",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  data!.region,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: primaryColor.withOpacity(0.2),
                ),
                const Text(
                  "Start Of Week",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  data!.startOfWeek,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
