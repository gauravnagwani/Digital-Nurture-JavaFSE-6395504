DECLARE
    from_account   NUMBER := 1;
    to_account     NUMBER := 2;
    amount         NUMBER := 500;
BEGIN
    TransferFunds(from_account, to_account, amount);
END;
/
