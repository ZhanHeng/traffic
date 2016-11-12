/**
 * Created by CHENSHUANG on 2016/11/12.
 */
/**
 * AD Float Object
 *
 * @desc:Create a float ad with image: ad.jpg
 * @example:FloatAd.newFloatAd("image_path/ad.jpg");
 * @desc:Create a float ad with image and url: ad.jpg
 * @example:FloatAd.newFloatAd("image_path/ad.jpg", "http://blog.csdn.net/xxd851116/");
 *
 * @author: Xing,XiuDong :Last Editer
 * @date: 2009-09-17
 * @refers:	http://www.ahbofcom.gov.cn/js/FloatAd.js
 */
FloatAd = {
    "ads" : new Object,
    /**
     * @param imgUrl : image path
     * @param strLink : image link address
     * @param top : image top at starting..
     * @param left : image left at starting..
     */
    "newFloatAd" : function(imgUrl, strLink, top, left) {
        var ad = document.createElement("a");
        ad.DirV = true;
        ad.DirH = true;
        ad.AutoMove = true;
        ad.Image = new Image;
        ad.Seed = Math.random();
        ad.Timer = setInterval("FloatAd.float(" + ad.Seed + ")", 20);
        this.ads[ad.Seed] = ad;
        ad.Image.Parent = ad;
        ad.style.position = "absolute";
        ad.style.left = left || 0;
        ad.style.top = top || 0;
        ad.Image.src = imgUrl;
        ad.Image.onmouseover = function(){this.Parent.AutoMove = false;};
        ad.Image.onmouseout = function(){this.Parent.AutoMove = true;};
        if(strLink) {
            ad.href = strLink;
            ad.Image.border = 0;
            ad.target = "_blank";
        }
        ad.appendChild(ad.Image);
        document.body.appendChild(ad);
        return ad;
    },
    "float" : function(floatId){
        var ad = this.ads[floatId];
        if(ad.AutoMove){
            var curLeft = parseInt(ad.style.left);
            var curTop = parseInt(ad.style.top);
            if(ad.offsetWidth + curLeft > document.documentElement.clientWidth + document.documentElement.scrollLeft - 1){
                curLeft = document.documentElement.scrollLeft + document.documentElement.clientWidth - ad.offsetWidth;
                ad.DirH = false;
            }
            if(ad.offsetHeight + curTop > document.documentElement.clientHeight + document.documentElement.scrollTop - 1){
                curTop = document.documentElement.scrollTop + document.documentElement.clientHeight - ad.offsetHeight;
                ad.DirV = false;
            }
            if(curLeft < document.documentElement.scrollLeft) {
                curLeft = document.documentElement.scrollLeft;
                ad.DirH = true;
            }
            if(curTop < document.documentElement.scrollTop) {
                curTop = document.documentElement.scrollTop;
                ad.DirV = true;
            }
            ad.style.left = curLeft + (ad.DirH ? 1 : -1) + "px";
            ad.style.top = curTop + (ad.DirV ? 1 : -1) + "px";
        }
    }
};