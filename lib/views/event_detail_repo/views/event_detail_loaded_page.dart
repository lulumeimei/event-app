import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/views/event_detail_repo/bloc/event_detail_bloc.dart';
import 'package:ticketapp/views/widgets/web_view_page.dart';
import 'package:ticketapp/views/widgets/webview_widget.dart';

class EventDetailLoadedPage extends StatefulWidget {
  const EventDetailLoadedPage({Key? key}) : super(key: key);

  @override
  _EventDetailLoadedPageState createState() => _EventDetailLoadedPageState();
}

class _EventDetailLoadedPageState extends State<EventDetailLoadedPage> {
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

  List<Widget> _bodyContent(TicketMaster ticketMaster) {
    List<Widget> widgetlist = [];

    Widget titleWidget = SizedBox(
      width: mediaQ.width,
      child: Text(
        ticketMaster.name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );

    Widget priceRangeWidget = ticketMaster.getPriceRange != null
        ? Container(
            width: mediaQ.width,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              ticketMaster.getPriceRange ?? '',
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        : Container();

    Widget ticketLimitWidget = ticketMaster.getTicketLimit != null
        ? Container(
            width: mediaQ.width,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Text(
                  'Tickets Limit',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                SizedBox(height: 5.h),
                Text(
                  ticketMaster.getTicketLimit ?? '',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          )
        : Container();

    Widget segmentTagsWidget = Container(
      width: mediaQ.width,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Tags',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          SizedBox(height: 5.h),
          Wrap(
            spacing: 5.w,
            runSpacing: 0.h,
            children: ticketMaster.getTags.map(
              (e) {
                return Chip(
                  padding: EdgeInsets.zero,
                  label: Text(
                    e,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );

    Widget ticketDateWidget = Container(
      margin: EdgeInsets.only(top: 10.h),
      width: mediaQ.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Event\'s Date',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          SizedBox(height: 5.h),
          Text(
            ticketMaster.getEventDate,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );

    Widget seatMapWidget = ticketMaster.seatMap != null
        ? Container(
            width: mediaQ.width,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seat Map',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: mediaQ.width,
                  constraints: BoxConstraints(
                    minHeight: 200.h,
                    maxHeight: 350.h,
                  ),
                  child: WebViewWidget(
                    url: ticketMaster.seatMap!.staticUrl,
                  ),
                ),
              ],
            ),
          )
        : Container();

    Widget imagesWidget = Container(
      margin: EdgeInsets.only(top: 15.h),
      width: mediaQ.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Medias',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          SizedBox(height: 10.h),
          Column(
            children: ticketMaster.ticketImageList.map(
              (e) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      e.url,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );

    widgetlist = [
      titleWidget,
      priceRangeWidget,
      ticketLimitWidget,
      segmentTagsWidget,
      ticketDateWidget,
      seatMapWidget,
      imagesWidget,
    ];
    return widgetlist;
  }

  @override
  Widget build(BuildContext context) {
    late TicketMaster ticketMaster;

    return BlocBuilder<EventDetailBloc, EventDetailModel>(
      builder: (context, state) {
        if (context.read<EventDetailBloc>().state.eventDetailState
            is EventDetailLoaded) {
          ticketMaster = (context.read<EventDetailBloc>().state.eventDetailState
                  as EventDetailLoaded)
              .ticketMaster;
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WebViewPage(
                      url: ticketMaster.url,
                    );
                  },
                ),
              );
            },
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerScroll) {
              return [
                SliverAppBar(
                  snap: false,
                  pinned: true,
                  floating: true,
                  stretch: true,
                  // title: Text(
                  //   ticketMaster.name,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      ticketMaster.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    background: Hero(
                      tag: ticketMaster.id,
                      child: Image.network(
                        ticketMaster.ticketImageList.isNotEmpty
                            ? ticketMaster.ticketImageList.first.url
                            : "https://myenglishmatters.com/wp-content/uploads/2020/11/placeholder.png",
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.srcOver,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(.7)
                            : Colors.grey[850]!.withOpacity(.5),
                      ),
                    ),
                    collapseMode: CollapseMode.parallax,
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                  ),
                  expandedHeight: 230,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      tooltip: 'Favorite',
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: ticketMaster.info,
                      onPressed: null,
                      icon: Icon(
                        Icons.info,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ];
            },
            body: ListView(
              padding: EdgeInsets.all(10.sp),
              children: _bodyContent(ticketMaster),
            ),
          ),
        );
      },
    );
  }
}
