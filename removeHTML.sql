CREATE FUNCTION `removeHTML`(strText longtext) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    DETERMINISTIC
BEGIN
declare nPos1, nPos2 int;

set nPos1 = InStr(strText, "<");
While nPos1 > 0 DO
set nPos2 = locate( ">", strText, nPos1 + 1);
If nPos2 > 0 Then
set strText = concat(Left(strText, nPos1 - 1), Mid(strText, nPos2 + 1));
End If;
set nPos1 = InStr(strText, "<");

END WHILE;
return strText;
END