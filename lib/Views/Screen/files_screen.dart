import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superteachers/Constants/app_color.dart';
import 'package:superteachers/Constants/app_text_style.dart';
import 'package:superteachers/Views/Widgets/layouts/appbar.dart';
import 'package:superteachers/Views/Widgets/layouts/appdrawar.dart';

import '../../Controllers/TabsController.dart';
import 'shimmer/subject_shimmer.dart';

class FilesScreen extends StatelessWidget {
  FilesScreen({super.key});
  final TabsController _tabx = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppAppBar(),
        drawer: AppDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabx.controller,
                          tabs: [
                            Tab(
                                child: Text(
                              'worksheets'.tr,
                              style: AppTextStyle.medium
                                  .copyWith(color: AppColors.primary),
                            )),
                            Tab(
                                child: Text(
                              'certificates'.tr,
                              style: AppTextStyle.medium
                                  .copyWith(color: AppColors.primary),
                            )),
                          ],
                          onTap: (index) {
                            //  _tabx.changeTab(index);
                          },
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: TabBarView(
                            controller: _tabx.controller,
                            children: _tabx.myTabs.map((Tab tab) {
                              final String label = tab.text!;
                              return label == "LEFT"
                                  ?  GetBuilder<TabsController>(
                                          builder: (controller) => _tabx.isLoading.value
                                      ? SubjectShimmer()
                                      : 
                                              GridView.count(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                childAspectRatio:
                                                    (itemWidth / itemHeight),
                                                children: List.generate(
                                                    _tabx.worksheets.length,
                                                    (index) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: Image.network(
                                                        fit: BoxFit.fill,
                                                        _tabx.worksheets[index]
                                                            .logo),
                                                  );
                                                }),
                                              ))
                                  : GetBuilder<TabsController>(
                                      builder: (controller) => GridView.count(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            childAspectRatio:
                                                (itemWidth / itemHeight),
                                            children: List.generate(
                                                _tabx.certificates.length,
                                                (index) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: Image.network(
                                                    fit: BoxFit.fill,
                                                    _tabx.certificates[index]
                                                        .file),
                                              );
                                            }),
                                          ));
                            }).toList(),
                          ),
                        )
                      ],
                    )))));
  }
}
