/**
 * Created by CHENSHUANG on 2016/11/12.
 */
function LTrim(str){
    var whitespace = new String(" \t\n\r");
    var s = new String(str);

    if (whitespace.indexOf(s.charAt(0)) != -1){
        var j=0, i = s.length;
        while (j < i && whitespace.indexOf(s.charAt(j)) != -1){
            j++;
        }
        s = s.substring(j, i);
    }
    return s;
}


function RTrim(str){
    var whitespace = new String(" \t\n\r");
    var s = new String(str);

    if (whitespace.indexOf(s.charAt(s.length-1)) != -1){
        var i = s.length - 1;
        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1){
            i--;
        }
        s = s.substring(0, i+1);
    }
    return s;
}


function Trim(str){
    return RTrim(LTrim(str));
}
/*
 function check(){
 var txt=document.getElementById("keyword").value;

 var siteid=document.getElementById("siteid").value;
 txt=txt.replace(/\\/g," ");
 txt=Trim(txt);
 if(txt==""||txt==null)
 {
 alert("请输入检索词!");
 return false;
 }
 var _title="";
 var _content="";

 var _kwArray=txt.split(" ");
 for (var i=0;i<(_kwArray.length);i++ )
 {
 var _var=_kwArray[i];
 if(_var.length>=1){
 if(i==0){
 _title="doctitle='"+_kwArray[i]+"'";
 _content="doccontent='"+_kwArray[i]+"'";
 }else{
 _title=_title+" and doctitle='"+_kwArray[i]+"'";
 _content=_content+" and doccontent='"+_kwArray[i]+"'";
 }
 }
 }

 txt="(("+_title+") or ("+_content+")) and (siteid='"+siteid+"') and (docstatus='10') ";
 if(document.getElementById("secondsearch").checked==true && document.getElementById("searchword").value!="")
 {
 txt ="("+txt +") and ("+ document.getElementById("searchword").value+")" ;

 }

 document.getElementById("searchword").value=txt;

 return true;
 }
 function search(){

 var txt=document.getElementById("keyword").value;

 var siteid=document.getElementById("siteid").value;
 txt=txt.replace(/\\/g," ");
 txt=Trim(txt);
 if(txt==""||txt==null)
 {
 alert("请输入检索词!");
 return false;
 }

 var _title="";
 var _content="";

 var _kwArray=txt.split(" ");
 for (var i=0;i<(_kwArray.length);i++ )
 {
 var _var=_kwArray[i];
 if(_var.length>=1){
 if(i==0){
 _title="doctitle='"+_kwArray[i]+"'";
 _content="doccontent='"+_kwArray[i]+"'";
 }else{
 _title=_title+" and doctitle='"+_kwArray[i]+"'";
 _content=_content+" and doccontent='"+_kwArray[i]+"'";
 }
 }
 }
 txt="(("+_title+") or ("+_content+")) and (siteid="+siteid+") and (docstatus=10) ";

 document.getElementById("searchword").value=txt;

 return true;
 }
 function load(){
 document.getElementById("keyword").value="";
 }

 var isIE = /MSIE/i.test(window.navigator.userAgent);
 function read()
 {

 if(document.getElementById("keyword").value==""){
 var data = document.getElementById("keyword");
 if(isIE) {
 data.load("savesomething");
 data.value = data.getAttribute("keepit");
 } else {
 var value = window.globalStorage['savesomething'].getItem("keepit");
 data.value = value;
 }
 }else{
 save();
 }

 }
 function save()
 {
 var data = document.getElementById("keyword");
 if(isIE) {
 data.setAttribute("keepit",data.value);
 data.save("savesomething");
 } else {
 window.globalStorage['savesomething'].setItem("keepit",data.value);
 }
 }


 */


