package com.demo.cloud.user.exchange;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * MQ通用交换消息
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ExchangeMessage<T> implements Serializable {

    /***
     * 组织代码(数据来源)
     */

    String organizationCode;
    /**
     * 动作
     */
    String action;

    /**
     * 数据
     */
    T data;

}
