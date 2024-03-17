import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbol_magazine/utils/api_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _showOverlay = false;
  late Future<Product?> _productFuture = ApiService().fetchProductDetails();
  Color customColor = Color(0xFF333333);
  Color customColor1 = Color(0xFFcdcbc0);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showOverlay = !_showOverlay; // Toggle overlay visibility on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            "assets/images/appbar.svg",
            width: 500,
            height: 100,
          ),
        ),
      ),

      //BODY OF THE PAGE
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PAGE1
            Container(
              color: customColor,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: _productFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final product = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          child: Image.asset("assets/images/stack.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 20, left: 22, right: 22),
                          child: Text(
                            "Treat Your Body Like Your Face",
                            style: TextStyle(
                              fontFamily: 'Clash',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Text(product.name1.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'MarisaMedium',
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.description1,
                                  style: TextStyle(
                                    fontFamily: 'Brown',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 20,
                                height: 30,
                                child: SvgPicture.asset(
                                  "assets/images/savewhite.svg",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Divider(
                                thickness: 4.0, // Adjust thickness as needed
                                color:
                                    Colors.grey, // Set desired separator color
                                height:
                                    0.0, // Adjust spacing above and below the line (optional)
                                indent:
                                    20.0, // Adjust left indentation (optional)
                                endIndent:
                                    20.0, // Adjust right indentation (optional)
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            //PAGE 2
            Container(
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: _productFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final product = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            child: Image.network(product.imageUrl),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontFamily: 'Varent',
                              color: Colors.black,
                              fontSize: 45,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.description,
                                  style: TextStyle(
                                    fontFamily: 'Brown',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 20,
                                height: 30,
                                child: SvgPicture.asset(
                                  "assets/images/saveblack.svg",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 150),
                          child: TextButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: customColor1,
                                  width: 2.0,
                                ),
                              ),
                              padding: const EdgeInsets.all(20.0),
                            ),
                            child: Row(
                              children: [
                                Text('Read More',
                                    style: TextStyle(
                                      fontFamily: 'Clash',
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )),
                                const SizedBox(width: 20.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55.0),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            //PAGE 3
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/ring.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  FutureBuilder<Product?>(
                    future: _productFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final product = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 100, bottom: 25, left: 22),
                              child: Text("Revitalize Your Body",
                                  style: TextStyle(
                                    fontFamily: 'Clash',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 0),
                              child: Text(
                                product.name.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'MarisaMedium',
                                  color: Colors.white,
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.description1,
                                      style: TextStyle(
                                        fontFamily: 'Brown',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      )),
                                  SizedBox(height: 40.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 130),
                                    child: TextButton(
                                      onPressed: null,
                                      style: TextButton.styleFrom(
                                        //backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(20.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Text('Discover More',
                                                style: TextStyle(
                                                  fontFamily: 'Clash',
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                )),
                                          ),
                                          SizedBox(width: 20.0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13.0),
                                            child: Icon(
                                              Icons.arrow_forward_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 100.0),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),

            //PAGE 4
            Container(
              child: FutureBuilder<Product?>(
                future: _productFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final product = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 22, bottom: 30),
                          child: Text("March 2024",
                              style: TextStyle(
                                fontFamily: 'Varent',
                                color: Colors.black,
                                fontSize: 40.0,
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.network(
                                    product.imageUrl1,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 50),
                                    child: Column(
                                      children: [
                                        Text(product.description3,
                                            style: TextStyle(
                                              fontFamily: 'Brown',
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            )),
                                        SizedBox(height: 30),
                                        TextButton(
                                          onPressed: null,
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.all(0.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Text('Read More',
                                                  style: TextStyle(
                                                    fontFamily: 'Clash',
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                  )),
                                              const SizedBox(width: 20.0),
                                              Icon(
                                                Icons.arrow_forward_outlined,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.network(
                                    product.imageUrl2,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 50),
                                    child: Column(
                                      children: [
                                        Text(product.name1,
                                            style: TextStyle(
                                              fontFamily: 'Brown',
                                              color: Colors.black,
                                              fontSize: 18.0,
                                            )),
                                        SizedBox(height: 30),
                                        TextButton(
                                          onPressed: null,
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.all(0.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Text('Read More',
                                                  style: TextStyle(
                                                    fontFamily: 'Clash',
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                  )),
                                              const SizedBox(width: 20.0),
                                              Icon(
                                                Icons.arrow_forward_outlined,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),

            //Page 4 END

            Divider(
              thickness: 4.0,
              color: Colors.black,
              height: 0.0,
              indent: 20.0,
              endIndent: 20.0,
            ),

            SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 50),
              child: Row(
                children: [
                  Text('All Articles',
                      style: TextStyle(
                        fontFamily: 'Clash',
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                  const SizedBox(width: 20.0),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white,
          height: 75,
          padding: EdgeInsets.only(left: 10.0, right: 10.0), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 5.0, // Adjust padding as needed
                    width: 28,
                    child: _selectedIndex == 0
                        ? Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                  bottomRight: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: SvgPicture.asset(
                        "assets/images/houselogo.svg",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5.0, // Adjust padding as needed
                    width: 28,
                    child: _selectedIndex == 1
                        ? Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                  bottomRight: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: SvgPicture.asset(
                        "assets/images/searchlogo.svg",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Handle onTap action here if needed
                    },
                    child: SizedBox(
                      height: 60,
                      child: SvgPicture.asset(
                        "assets/images/ologo.svg",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5.0, // Adjust padding as needed
                    width: 28,
                    child: _selectedIndex == 2
                        ? Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                  bottomRight: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: SvgPicture.asset(
                        "assets/images/savelogo.svg",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5.0, // Adjust padding as needed
                    width: 28,
                    child: _selectedIndex == 3
                        ? Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                  bottomRight: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: SvgPicture.asset(
                        "assets/images/peoplelogo.svg",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
