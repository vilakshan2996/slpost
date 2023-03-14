import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:slpost/app/data/constants.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key ?key,
    required this.isActive,
    required this.isHover,
    
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? SvgPicture.asset(
                    "assets/Icons/Angle right.svg",
                    width: 15,
                  )
                : SizedBox(width: 15),
            SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive || isHover) ? kPrimaryColor : kGrayColor,
                    ),
                    SizedBox(width: kDefaultPadding * 0.75),
                    TextRenderer(
                      child: Text(
                        title,
                    
                        style: TextStyle(
                          color: (isActive || isHover) ? kTextColor : kGrayColor,
                        ),
                        
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
