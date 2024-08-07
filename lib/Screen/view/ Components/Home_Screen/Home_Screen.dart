import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/news_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newsprovider newsprovider = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          title: Text(
            "News App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Text("Ekta trivedi")),
              ListTile(
                title: Text(
                  "Deatils",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/detail");
                },
              ),
              ListTile(
                title: Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/save");
                },
              ),
              ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: newsprovider.fromJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => Container(
                          height: 280,
                          width: 350,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1P2nawx83rCr-UYTirrdqp1q5MOifxB8IaIhQgZ8RFwK21Ya99e3VmWRQF7bNJV3A9ts&usqp=CAU'),
                                fit: BoxFit.cover,
                                opacity: 0.60),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${newsprovider.newsmodal.sources[index].description}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    margin: EdgeInsets.only(bottom: 5, top: 9),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://img.freepik.com/premium-photo/news-anchor-tv-studio-beautiful-girl-reading-news-ai-generated_569725-609.jpg'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '${newsprovider.newsmodal.sources[index].name}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
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
                        onTap: () {
                          selectedIndex = index;
                          Navigator.of(context).pushNamed('/detail');
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 140,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://media.istockphoto.com/id/157399872/photo/news.jpg?s=612x612&w=0&k=20&c=8-h3SFEI9exm7787t6dlW5q7wJFNH-Dolw-4OGCtCo4='),
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
                                          .newsmodal.sources[index].description,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(newsprovider
                                      .newsmodal.sources[index].name),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: newsprovider.newsmodal.sources.length,
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

int selectedIndex = 0;
