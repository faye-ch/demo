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
public class AccountDetail  extends SerialClone{

    private Long accountId;

    private String email;


}
