SET SERVEROUTPUT ON;

BEGIN
  FOR res IN (
    SELECT l.loanID, l.endDate, c.name, c.customerID
    FROM loans l
    JOIN customers c ON l.customerID = c.customerID
    WHERE l.endDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || res.loanID || 
                         ' for customer ' || res.name || 
                         ' (ID: ' || res.customerID || 
                         ') is due on ' || TO_CHAR(res.endDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/
