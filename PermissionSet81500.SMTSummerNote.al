permissionset 81500 "SMT Summer Note"
{
    Assignable = true;
    Caption = 'SMT Summer Note', MaxLength = 30;
    Permissions =
        table "SMT Content" = X,
        tabledata "SMT Content" = RMID,
        page "SMT Summer Note Editor" = X;
}
