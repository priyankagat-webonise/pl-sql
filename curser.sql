create procedure total_sale()
 BEGIN
 DECLARE o_cost INTEGER DEFAULT 0;
 DECLARE total INTEGER DEFAULT 0;
DECLARE tc INTEGER DEFAULT 0;
DECLARE finished INTEGER DEFAULT 0;
 DECLARE total_cst_cur CURSOR FOR SELECT order_cost from orders where month(date)>=month(CURDATE())-1;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
 OPEN total_cst_cur;
 get_cost : LOOP 
FETCH total_cst_cur INTO tc;
SET total=total+tc;
IF finished THEN
 LEAVE get_cost;
END IF;
 END LOOP get_cost;
 select total;
 close total_cst_cur;
END;

