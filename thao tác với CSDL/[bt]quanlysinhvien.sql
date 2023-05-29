-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select address, count(studentid) SLHV from student 
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select st.studentid, avg(m.mark) from mark m
join student st on st.studentid = m.studentid
group by studentid;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 9
select st.studentid, avg(m.mark) DTB from mark m
join student st on st.studentid = m.studentid
group by studentid
having DTB >= 10;

--  Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

select st.studentid, avg(m.mark) from mark m
join student st on st.studentid = m.studentid
group by st.studentid
having avg(m.mark) >= all (select avg(mark) from mark group by st.studentid);






