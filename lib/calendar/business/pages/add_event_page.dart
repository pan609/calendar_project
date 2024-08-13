import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_event_controller.dart';

class AddEventPage extends StatelessWidget {
  final String? title;

  AddEventPage({super.key, this.title});

  final controller = Get.find<AddEventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Title',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular((20)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'title',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Date',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('start time'),
                        SizedBox(height: 10,),
                        GestureDetector(
                            onTap: () {
                              controller.selectDate(context, 1);
                            },
                            child: Obx(() => Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular((8)),
                                ),
                                child: Text(controller.startDateTimeText.value)))),
                      ],
                    ),
                    const Text('———————'),
                    Column(
                      children: [
                        Text('end time'),
                        SizedBox(height: 10,),
                        GestureDetector(
                            onTap: () {
                              controller.selectDate(context, 2);
                            },
                            child: Obx(() => Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular((8)),
                                ),
                                child: Text(controller.endDateTimeText.value)))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'OverView',
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular((8)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: TextField(
                        minLines: 10,
                        maxLines: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'OverView',
                        ),
                        textAlign: TextAlign.start),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Category'),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<AddEventController>(
                    id: controller.categoryId,
                    builder: (_) {
                      return Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.start,
                        children: buildSelectCategoryWidget(context),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular((20)),
                  ),
                  width: double.infinity,
                  child: const Text(
                    'submit',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ]))
      ],
    );
  }

  List<Widget> buildSelectCategoryWidget(BuildContext context) {
    List<Widget> widgets = [];
    for (var categoryModel in controller.categoryButtonList) {
      print('buildSelectCategoryWidget');
      MaterialButton button = MaterialButton(
        onPressed: () {
          controller.selectButton(categoryModel.buttonId ?? -1);
        },
        color: categoryModel.isSelected ? Colors.pinkAccent : Colors.blueGrey,
        child: Text(categoryModel.content),
      );
      widgets.add(button);
    }
    return widgets;
  }
}
