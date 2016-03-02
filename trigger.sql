create trigger update_user_id AFTER UPDATE on users for each row BEGIN  update customer c set c.user_id= new.user_id where c.user_id= old.user_id;  END;
