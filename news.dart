import 'package:flutter/material.dart';
import 'package:project/Helpful.dart';
import 'package:project/classes.dart';
import 'package:project/projects.dart';
import 'package:project/todolist.dart';
import 'home.dart';
class news extends StatefulWidget{
  int id;
  news(this.id);
  @override
  State<news> createState() => _news();
}

class _news extends State<news> {
  static const buttonColor = Color(0xffbb0000);
  static const textColor = Color(0xFF024335);
  static const backgroundColor = Color(0xFFE6F6EF);
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه خبرا'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: widthOfScreen,
          height: heightOfScreen+100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [
                  0.5,
                  0.8,
                  0.9,
                ],
                colors: [
                  Colors.white,
                  Colors.green.shade50,
                  Colors.green.shade100,
                ]),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  right: 20,
                  child: Text(
                    'خبرا',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  )
              ),  //نوشته
              Positioned(
                  top: 700,
                  right: 7.5,
                  child: NEWS(
                    title: 'کسب رتبه اول در 22مین دوره مسابقات برنامه نویسی دانشجویی کشور' ,
                    text: 'در بیست و دومین دوره مسابقات برنامه نویسی دانشجویی دانشگاههای کشور که در تاریخ 18 فروردین ماه به میزبانی دانشگاه صنعتی امیرکبیر برگزار شد، تیم برنامه نویسی دانشجویی ICPC دانشکده مهندسی و علوم کامپیوتر دانشگاه شهیدبهشتی، متشکل از آقایان محمدرضا محمدزاده، امیررضا محسنی، و میلاد انصاری، جایگاه اول دانشگاههای کشور را از آنِ خود نمود' ,
                    url: 'https://cse.sbu.ac.ir/image/journal/article?img_id=59184046&t=1720580036179',
                  ),
              ),
              Positioned(
                top: 280,
                right: 7.5,
                child: NEWS(
                    title: 'درخشش تیم رباتیک در هفدهمین دوره مسابقات بین‌المللی ربوکاپ آزاد ایران' ,
                    text: 'اعضای تیم رباتیک دانشکده مهندسی کامپیوتر این دانشگاه (R3CESBU) محمدحسام نصیری، سیدحسن مجیدزنوزی، آریا پرویزی، سیدمصطفی اطیابی، ساناز موسی پور، سیده رانا رکنی، ماهان ویسی، کیارش کوثری و محمدرضا محمدزاده  دانشجویان مقطع کارشناسی هستند. آقای دکتر آرمین سلیمی بدر عضو هیأت علمی دانشکده مهندسی و علوم کامپیوتر، سرپرستی این تیم را برعهده دارد.',
                    url:"https://cse.sbu.ac.ir/image/journal/article?img_id=60289669&t=1720580036165"
                  )
              ),
              Positioned(
                top: 490,
                right: 7.5,
                child: NEWS(
                    title: 'کسب مقام سوم در مسابقات رباتیک کشوری در بخش ربات‌های پرنده' ,
                    text: 'تيم رباتیک دانشگاه شهيد بهشتي در مسابقات رباتیک کشوری در بخش ربات‌های پرنده مقام سوم را به دست آورد. اعضای تیم این دانشگاه آقایان محمدحسام نصیری، مهدی پرچمی، مصطفی اطیابی، سید حسن مجید زنوزی و خانم فاطمه حوراء حقیقت خواه هستند. آقای دکتر آرمین سلیمی بدر عضو هیأت علمی دانشکده مهندسی و علوم کامپیوتر، سرپرستی این تیم را برعهده دارد.',
                    url: 'https://cse.sbu.ac.ir/documents/1009763/0/photo_5843812226576794799_y.jpg/6ce004aa-e5e0-676e-d013-4416431d105f?t=1713630135955',
                ),
              ),
              Positioned(
                top: 70,
                right: 7.5,
                child: NEWS(
                    title: 'مسابقه برنامه‌نویسی NEWBIES 2024 برگزار شد' ,
                    text: 'مسابقه برنامه‌نویسی NEWBIES 2024 با حضور ۲۴ تیم برنامه‌نویسی سه نفره از دانشجویان سال اول و دوم دانشگاه، در تاریخ ۱۲ تیرماه ۱۴۰۲ در دانشکده مهندسی و علوم کامپیوتر برگزار شد. این رویداد که با هدف ارتقای مهارت‌های برنامه‌نویسی و کشف استعدادهای جدید دانشجویی برگزار شد، با استقبال گسترده‌ای همراه بود. در این مسابقه، شرکت‌کنندگان با چالش حل ۱۱ سوال الگوریتمی به سبک مسابقات ICPC روبه‌رو شدند.',
                    url: 'https://cse.sbu.ac.ir/documents/1009763/0/photo_5780568639869665649_y.jpg/17a19aab-6eaf-09de-876f-cf46d1b74c6c?t=1720257622706',
                ),
              ),
            ],
          ),

        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: textColor,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.note_alt,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => projects(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            Container(
              width: 50,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.campaign,
                    color: backgroundColor,
                    size: 30,
                  ),
                  onPressed: () => setState(
                        () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => home(widget.id),
                      ));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.school,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => classes(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.list_alt,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => todolist(widget.id),
                  ));
                },
              ),
            ),
            SizedBox(width: 26,),
            IconButton(
              icon: Icon(
                Icons.home,
                color: backgroundColor,
                size: 30,
              ),
              onPressed: () => setState(
                    () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => home(widget.id),
                  ));
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}

class NEWS extends StatelessWidget{
  String title;
  String text;
  String url;
  NEWS({required this.title,required this.text , required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          height: 180,
          decoration: BoxDecoration(
              border: Border.all(width: 4, color: _news.textColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
              ),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    url
                  )
              )
          ),
        ),
        Container(
          width: 230,
          height: 180,
          decoration:  BoxDecoration(
            color: Colors.green.shade300,
            border: Border.all(width: 4, color: _news.textColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: _news.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: _news.backgroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 9.5
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}