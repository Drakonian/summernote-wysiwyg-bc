page 81502 "SMT Summer Note Doc Attachment"
{
    Caption = 'Summer Note Editor';
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Document Attachment";

    layout
    {
        area(Content)
        {
            group(GrpEditor)
            {
                Caption = 'Editor';
                usercontrol(SMTEditor; "SMT Editor")
                {
                    ApplicationArea = All;
                    trigger ControlAddinReady()
                    begin
                        NewData := Rec.SMTGetContent();
                        CurrPage.SMTEditor.InitializeSummerNote(NewData);
                    end;

                    trigger onBlur(Data: Text)
                    begin
                        NewData := Data;
                    end;
                }
            }

        }
    }

    trigger OnClosePage()
    begin
        Rec.SMTSetContent(NewData);
    end;

    var
        NewData: Text;
}