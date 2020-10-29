# Cycle 3

## Experiment 1:

### **PL/SQL**

1. Write a PL SQL program which assigns a message and display it.
2. Write a PL SQL program to add two numbers
3. Using Varray write a PL SQL program to find total marks of each of 5 students in 2 subject
4. Using While loop write a PL SQL program to find factorial of any number
5. Using simple loop write a PL SQL program to display multiplication table of 3 upto 10
6. Write a PL SQL program to check whether a given number is prime or not
7. Write a PL/SQL block to accept customer id and update EMI value to half of its original value and display appropriate message based on the existence of the record in customer table
8. Write a PL SQL program to print the pattern
    ```
    *
    **
    ***
    ****
    *****
    ```

### 1.

#### _Program_:

```
DECLARE
    message varchar(20):= 'Hello World!';
BEGIN
    dbms_output.put_line(message);
END;
```

#### _Output:_

```
Statement processed.
Hello World!
```

### 2.

#### _Program_:

```
DECLARE
    a INTEGER(5);
    b INTEGER(5);
    c INTEGER(5);
BEGIN
    a:=5;
    b:=7;
    c:= a + b;
    dbms_output.put_line('sum is: '||c);
END;
```

#### _Output:_

```
Statement processed.
sum is: 12
```

### 3.

#### _Program_:

```
DECLARE
    type students is varray(5) of varchar2(10);
    type subject is varray(5) of integer;
    s students;
    subject_1 subject;
    subject_2 subject;
    tot_sum integer;
    max_val integer;
BEGIN
    s := students('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    subject_1 := subject(95,90,89,88,95);
    subject_2 := subject(99,98,98,90,99);
    max_val := s.count;
    FOR i in 1..max_val LOOP
        tot_sum := subject_1(i) + subject_2(i);
        dbms_output.put_line('Student: ' || s(i) );
        dbms_output.put_line('MARKS TOTAL: '|| tot_sum );
    END LOOP;
END;
```

#### _Output:_

```
Statement processed.
Student: Kavita
MARKS TOTAL: 194
Student: Pritam
MARKS TOTAL: 188
Student: Ayan
MARKS TOTAL: 187
Student: Rishav
MARKS TOTAL: 178
Student: Aziz
MARKS TOTAL: 194
```


### 4.

#### _Program_:

```
DECLARE
    num integer;
    i integer;
    fact integer;
BEGIN
    num := 10;
    i := 1;
    fact := 1;
    while i <= num
    LOOP
    EXIT WHEN num = 0;
        fact := fact * i;
        i := i + 1;
    END LOOP;
    dbms_output.put_line('factorial of ' || num || ' is ' || fact );
END;
```

#### _Output:_

```
Statement processed.
factorial of 10 is 3628800
```

### 5.

#### _Program_:

```
DECLARE
    num integer;
    i integer;
BEGIN
    num := 3;
    i := 0;
    for i in 0..10 LOOP
        dbms_output.put_line(' '|| num || ' x ' || i || ' = ' || num * i);
    END LOOP;
END;
```

#### _Output:_

```
Statement processed.
 3 x 0 = 0
 3 x 1 = 3
 3 x 2 = 6
 3 x 3 = 9
 3 x 4 = 12
 3 x 5 = 15
 3 x 6 = 18
 3 x 7 = 21
 3 x 8 = 24
 3 x 9 = 27
 3 x 10 = 30
```

### 6.

#### _Program_:

```
DECLARE
    q integer;
    i integer;
    prime integer;
BEGIN
    i := 2;
    prime := 1;
    q := 10;
    for i in 2..q-1 LOOP
        if mod(q, i) = 0
        then
            prime := 0;
        end if;
    END LOOP;
    if prime=1
    then
        dbms_output.put_line('prime number');
    else
        dbms_output.put_line('non-prime number');
    end if;
END;
```

#### _Output:_

```
Statement processed.
non-prime number
```

### 7.

#### _Program_:

```
create table customer (
    c_name varchar(20),
    c_id int primary key,
    emi float
);

DECLARE
    cursor clist is
        select * from customer;
    cid integer := 0;
    flag integer := 0;
BEGIN
    insert into customer values('milan', 1, 100);
    insert into customer values('risal', 2, 150);
    insert into customer values('sahil', 3, 100);
    FOR n IN clist LOOP
        dbms_output.put_line('Customer: '|| n.c_name ||' ID: '|| n.c_id || ' EMI: '|| n.emi/2);
    END LOOP;
    cid := 1;
    FOR n IN clist LOOP
        if n.c_id = cid
        then
            flag:=1;
        end if;
    END LOOP;
    if flag=1
    then
        dbms_output.put_line('Customer found!');
    else
        dbms_output.put_line('Customer not found!');
    end if;
END;
```

