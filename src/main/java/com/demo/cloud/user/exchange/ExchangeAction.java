package com.demo.cloud.user.exchange;

import java.io.Serializable;

/**
 * MQ通用交换消息动作定义
 */
public class ExchangeAction<T> implements Serializable {


    /**
     * 新增订单
     */
    public static final String ADD_ORDER_ACTION = "ADD_ORDER_ACTION";

    /**
     * 取消订单
     */
    public static final String CANCEL_ORDER_ACTION = "CANCEL_ORDER_ACTION";

    /**
     * 财务
     */
    public static final String FINANCIAL_ACTION = "FINANCIAL_ACTION";


}
