این برنامه توسط هانا لشکری برای پروژه درس برنامه نویسی پیشرفته نوشته شده است.
مخزن frontend شامل کدهای مربوط به بخش فرانتاند اپلیکیشن دانشجویار است. این کدها برای ایجاد رابط کاربری و تعاملات کاربر با برنامه طراحی شده اند.

-- فایلهای مهم
•  `main.dart`: فایل اصلی که نقطه ورود برنامه است و مسئولیت بارگذاری صفحه اولیه را دارد.

•  `log_in.dart`: این فایل شامل کدهای مربوط به ورود کاربر به سیستم است و با اتصال به بکند برسی می کند که ایا کاربر قبلا در سیستم ثبت نام کرده است یا خیر.

•  `sign_up.dart`: این فایل صفحه فرایند ثبت نام را به کاربر نشان می دهد و مطمئن می شود که کاربر شماره دانشجویی یکتا و رمز معتبری داشته باشد 

•  `profile.dart`: این فایل صفحه پروفایل کاربر و اطلاعات او را نشان می دهد و شامل دکمه هایی برای حذف حساب کاربری، خروج از اکانت و تغییر نام و رمز کاربر است

•  `home.dart`: صفحه سرا یا خانه که خلاصه ای فعالیت های کاربر را به او نشان می دهد و پلی برای دسترسی به سایذ اجزای برنامه است

•  `news.dart`: این فایل خبرای های پر بازدید سایت دانشکده را به او نشان می دهد.

•  `todolist.dart`: این فایل حکم todolist را دارد و فعالیت هایی که کاربر برای خود تعریف می کند تا انجام دهد را برای او لیست می کند. همچنین قابلیت حذف فعالیت را نیز دارا است.

•  `UserInformation`: در این کلاس کاربر توانایی تغییر اطلاعات خود یعنی تغییر نام و نام خانوادگی و رمز عبور خود است و توانایی تغییر سایر اطلاعات را ندارد

•  `Helpful`: این فایل شامل کلاس های مفید و کمک کنند ه و پر کاربردی است که به برای بهیته سازی کد و صرفه جویی در وقت و جلوگیری از تکرار کد کمک می کنند. مانند کلاس  FieldBox  که تکست تعریف شده برای گرفتن اطلاعات از کاربر است یا ProjectHandler و ToDoListHandler  که اطلاعات دریافتی از بکند را به حالت مورد نیاز برای نمایش در 
صفحه نگهداری میکنند

•  `classes`: این کلاس خلاصه ای از کلاس هایی که کاربر در ان ثبت نام شده است را به او نشان می دهد و توانایی افزودن کلاس توسط کاربر نیز وجود دارد به شرطی که ان کلاس قبلا در بکند تعریف شده باشد

•  `projects`: کلاس تمرینا ، پروژه ها و تکلیف هایی که کاربر دارد را به ترتیبی که کاربر مد نطر دارد به او نشان میدهد. توضیح جزئیات این کلاس در فایل دیگری خواهد بود

•  `Classes Folder`: این پوشه کلاس شخصیت های تعریف شده در برنامه را به زبان دارت نگهداری می کند. این کلاس ها به زبان جاوا در مخزن clui  وجود دارند
