program IdkDontAskme;
uses crt;

var
    i, n : integer;
    harga : real;

begin
clrscr;

    write('Banyak minuman(n) :'); readln(n);
    
    for i := 1 to n do
        begin
            write('Masukkan harga minuman ke-', i, ': '); readln(harga);
            if (harga < 10000) then
                begin
                    writeln;
                    writeln('Minuman yang bisa dibeli Nala:');
                    writeln('Minuman ke-', i, ': Rp', harga:4:2);
                    writeln;
                end;
        end;
        
end.