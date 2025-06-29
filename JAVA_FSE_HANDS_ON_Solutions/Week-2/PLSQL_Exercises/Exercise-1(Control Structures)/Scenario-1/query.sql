BEGIN
  FOR res IN (
    SELECT c.name, c.customerID, l.loanID, l.interestRate
    FROM loans l
    JOIN customers c ON l.customerID = c.customerID
    WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, c.dob) / 12) > 60
  ) LOOP
    UPDATE loans
    SET interestRate = res.interestRate - 1
    WHERE loanID = res.loanID;
  END LOOP;
END;

