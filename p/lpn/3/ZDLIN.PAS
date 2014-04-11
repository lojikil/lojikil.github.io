program zdlin(input, output);
uses
    Classes, SysUtils;
var
    buffer : TStringList;
    line, src : string;
    idx, tmp0, tmp1, tmp2 : integer;
begin
    buffer := TStringList.create;
    src := ParamStr(1);
    buffer.LoadFromFile(src);
    idx := buffer.count - 1;
    write('> ');
    readln(line);
    while line <> 'q' do
    begin
        if line = 'p' then
        begin
            if idx > 0 then
            begin
                for tmp0 := 0 to idx do
                begin
                    writeln(buffer[tmp0]);
                end;
            end;
        end
        else if line = 'P' then // should prompt for a range
        begin
            if idx > 0 then
            begin
                for tmp0 := 0 to idx do
                begin
                    writeln(inttostr(tmp0),': ', buffer[tmp0]);
                end;
            end;
        end
        else if line = 'd' then
        begin
            write('at: ');
            readln(line);
            Val(line, tmp0, tmp1);
            buffer.delete(tmp0);
            Dec(idx);
        end
        else if line = 'D' then
        begin
            write('start: ');
            readln(line);
            Val(line, tmp0, tmp1);
            write('end: ');
            readln(line);
            Val(line, tmp1, tmp2);
            for tmp2 := tmp0 to tmp1 do
            begin
                buffer.delete(tmp0); // buffer shrinks each time
            end;
            idx := buffer.count - 1;
        end
        else if line = 'I' then
        begin
            write('at: ');
            readln(line);
            Val(line, tmp0, tmp1);
            readln(line);
            tmp1 := tmp0;
            while line <> '.' do
            begin
                buffer.insert(tmp0, line);
                Inc(tmp0);
                readln(line);
            end;
            Inc(idx, tmp0 - tmp1);
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
    buffer.SaveToFile(src);
    buffer.Free;
end.
