using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;//added for Image and bitmap
using System.Drawing.Imaging;//added for PixelFormat
using System.Drawing.Drawing2D;//added for CompositingQuality
using System.IO;//added for FileInfo

namespace FSDP.DOMAIN.Services
{
    //our image service will require us to add a reference to System.Darwing
    public class ImageService
    {
        public static void ResizeImage(string savePath, string fileName, Image image, int maxImgSize, int maxThumbSize)
        {
            //Get new proportional image dimensions based off current size and maxSize
            int[] newImageSizes = GetNewSize(image.Width, image.Height, maxImgSize);

            //resize the image to new dimensions returned aboce
            Bitmap newImage = DoResizeImage(newImageSizes[0], newImageSizes[1], image);
            //save new image to path w/ filename
            newImage.Save(savePath + fileName);//overwrites original
            //thumbnail
            //calculate proportional size for thumbnail based on max thumbsize
            int[] newThumbSizes = GetNewSize(newImage.Width, newImage.Height, maxThumbSize);
            //create thumbnail image
            Bitmap newThumb = DoResizeImage(newThumbSizes[0], newThumbSizes[1], image);
            //save it with the t_ prefix
            newThumb.Save(savePath + "t_" + fileName);
            //clean up the service
            newImage.Dispose();
            newThumb.Dispose();
            image.Dispose();
        }

        public static int[] GetNewSize(int imgWidth, int imgHeight, int maxImgSize)
        {
            //calculate which dimension is being changed most and use that as aspect ratio for both sides
            float ratioX = (float)maxImgSize / (float)imgWidth;
            float ratioY = (float)maxImgSize / (float)imgWidth;
            float ratio = Math.Min(ratioX, ratioY);
            //calculate new height and width based on aspect ratio
            int[] newImgSizes = new int[2];
            newImgSizes[0] = (int)(imgWidth * ratio);
            newImgSizes[1] = (int)(imgHeight * ratio);

            //return new proportional image sizes
            return newImgSizes;
        }

        public static Bitmap DoResizeImage(int imgWidth, int imgHeight, Image image)
        {
            //convert other formats including cmyk to RGB
            Bitmap newImage = new Bitmap(imgWidth, imgWidth, PixelFormat.Format24bppRgb);

            //if image format supports transparency, apply it
            newImage.MakeTransparent();

            //set image to screen resolution of 72dpi (standard for monitors)
            newImage.SetResolution(72, 72);

            //do the resize
            using (Graphics graphics = Graphics.FromImage(newImage))
            {
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.DrawImage(image, 0, 0, imgWidth, imgHeight);
            }


            //return the resized image
            return newImage;
        }
    }
}