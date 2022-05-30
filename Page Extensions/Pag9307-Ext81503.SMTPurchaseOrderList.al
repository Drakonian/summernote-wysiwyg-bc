pageextension 81503 "SMT Purchase Order List" extends "Purchase Order List" //9307
{
    actions
    {
        addlast(processing)
        {
            action("SMT Content")
            {
                ApplicationArea = All;
                Image = Text;
                Caption = 'HTML Content';
                ToolTip = 'HTML Content';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Content: Record "SMT Content";
                    RichContentList: Page "SMT Rich Content List";
                begin
                    Clear(RichContentList);
                    Content.FilterGroup(4);
                    Content.SetRange("Source Record ID", Rec.RecordId());
                    RichContentList.SetTableView(Content);
                    RichContentList.Run();
                end;
            }
        }
    }
}