#### _Output:_

```
Statement processed.
Customer: milan ID: 1 EMI: 50
Customer: risal ID: 2 EMI: 75
Customer: sahil ID: 3 EMI: 50
Customer found!
```

### 8.

#### _Program_:

```
DECLARE
    i integer;
    j integer;
BEGIN
    i:=0;
    for i in 1..6 LOOP
        dbms_output.put_line(' ');
        for j in 1..i LOOP
            dbms_output.put('*');
        END LOOP;
    END LOOP;
END;
```

#### _Output:_

```
Statement processed.
* 
** 
*** 
**** 
*****
```

## Experiment 2:

### **PL/SQL PROCEDURE**

1. Create a procedure to find the minimum of two numbers
2. Create a procedure to find the factorial of n numbers
3. Create a procedure to convert a user input binary number to its decimal number
4. Create a procedure to find roots of a quadratic equation
5. Using procedure increment the salary with 20 percent for the staff whose id is given by user. 

### 1.

#### _Program_:

```
DECLARE
    a number;
    b number;
    c number;

PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
    IF x < y THEN
        z := x;
    ELSE
        z := y;
    END IF;
END;
BEGIN
    a := 10;
    b := 20;
    findMin(a, b, c);
    dbms_output.put_line('Minimum of (10, 20) : ' || c);
END;
```

#### _Output:_

```
Statement processed.
Minimum of (10, 20) : 10
```

### 2.

#### _Program_:

```
DECLARE
    num int;
    i int := 1;
    fact int := 1;
PROCEDURE findfact(X IN INTEGER, Z OUT INTEGER) is
BEGIN
    i := 1;
    Z := 1;
    WHILE i<=X
    LOOP
        exit when X = 0;
        Z := Z * i;
        i := i + 1;
    END LOOP;
END;
BEGIN
    num := 5;
    findfact(num, fact);
    dbms_output.put_line('factorial of ' || num || ' is ' || fact);
END;
```

#### _Output:_

```
Statement processed.
factorial of 5 is 120
```

### 3.

#### _Program_:

```
DECLARE
    bin varchar(4);
    deci integer;
    digits integer;
    current_digit varchar(1);
    current_digit_dec integer;
    i integer;
    res integer;
PROCEDURE bindec(bin in VARCHAR,res OUT INTEGER) is
BEGIN
    i := 1;
    res := 0;
    digits := LENGTH(bin);
    FOR i IN 1..digits LOOP
        current_digit := SUBSTR(bin, i, 1);
        current_digit_dec := TO_NUMBER(current_digit);
        res := (res * 2) + current_digit_dec;
    END LOOP;
END;
BEGIN
    bin := '1010';
    bindec(bin, deci);
    dbms_output.put_line('decimal equivalent of '|| bin || ' = ' || deci);
END;
```

#### _Output:_

```
Statement processed.
decimal equivalent of 1010 = 10
```


### 4.

#### _Program_:

```
DECLARE
    A number;
    B number;
    C number;
    D number;
PROCEDURE quad(A in number,B in number,C in number) is
BEGIN
    D := B * B - 4 * A * C;
    if A = 0 then
        dbms_output.put_line('Not a quadratic equation.');
        return;
    end if;
    if D = 0 then
        dbms_output.put_line('x = ' || to_char(-B/2/A));
    elsif D > 0 then
        dbms_output.put_line('x1 = ' || to_char((-B-sqrt(D))/2/A));
        dbms_output.put_line('x2 = ' || to_char((-B+sqrt(D))/2/A));
    else
        dbms_output.put_line('x1 = (' || to_char(-B/2/A) || ', ' ||
        to_char(sqrt(-D)/2/A) || ')');
        dbms_output.put_line('x2 = (' || to_char(-B/2/A) || ', ' ||
        to_char(-sqrt(-D)/2/A) || ')');
    end if;
END;

BEGIN
    A:=1;
    B:=-3;
    C:=2;
    quad(A,B,C);
END;
```

#### _Output:_

```
Statement processed.
x1 = 1
x2 = 2
```

### 5.

#### _Program_:

