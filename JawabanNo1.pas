program tokoAHY;
uses crt, sysutils;

label
    1, 2, 3, 4;

var 
    nomor, jumlah : integer;
    harga, totalHarga, diskonTambahan, diskonMember, totalDiskon, poin, totalPoin : real;
    nama, jawaban, hari, namaAnggota : string;
    member, diskon : boolean;

begin
clrscr;
    totalPoin := 10;
    member := false;
    diskonMember := 10;
    namaAnggota := 'Anandhini'; {Anandhini adalah member toko AHY}

    write('Punya Akun Member? (y/t): '); readln(jawaban); {sebelum berbelanja, program menanya apakah dia memiliki akun member atau tidak}
    if (jawaban <> 'y') and (jawaban <> 'Y') and (jawaban <> 't') and (jawaban <> 'T') then
        begin
            writeln('BRUH GAK JELAS'); {jika jawabannya agak lain, maka yang keluar pun agak lain}
        end
    else if (jawaban = 'y') or (jawaban = 'Y') then
        begin
            write('Nama Anggota: '); readln(nama);
            if (nama = namaAnggota) then
                begin
                    member := true;
                end
            else
                begin
                    writeln('Nama Tidak Terdaftar');
                end;
        end;

    write('Hari: '); readln(hari);

    2:
    totalHarga := 0;
    jumlah := 0;

    1:
    writeln('=============TOKO AHY=============');
    writeln('PRODUK: ');
    writeln('1) Pasta Gigi------------Rp16.000');
    writeln('2) Sabun-----------------Rp7.000');
    writeln('3) Es Krim---------------Rp20.000');
    writeln('4) Sosis Ayam------------Rp30.000');
    writeln('5) Lampu LED 18 Watt-----Rp40.000');
    writeln('6) Susu------------------Rp10.000');
    writeln('0) Keluar');
    write('Pilih Barang yang ingin dibeli (nomor 1 - 6): '); readln(nomor);

    if (nomor = 0) and (jumlah = 0) then 
    begin
        exit; {jika setelah membeli barang dengan jumlah 0 (total harga = 0) dan memilih opsi nomor 0, maka program selesai atau tidak lanjut menghitung total harga atau diskon}    
    end;

    case nomor of
        1 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 16000;
            if (LowerCase(hari) = 'senin') then
                begin
                    harga := harga * 0.9; {hari senin, kategori hygine diskon 10%}
                end;
            writeln('Produk:');
            writeln(jumlah, ' Pasta Gigi Rp ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        2 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 7000;
            if (LowerCase(hari) = 'senin') then
                begin
                    harga := harga * 0.9; {hari senin, kategori hygine diskon 10%}
                end;
            writeln('Produk:');
            writeln(jumlah, ' Sabun Rp ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        3 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 20000;
            writeln('Produk:');
            writeln(jumlah, ' Es Krim Rp ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        4 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 30000;
            if (LowerCase(hari) = 'selasa') then
                begin
                    harga := harga * 0.95; {hari selasa, kategori frozen food diskon 5%}
                end;
            writeln('Produk:');
            writeln(jumlah, ' Sosis Ayam ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        5 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 40000;
            if (LowerCase(hari) = 'rabu') then
                begin
                    harga := harga * 0.7; {hari rabu, kategori elektronik diskon 30%}
                end;
            writeln('Produk:');
            writeln(jumlah, ' Lampu LED 18 Watt Rp ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        6 : begin
            write('Masukkan jumlah: '); readln(jumlah);
            harga := 10000;
            if (LowerCase(hari) = 'kamis') then
                begin
                    harga := harga * 0.92; {hari kamis, kategori laktosa diskon 8%}
                end;
            writeln('Produk:');
            writeln(jumlah, ' Susu ', (harga * jumlah):5:2);
            harga := harga * jumlah;
        end;
        0 : exit;
    end;
    
    if (jumlah >= 10) then {jika dalam 1 struk terdapat 10 barang, maka dikon 5%}
        begin
            diskon := true;
            diskonTambahan := 5;
        end;

    totalHarga := totalHarga + harga;
    writeln;
    
    4:
    write('Ingin Memilih Lagi? (y/t): '); readln(jawaban);
    if (jawaban = 'y') or (jawaban = 'Y') then
        begin
            goto 1;
        end
    else if (jawaban <> 'y') and (jawaban <> 'Y') and (jawaban <> 'T') and (jawaban <> 't') then
        begin
            goto 4; {kalau jawaban gak jelas, balik lagi ke pertanyaan}
        end
    else if (totalHarga = 0) and (jawaban = 't') or (jawaban = 'T') then
        begin
            exit; {jika tidak membeli barang sama sekali dan menjawab tidak, maka program selasai}
        end;
    writeln;

    writeln('Total: Rp', totalHarga:5:2);

    if (member) and (diskon) then {jika dia seorang member dan membeli 10 barang dalam 1 struk}
        begin
            poin := trunc(totalHarga / 50000); {menghitung poin jika dia member}
            totalDiskon := diskonMember + diskonTambahan;
            writeln('Diskon: ', diskonMember:1:0, '% + ', diskonTambahan:1:0, '% = ',  totalDiskon:1:0, '%');
            totalHarga := totalHarga - totalHarga * (totalDiskon/100);
        end
    else if (member) then {jika dia seorang member namun, ia tidak membeli barang sebanyak 10}
        begin
            poin := trunc(totalHarga / 50000); {menghitung poin jika dia member}
            writeln('Diskon: ', diskonMember:1:0, '%');
            totalHarga := totalHarga - totalHarga * (diskonMember/100);
        end
    else if (diskon) then {jika dia bukan seorang member namun membeli berang sebanyak 10}
        begin
            writeln('Diskon: ', diskonTambahan:1:0, '%');
            totalHarga := totalHarga - totalHarga * (diskonTambahan/100);
        end;
    
    writeln('Pembayaran: Rp', totalHarga:5:2);
    if (poin >= 1) then {poin hanya ditampilkan jika hasil pembagian dari total harga dengan 50.000 lebih besar atau sama dengan 1}
        begin 
            writeln('Poin: ', poin:1:0);
        end;
        
    totalPoin := totalPoin + poin; 
    if (totalPoin >= 50) then {jika memiliki 50 poin, kita dapat menukarkan menjadi voucher}
        begin
            writeln('Total Poin Anda sekarang adalah ', totalPoin:1:0);
            write('Apakah Anda ingin Menukarkannya Menjadi Voucher Diskon 20% (y/t): '); readln(jawaban);
            if (jawaban = 'y') or (jawaban = 'Y') then
                begin
                    writeln('Total Poin -50');
                    writeln('Selamat Anda Mendapatkan Vocuher Diskon 20%!');
                    totalPoin := totalPoin - 50;
                end;
        end;

    3:
    write('Ingin Belanja lagi? (y/t): '); readln(jawaban); {menanya lagi apakah dia ingin belanja lagi (agar banyak ngumpulkan poin LOL)}
    if (jawaban = 'y') or (jawaban ='Y') then
        begin
            goto 2;
        end
    else if (jawaban ='t') or (jawaban = 'T') then
        begin
            exit;
        end
    else
        begin
            goto 3; {kalau jawaban gak jelas, balik lagi ke pertanyaan}
        end;  
end.