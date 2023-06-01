-- P2. Tính số lượng đề tài mà một giáo viênđang thực hiện.  
DROP PROCEDURE IF EXISTS SLDTGV	;
delimiter //
create procedure SLDTGV(
in pMAGV varchar(3),
out pTongDeTai int ,
out message varchar(200)
)
begin
	declare count int default 0;
	set @count = (SELECT count(*) FROM giaovien where MAGV = pMAGV);
    -- SELECT count(*) into @count FROM giaovien where MAGV = pMAGV;
    -- count = (SELECT count(*) FROM giaovien where MAGV = pMAGV);
    if( @count <> 0) THEN
			SET pTongDeTai = (SELECT count(distinct MADT) FROM thamgiadt where MAGV = pMAGV);
        ELSE
            SET message = 'Mã giáo viên không hợp lệ';
    END IF;

end //
delimiter ;




-- P6. Thực hiện thêm một phân công cho giáo viên thực hiện một công việc của đề tài: 
-- 	o Kiểm tra thông tin đầu vào hợp lệ: giáo viên phải tồn tại, 
-- công việc phải tồn tại, thời gian tham gia phải >0 
-- 	o Giáo viên chỉ tham gia đề tài cùng bộ môn với giáo viên làm chủ nhiệm đề tài đó.. 
-- 
DELIMITER //

CREATE PROCEDURE AssignTask(
    IN input_magv varchar(3),
    IN sott INT,
    IN gvcndt varchar(3),
    IN participationTime date,
    out MESSAGE_TEXT varchar(255)
)
BEGIN
    DECLARE teacherCount INT;
    DECLARE taskCount INT;
    DECLARE subjectId INT;
    DECLARE projectSubjectId INT;
    
    -- Kiểm tra giáo viên có tồn tại
    SELECT COUNT(*) INTO teacherCount FROM giaovien WHERE magv = input_magv;
    IF teacherCount = 0 THEN
         SET MESSAGE_TEXT = 'Giáo viên không tồn tại.';
    END IF;
    
    -- Kiểm tra công việc có tồn tại
    SELECT COUNT(*) INTO taskCount FROM detai WHERE madt = sott;
    IF taskCount = 0 THEN
         SET MESSAGE_TEXT = 'Công việc không tồn tại.';
    END IF;
    
    -- Kiểm tra thời gian tham gia hợp lệ
    IF participationTime <= 0 THEN
        SET MESSAGE_TEXT = 'Thời gian tham gia phải lớn hơn 0.';
    END IF;
    
    -- Lấy bộ môn của giáo viên làm chủ nhiệm đề tài
    SELECT madt FROM detai WHERE gvcndt = gvcndt INTO projectSubjectId;
    
    -- Kiểm tra giáo viên và chủ nhiệm đề tài cùng bộ môn
    SELECT subjectId FROM Teachers WHERE mgv = teacherId INTO subjectId;
    IF subjectId <> projectSubjectId THEN
        SET MESSAGE_TEXT = 'Giáo viên không tham gia cùng bộ môn với giáo viên làm chủ nhiệm đề tài.';
    END IF;
    
    -- Thực hiện phân công công việc cho giáo viên
    INSERT INTO congviec (input_magv, sott, participationTime)
    VALUES (input_magv, sott, participationTime);
    

END //

DELIMITER ;



-- P7. Thực hiện xoá một giáo viên theo mã. Nếu giáo viên có 
-- thông tin liên quan (Có thân nhân, có làm đề tài, …) thì báo lỗi. 
delimiter //
create procedure deletegv(
in input_magv varchar(3)
)
begin
declare kt_nguoithan int ;
declare kt_detai int;
declare message  varchar(255);

		SELECT COUNT(*) INTO @count FROM GIAOVIEN WHERE MAGV = input_magv;
		IF @count = 0  THEN
			SET message = CONCAT('Mã giáo viên ', input_magv, ' k tồn tại. Vui lòng chọn mã khác.');
		END IF;
        
		select count(*) into kt_nguoithan from nguoithan where magv = input_magv;
        if kt_nguoithan > 0 then 
			set message = 'không thể xóa vì có người thân';
		end if;
        
        select count(*) into kt_detai from thamgiadt where magv = input_magv;
        if kt_detai > 0 then
			set message = ' không thể xóa vì đang làm nhiệm vụ';
        end if;    
        
        delete from giaovien where magv = input_magv;    
         SELECT 'Xóa giáo viên thành công.' AS Message;
end //












