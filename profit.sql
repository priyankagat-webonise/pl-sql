create procedure total_profit()
 BEGIN
  DECLARE o_cost INTEGER DEFAULT 0;
  DECLARE total INTEGER DEFAULT 0;
  DECLARE tc INTEGER DEFAULT 0;
  DECLARE oi1 INTEGER DEFAULT 0;
  DECLARE cnt INTEGER DEFAULT 0;
  DECLARE sp INTEGER DEFAULT 0;
  DECLARE oi2 INTEGER DEFAULT 0;
  DECLARE sub INTEGER DEFAULT 0;
  DECLARE done INTEGER DEFAULT 0;
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE order_cur CURSOR FOR SELECT order_id,order_cost from orders where month(date)>=month(CURDATE())-1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  OPEN order_cur;

  BEGIN
   DECLARE ordered_cur CURSOR FOR SELECT order_id,sale_price from ordered;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
   OPEN ordered_cur;
    get_order : LOOP 
    FETCH order_cur INTO oi1,tc;
     get_ordered : LOOP
     FETCH ordered_cur INTO oi2,sp;
      
      IF done=0 THEN
       IF oi1 = oi2 THEN
        SET sub=sp-tc;
       END IF;
       ELSE
        LEAVE get_ordered;
      END IF;
      SET total=total+sub;
     END LOOP get_ordered;
    IF finished THEN
     LEAVE get_order;
    END IF;
    LEAVE get_order;
    END LOOP get_order;
  select total;
   close ordered_cur;
  END;
 close order_cur;
 END;

