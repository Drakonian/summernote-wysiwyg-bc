page 81500 "SMT Summer Note Editor"
{
    Caption = 'Summer Note Editor';
    PageType = Card;
    UsageCategory = None;
    SourceTable = "SMT Content";

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
                        CurrPage.SMTEditor.InitializeSummerNote(Rec.GetContent());
                    end;

                    trigger OnChange(Data: Text)
                    begin
                        Rec.SetContent(Data);
                    end;
                }
            }

        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.FilterGroup(4);
        if Rec.GetFilter("Source Record ID") <> '' then
            evaluate(Rec."Source Record ID", Rec.GetFilter("Source Record ID"));
        Rec.FilterGroup(0);
    end;
}