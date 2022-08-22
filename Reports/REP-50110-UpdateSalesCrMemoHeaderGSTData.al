report 50110 "Update Sales Cr Memo Data"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata "Sales Cr.Memo Header" = rimd;

    trigger OnPreReport()
    var
        RecTempData: Record "Temp Data";
        RecSalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin

        RecTempData.RESET;
        if RecTempData.FindSet then begin
            repeat
                RecSalesCrMemoHeader.RESET;
                RecSalesCrMemoHeader.SetRange("No.", RecTempData.Code);
                if RecSalesCrMemoHeader.FindFirst then begin
                    EVALUATE(RecSalesCrMemoHeader."Time-of Removal of Goods", RecTempData.Field1);
                    EVALUATE(RecSalesCrMemoHeader."Vehicle-No1", RecTempData.Field2);
                    EVALUATE(RecSalesCrMemoHeader."Date-and Time of Pre of Inv", RecTempData.Field3);
                    EVALUATE(RecSalesCrMemoHeader."C-Form Amount", RecTempData.Field4);
                    EVALUATE(RecSalesCrMemoHeader."Date-of Removal of Goods", RecTempData.Field5);
                    EVALUATE(RecSalesCrMemoHeader."IRN-No.", RecTempData.Field6);
                    EVALUATE(RecSalesCrMemoHeader."Ack-No.", RecTempData.Field7);
                    EVALUATE(RecSalesCrMemoHeader."Ack-Date", RecTempData.Field8);
                    EVALUATE(RecSalesCrMemoHeader."Ack-No01", RecTempData.Field9);
                    RecSalesCrMemoHeader.Modify;
                end;
            until RecTempData.Next = 0;
        end;

        /*
        RecTempData.RESET;
        if RecTempData.FindSet then
            RecTempData.DeleteAll;
        */
    end;

}