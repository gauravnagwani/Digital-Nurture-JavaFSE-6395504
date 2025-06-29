ALTER TABLE customers ADD isVIP VARCHAR2(1);

BEGIN
  FOR res IN (
    SELECT customerID, balance
    FROM customers
    WHERE balance > 10000
  ) LOOP
    UPDATE customers
    SET isVIP = 'Y'
    WHERE customerID = res.customerID;
  END LOOP;
END;
/
