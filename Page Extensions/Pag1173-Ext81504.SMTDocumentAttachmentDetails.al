pageextension 81504 "SMTDocument Attachment Details" extends "Document Attachment Details" //1173
{
    actions
    {
        addlast(processing)
        {
            action("SMT Edit HTML")
            {
                ApplicationArea = All;
                Image = Text;
                Caption = 'Edit HTML';
                ToolTip = 'Edit HTML';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                Enabled = Rec."File Extension" = 'html';
                trigger OnAction()
                var
                    RichContent: Page "SMT Summer Note Doc Attachment";
                begin
                    RichContent.SetRecord(Rec);
                    RichContent.SetTableView(Rec);
                    RichContent.Run();
                end;
            }
        }
    }
}
