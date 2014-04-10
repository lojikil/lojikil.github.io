program zdlin(input, output);
uses
    Classes, SysUtils;
var
    buffer : TStringList;
    line : string;
    idx, tmp0, tmp1 : integer;
begin
    buffer := TStringList.create;
    idx := 0;
    write('> ');
    readln(line);
    while line <> 'q' do
    begin
        if line = 'p' then
        begin
            for tmp0 := 0 to idx do
            begin
                writeln(buffer[tmp0]);
            end;
        end
        else if line = 'i' then
        begin
            readln(line);
            while line <> '.' do
            begin
                idx := buffer.add(line);
                readln(line);
            end;
        end
        else
            writeln('Unknown command: ', line);
        write('> ');
        readln(line);
    end;
    buffer.Free;
end.
