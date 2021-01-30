DECLARE
    n number := 5; 
    i number; 
    j number; 
BEGIN
    for i in 0.. n
    LOOP
        dbms_output.new_line; 
        for j in 1..n-i 
        LOOP
            dbms_output.put('*'); 
        END LOOP; 
    END LOOP;
    for i in 2..n 
    LOOP
        for j in 1..i 
        LOOP
            dbms_output.put('*'); 
        END LOOP; 
        dbms_output.new_line; 
    END LOOP; 
END; 