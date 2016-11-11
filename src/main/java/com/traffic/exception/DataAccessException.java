package com.traffic.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by ZhanHeng on 2016/11/11.
 */
public class DataAccessException extends RuntimeException {

    public DataAccessException(String message) {
        super(message);
    }

    public DataAccessException(String message, Throwable cause) {
        super(message, cause);
    }
}
