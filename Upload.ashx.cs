using System.Collections;
using System.Web;

namespace MobileToPC
{
    /// <summary>
    /// Upload 的摘要说明
    /// </summary>
    public class Upload : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            //上传配置
            int size = 2;           //文件大小限制,单位MB
            string[] filetype = { ".gif", ".png", ".jpg", ".jpeg", ".bmp" };

            //上传图片
            Hashtable info = new Hashtable();
            UploadHelper up = new UploadHelper();
            string path = "/upload/images";

            info = up.upFile(context, path + '/', filetype, size);  //获取上传状态
            context.Response.Write(info["url"]);  //向浏览器返回数据json数据
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}