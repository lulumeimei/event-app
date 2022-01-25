import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';

class EventWidget extends StatefulWidget {
  final TicketMaster ticketMaster;
  const EventWidget({
    Key? key,
    required this.ticketMaster,
  }) : super(key: key);

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    TicketMaster ticketMaster = widget.ticketMaster;
    final BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(
        10.sp,
      ),
    );
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.EVENT_DETAIL_PAGE,
          arguments: EventDetailParams(
            id: ticketMaster.id,
            ticketMaster: ticketMaster,
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: Theme.of(context).cardColor,
      elevation: 1,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          width: mediaQ.width,
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.sp,
                height: 60.sp,
                child: ticketMaster.ticketImageList.isNotEmpty
                    ? Image.network(
                        ticketMaster.ticketImageList.first.url,
                        fit: BoxFit.cover,
                      )
                    : const Placeholder(),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticketMaster.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      ticketMaster.getEventDate,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
