program prompttest(input, output);
var
    s : string;
begin
    write('> ');
    readln(s);
    while s <> 'q' do
    begin
        writeln('s is ', s);
        write('> ');
        readln(s);
    end;
end.
