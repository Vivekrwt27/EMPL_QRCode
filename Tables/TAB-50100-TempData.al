table 50100 "Temp Data"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Field1; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Field2; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Field3; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Field4; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Field5; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Field6; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Field7; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Field8; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Field9; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Field10; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Field12; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Field13; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}