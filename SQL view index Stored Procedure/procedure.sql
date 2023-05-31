delimiter // 
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_giaovien`(
	IN new_magv nvarchar(3),
	IN new_hoten nvarchar(40),
	IN new_luong decimal(10,1),
	IN new_phai nvarchar(3),
	IN new_ngsinh date,
	IN new_diachi nvarchar(50),
	IN new_gvqlcm nvarchar(3),
	IN new_mabm nvarchar(4)
    )
BEGIN
	DECLARE has_error INT DEFAULT 0;
	DECLARE error_message VARCHAR(255);
	IF has_error = 0 THEN
		-- Kiểm tra xem MAGV mới truyền vào đã tồn tại hay chưa
		SELECT COUNT(*) INTO @count FROM GIAOVIEN WHERE MAGV = new_magv;
		IF @count = 0  THEN
			SET has_error = 1;
			SET error_message = CONCAT('Mã giáo viên ', new_magv, ' k tồn tại. Vui lòng chọn mã khác.');
		END IF;
		IF new_luong <= 0 THEN
			SET has_error = 1;
			SET error_message = 'Lương không hợp lệ. Vui lòng nhập lại.';
		END IF;
		IF has_error = 0 AND new_mabm IS NOT NULL THEN
			-- Kiểm tra xem MABM mới truyền vào có tồn tại trong bảng BOMON hay không
			SELECT COUNT(*) INTO @count FROM BOMON WHERE MABM = new_mabm;
			IF @count = 0 THEN
				SET has_error = 1;
				SET error_message = CONCAT('Mã bộ môn ', new_mabm, ' không tồn tại trong hệ thống. Vui lòng chọn mã khác.');
			END IF;
		END IF;
		IF has_error = 0 THEN
			UPDATE GIAOVIEN
			SET MAGV = new_magv, HOTEN = new_hoten, LUONG = new_luong, PHAI = new_phai, NGSINH = new_ngsinh, DIACHI = new_diachi, GVQLCM = new_gvqlcm, MABM = new_mabm
			WHERE MAGV = new_magv;
		END IF;
	END IF;
	IF has_error = 1 THEN
		-- Trả về thông tin lỗi
		SELECT has_error AS 'error', error_message AS 'message';
	ELSE
		-- Trả về thông tin chỉnh sửa
		SELECT has_error AS 'error', CONCAT('Đã chỉnh sửa thông tin giáo viên có mã ', new_magv, ' thành thông tin mới có mã ', new_magv, '.') AS 'message';
	END IF;	
END //
