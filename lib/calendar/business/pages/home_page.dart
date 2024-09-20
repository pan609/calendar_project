import 'package:calendar_project/calendar/business/controllers/home_controller.dart';
import 'package:calendar_project/calendar/business/models/event_item_model.dart';
import 'package:calendar_project/calendar/business/models/event_list_model.dart';
import 'package:flutter/material.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  final String? title;

  HomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<EventListModel>(
        builder: (context, model, child) {
          return _buildBody(context, model);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, EventListModel model) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 9, right: 16, bottom: 36),
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green], // 渐变的颜色
              begin: Alignment.topCenter, // 渐变开始位置
              end: Alignment.bottomCenter, // 渐变结束位置
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'here is your task',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleProgressBar(
                          strokeWidth: 12,
                          foregroundColor: Colors.pinkAccent,
                          backgroundColor: Colors.white,
                          value: 0.7,
                          animationDuration: const Duration(seconds: 0),
                          child: Center(
                            child: Text(
                              '${model.items.where((element) => element.state == FinishState.todo).length}',
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                            ),
                          ),
                        )),
                    const SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleProgressBar(
                          strokeWidth: 12,
                          foregroundColor: Colors.pinkAccent,
                          backgroundColor: Colors.white,
                          value: 0.7,
                          animationDuration: Duration(seconds: 0),
                          child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                            ),
                          ),
                        )),
                    const SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleProgressBar(
                          strokeWidth: 12,
                          foregroundColor: Colors.pinkAccent,
                          backgroundColor: Colors.white,
                          value: 0.7,
                          animationDuration: Duration(seconds: 0),
                          child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 9, right: 16, bottom: 36),
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green], // 渐变的颜色
                      begin: Alignment.topCenter, // 渐变开始位置
                      end: Alignment.bottomCenter, // 渐变结束位置
                    ),
                  ),
                  child: const Text(textAlign: TextAlign.center, 'todo'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green], // 渐变的颜色
                      begin: Alignment.topCenter, // 渐变开始位置
                      end: Alignment.bottomCenter, // 渐变结束位置
                    ),
                  ),
                  child: const Text(textAlign: TextAlign.center, 'pedding'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green], // 渐变的颜色
                      begin: Alignment.topCenter, // 渐变开始位置
                      end: Alignment.bottomCenter, // 渐变结束位置
                    ),
                  ),
                  child: const Text(textAlign: TextAlign.center, 'completed'),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: Get.width,
              height: 200,
              child: ListView.builder(
                controller: controller.scrollController,
                scrollDirection: Axis.horizontal, // 设置滚动方向为水平
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: GestureDetector(
                        onLongPress: () {
                          // todo test
                          model.addItem(EventItemModel(id: model.items.length, state: FinishState.todo));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
                          width: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.green], // 渐变的颜色
                              begin: Alignment.topCenter, // 渐变开始位置
                              end: Alignment.bottomCenter, // 渐变结束位置
                            ),
                          ),
                          child: const Text(
                            'test3test3test3test3test3test3test3test3test3test3',
                            maxLines: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildIndicator(),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.currentIndex.value == index ? Colors.blue : Colors.grey[300],
              ),
            );
          }),
        ));
  }
}
