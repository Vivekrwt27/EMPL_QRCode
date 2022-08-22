tableextension 50200 MyExtension200 extends "Sales Invoice Header"
{
    fields
    {
        field(50050; "QR-Code"; Blob)
        {
            Subtype = Bitmap;
        }
    }
}