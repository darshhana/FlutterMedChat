import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/gridbookappointment1_item_widget.dart';
import 'widgets/sliderview_item_widget.dart';

class AndroidSmallSevenScreen extends StatelessWidget {
  AndroidSmallSevenScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();
  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildSearchSection(context),
                  SizedBox(height: 14.h),
                  _buildMainContent(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      ),
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWhatsappImage202330612,
            height: 40.h,
            width: 40.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            margin: EdgeInsets.only(top: 16.h),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: CustomSearchView(
              controller: searchController,
              hintText: "Search Anything...",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 10.h,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          SizedBox(
            height: 190.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 190.h,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      sliderIndex = index;
                    },
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index, realIndex) {
                    return SliderviewItemWidget();
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 14.h),
                    child: AnimatedSmoothIndicator(
                      activeIndex: sliderIndex,
                      count: 1,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                        spacing: 6.22,
                        activeDotColor:
                            theme.colorScheme.onPrimary.withOpacity(1),
                        dotColor: appTheme.indigo200,
                        activeDotScale: 1.333333333,
                        dotHeight: 6.h,
                        dotWidth: 6.h,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  height: 12.h,
                  width: 12.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 1.h,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant
                            .imgAppmintLogo, // Temporarily using PNG instead of SVG
                        height: 6.h,
                        width: 8.h,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 152.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Featured Services",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: 68.h,
                        child: Divider(
                          color: appTheme.green300,
                          endIndent: 2.h,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12.h),
          ResponsiveGridListBuilder(
            minItemWidth: 1,
            minItemsPerRow: 3,
            maxItemsPerRow: 3,
            horizontalGridSpacing: 26.h,
            verticalGridSpacing: 26.h,
            builder: (context, items) => ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              children: items,
            ),
            gridItems: List.generate(
              10,
              (index) {
                return Gridbookappointment1ItemWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
