--PL/SQL variable declaration and print value

set serveroutput on
DECLARE 
item_title items.title%type;
item_category items.category%type;
BEGIN
SELECT title,category INTO item_title,item_category FROM items WHERE publisher LIKE 'apress';
dbms_output.put_line('TITLE: '||item_title|| ' CATEGORY: '||item_category);
END;
/

--Insert and set default value
set serveroutput on
DECLARE
  v_user_id users.user_id%TYPE := 'john123';
  v_name users.name%TYPE := 'John';
  v_gender users.gender%TYPE := 'Male';
  v_email users.email%TYPE := 'john@example.com';
  v_phone users.phone%TYPE := '1234567890';
  v_password users.password%TYPE := 'password123';
BEGIN
  INSERT INTO users (user_id, name, gender, email, phone, password)
  VALUES (v_user_id, v_name, v_gender, v_email, v_phone, v_password);
  DBMS_OUTPUT.PUT_LINE('Data inserted successfully');
END;
/
--Row type usage
set serveroutput on
DECLARE
  v_item items%ROWTYPE;
BEGIN
  SELECT *
  INTO v_item
  FROM items
  WHERE item_no = 1;
  
  DBMS_OUTPUT.PUT_LINE('Item No: ' || v_item.item_no);
  DBMS_OUTPUT.PUT_LINE('Title: ' || v_item.title);
  DBMS_OUTPUT.PUT_LINE('Category: ' || v_item.category);
  DBMS_OUTPUT.PUT_LINE('Publisher: ' || v_item.publisher);
  DBMS_OUTPUT.PUT_LINE('Year of Publication: ' || v_item.year_of_publication);
  DBMS_OUTPUT.PUT_LINE('Floor: ' || v_item.floor);
  DBMS_OUTPUT.PUT_LINE('Shelf No: ' || v_item.shelf_no);
END;
/

--Cursor and row count usage
set serveroutput on
DECLARE
  CURSOR c_items IS
    SELECT *
    FROM items;
    
  v_item items%ROWTYPE;
  v_rowcount NUMBER := 0;
BEGIN
  OPEN c_items;
  
  LOOP
    FETCH c_items INTO v_item;
    EXIT WHEN c_items%NOTFOUND;
    
    -- Process the fetched data here
    DBMS_OUTPUT.PUT_LINE('Item No: ' || v_item.item_no);
    DBMS_OUTPUT.PUT_LINE('Title: ' || v_item.title);
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_item.category);
    DBMS_OUTPUT.PUT_LINE('Floor: ' || v_item.floor);
    DBMS_OUTPUT.PUT_LINE('Shelf No: ' || v_item.shelf_no);
  
    v_rowcount := v_rowcount + 1;
  END LOOP;
  CLOSE c_items;
  DBMS_OUTPUT.PUT_LINE('Total Rows: ' || v_rowcount);
END;
/

--FOR LOOP/ARRAY with extend() function
set serveroutput on
DECLARE
  TYPE admin_array IS TABLE OF admin%ROWTYPE;
  v_admins admin_array := admin_array();
BEGIN
  -- Populating the array with data from admin table using a cursor
  FOR admin_rec IN (SELECT * FROM admin) LOOP
    v_admins.EXTEND;
    v_admins(v_admins.LAST) := admin_rec;
  END LOOP;
  
  -- Displaying the initial array values
  FOR i IN 1..v_admins.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('User ID: ' || v_admins(i).user_id);
    DBMS_OUTPUT.PUT_LINE('Role: ' || v_admins(i).role);
    DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_admins(i).transaction_id);
  END LOOP;
  
  -- Adding a new admin to the array
  v_admins.EXTEND;
  v_admins(v_admins.LAST).admin_id := 'new_admin';
  v_admins(v_admins.LAST).user_id := 'new_user';
  v_admins(v_admins.LAST).role := 'new_role';
  v_admins(v_admins.LAST).transaction_id := 111.111;
  
  -- Displaying the modified array values
  FOR i IN 1..v_admins.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('User ID: ' || v_admins(i).user_id);
    DBMS_OUTPUT.PUT_LINE('Role: ' || v_admins(i).role);
    DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_admins(i).transaction_id);
  END LOOP;
END;
/

--IF /ELSEIF /ELSE usage
set serveroutput on
DECLARE
  v_fine NUMBER;
BEGIN
  -- Querying the fine amount from user_history table
  SELECT fine INTO v_fine
  FROM user_history
  WHERE item_no = 1;
  
  -- Checking the fine amount and providing a message based on the range
  IF v_fine = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No fine is applicable.');
  ELSIF v_fine <= 20 THEN
    DBMS_OUTPUT.PUT_LINE('Fine amount: ' || v_fine || ' USD. Please pay within 14 days.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Fine amount: ' || v_fine || ' USD. Please pay immediately.');
  END IF;
END;
/

--simple FUNCTION usage
CREATE OR REPLACE FUNCTION countTransactions(
  p_user_id IN users.user_id%TYPE
) RETURN NUMBER
IS
  v_count NUMBER;
BEGIN
  -- Retrieve the count of transactions for the specified user
  SELECT COUNT(*) INTO v_count
  FROM transactions
  WHERE user_id = p_user_id;
  
  RETURN v_count;
END;
/

DECLARE
  v_user_id users.user_id%TYPE := 'sonjoy1';
  v_transaction_count NUMBER;
BEGIN
  v_transaction_count := countTransactions(v_user_id);
  DBMS_OUTPUT.PUT_LINE('Transaction Count for User ID ' || v_user_id || ': ' || v_transaction_count);
END;
/


--simple Procedure usage
CREATE OR REPLACE PROCEDURE updateEmail(
  p_user_id IN users.user_id%TYPE,
  p_new_email IN users.email%TYPE
)
AS
BEGIN
  -- Update the email address for the specified user
  UPDATE users
  SET email = p_new_email
  WHERE user_id = p_user_id;
  
  DBMS_OUTPUT.PUT_LINE('Email address updated successfully for User ID: ' || p_user_id);
END;
/

BEGIN
  updateEmail('sonjoy1', 'sonjoy@example.com');
END;
/

--dropping procedure and function
drop procedure updateEmail;
drop function countTransactions;