/* CKeditor的主配置文件，主要配置上传的路径 */
 CKEDITOR.editorConfig =  function (config) {
    config.filebrowserUploadUrl =  '/upload' ;      //文件上传路径
    config.filebrowserImageUploadUrl =  '/upload' ; //图片上传路径
    config.filebrowserFlashUploadUrl =  '/upload' ; //flash上传路径
    config.language =  "zh-cn" ;                    //配置语言属性
    config.image_previewText = " ";                 //预览区域显示内容
    config.height = 350;                            //默认显示高度
    config.toolbar =                                //自定义工具栏
    	 [
    	     ['Cut','Copy','Paste','PasteText','PasteFromWord'],
    	     ['Undo','Redo','RemoveFormat'],
    	     ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    	     ['NumberedList','BulletedList','-','Outdent','Indent'],
    	     ['Link','Unlink','Anchor'],
    	     ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    	     '/',
    	     ['Styles','Format','Font','FontSize'],
    	     ['TextColor','BGColor'],
    	     ['Maximize']
    	 ];

}; 