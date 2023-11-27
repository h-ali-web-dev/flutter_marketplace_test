import 'package:flutter/material.dart';
import 'package:flutter_marketplace_test/common/my_drawer.dart';
import 'package:flutter_marketplace_test/constants.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:flutter_marketplace_test/state.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final StateController controller = Get.put(StateController());
    var navIndex = 0.obs;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: myNewDrawer(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navIndex.value,
          onDestinationSelected: (i) => navIndex.value = i,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
              enabled: false,
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              enabled: false,
              icon: Icon(Icons.shopping_cart_checkout),
              label: 'Orders',
            ),
            NavigationDestination(
              enabled: false,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: 60,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.recommend), Text("Recommended")],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.shopping_bag), Text("Sale")],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('/settings');
                  },
                  icon: Icon(Icons.settings_applications_sharp),
                ),
              ],
              title: SearchBar(
                onTap: () {
                  Get.toNamed('/search');
                },
                constraints: BoxConstraints(minHeight: 40),
                hintText: "Search Here...",
                elevation: MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStatePropertyAll(Colors.grey.withAlpha(100)),
              ),
              floating: true,
              stretch: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Colors.purple.shade900,
                        Colors.purple.shade500,
                        Colors.purple.shade400,
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ),
              ),
              expandedHeight: 0,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: 650,
                  width: context.width,
                  child: TabBarView(
                    children: [
                      CustomScrollView(
                        shrinkWrap: true,
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Featured Catalog",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: fetchItems(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return SliverList.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    var item = snapshot.data;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            '/details/${item[index].id}',
                                          );
                                        },
                                        child: Card(
                                          color:
                                              Colors.indigo[100]?.withAlpha(20),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  '$pocketbaseUrl/api/files/${item![index].collectionId}/${item[index].id}/${item[index].data['image']}',
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                              Expanded(
                                                child: ListTile(
                                                  title: Text(
                                                    item[index].data['title'],
                                                  ),
                                                  subtitle: Text(
                                                    '\$ ${item[index].data['price']}',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              return SliverToBoxAdapter(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ],
                      ),
                      CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Sales",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SliverConstrainedCrossAxis(
                            maxExtent: 500,
                            sliver: FutureBuilder(
                              future: fetchSales(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      var item = snapshot.data;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0,
                                        ),
                                        child: GestureDetector(
                                          // onTap: () {
                                          //   Get.toNamed('/details/${item[index].id}');
                                          // },
                                          child: Card(
                                            color: Colors.indigo[100]
                                                ?.withAlpha(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '$pocketbaseUrl/api/files/${item![index].collectionId}/${item[index].id}/${item[index].data['image']}',
                                                    height: 150,
                                                    // width: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                FittedBox(
                                                  child: Text(
                                                    item[index].data['message'],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return SliverToBoxAdapter(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Recommended For You",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            FutureBuilder(
              future: fetchItems(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data;
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/details/${item[index].id}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          child: GridTile(
                            header: item?[index].data['sale'] == 0
                                ? null
                                : GridTileBar(
                                    leading: Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    title: Text(
                                      "Sale",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                            footer: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                ),
                                color: Colors.grey.withAlpha(150),
                              ),
                              height: 40,
                              child: GridTileBar(
                                title: Text(
                                  item?[index].data['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "\$ ${item?[index].data['price'].toString()}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '$pocketbaseUrl/api/files/${item![index].collectionId}/${item[index].id}/${item[index].data['image']}',
                                // height: 150,
                                // width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
