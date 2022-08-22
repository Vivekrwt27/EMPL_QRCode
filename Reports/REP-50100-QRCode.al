report 50100 "QR Code"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    UseRequestPage = false;
    ProcessingOnly = true;
    Permissions = tabledata "Sales Invoice Header" = rimd;

    trigger OnPreReport()
    var
        RecSalesInvoiceHeader: Record "Sales Invoice Header";
        RecRef: RecordRef;
        QRText: Text;
        QRGenerator: Codeunit "QR Generator";
        TempBlob: Codeunit "Temp Blob";
        FldRef: FieldRef;
        MyInStream: InStream;
        MyOutStream: OutStream;
        RecTempData: Record "Temp Data";
        TypeHelper: Codeunit "Type Helper";
        i: Integer;
    begin

        Clear(QRText);

        RecSalesInvoiceHeader.RESET;
        RecSalesInvoiceHeader.SetRange("No.", 'S1-22-0063');
        IF RecSalesInvoiceHeader.FindSet then begin
            RecSalesInvoiceHeader.CalcFields("QR Code");
            if RecSalesInvoiceHeader."QR Code".HasValue then begin

                RecSalesInvoiceHeader."QR Code".CreateInStream(MyInStream, TextEncoding::Windows);
                MyInStream.Read(QRText);

                RecTempData.RESET;
                RecTempData.SETRANGE(Code, 'S1-22-0063');
                if not RecTempData.FindFirst then begin
                    RecTempData.Code := 'S1-22-0063';
                    RecTempData.Field13 := QRText;
                    RecTempData.INSERT;
                end else begin
                    RecTempData.Field13 := QRText;
                    RecTempData.MODIFY;
                end;
            end;
        end;




        Clear(RecRef);
        RecRef.Get(RecSalesInvoiceHeader.RecordId);
        if QRGenerator.GenerateQRCodeImage(QRText, TempBlob) then begin
            if TempBlob.HasValue() then begin
                FldRef := RecRef.Field(RecSalesInvoiceHeader.FieldNo("QR-Code"));
                TempBlob.ToRecordRef(RecRef, RecSalesInvoiceHeader.FieldNo("QR-Code"));
                RecRef.Modify();
                Message('Done');
            end;
        end;
    end;
}