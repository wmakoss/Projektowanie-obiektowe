program main;

var tablica: Array[0..49] of Integer;
var i: integer;
var j: integer;
var tmp: integer;

procedure wygeneruj();
begin;
    for i:=0 to 49 do
    begin;
        tablica[i] := random(101);
    end;
end;

procedure wypisz();
begin;
    for i:= 0 to 49 do
    begin;
        write(tablica[i]);
        write(' ');
    end;
    writeln('');
end;

procedure sortuj();
begin;
    for i:= 1 to 49 do
    begin;
        for j:= 0 to 49-i do
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

begin
    randomize;
    wygeneruj();
    wypisz();
    sortuj();
    wypisz();
end.
