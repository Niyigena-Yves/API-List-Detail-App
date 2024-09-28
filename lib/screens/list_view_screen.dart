import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';
import 'detail_view_screen.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Item>>(
        future: ApiService().fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          } else {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text('Users Profiles'),
                  floating: true,
                  snap: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      Item item = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(item.thumbnailUrl),
                            radius: 30,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailViewScreen(item: item),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}