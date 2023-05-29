-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject` sb where credit =(select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject sb
join mark m on sb.subid = m.subid
where mark = ( select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(m.mark) as dtb from student s
join mark m on s.studentid = m.studentid
group by m.studentid
order by avg(mark) DESC;