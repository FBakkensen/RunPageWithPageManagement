pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action(RunItem)
            {
                ApplicationArea = All;
                Caption = 'Run Item';

                trigger OnAction()
                var
                    RecAsVariant: Variant;
                    Item: Record Item;
                begin
                    Page.Run(0, Item);
                end;
            }
            action(RunGlJnlLine)
            {
                ApplicationArea = All;
                Caption = 'Run Gen. Jnl. Line';

                trigger OnAction()
                var
                    GenJournalTemplate: Record "Gen. Journal Template";
                    GenJournalLine: Record "Gen. Journal Line";
                begin
                    GenJournalTemplate.SetRange(Type, GenJournalTemplate.Type::General);
                    GenJournalTemplate.FindFirst();
                    GenJournalLine.SetRange("Journal Template Name", GenJournalTemplate.Name);
                    if not GenJournalLine.FindFirst() then
                        GenJournalLine."Journal Template Name" := GenJournalTemplate.Name;
                    Page.Run(0, GenJournalLine);
                end;
            }
            action(RunGenGlJnlLineWithPageManagement)
            {
                ApplicationArea = All;
                Caption = 'Run Gen. Jnl. Line With Page Management';

                trigger OnAction()
                var
                    GenJournalTemplate: Record "Gen. Journal Template";
                    GenJournalLine: Record "Gen. Journal Line";
                    PageManagement: Codeunit "Page Management";
                begin
                    GenJournalTemplate.SetRange(Type, GenJournalTemplate.Type::General);
                    GenJournalTemplate.FindFirst();
                    GenJournalLine.SetRange("Journal Template Name", GenJournalTemplate.Name);
                    if not GenJournalLine.FindFirst() then
                        GenJournalLine."Journal Template Name" := GenJournalTemplate.Name;
                    PageManagement.PageRun(GenJournalLine);
                end;
            }
            action(RunPaymentGlJnlLineWithPageManagement)
            {
                ApplicationArea = All;
                Caption = 'Run Payment Jnl. Line With Page Management';

                trigger OnAction()
                var
                    GenJournalTemplate: Record "Gen. Journal Template";
                    GenJournalLine: Record "Gen. Journal Line";
                    PageManagement: Codeunit "Page Management";
                begin
                    GenJournalTemplate.SetRange(Type, GenJournalTemplate.Type::Payments);
                    GenJournalTemplate.FindFirst();
                    GenJournalLine.SetRange("Journal Template Name", GenJournalTemplate.Name);
                    if not GenJournalLine.FindFirst() then
                        GenJournalLine."Journal Template Name" := GenJournalTemplate.Name;
                    PageManagement.PageRun(GenJournalLine);
                end;
            }
        }
    }
}