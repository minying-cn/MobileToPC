<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PCQrCode.aspx.cs" Inherits="MobileToPC.PCQrCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>上传图片</title>
    <script src="Scripts/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.qrcode.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="code"></div>
        <div id="buttondiv">
            <input type="button" id="btnCreateQR" value="上传手机图片" />
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
        $(function () {
            //URL演示
            $("#btnCreateQR").click(function () {
                var urlTxt = "http://127.0.0.1:1016/UploadImg.aspx";
                if (urlTxt.indexOf("http://") < 0) {
                    urlTxt = 'http://' + urlTxt;
                }
                $("#buttondiv").hide(500);
                outputQRCod(urlTxt, 300, 300);
            });
        });

        //中文字符处理
        function toUtf8(str) {
            var out, i, len, c;
            out = "";
            len = str.length;
            for (i = 0; i < len; i++) {
                c = str.charCodeAt(i);
                if ((c >= 0x0001) && (c <= 0x007F)) {
                    out += str.charAt(i);
                } else if (c > 0x07FF) {
                    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                    out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                } else {
                    out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                }
            }
            return out;
        }

        //生成二维码
        function outputQRCod(txt, width, height) {
            //先清空
            $("#code").empty();
            //中文格式转换
            var str = toUtf8(txt);
            //生成二维码
            $("#code").qrcode({
                render: "table",
                width: width,
                height: height,
                text: str
            });
        }
    </script>