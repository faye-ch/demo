package com.faye.demo.ex.dclone;

import lombok.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/1
 **/
@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Account extends SerialClone{

    private Long id;

    private String name;

    private AccountDetail detail;

}
