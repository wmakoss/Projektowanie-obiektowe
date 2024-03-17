program main;

var tablica: Array[0..49] of Integer;
var i: integer;

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

begin
    randomize;
    wygeneruj();
    wypisz();
end.
