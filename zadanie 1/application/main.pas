program main;

var tablica: Array[0..49] of Integer;
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

var od: integer = 0;
var doo: integer = 100;
var ile: integer = 50;

begin

    randomize;
    write('OD: ');
    write(od);
    writeln('');

    write('DO: ');
    write(doo);
    writeln('');

    write('ILE: ');
    write(ile);
    writeln('');

    wygeneruj(od, doo, ile);

    writeln('Wygenerowane liczby:');
    wypisz(ile);

    sortuj(ile);

    writeln('Posortowane liczby:');
    wypisz(ile);
    
end.
