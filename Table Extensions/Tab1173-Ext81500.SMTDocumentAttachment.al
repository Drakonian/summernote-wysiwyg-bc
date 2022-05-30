tableextension 81500 "SMT Document Attachment" extends "Document Attachment" //1173
{
    procedure SMTSetContent(Data: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        OutStreamVar: OutStream;
        InStreamVar: InStream;
    begin
        Clear("Document Reference ID");
        TempBlob.CreateInStream(InStreamVar);
        TempBlob.CreateOutStream(OutStreamVar);
        OutStreamVar.Write(Data);
        "Document Reference ID".ImportStream(InStreamVar, 'html');
    end;

    procedure SMTGetContent() Data: Text
    var
        TempBlob: Codeunit "Temp Blob";
        InStreamVar: InStream;
        OutStreamVar: OutStream;
    begin
        if not "Document Reference ID".HasValue() then
            exit;
        TempBlob.CreateInStream(InStreamVar);
        TempBlob.CreateOutStream(OutStreamVar);
        "Document Reference ID".ExportStream(OutStreamVar);
        InStreamVar.Read(Data);
    end;
}
