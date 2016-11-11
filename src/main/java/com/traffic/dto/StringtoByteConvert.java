package com.traffic.dto;

import org.apache.struts2.util.StrutsTypeConverter;

import java.util.Map;

/**
 * Created by ZhanHeng on 2016/11/11.
 */
public class StringtoByteConvert extends StrutsTypeConverter {

    /*
     * context：转换上下文，可以在里面引用各种对象，比如：可以通过context.get(ValueStack.VALUE_STACK)来引用值栈。
     * values：用户输入的字符串。 toClass：将要被转换成的对象类型。
     */
    public Object convertFromString(Map context, String[] value, Class toType) {
        // TODO Auto-generated method stub
        String content = value[0];
        byte[] content1 = content.getBytes();
        return content1;
    }

    /*
     * 实现对象向字符串的转换，它有两个参数： context：同上，也是转换的上下文。
     */
    public String convertToString(Map context, Object content) {
        // TODO Auto-generated method stub
        return content.toString();
    }
}
