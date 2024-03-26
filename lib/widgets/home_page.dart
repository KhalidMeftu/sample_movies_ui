import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../app_archtecture/controller/carousel_provider.dart';
import '../const/app_fonts.dart';
import '../const/imdb_colors.dart';
import '../const/resources.dart';
import '../const/utils.dart';
import 'linear_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Consumer<CarouselProvider>(
        builder: (context, carouselProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await carouselProvider.loadCarouselItems(carouselProvider);
          });
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.7,
                      child: PageView.builder(
                        itemCount: carouselProvider.carouselItems.length,
                        onPageChanged: (index) {
                          carouselProvider.setCurrentIndex(index);
                        },
                        itemBuilder: (context, index) {
                          final item = carouselProvider.carouselItems[index];
                          return Stack(
                            children: [
                              ///cover image
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(item.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              /// titles
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [

                                        Flexible(
                                            child: Text(
                                          item.genre.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: AppFonts.small(
                                                  fontFamily: AppFonts.roboto)
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        )),
                                      ],
                                    ),
                                    Text(
                                      item.title.toUpperCase(),
                                      style: AppFonts.small(
                                              fontFamily: AppFonts.roboto)
                                          .copyWith(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '${item.type}. ${item.year}',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: AppFonts.small(
                                                  fontFamily: AppFonts.roboto)
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// overlay
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black87.withOpacity(0.9),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          );
                        },
                      ),
                    ),
                    /// wathc now btn
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40,
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 214.0,
                              decoration: const BoxDecoration(
                                color: ImdbColors.blueColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(25)),
                              ),
                              child: Center(
                                child: Text(
                                  ImdbStrings.watchNow,
                                  style: AppFonts.small(
                                    fontFamily: AppFonts.roboto,
                                  ).copyWith(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: ImdbColors.greyColor
                                    .withOpacity(0.65),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25)),
                              ),
                              child: const Center(
                                child: Icon(Icons.add,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /// dots
                    Positioned(
                      bottom: 1,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: carouselProvider.carouselItems.map((item) {
                          int index =
                              carouselProvider.carouselItems.indexOf(item);
                          return Container(
                            width: 11.0,
                            height: 11.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: carouselProvider.currentIndex == index
                                  ? const Color(0xffD9D9D9)
                                  : const Color(0xffD9D9D9).withOpacity(0.36),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    /// logo
                    Positioned(
                        top: 32.h,
                        left: 20.w,
                        child: Image.asset(AppResources.logo, width: 40, height:40)),
                  ],
                ),

                /// continue watching
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                    ImdbStrings.continueWatching,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

              /*  Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 247,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> items = [
                          {
                            'percentage': 0.5,
                            'imageLocation': AvetolResources.continueWatching,
                            'title': 'Movie 1'
                          },
                          {
                            'percentage': 0.75,
                            'imageLocation': AvetolResources.continueWatching,
                            'title': 'Movie 2'
                          },
                          {
                            'percentage': 0.25,
                            'imageLocation': AvetolResources.continueWatching,
                            'title': 'Movie 3'
                          },
                          {
                            'percentage': 1.0,
                            'imageLocation': AvetolResources.continueWatching,
                            'title': 'Movie 4'
                          },
                        ];

                        Map<String, dynamic> itemData = items[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageTitleDisplay(
                            showAPlus: false,
                            percentage: itemData['percentage'],
                            imageLoction: itemData['imageLocation'],
                            title: itemData['title'],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                */

                /// trending
/*
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                   AvetolStrings.trending,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 247,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> items = [
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.trending,
                            'title': 'Movie 1'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.trending,
                            'title': 'Movie 2'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.trending,
                            'title': 'Movie 3'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.trending,
                            'title': 'Movie 4'
                          },
                        ];

                        Map<String, dynamic> itemData = items[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageTitleDisplay(
                            showAPlus: true,
                            percentage: itemData['percentage'],
                            imageLoction: itemData['imageLocation'],
                            title: itemData['title'],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// avetol originals
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Image.asset(AvetolResources.logoSmall),
                ),
*/
          /*
                /// orginals text
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                    AvetolStrings.originals,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                /// orginals show
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 380,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carouselProvider.carouselItems.length,
                      itemBuilder: (context, index) {
                        final item = carouselProvider.carouselItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ///cover image
                              Container(
                                width: 255,
                                height: 376,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                  image: DecorationImage(
                                    image: AssetImage(item.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              /// titles
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.genre.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: AppFonts.small(
                                              fontFamily: AppFonts.roboto)
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                    ),
                                    Text(
                                      item.title.toUpperCase(),
                                      style: AppFonts.small(
                                              fontFamily: AppFonts.roboto)
                                          .copyWith(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                    ),
                                    Text(
                                      '${item.type}. ${item.year}',
                                      maxLines: 2,
                                      style: AppFonts.small(
                                              fontFamily: AppFonts.roboto)
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// ads
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AvetolResources.ads),
                ),

                /// avetol shows
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                    AvetolStrings.avetolShows,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
*/
          /*
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 247,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> items = [
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.avShows,
                            'title': '#Time With Danayit'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.avShows,
                            'title': 'Dereb Show'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.avShows,
                            'title': 'Dereb Show'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.avShows,
                            'title': '#Time With Danayit'
                          },
                        ];

                        Map<String, dynamic> itemData = items[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageTitleDisplay(
                            showAPlus: false,
                            percentage: itemData['percentage'],
                            imageLoction: itemData['imageLocation'],
                            title: itemData['title'],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// live channels

                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AvetolStrings.avetolTvShows,
                        textAlign: TextAlign.left,
                        style: AppFonts.small(fontFamily: AppFonts.roboto)
                            .copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                      Image.asset(AvetolResources.arrow)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 234,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> items = [
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.ebs,
                            'title': ''
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.ebs,
                            'title': ''
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.ebs,
                            'title': ''
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.ebs,
                            'title': ''
                          },
                        ];

                        Map<String, dynamic> itemData = items[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageTitleDisplay(
                            showAPlus: false,
                            percentage: itemData['percentage'],
                            imageLoction: itemData['imageLocation'],
                            title: itemData['title'],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// exculisive

                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                   AvetolStrings.exclusives,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 247,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> items = [
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.exclusive,
                            'title': 'Weraj'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.exclusive,
                            'title': 'Weraaj'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.exclusive,
                            'title': 'Ere Weraj'
                          },
                          {
                            'percentage': null,
                            'imageLocation': AvetolResources.exclusive,
                            'title': 'Ende Weraj'
                          },
                        ];

                        Map<String, dynamic> itemData = items[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImageTitleDisplay(
                            showAPlus: false,
                            percentage: itemData['percentage'],
                            imageLoction: itemData['imageLocation'],
                            title: itemData['title'],
                          ),
                        );
                      },
                    ),
                  ),
                ),
*/
                /// categories

                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Text(
                    ImdbStrings.categories,
                    textAlign: TextAlign.left,
                    style: AppFonts.small(fontFamily: AppFonts.roboto).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: SizedBox(
                    height: 172.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return GradientContainerWithColumn(
                          columnChildren: [
                            Image.asset(AppResources.logo, width: 50, height:50,),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                titles[index],
                                textAlign: TextAlign.left,
                                style: AppFonts.small(fontFamily: AppFonts.roboto)
                                    .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context, provider, _) {
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black87,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black87,
              currentIndex: provider.currentIndex,
              selectedItemColor: ImdbColors.blueColor,
              unselectedItemColor: Colors.white,
              onTap: provider.updateIndex,
              items:  [
                BottomNavigationBarItem(
                  icon: Image.asset(AppResources.bottomHome),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppResources.bottomBrowse),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppResources.bottomLiveTv),
                  label: 'Live TV',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.verified_user),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}
