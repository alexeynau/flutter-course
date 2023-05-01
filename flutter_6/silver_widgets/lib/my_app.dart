import 'package:flutter/material.dart';

// this app shows usage of SilverAppBar and SilverToBoxAdapter

class MySilverWidget extends StatefulWidget {
  const MySilverWidget({super.key});

  @override
  State<MySilverWidget> createState() => _MySilverWidgetState();
}

class _MySilverWidgetState extends State<MySilverWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            expandedHeight: 300,
            pinned: true,
            title: const Text(
              'Page Title',
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // get random image
              background: Image.network(
                'https://picsum.photos/800/500',
                fit: BoxFit.cover,
                color: Colors.black,
                colorBlendMode: BlendMode.overlay,
              ),
            ),
          ),

          // lorem ipsum text
          const SliverToBoxAdapter(
            child: Text(
                '''Non dolor nulla pariatur enim excepteur velit sunt occaecat magna veniam aute aliqua. Ut voluptate excepteur cupidatat esse proident. Culpa voluptate reprehenderit laborum laborum et et. Dolor Lorem tempor mollit sit. Culpa elit est ex quis id exercitation occaecat proident reprehenderit Lorem est. Non Lorem tempor magna nostrud. Anim id excepteur sit sit. Enim et cillum ea elit fugiat pariatur minim quis. Tempor proident aliqua voluptate do nostrud nulla non velit fugiat culpa ipsum est do consequat. Enim cillum laboris sunt ipsum cupidatat laboris non esse commodo reprehenderit. Qui cupidatat velit excepteur adipisicing excepteur amet do irure excepteur labore ex aute. Consequat quis velit sit ullamco excepteur ullamco duis. Anim fugiat occaecat in sint labore anim enim cupidatat esse dolore exercitation. Esse qui esse esse eiusmod anim nisi ut non sunt irure elit excepteur aliquip aute.
Dolor laborum nisi commodo adipisicing esse. Ad culpa ut cillum nisi mollit adipisicing qui anim anim labore. Ut esse magna id aliqua culpa non ullamco elit incididunt. Id mollit elit eiusmod fugiat laborum sit fugiat elit officia. Ullamco incididunt incididunt quis esse duis velit. Adipisicing esse in tempor esse cupidatat pariatur qui do nisi eu id adipisicing ullamco non. Incididunt ut elit non sunt Lorem deserunt dolor consectetur cupidatat.
Veniam qui incididunt dolor ad ut est excepteur mollit. Velit laborum deserunt ea aute in exercitation cillum qui do ipsum quis et dolor elit. Et ut elit aliquip et id consequat esse ea. Anim id nulla esse adipisicing sint aliquip sunt reprehenderit enim velit sit aliqua. Ullamco elit aliquip ex sint est culpa ullamco ut fugiat esse ad ipsum enim anim. Sint ut amet culpa aute duis officia deserunt consectetur labore veniam non. Et proident ea aliqua consectetur qui irure proident cillum pariatur dolore minim proident proident nostrud.'''),
          )
        ],
      ),
    );
  }
}
