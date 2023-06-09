use quanlysinhvien;

-- hiển thị danh sách tất các học viên
select * from student;

-- hiển thị danh sách các học viên đang học
select * from student where status = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from subject where credit < 10;

-- Hiển thị danh sách học viên lớp A1
select s.studentname, c.classname from student s join class c on s.classid = c.classid
where c.classname = 'A1' ;

-- Hiển thị điểm môn CF của các học viên.
select s.studentid, s.studentname, sub.subname, m.mark 
from student s join mark m on s.studentid = m.studentid
join subject sub on m.subid = sub.subid
where sub.subname = 'CF';

