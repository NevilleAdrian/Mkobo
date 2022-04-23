import 'package:flutter/material.dart';
import 'package:mkobo/screens/background/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkobo/utils/assets.dart';
import 'package:mkobo/utils/colors.dart';
import 'package:mkobo/utils/functions.dart';
import 'package:mkobo/utils/mock_data.dart';
import 'package:mkobo/utils/padding.dart';
import 'package:mkobo/utils/sized_boxes.dart';
import 'package:mkobo/utils/space_divider.dart';
import 'package:mkobo/utils/text_styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
          children: [
            Padding(
              padding: defaultHPadding,
              child: Navbar(),
            ),
            Padding(
              padding: defaultHPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome, Lanre!', style: textStyleBigBlack),
                  kVerySmallHeight,
                  Row(
                    children: [
                      Text('Account no:', style: textStyleSmallGrey),
                      Text('  533423243542 ', style: textStyleSmallBlack),
                      kSmallestWidth,
                      SvgPicture.asset(Assets.copy),
                    ],
                  )
                ],
              ),
            ),
            kSmallHeight,
            Padding(
              padding: defaultLeftPadding,
              child: CardBox(),
            ),
            kSmallHeight,
            Padding(
              padding: defaultHPadding,
              child: TabItems(),
            ),
            kSmallHeight,
            Container(
              height: 250,
              child: ListView(
                shrinkWrap: true,
                children: [
                   PayItems(),
                   kSmallHeight,
                   TransactionList()
                ],
              ),
            )

          ],
        ));
  }
}

//Navbar
class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(Assets.support),
        kSmallWidth,
        SvgPicture.asset(Assets.notification)
      ],
    );
  }
}

//Tab Menu
class TabMenu extends StatelessWidget {
  const TabMenu(
      {required this.text,
      required this.onTap,
      this.decoration,
      required this.style});

  final String text;
  final Function() onTap;
  final BoxDecoration? decoration;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      width: MediaQuery.of(context).size.width / 2.4,
      decoration: decoration,
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//Card Box
class CardBox extends StatelessWidget {
  const CardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: defaultPadding,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Available Balance',
                        style: textStyleSmallWhite.copyWith(fontWeight: FontWeight.w100)),
                    FlatButton(
                        color: whiteColor,
                        onPressed: () {},
                        child: Text(
                          'Tier 1',
                          style: textStyleMediumPrimary,
                        ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('N', style: textStyleSmallWhite),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '690,390.68',
                          style: textStyleBigWhite,
                        ),
                        kSmallestWidth,
                        SvgPicture.asset(Assets.hide),
                      ],
                    )
                  ],
                ),
                SpaceDivider(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.fund),
                    kSmallWidth,
                    Text(
                      'Fund Account',
                      style: textStyleSmallWhite,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
        )
      ],
    );
  }
}

//Tab Items
class TabItems extends StatefulWidget {
  const TabItems({Key? key}) : super(key: key);

  @override
  State<TabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<TabItems> {
  String type = tabs[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(9)),
      padding: defaultButtonPadding,
      child: ListView.builder(
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String tab = tabs[index];
          return Center(
            child: TabMenu(
              text: tab == 'linked'
                  ? 'Linked Account'
                  : 'Spending Account',
              style: type == tab
                  ? textStyleSmallPrimary
                  : textStyleSmallGrey,
              onTap: () {
                setState(() {
                  type = tabs[index];
                });
              },
              decoration: BoxDecoration(
                  color: type == tab ? whiteColor : lightGreyColor,
                  border: type == tab
                      ? Border.all(color: greyColor, width: 0.3)
                      : const Border(bottom: BorderSide.none),
                  borderRadius: type == tab
                      ? BorderRadius.circular(6)
                      : BorderRadius.circular(0)),
            ),
          );
        },
      ),
    );
  }
}


//Pay Items
class PayItems extends StatefulWidget {
  const PayItems({Key? key}) : super(key: key);

  @override
  State<PayItems> createState() => _PayItemsState();
}

class _PayItemsState extends State<PayItems> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: defaultHPadding,
      child: SizedBox(
        height: 150,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 149,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20),
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              String? title = items[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: primaryColor,
                    child: SvgPicture.asset(returnImage(items[index]), height: 40,),
                  ),
                  kSmallHeight,
                  Text(title, style: textStyleMediumPrimary.copyWith(fontWeight: FontWeight.w700),)
                ],
              );
            }),
      ),
    );
  }
}

//Transaction List
class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: defaultHPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions', style: textStyleNormalBlack.copyWith(fontWeight: FontWeight.w700),),
              FlatButton(
                  color: lightPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    'More',
                    style: textStyleMediumPrimary,
                  ))
            ],
          ),
        ),
        kSmallHeight,
        Container(
          height: 300,
          padding: defaultHPadding,
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, _) => kSmallHeight,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                String? title = transactions[index]['title'];
                String? description = transactions[index]['description'];
                String? amount = transactions[index]['amount'];
                String? date = transactions[index]['date'];
                String? type = transactions[index]['type'];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        transactionImage(type),
                        kSmallWidth,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(title!, style: textStyleSmallGrey),
                            kVerySmallHeight,
                            Text(description!, style: textStyleSmallBlack),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(date!, style: textStyleSmallGrey),
                        kVerySmallHeight,
                        Text('N${amount!}', style: textStyleSmallBlack),
                      ],
                    )

                  ],
                );
              }
          ),
        )
      ],
    );
  }
}


