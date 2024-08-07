import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../provider/news_provider.dart';

class Savedscreen extends StatelessWidget {
  const Savedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Newsprovider newsprovider = Provider.of(context, listen: false);
    Newsprovider newsproviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Latest News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top News',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 140,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://media.istockphoto.com/id/1336906460/photo/media-concept-multiple-television-screens.webp?b=1&s=170667a&w=0&k=20&c=EiQneLW7bamCTyLq6iuPZWckCvaMpNbcpTiHGuZhd78='),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 67,
                                  width: 230,
                                  margin: EdgeInsets.only(bottom: 7),
                                  child: Text(
                                    newsprovider
                                        .newsmodal
                                        .sources[listOfFavourite[index]]
                                        .description,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(newsprovider.newsmodal
                                    .sources[listOfFavourite[index]].name),
                                IconButton(
                                    onPressed: () {
                                      newsprovider.removeFavourite(index);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: listOfFavourite.length,
            ),
          )
        ],
      ),
    );
  }
}
