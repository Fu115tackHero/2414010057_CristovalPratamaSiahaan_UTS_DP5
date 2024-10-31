program fibonacci;
uses crt;

var 
    i, n, a, b, jumlah, total : integer;

begin
clrscr;

    write('N = '); readln(n);

    a := 0;
    b := 1;
    jumlah := 0;
    total := 0;

    write('Sequence = ');
    for i := 1 to n do
    begin
        if (i = n) then
            begin
                write(a);
            end
        else
            begin
                write(a, ', ');
            end;
        total := total + a;
        jumlah := a + b;
        b := a;
        a := jumlah;
    end;
    
    writeln;
    writeln('Total = ', total);    

end. 