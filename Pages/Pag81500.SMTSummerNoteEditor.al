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
                        NewData := Rec.GetContent();
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
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.FilterGroup(4);
        if Rec.GetFilter("Source Record ID") <> '' then
            evaluate(Rec."Source Record ID", Rec.GetFilter("Source Record ID"));
        Rec.FilterGroup(0);
        if Rec.Insert() then;
    end;

    trigger OnClosePage()
    begin
        Rec.SetContent(NewData);
    end;

    var
        NewData: Text;
}