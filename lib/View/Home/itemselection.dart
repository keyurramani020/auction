// import 'package:btt/View/Utilites/Colors.dart';
// import 'package:btt/View/Utilites/imagepath.dart';
// import 'package:btt/View/Widget/widget.dart';
// import 'package:btt/controller/homecontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:linked_scroll_controller/linked_scroll_controller.dart';
//
// class itemselection extends StatefulWidget {
//   const itemselection({super.key});
//
//   @override
//   State<itemselection> createState() => _itemselectionState();
// }
//
// class _itemselectionState extends State<itemselection> {
//   late LinkedScrollControllerGroup _horizontalControllersGroup;
//   late ScrollController _horizontalController1;
//   late ScrollController _horizontalController2;
//
//   @override
//   void initState() {
//     _horizontalControllersGroup = LinkedScrollControllerGroup();
//     _horizontalController1 = _horizontalControllersGroup.addAndGet();
//     _horizontalController2 = _horizontalControllersGroup.addAndGet();
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _horizontalController1.dispose();
//     _horizontalController2.dispose();
//     _isLoading = false;
//     super.dispose();
//   }
//
//   bool _isLoading = false;
//
//   // final List<List<String>> rows = List.generate(
//   //   20,
//   //   (index) => List.generate(
//   //     4,
//   //     (colIndex) => 'Item ${index * 10 + colIndex + 1}',
//   //   ),
//   // );
//
//   // final List<String> colEntries = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('');
//   // final List<String> rowEntries =
//   //     Iterable<int>.generate(10).map((e) => e.toString()).toList();
//   bool allitem = false;
//   @override
//   Widget build(BuildContext context) {
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.width;
//     final get = Get.put(homeController(context: context));
//
//     var header = get.headerlist;
//     return PopScope(
//       canPop: false,
//       onPopInvoked: (bool didPop) async {
//         if (didPop) {
//           return;
//         }
//
//         Get.toNamed("/details");
//         // final bool shouldPop = await _showBackDialog() ?? false;
//         // if (context.mounted && shouldPop) {
//         //   Navigator.pop(context);
//         // }
//       },
//       child: Scaffold(body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return Center(
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 controller: get.scrollController1.value,
//                 child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                         maxHeight: viewportConstraints.maxHeight,
//                         maxWidth: viewportConstraints.maxWidth),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           width: widths * 0.9,
//                           height: 50,
//                           child: Row(
//                             children: [
//                               TextButton(
//                                   onPressed: () {
//                                     Get.toNamed("/home");
//                                   },
//                                   child: Image.asset(
//                                     paths.logo,
//                                     scale: 4,
//                                   )),
//                               SizedBox(
//                                 width: widths * 0.5,
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   Get.toNamed("/profile");
//                                 },
//                                 icon: Image.asset(
//                                   paths.Ellipse4,
//                                   scale: 4,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Obx(() {
//                           return get.loading5.value == true
//                               ? const Center(
//                                   child: CircularProgressIndicator(
//                                     color: colors.primary,
//                                   ),
//                                 )
//                               : Container(
//                                   margin: EdgeInsets.all(20),
//                                   // decoration: BoxDecoration(
//                                   //     border: Border.all(color: colors.primary)),
//                                   child: Column(
//                                     children: <Widget>[
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Row(
//                                         children: <Widget>[
//                                           Expanded(
//                                             child: Container(
//                                               width: widths,
//                                               child: SingleChildScrollView(
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 controller:
//                                                     _horizontalController2,
//                                                 child: Row(
//                                                   children: List.generate(
//                                                     get.headerlist.length,
//                                                     (i) {
//                                                       return Row(
//                                                         children: [
//                                                           Container(
//                                                             height: 30,
//                                                             width: 100,
//                                                             child: i == 0
//                                                                 ? Checkbox(
//                                                                     value:
//                                                                         allitem,
//                                                                     onChanged:
//                                                                         (vel) {
//                                                                       setState(
//                                                                           () {
//                                                                         if (allitem ==
//                                                                             true) {
//                                                                           for (var i = 0;
//                                                                               i < get.items.value;
//                                                                               i++) {
//                                                                             get.cellvaluelist[i][0] =
//                                                                                 "0";
//                                                                             print(get.cellvaluelist[i]);
//                                                                           }
//                                                                           allitem =
//                                                                               false;
//                                                                         } else {
//                                                                           for (var i = 0;
//                                                                               i < get.items.value;
//                                                                               i++) {
//                                                                             get.cellvaluelist[i][0] =
//                                                                                 "1";
//                                                                             print(get.cellvaluelist[i]);
//                                                                           }
//                                                                           allitem =
//                                                                               true;
//                                                                         }
//                                                                       });
//                                                                     },
//                                                                     activeColor:
//                                                                         colors
//                                                                             .primary,
//                                                                     checkColor:
//                                                                         colors
//                                                                             .secondary,
//                                                                     side: BorderSide(
//                                                                         color: colors
//                                                                             .primary),
//                                                                   )
//                                                                 : Container(
//                                                                     decoration: BoxDecoration(
//                                                                         border: Border(
//                                                                             left: BorderSide(
//                                                                                 color: Colors
//                                                                                     .grey))),
//                                                                     alignment:
//                                                                         Alignment
//                                                                             .center,
//                                                                     child: Text(
//                                                                       get.headerlist[
//                                                                           i],
//                                                                       style: TextStyle(
//                                                                           color: colors
//                                                                               .primary,
//                                                                           fontWeight:
//                                                                               FontWeight.bold),
//                                                                     )),
//                                                           ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Divider(
//                                         indent: 20,
//                                         endIndent: 20,
//                                       ),
//                                       Row(
//                                         children: <Widget>[
//                                           Expanded(
//                                             child: SizedBox(
//                                               height: heights * 0.65,
//                                               width: widths * 0.9,
//                                               child: SingleChildScrollView(
//                                                 child: SingleChildScrollView(
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   controller:
//                                                       _horizontalController1,
//                                                   child: BodyContainer(
//                                                       // rowEntries: rowEntries,
//                                                       // colEntries: colEntries,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                         }),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           width: widths * 0.3,
//                           height: 40,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: colors.primary,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: TextButton(
//                             onPressed: () async {
//                               get.itemSelectionsubmit();
//
//                               setState(() {
//                                 _isLoading = !_isLoading;
//                               });
//
//                               try {
//                                 if (get.Response7.value.statusCode == 200) {
//                                   int tem = 0;
//                                   for (var i = 0;
//                                       i < get.cellvaluelist.length;
//                                       i++) {
//                                     if (get.cellvaluelist[i][0] == "1") {
//                                       if (tem == 2) {
//                                         break;
//                                       }
//                                       tem++;
//                                     }
//                                   }
//
//                                   if (tem == 1) {
//                                     showDialog<String>(
//                                         context: context,
//                                         builder: (BuildContext context) =>
//                                             AlertDialog(
//                                               title: const Text('Bidding'),
//                                               content: const Text(
//                                                   'Select Bidding Type'),
//                                               actionsAlignment:
//                                                   MainAxisAlignment.center,
//                                               actions: <Widget>[
//                                                 TextButton(
//                                                   onPressed: () => Get.back(),
//                                                   child: const Text(
//                                                     'cancel',
//                                                     style: TextStyle(
//                                                         color: colors.primary),
//                                                   ),
//                                                 ),
//                                                 TextButton(
//                                                   onPressed: () async {
//                                                     get.Dynbiddinghall("dcvs");
//                                                   },
//                                                   child: const Text(
//                                                     'Manual',
//                                                     style: TextStyle(
//                                                         color: colors.primary),
//                                                   ),
//                                                 ),
//                                                 TextButton(
//                                                   onPressed: () => Get.toNamed(
//                                                       "/autobidding"),
//                                                   child: const Text('Auto',
//                                                       style: TextStyle(
//                                                           color:
//                                                               colors.primary)),
//                                                 ),
//                                               ],
//                                             ));
//                                   } else {
//                                     get.Dynbiddinghall("auid");
//                                   }
//                                 }
//                               } catch (e) {
//                                 print(e);
//                                 toast("Select Items");
//                               }
//                             },
//                             child: _isLoading
//                                 ? Container(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2.0,
//                                       valueColor: AlwaysStoppedAnimation<Color>(
//                                           Colors.white),
//                                     ),
//                                   )
//                                 : Text(
//                                     "Bid Now",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           );
//         },
//       )),
//     );
//   }
// }
//
// class ColumnContainer extends StatelessWidget {
//   final List<String> colEntries;
//   const ColumnContainer({
//     super.key,
//     required this.colEntries,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final get = Get.put(homeController(context: context));
//     int numberOfRows = get.cellvaluelist.length;
//     print("n$numberOfRows");
//     return Column(
//       children: List.generate(
//         numberOfRows,
//         (i) {
//           return Container(
//             height: 50,
//             width: 100,
//             child: Center(child: Text(colEntries[i])),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class HeaderContainer extends StatefulWidget {
//   final List<String> rowEntries;
//   const HeaderContainer({
//     super.key,
//     required this.rowEntries,
//   });
//
//   @override
//   State<HeaderContainer> createState() => _HeaderContainerState();
// }
//
// class _HeaderContainerState extends State<HeaderContainer> {
//   @override
//   Widget build(BuildContext context) {
//     int _numberOfColumns = widget.rowEntries.length;
//     final get = Get.put(homeController(context: context));
//     return Row(
//       children: List.generate(
//         _numberOfColumns,
//         (i) {
//           return Row(
//             children: [
//               Container(
//                 height: 30,
//                 width: 100,
//                 child: i == 0
//                     ? Checkbox(
//                         value: false,
//                         onChanged: (vel) {
//                           setState(() {
//                             for (var i = 0; i < get.items.value; i++) {
//                               get.cellvaluelist[i][0] = "1";
//                               print(get.cellvaluelist[i]);
//                             }
//
//                             vel = true;
//                           });
//                         },
//                         activeColor: colors.primary,
//                         checkColor: colors.secondary,
//                         side: BorderSide(color: colors.primary),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                             border:
//                                 Border(left: BorderSide(color: Colors.grey))),
//                         alignment: Alignment.center,
//                         child: Text(widget.rowEntries[i])),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class BodyContainer extends StatefulWidget {
//   // final List<String> colEntries;
//   // final List<String> rowEntries;
//   const BodyContainer({
//     Key? key,
//     // required this.colEntries,
//     // required this.rowEntries,
//   }) : super(key: key);
//
//   @override
//   State<BodyContainer> createState() => _BodyContainerState();
// }
//
// class _BodyContainerState extends State<BodyContainer> {
//   @override
//   Widget build(BuildContext context) {
//     final get = Get.put(homeController(context: context));
//
//     int numberOfColumns = get.cellvaluelist[0].length;
//     int numberOfLines = get.cellvaluelist.length;
//
//     return Column(
//       children: List.generate(numberOfLines, (y) {
//         return Row(
//           children: [
//             Row(
//               children: List.generate(numberOfColumns, (x) {
//                 return x == 0
//                     ? Container(
//                         width: 100,
//                         child: Checkbox(
//                           value: get.cellvaluelist[y][0] == "1" ? true : false,
//                           onChanged: (vel) {
//                             print(y);
//                             setState(() {
//                               if (get.cellvaluelist[y][0] == "0") {
//                                 get.cellvaluelist[y][0] = "1";
//                               } else {
//                                 get.cellvaluelist[y][0] = "0";
//                               }
//                             });
//                           },
//                           activeColor: colors.primary,
//                           checkColor: colors.secondary,
//                           side: BorderSide(color: colors.primary),
//                         ),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                             border:
//                                 Border(left: BorderSide(color: Colors.grey))),
//                         child: TableCell(item: get.cellvaluelist[y][x]));
//               }),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
//
// class TableCell extends StatelessWidget {
//   final String item;
//   const TableCell({
//     super.key,
//     required this.item,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 100,
//       child: Center(child: Text(item)),
//     );
//   }
// }
import 'dart:async';

import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../Widget/widget.dart';

class ItemSelection extends StatefulWidget {
  const ItemSelection({super.key});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  late LinkedScrollControllerGroup _horizontalControllersGroup;
  late ScrollController _horizontalController1;
  late ScrollController _horizontalController2;
  late ScrollController _verticalController;

  bool allitem = false;

  @override
  void initState() {
    _horizontalControllersGroup = LinkedScrollControllerGroup();
    _horizontalController1 = _horizontalControllersGroup.addAndGet();
    _horizontalController2 = _horizontalControllersGroup.addAndGet();
    _verticalController = ScrollController();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _horizontalController1.dispose();
    _horizontalController2.dispose();
    _verticalController.dispose();
    final get = Get.put(homeController(context: context));
    get.scrollController1.value.dispose();
    super.dispose();
  }

  // Replace this with your API call
  Future<String?> showBackDialog1() {
    final get = Get.put(homeController(context: context));
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Select Bidding Type'),
              // content:
              //     const Text('Select Bidding Type'),
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: colors.primary),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    loding(context);
                    await get.Dynbiddinghall("item");
                    Get.toNamed("/manualbidding");
                  },
                  child: const Text(
                    'Manual',
                    style: TextStyle(color: colors.primary),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    loding(context);
                    await get.Dynbiddinghallauto("item");
                    get.autobiddingstates.value = true;
                    Get.toNamed("/yourrank");
                  },
                  child: const Text('Auto',
                      style: TextStyle(color: colors.primary)),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));
    //var header = get.headerlist;

    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          Get.toNamed("/details");
        },
        child: Scaffold(
          body: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: viewportConstraints.maxHeight,
                        maxWidth: viewportConstraints.maxWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          sbh(10.0),
                          cappbar(context, widths, "/details"),
                          Obx(() {
                            return get.cellvaluelist.isEmpty
                                ? SizedBox(
                                    height: heights * 0.65,
                                    width: widths * 0.9,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: colors.primary,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      children: <Widget>[
                                        sbh(20.0),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: SizedBox(
                                                width: widths,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  controller:
                                                      _horizontalController2,
                                                  child: Row(
                                                    children: List.generate(
                                                      get.headerlist.length,
                                                      (i) {
                                                        return Row(
                                                          children: [
                                                            i == 0
                                                                ? SizedBox(
                                                                    height: 50,
                                                                    width: 100,
                                                                    child:
                                                                        Checkbox(
                                                                      value:
                                                                          allitem,
                                                                      onChanged:
                                                                          (vel) {
                                                                        setState(
                                                                            () {
                                                                          if (allitem) {
                                                                            for (var i = 0;
                                                                                i < get.items.value;
                                                                                i++) {
                                                                              get.cellvaluelist[i][0] = "0";
                                                                            }
                                                                            allitem =
                                                                                false;
                                                                          } else {
                                                                            for (var i = 0;
                                                                                i < get.items.value;
                                                                                i++) {
                                                                              get.cellvaluelist[i][0] = "1";
                                                                            }
                                                                            allitem =
                                                                                true;
                                                                          }
                                                                        });
                                                                      },
                                                                      activeColor:
                                                                          colors
                                                                              .primary,
                                                                      checkColor:
                                                                          colors
                                                                              .secondary,
                                                                      side: const BorderSide(
                                                                          color:
                                                                              colors.primary),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    height: 50,
                                                                    width: 200,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                            border:
                                                                                Border(left: BorderSide(color: Colors.grey))),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: get
                                                                            .headerlist
                                                                            .isEmpty
                                                                        ? const Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: colors.primary,
                                                                            ),
                                                                          )
                                                                        : Text(
                                                                            get.headerlist[i],
                                                                            style:
                                                                                const TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
                                                                          ),
                                                                  ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                            indent: 20, endIndent: 20),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: SizedBox(
                                                height: heights * 0.65,
                                                width: widths * 0.9,
                                                child: SingleChildScrollView(
                                                  controller:
                                                      _verticalController,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    controller:
                                                        _horizontalController1,
                                                    child: Column(children: [
                                                      const BodyContainer(),
                                                      get.loading5.value ==
                                                                  true &&
                                                              get.cellvaluelist
                                                                  .isNotEmpty
                                                          ? const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: colors
                                                                    .primary,
                                                              ),
                                                            )
                                                          : Container()
                                                    ]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                          }),
                          Container(
                            width: widths * 0.3,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: colors.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              onPressed: () async {
                                await get.itemSelectionsubmit();
                                int tem = 0;
                                for (var i = 0;
                                    i < get.cellvaluelist.length;
                                    i++) {
                                  if (get.cellvaluelist[i][0] == "1") {
                                    if (tem == 2) {
                                      break;
                                    }
                                    tem++;
                                  }
                                }
                                if (tem == 1) {
                                  await showBackDialog1();
                                } else {
                                  loding(context);
                                  await get.Dynbiddinghall("item");
                                  Get.toNamed("/manualbidding");
                                }

                                // int tem = 0;
                                // for (var i = 0;
                                //     i < get.cellvaluelist.length;
                                //     i++) {
                                //   if (get.cellvaluelist[i][0] == "1") {
                                //     if (tem == 2) {
                                //       break;
                                //     }
                                //     tem++;
                                //   }
                                // }
                                // if (tem != 2) {
                                //   showDialog<String>(
                                //       context: context,
                                //       builder: (BuildContext context) =>
                                //           AlertDialog(
                                //             title:
                                //                 const Text('Select Bidding Type'),
                                //             // content:
                                //             //     const Text('Select Bidding Type'),
                                //             titlePadding: EdgeInsets.symmetric(
                                //                 horizontal: 45, vertical: 20),
                                //             actionsAlignment:
                                //                 MainAxisAlignment.center,
                                //             actions: <Widget>[
                                //               TextButton(
                                //                 onPressed: () => Get.back(),
                                //                 child: const Text(
                                //                   'cancel',
                                //                   style: TextStyle(
                                //                       color: colors.primary),
                                //                 ),
                                //               ),
                                //               TextButton(
                                //                 onPressed: () async {
                                //                   await get.Dynbiddinghall(
                                //                       "item");
                                //                   Get.toNamed("/manualbidding");
                                //                 },
                                //                 child: const Text(
                                //                   'Manual',
                                //                   style: TextStyle(
                                //                       color: colors.primary),
                                //                 ),
                                //               ),
                                //               TextButton(
                                //                 onPressed: () async {
                                //                   loding(context);
                                //                   await get.Dynbiddinghallauto(
                                //                       "item");
                                //                   Get.toNamed("/autobidding");
                                //                 },
                                //                 child: const Text('Auto',
                                //                     style: TextStyle(
                                //                         color: colors.primary)),
                                //               ),
                                //             ],
                                //           ));
                                // } else {
                                //   await get.Dynbiddinghall("item");
                                //   Get.toNamed("/manualbidding");
                                // }

                                // print("tem" + tem.toString());
                                //
                                // if (get.Response7.value.statusCode == 200) {
                                //   int tem = 0;
                                //   for (var i = 0;
                                //       i < get.cellvaluelist.length;
                                //       i++) {
                                //     if (get.cellvaluelist[i][0] == "1") {
                                //       if (tem == 2) {
                                //         break;
                                //       }
                                //       tem++;
                                //     }
                                //   }
                                // }
                                // get.Dynbiddinghall();
                                // Get.toNamed("/manualbidding");

                                //
                                // try {
                                //   // if (get.Response7.value.statusCode == 200) {
                                //   //   int tem = 0;
                                //   //   for (var i = 0;
                                //   //       i < get.cellvaluelist.length;
                                //   //       i++) {
                                //   //     if (get.cellvaluelist[i][0] == "1") {
                                //   //       if (tem == 2) {
                                //   //         break;
                                //   //       }
                                //   //       tem++;
                                //   //     }
                                //   //   }
                                //
                                //   if (get.Response6.value.responseData!
                                //               .biddingHallDetail!.length ==
                                //           1 &&
                                //       get.loading6.value) {
                                //     showDialog<String>(
                                //         context: context,
                                //         builder: (BuildContext context) =>
                                //             AlertDialog(
                                //               title: const Text('Bidding'),
                                //               content: const Text(
                                //                   'Select Bidding Type'),
                                //               actionsAlignment:
                                //                   MainAxisAlignment.center,
                                //               actions: <Widget>[
                                //                 TextButton(
                                //                   onPressed: () => Get.back(),
                                //                   child: const Text(
                                //                     'cancel',
                                //                     style: TextStyle(
                                //                         color: colors.primary),
                                //                   ),
                                //                 ),
                                //                 TextButton(
                                //                   onPressed: () async {
                                //                     // get.Dynbiddinghall("dcvs");
                                //                     Get.toNamed("/manualbidding");
                                //                   },
                                //                   child: const Text(
                                //                     'Manual',
                                //                     style: TextStyle(
                                //                         color: colors.primary),
                                //                   ),
                                //                 ),
                                //                 TextButton(
                                //                   onPressed: () async {
                                //                     // get.Dynbiddinghall("dcvs");
                                //                     Get.toNamed("/autobidding");
                                //                   },
                                //                   child: const Text('Auto',
                                //                       style: TextStyle(
                                //                           color: colors.primary)),
                                //                 ),
                                //               ],
                                //             ));
                                //   } else {
                                //     // get.Dynbiddinghall("auid");
                                //     Get.toNamed("/manualbidding");
                                //   }
                                // } catch (e) {
                                //   toast("Select Items");
                                // }
                              },
                              child: const Text(
                                "Bid Now",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          sbh(20.0),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

// class ItemSelection extends StatefulWidget {
//   const ItemSelection({super.key});
//
//   @override
//   State<ItemSelection> createState() => _ItemSelectionState();
// }
//
// class _ItemSelectionState extends State<ItemSelection> {
//   late LinkedScrollControllerGroup _horizontalControllersGroup;
//   late ScrollController _horizontalController1;
//   late ScrollController _horizontalController2;
//   late ScrollController _verticalController;
//   bool _isLoading = false;
//   bool allitem = false;
//
//   @override
//   void initState() {
//     _horizontalControllersGroup = LinkedScrollControllerGroup();
//     _horizontalController1 = _horizontalControllersGroup.addAndGet();
//     _horizontalController2 = _horizontalControllersGroup.addAndGet();
//     _verticalController = ScrollController();
//
//     _verticalController.addListener(() {
//       if (_verticalController.position.atEdge) {
//         if (_verticalController.position.pixels != 0) {
//           _loadMoreData();
//         }
//       }
//     });
//
//     _horizontalController1.addListener(() {
//       if (_verticalController.position.atEdge) {
//         if (_verticalController.position.pixels != 0) {
//           _loadMoreData();
//         }
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _horizontalController1.dispose();
//     _horizontalController2.dispose();
//     _verticalController.dispose();
//     super.dispose();
//   }
//
//   void _loadMoreData() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final get = Get.find<homeController>();
//     if (get.items.value == get.cellvaluelist.length) {
//     } else {
//       await get.GetitemSelection(get.auctionid);
//     }
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final get = Get.put(homeController(context: context));
//     final widths = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Center(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             controller: _verticalController,
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 Container(
//                   width: widths * 0.9,
//                   height: 50,
//                   child: Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Get.toNamed("/home");
//                         },
//                         child: Container(
//                           width: 60,
//                           child: Image.asset(
//                             paths.logo,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           final getProfile =
//                               Get.put(profileController(context: context));
//                           getProfile.getprofile();
//                           Get.toNamed("/profile");
//                         },
//                         icon: Image.asset(
//                           paths.Ellipse4,
//                           scale: 4,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Obx(() {
//                   return Container(
//                     margin: EdgeInsets.all(20),
//                     child: SingleChildScrollView(
//                       controller: _horizontalController1,
//                       scrollDirection: Axis.horizontal,
//                       child: buildTableSpan(get),
//                     ),
//                   );
//                 }),
//                 SizedBox(height: 20),
//                 Container(
//                   width: widths * 0.3,
//                   height: 40,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: colors.primary,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: TextButton(
//                     onPressed: () async {
//                       await get.itemSelectionsubmit();
//                       showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                           title: const Text('Select Bidding Type'),
//                           actionsAlignment: MainAxisAlignment.center,
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () => Get.back(),
//                               child: const Text(
//                                 'Cancel',
//                                 style: TextStyle(color: colors.primary),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () async {
//                                 await get.Dynbiddinghall("item");
//                                 Get.toNamed("/manualbidding");
//                               },
//                               child: const Text(
//                                 'Manual',
//                                 style: TextStyle(color: colors.primary),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () async {
//                                 loding(context);
//                                 await get.Dynbiddinghallauto("item");
//                                 Get.toNamed("/yourrank");
//                               },
//                               child: const Text(
//                                 'Auto',
//                                 style: TextStyle(color: colors.primary),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     child: get.loading6.value == true ||
//                             get.loading7.value == true
//                         ? Container(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2.0,
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                             ),
//                           )
//                         : Text(
//                             "Bid Now",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTableSpan(homeController get) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           // Header row
//           for (var header in get.headerlist)
//             Container(
//               width: 100,
//               alignment: Alignment.center,
//               decoration: const BoxDecoration(
//                 border: Border(
//                   left: BorderSide(color: Colors.grey),
//                 ),
//               ),
//               child: Text(
//                 header,
//                 style: const TextStyle(
//                   color: colors.primary,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//           // Data rows
//           for (var row in get.cellvaluelist)
//             Row(
//               children: [
//                 for (var cell in row)
//                   Container(
//                     width: 100,
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       border: Border(
//                         left: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                     child: Text(cell.toString()),
//                   ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

class ColumnContainer extends StatelessWidget {
  final List<String> colEntries;
  const ColumnContainer({
    super.key,
    required this.colEntries,
  });

  @override
  Widget build(BuildContext context) {
    final get = Get.put(homeController(context: context));
    int numberOfRows = get.cellvaluelist.length;

    //print("n$numberOfRows");
    return Column(
      children: List.generate(
        numberOfRows,
        (i) {
          return i == 0
              ? SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(child: Text(colEntries[i])))
              : SizedBox(
                  height: 50,
                  width: 200,
                  child: Center(child: Text(colEntries[i])),
                );
        },
      ),
    );
  }
}

class HeaderContainer extends StatefulWidget {
  final List<String> rowEntries;
  const HeaderContainer({
    super.key,
    required this.rowEntries,
  });

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    //final widths = MediaQuery.of(context).size.width;
    int numberOfColumns = widget.rowEntries.length;
    final get = Get.put(homeController(context: context));
    return Row(
      children: List.generate(
        numberOfColumns,
        (i) {
          return Row(
            children: [
              i == 0
                  ? SizedBox(
                      height: 50,
                      width: 100,
                      child: Checkbox(
                        value: false,
                        onChanged: (vel) {
                          setState(() {
                            for (var i = 0; i < get.items.value; i++) {
                              get.cellvaluelist[i][0] = "1";
                            }
                            vel = true;
                          });
                        },
                        activeColor: colors.primary,
                        checkColor: colors.secondary,
                        side: const BorderSide(color: colors.primary),
                      ),
                    )
                  : Container(
                      height: 30,
                      width: 200,
                      decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey))),
                      alignment: Alignment.center,
                      child: Text(widget.rowEntries[i])),
            ],
          );
        },
      ),
    );
  }
}

class BodyContainer extends StatefulWidget {
  const BodyContainer({super.key});

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final get = Get.put(homeController(context: context));

    int numberOfColumns = get.cellvaluelist[0].length;
    int numberOfLines = get.cellvaluelist.length;
    // final widths = MediaQuery.of(context).size.width;
    return Column(
      children: List.generate(numberOfLines, (y) {
        return Row(
          children: [
            Row(
              children: List.generate(numberOfColumns, (x) {
                return x == 0
                    ? SizedBox(
                        width: 100,
                        child: Checkbox(
                          value: get.cellvaluelist[y][0] == "1" ? true : false,
                          onChanged: (vel) {
                            //print(y);
                            setState(() {
                              if (get.cellvaluelist[y][0] == "0") {
                                get.cellvaluelist[y][0] = "1";
                              } else {
                                get.cellvaluelist[y][0] = "0";
                              }
                            });
                          },
                          activeColor: colors.primary,
                          checkColor: colors.secondary,
                          side: const BorderSide(color: colors.primary),
                        ),
                      )
                    : Container(
                        width: 200,
                        decoration: const BoxDecoration(
                            border:
                                Border(left: BorderSide(color: Colors.grey))),
                        child: TableCell(item: get.cellvaluelist[y][x]),
                      );
              }),
            ),
          ],
        );
      }),
    );
  }
}

class TableCell extends StatelessWidget {
  final String item;
  const TableCell({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    //final widths = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      width: 200,
      child: Center(child: Text(item)),
    );
  }
}
