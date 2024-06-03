** Solution 

* 1. Removing the dashes

SELECT REPLACE(SORT_CODE, '-', '')as SORT_CODE, *
        FROM PD2023_WK02_TRANSACTIONS;
        ;


* 2. Joining the Lookup Table, adding Country code column and creating IBAN column

SELECT REPLACE(SORT_CODE, '-', '')as SORT_CODE, *, 'GB' as Country_Code, 
            'GB' || check_digits || swift_code || REPLACE(SORT_CODE, '-', '') || account_number as IBAN
                    FROM PD2023_WK02_TRANSACTIONS
                        INNER JOIN PD2023_WK02_SWIFT_CODES
                                ON PD2023_WK02_TRANSACTIONS.BANK = PD2023_WK02_SWIFT_CODES.BANK
                    ;


* 3. Removing the unnecessary columns

SELECT TRANSACTION_ID, 
            'GB' || check_digits || swift_code || REPLACE(SORT_CODE, '-', '') || account_number as IBAN
                    FROM PD2023_WK02_TRANSACTIONS
                        INNER JOIN PD2023_WK02_SWIFT_CODES
                                ON PD2023_WK02_TRANSACTIONS.BANK = PD2023_WK02_SWIFT_CODES.BANK
                    ;