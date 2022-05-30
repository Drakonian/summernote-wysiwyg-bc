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
                        CurrPage.SMTEditor.InitializeSummerNote(Rec.SMTGetContent());
                    end;

                    trigger OnChange(Data: Text)
                    begin
                        Rec.SMTSetContent(Data);
                    end;
                }
            }

        }
    }
}