```
CREATE TABLE STAFF (
    S_ID INTEGER NOT NULL,
    SALARY INTEGER
);

DECLARE
    staff_id integer;
    s_id int;
    sal float;
    
PROCEDURE update_salary(n IN number) is
BEGIN
    update staff set salary = salary * 1.2 where s_id = n;
END;

BEGIN
    INSERT INTO STAFF VALUES(300,1000);
    INSERT INTO STAFF VALUES(450,2000);
    INSERT INTO STAFF VALUES(500,3000);
    staff_id := 450;
    update_salary(staff_id);
END;
```

#### _Output:_

```
Statement processed.
```


## Experiment 3:

### **PL/SQL FUNCTIONS**

1. Create a function to find the factorial of n numbers
2. Create a function to find the reverse of a given number and also check whether the number is palindrome or not
3. Create a function to check the given number is armstrong or not
4. Create a function to find sum of n natural numbers and also insert it into a table having attributes number and sum
5. Create a function to find square root and cube root of a given number and then insert it into table having attributes number, squareroot and cuberoot

### 1.

#### _Program_:

```
DECLARE
    f integer;
    n integer;
FUNCTION fact(num in number)
RETURN number
IS
    res_fact number := 1;
BEGIN
    for i in 1..n loop
    res_fact := res_fact * i;
    end loop;
    return res_fact;
END;

BEGIN
    n := 5;
    f := fact(n);
    dbms_output.put_line('factorial of ' || n || ' is ' || f);
END;
```

#### _Output:_

```
Statement processed.
factorial of 5 is 120
```

### 2.

#### _Program_:

```
DECLARE
    num number;
    temp number;
    rev number;
    n number;

FUNCTION reverse(num integer)
RETURN number
IS
    rev number;
BEGIN
    rev := 0;
    temp := num;
    while temp>0
    LOOP
        n := mod(temp,10);
        rev := (rev*10) + n;
        temp := floor(temp/10);
    END LOOP;
    return rev;
END;
BEGIN
    num := 12321;
    rev : =reverse(num);
    if num  =rev
    then
        dbms_output.put_line('palindrome');
    else
        dbms_output.put_line('not palindrome');
    end if;
END;
```

#### _Output:_

```
Statement processed.
palindrome
```

### 3.

#### _Program_:

```
DECLARE
    num number;
    temp number;
    sm number;
    n number;
FUNCTION armstrong(num integer)
RETURN number
IS
    sm number;
BEGIN
    sm := 0;
    temp := num;
    while temp > 0
    LOOP
        n := mod(temp,10);
        sm := sm + power(n,3);
        temp := floor(temp/10);
    END LOOP;
    return sm;
END;
BEGIN
    num := 153;
    sm := armstrong(num);
    if num = sm
    then
        dbms_output.put_line('armstrong'); 
    else
        dbms_output.put_line('not armstrong');
    end if;
END;
```

#### _Output:_

```
Statement processed.
armstrong
```


### 4.

#### _Program_:

```
create table sn(
    num integer,
    sum integer
);

DECLARE
    sm number;
    tmp number;
    n number;
    i number;

FUNCTION sumn(n integer)
RETURN number
IS
    sm number;
BEGIN
    sm := 0;
    tmp := n;
    for i in 1..tmp LOOP
        sm := sm + i;
    END LOOP;
    return sm;
END;
BEGIN
    n := 10;
    sm := sumn(n);
    dbms_output.put_line('sum of ' || n || ' is ' || sm);
    insert into sn values(n, sm);
END;
```

#### _Output:_

```
Table created.

Statement processed.
sum of 10 is 55
```

### 5.

#### _Program_:

```
create table list(
    num integer,
    sqrt float,
    cbrt float
);

DECLARE
    s float;
    c float;
    n number;
    i number;

FUNCTION sqrt(n integer)
RETURN float
IS
    s float;
BEGIN
    s:= POWER(n, 0.5);
    return s;
END;

FUNCTION cbrt(n integer)
RETURN float
IS
    c float;
BEGIN
    c := POWER(n,0.3333);
    return c;
END;

BEGIN
    n := 8;
    s := sqrt(n);
    c := cbrt(n);
    dbms_output.put_line('number: '|| n ||' square root: '|| round(s,2) ||' cube root: '|| round(c,3));
    insert into list values(n, s, c);
END;
```

#### _Output:_

```
Table created.

Statement processed.
number: 8 square root: 2.83 cube root: 2
```