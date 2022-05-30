page 81501 "SMT Rich Content List"
{
    ApplicationArea = All;
    Caption = 'Rich Content List';
    PageType = List;
    SourceTable = "SMT Content";
    UsageCategory = Lists;
    CardPageId = "SMT Summer Note Editor";
    PopulateAllFields = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(HasValue; Rec.Content.HasValue())
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has Value field.';
                    Caption = 'Has Value';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
