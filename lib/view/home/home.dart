import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_colors.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/data.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/view/home/widget/appBar.dart';
import 'package:real_estate/view/home/widget/filter_chip.dart';
import 'package:real_estate/view/home/widget/gradient.dart';
import 'package:real_estate/view/home/widget/locationSearch.dart';
import 'package:real_estate/view/home/widget/location_Pick_sheet.dart';
import 'package:real_estate/view/home/widget/navBar.dart';
import 'package:real_estate/view/home/widget/propertyList.dart';
import 'package:real_estate/view/home/widget/sort_option_sheet.dart';

// Updated HomeView with bottom navigation
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedFilterIndex = 0;
  int currentNavIndex = 0; // Add this for bottom nav
  String searchQuery = '';
  String selectedLocation = 'New Jersey 45463';
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWidget(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBarWidget(),
              10.vSpace,
              LocationSearchWidget(
                selectedLocation: selectedLocation,
                onLocationTap: _showLocationPicker,
                onSearchChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    isSearchActive = value.isNotEmpty;
                  });
                },
                onSortTap: _showSortOptions,
              ),
              24.vSpace,
              FilterChipsWidget(
                selectedIndex: selectedFilterIndex,
                onFilterChanged: (index) {
                  setState(() {
                    selectedFilterIndex = index;
                  });
                },
              ),
              20.vSpace,
              Expanded(
                child: PropertyListWidget(
                  properties: _getFilteredProperties(),
                  onFavoriteToggle: (property) {
                    setState(() {
                      property.isFavorite = !property.isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomBottomNavBar(
        currentIndex: currentNavIndex,
        onTap: (index) {
          setState(() {
            currentNavIndex = index;
          });
          _handleNavigation(index);
        },
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        // Home - already here
        break;
      case 1:
        // Calendar/Schedule
        // Navigate to calendar page
        break;
      case 2:
        // Add/Create new property
        // Navigate to add property page or show modal
        _showAddPropertyModal();
        break;
      case 3:
        // Bookmarks/Saved
        // Navigate to saved properties page
        break;
      case 4:
        // Profile
        // Navigate to profile page
        break;
    }
  }

  void _showAddPropertyModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Property',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.vSpace,
              // Add your property creation form here
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Handle property creation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Create Property',
                  style: AppTypography.bodyLarge.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Your existing methods remain the same
  List<PropertyModel> _getFilteredProperties() {
    List<PropertyModel> filtered = List.from(properties);

    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((property) {
        return property.title
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            property.location.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    if (selectedFilterIndex > 0) {
      String filterType = '';
      switch (selectedFilterIndex) {
        case 1:
          filterType = 'House';
          break;
        case 4:
          filterType = 'Apartment';
          break;
        case 5:
          filterType = 'Villa';
          break;
        case 2:
          filtered = filtered.where((p) => p.isForSale).toList();
          return filtered;
        case 3:
          filtered.sort((a, b) {
            int priceA = int.parse(a.price.replaceAll(RegExp(r'[^\d]'), ''));
            int priceB = int.parse(b.price.replaceAll(RegExp(r'[^\d]'), ''));
            return priceB.compareTo(priceA);
          });
          return filtered.take(2).toList();
      }

      if (filterType.isNotEmpty) {
        filtered = filtered
            .where((property) => property.propertyType == filterType)
            .toList();
      }
    }

    return filtered;
  }

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return LocationPickerModal(
          selectedLocation: selectedLocation,
          onLocationSelected: (location) {
            setState(() {
              selectedLocation = location;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SortOptionsModal(),
    );
  }
}
