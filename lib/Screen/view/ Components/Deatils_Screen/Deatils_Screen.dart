import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/news_provider.dart';
import '../Home_Screen/Home_Screen.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    Newsprovider newsprovider = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                //: BorderRadius.only(
                //bottomRight: Radius.circular(15),
                // bottomLeft: Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                  Text(
                    'NEWS DEATLIS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  IconButton(
                      onPressed: () {
                        newsprovider.favouriteData(selectedIndex);
                      },
                      icon: Icon(
                        Icons.save_alt,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                newsprovider.newsmodal.sources[selectedIndex].name,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/157399872/photo/news.jpg?s=612x612&w=0&k=20&c=8-h3SFEI9exm7787t6dlW5q7wJFNH-Dolw-4OGCtCo4='),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '${newsprovider.newsmodal.sources[selectedIndex].description}${newsprovider.newsmodal.sources[selectedIndex].description}${newsprovider.newsmodal.sources[selectedIndex].description}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
