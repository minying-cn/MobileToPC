<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadImg.aspx.cs" Inherits="MobileToPC.UploadImg" %>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>移动端文件上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="//cdn.bootcss.com/jquery-mobile/1.4.5/jquery.mobile.min.css" />
    <link rel="stylesheet" href="css/zyupload-1.0.0.min.css" />
    <script src="//cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/jquery-mobile/1.4.5/jquery.mobile.js"></script>
    <script src="Scripts/zyupload.basic-1.0.0.min.js" type="text/javascript"></script>
</head>
<body>
    <div data-role="page">
        <div data-role="header" data-position="fixed">
            <h1>移动端文件上传</h1>
        </div>
        <div class="ui-content">
            <div id="zyupload" class="zyupload"></div>
        </div>
        <div data-role="footer" data-position="fixed">
            <h1>移动端文件上传</h1>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $(function () {
            // 初始化插件
            $("#zyupload").zyUpload({
                width: screen.width > 650 ? "650px" : screen.width,                 // 宽度
                height: "400px",                 // 高度
                itemWidth: "140px",                 // 文件项的宽度
                itemHeight: "115px",                 // 文件项的高度
                url: "Upload.ashx",  // 上传文件的路径
                fileType: ["jpg", "png", "jpeg", "gif"],// 上传文件的类型
                fileSize: 51200000,                // 上传文件的大小
                multiple: true,                    // 是否可以多个文件上传
                dragDrop: false,                   // 是否可以拖动上传文件
                tailor: false,                   // 是否可以裁剪图片
                del: true,                    // 是否可以删除文件
                finishDel: false,  				  // 是否在上传文件完成后删除预览
                /* 外部获得的回调接口 */
                onSelect: function (selectFiles, allFiles) {    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
                    console.info("当前选择了以下文件：");
                    console.info(selectFiles);
                },
                onDelete: function (file, files) {              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
                    console.info("当前删除了此文件：");
                    console.info(file.name);
                },
                onSuccess: function (file, response) {          // 文件上传成功的回调方法
                    console.info("此文件上传成功：");
                    console.info(file.name);
                    console.info("此文件上传到服务器地址：");
                    console.info(response);
                    $("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
                },
                onFailure: function (file, response) {          // 文件上传失败的回调方法
                    console.info("此文件上传失败：");
                    console.info(file.name);
                },
                onComplete: function (response) {           	  // 上传完成的回调方法
                    console.info("文件上传完成");
                    console.info(response);
                    alert("文件全部上传完成！");
                }
            });

        });
    });
</script>
