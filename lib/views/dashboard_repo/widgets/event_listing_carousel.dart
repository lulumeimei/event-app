import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';

class EventListingCarouselWidget extends StatefulWidget {
  final double width;
  final double height;
  final List<TicketMaster> ticketMasterList;
  const EventListingCarouselWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.ticketMasterList,
  }) : super(key: key);

  @override
  _EventListingCarouselWidgetState createState() =>
      _EventListingCarouselWidgetState();
}

class _EventListingCarouselWidgetState
    extends State<EventListingCarouselWidget> {
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

  List<Widget> get _widgetlist {
    RoundedRectangleBorder eventButtonShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          12,
        ),
      ),
    );
    List<Widget> widgetlist = [];
    for (TicketMaster ticketMaster in widget.ticketMasterList) {
      widgetlist.add(
        Container(
          width: widget.width,
          height: widget.height,
          margin: EdgeInsets.only(right: 15.w),
          child: MaterialButton(
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
            padding: EdgeInsets.zero,
            color: Theme.of(context).cardColor,
            shape: eventButtonShape,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: ticketMaster.id,
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: ticketMaster.ticketImageList.isNotEmpty
                          ? Image.network(
                              ticketMaster.ticketImageList.first.url,
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: widget.width,
                      height: 80.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors:
                              Theme.of(context).brightness == Brightness.light
                                  ? [
                                      Colors.black.withOpacity(.7),
                                      Colors.black.withOpacity(1),
                                    ]
                                  : [
                                      Colors.white.withOpacity(.6),
                                      Colors.white.withOpacity(1),
                                    ],
                          stops: const [0.0, 1.0],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 17.h,
                        horizontal: 15.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widget.width,
                            child: Text(
                              ticketMaster.getEventDate,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.grey[400]
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Text(
                              ticketMaster.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.grey[200]
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    right: 15.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.sp,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // TODO: save
                        },
                        child: Container(
                          color: Theme.of(context).cardColor.withOpacity(.7),
                          width: 50.sp,
                          height: 50.sp,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return widgetlist;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardModel>(
      builder: (context, state) {
        return SizedBox(
          width: mediaQ.width,
          height: widget.height,
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: widget.height,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 15),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: true,
                  onPageChanged:
                      (int page, CarouselPageChangedReason changedReason) {
                    if (changedReason != CarouselPageChangedReason.manual) {
                      return;
                    }
                    if (state.dashboardState is DashboardLoading) {
                      return;
                    }

                    if (page >= state.ticketMasterList.length - 4) {
                      // if (state.page > 40) {
                      //   return;
                      // }

                      context.read<DashboardBloc>().add(
                            NewEventsPage(),
                          );
                    }
                  },
                  scrollDirection: Axis.horizontal,
                ),
                items: _widgetlist.map(
                  (i) {
                    return i;
                  },
                ).toList(),
              ),
              if (state.dashboardState is DashboardLoading)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 15.w),
                    child: const CircularProgressIndicator(),
                  ),
                )
              else if (state.dashboardState is DashboardNextPageFailed)
                IconButton(
                  onPressed: () {
                    context.read<DashboardBloc>().add(
                          NewEventsPage(),
                        );
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
