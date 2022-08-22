xmlport 50001 "Import Sales Cr Memo Data"
{
    Permissions = tabledata "Temp Data" = rimd;
    Format = VariableText;

    schema
    {
        textelement(PermissionSets)
        {
            tableelement(TempData; "Temp Data")
            {
                CalcFields = Field10;
                fieldelement(No; TempData.Code)
                {

                }
                /*
                fieldelement(TimeofRemovalofGoods; TempData.Field1)
                {

                }
                fieldelement(VehicleNo1; TempData.Field2)
                {

                }

                fieldelement(DateandTimeofPreInv; TempData.Field3)
                {

                }
                fieldelement(CFormAmt; TempData.Field4)
                {

                }
                fieldelement(DateofRemovalofGoods; TempData.Field5)
                {

                }

                fieldelement(IRNNo; TempData.Field6)
                {

                }
                fieldelement(AckNo; TempData.Field7)
                {

                }
                fieldelement(AckDates; TempData.Field8)
                {

                }
                fieldelement(AckNo1; TempData.Field9)
                {

                }
                */
                textelement(QR_Code)
                {

                }

                trigger OnBeforeInsertRecord()
                begin
                    Message(QR_Code);
                end;
            }
        }
    }

    trigger OnPreXmlPort()
    var
        RecTempData: Record "Temp Data";
    begin
        RecTempData.RESET;
        RecTempData.DeleteAll;
    end;
}