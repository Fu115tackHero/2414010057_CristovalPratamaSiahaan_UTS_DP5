program kembalianUang;
uses crt;

var
    kembalian, sisa : real;
    jumlah : integer;

begin
clrscr;
    
    write('Masukkan jumlah kembalian: '); 
    readln(kembalian);

    if (kembalian >= 100000) then
        begin
            writeln('gak mungkin ada kembalian 100.000 ke atas');
            exit;
        end
    else if (kembalian < 100) then
        begin
            writeln('Gak punya uang kembalian di bawah 100');
            exit;
        end;
    
    jumlah := 0;
    sisa := kembalian; 
    
    {dimulai 75.000 karena gak mungkin ada kembalian 100.000}
    while (sisa >= 75000) do
        begin
            sisa := sisa - 75000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 50000) do
        begin
            sisa := sisa - 50000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 20000) do
        begin
            sisa := sisa - 20000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 10000) do
        begin
            sisa := sisa - 10000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 5000) do
        begin
            sisa := sisa - 5000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 2000) do
        begin
            sisa := sisa - 2000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 1000) do
        begin
            sisa := sisa - 1000;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 500) do
        begin
            sisa := sisa - 500;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 200) do
        begin
            sisa := sisa - 200;
            jumlah := jumlah + 1;
        end;
    
    while (sisa >= 100) do
        begin
            sisa := sisa - 100;
            jumlah := jumlah + 1;
        end;
    
    writeln('Jumlah lembaran atau koin: ', jumlah);

end.
