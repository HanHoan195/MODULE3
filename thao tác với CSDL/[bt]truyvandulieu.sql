-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where studentname like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(startdate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set classid = 2 where studentname = 'hung' ;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.studentname, sub.subname, m.mark
from student s join mark m on s.studentid = m.studentid
<<<<<<< HEAD
join subject sub on sub.subid = m.subid;
=======
join subject sub on sub.subid = m.subid;
>>>>>>> efa5da184c6cf5e5521d4223af4a5a85a5588e0b
