program main;

var tablica: Array[0..1000] of Integer;
var i: integer;
var j: integer;
var tmp: integer;

procedure wygeneruj(min, max, amount: Integer);
begin;
    for i:=0 to amount-1 do
    begin;
        tablica[i] := random(max-min+1)+min;
    end;
end;

procedure wypisz(amount: Integer);
begin;
    for i:= 0 to amount-1 do
    begin;
        write(tablica[i]);
        write(' ');
    end;
    writeln('');
end;

procedure sortuj(amount: Integer);
begin;
    for i:= 1 to amount-1 do
    begin;
        for j:= 0 to amount-1-i do
        begin;
            if tablica[j+1] < tablica[j] then
            begin;
                tmp := tablica[j+1];
                tablica[j+1] := tablica[j];
                tablica[j] := tmp;
            end;
        end;
    end;
end;

procedure test_wygeneruj_1();
var test_result: boolean = true;
begin;
    wygeneruj(-100, -10, 17);
    for i:= 0 to 16 do
    begin;
        if (tablica[i] < -100) or (tablica[i] > -10) then
        begin;
          test_result := false;
          break
        end;
    end;

    write('Test procedury wygeneruj nr 1: ');

    if (test_result = true) then
    begin;
        writeln('PASSED');
    end;

    if (test_result = false) then
    begin;
        writeln('FAILED');
    end;
end;

procedure test_wygeneruj_2();
var test_result: boolean = true;
begin;
    wygeneruj(0, 20, 1000);
    for i:= 0 to 999 do
    begin;
        if (tablica[i] < 0) or (tablica[i] > 20) then
        begin;
          test_result := false;
          break
        end;
    end;

    write('Test procedury wygeneruj nr 2: ');

    if (test_result = true) then
    begin;
        writeln('PASSED');
    end;

    if (test_result = false) then
    begin;
        writeln('FAILED');
    end;
end;

procedure test_wygeneruj_3();
var test_result: boolean = true;
begin;
    wygeneruj(126, 126, 1000);
    for i:= 0 to 999 do
    begin;
        if (tablica[i] < 126) or (tablica[i] > 126) then
        begin;
          test_result := false;
          break
        end;
    end;

    write('Test procedury wygeneruj nr 3: ');

    if (test_result = true) then
    begin;
        writeln('PASSED');
    end;

    if (test_result = false) then
    begin;
        writeln('FAILED');
    end;
end;


procedure test_sortuj_losowy();
var test_result: boolean = true;
begin;
    wygeneruj(0, 500, 1000);
    sortuj(1000);
    for i:= 0 to 998 do
    begin;
        if tablica[i+1] < tablica[i] then
        begin;
          test_result := false;
          break
        end;
    end;

    write('Test procedury sortuj losowy: ');

    if (test_result = true) then
    begin;
        writeln('PASSED');
    end;

    if (test_result = false) then
    begin;
        writeln('FAILED');
    end;
end;


procedure test_sortuj_odwrocona_tablica();
var test_result: boolean = true;
begin;
    for i:=0 to 999 do
    begin;
        tablica[i] := 1000-i;
    end;
    sortuj(1000);
    for i:= 0 to 998 do
    begin;
        if tablica[i+1] < tablica[i] then
        begin;
          test_result := false;
          break
        end;
    end;

    write('Test procedury sortuj odwrocona tablica: ');

    if (test_result = true) then
    begin;
        writeln('PASSED');
    end;

    if (test_result = false) then
    begin;
        writeln('FAILED');
    end;
end;



var od: integer = 0;
var doo: integer = 100;
var ile: integer = 50;

begin

    randomize;
    write('OD: ');
    writeln(od);

    write('DO: ');
    writeln(doo);

    write('ILE: ');
    writeln(ile);

    wygeneruj(od, doo, ile);

    writeln('Wygenerowane liczby:');
    wypisz(ile);

    sortuj(ile);

    writeln('Posortowane liczby:');
    wypisz(ile);

    writeln('');
    writeln('Testy:');
    test_wygeneruj_1();
    test_wygeneruj_2();
    test_wygeneruj_3();
    test_sortuj_losowy();
    test_sortuj_odwrocona_tablica();
end.
