package com.faye.demo.ex.dclone;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/1
 **/
public class Test {

    public static void main(String[] args) throws Exception{
        Account account = new Account();
        account.setId(1L);
        account.setName("faye");
        AccountDetail accountDetail = new AccountDetail(1L,"27272@qq.com");
        account.setDetail(accountDetail);

        Account accountClone = SerialCloneUtils.deepClone(account);
        System.out.println();
    }
}
