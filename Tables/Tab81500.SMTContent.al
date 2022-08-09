table 81500 "SMT Content"
{
    Caption = 'Content';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Content; Blob)
        {
            Caption = 'Content';
            DataClassification = CustomerContent;
        }
        field(4; "Source Record ID"; RecordId)
        {
            Caption = 'Source Record ID';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure SetContent(Data: Text)
    var
        OutStreamVar: OutStream;
    begin
        Clear(Content);
        Content.CreateOutStream(OutStreamVar);
        OutStreamVar.Write(Data);
        if not Rec.Modify(true) then;
    end;

    procedure GetContent() Data: Text
    var
        InStreamVar: InStream;
    begin
        CalcFields(Content);
        if not Content.HasValue() then
            exit;
        Content.CreateInStream(InStreamVar);
        InStreamVar.Read(Data);
    end;
}
