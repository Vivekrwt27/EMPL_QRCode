pageextension 50200 MyExtension200 extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Location Code")
        {
            field("QR Code"; Rec."QR Code")
            {
                ToolTip = 'Specifies the value of the QR Code field.';
                ApplicationArea = All;
            }
            field("QR-Code"; Rec."QR-Code")
            {
                ToolTip = 'Specifies the value of the QR-Code field.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(Statistics)
        {
            action("Import Sales Cr Memo Data")
            {
                ApplicationArea = All;
                RunObject = xmlport "Import Sales Cr Memo Data";
            }
        }
    }
}