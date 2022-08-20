function execute(input, output) {
    var prdDtlBody = input.prdDtlBody;
    var policyBeginDate = input.policyBeginDate;
    var currentData = prdDtlBody.planInfo.currentData;
    var clauses = prdDtlBody.planInfo.clauses;
    var productComponent = input.productComponent; //工具
    var premCurrents = prdDtlBody.planInfo.premCalcAttrs;
    var attrInfo = prdDtlBody.attrInfo;

    var premCurrentMap = {};
    for (var i = 0, len = premCurrents.length; i < len; i++) {
        premCurrentMap[premCurrents[i].enName] = premCurrents[i];
    }


    //保障额度
    var currentpolicyamount = currentData.policy_amount;
    //起保日期
    var beginDate=prdDtlBody.meta.policyDate.begin;
    //生日
    var birthday = prdDtlBody.planInfo.currentData.birthday;
    //被保人年龄
    var age = productComponent.getAge(premCurrentMap.birthday.calculateCode, birthday, beginDate);
    
    //起保日期
    var beginDate=prdDtlBody.meta.policyDate.begin;
    if (currentpolicyamount == '100万'){
        attrInfo.bid='DC24';
        attrInfo.clauses.remove(6);
        attrInfo.clauses.remove(5);
        attrInfo.clauses.remove(3);
        attrInfo.clauses.remove(1);
    }else if(currentpolicyamount == '300万'){
        attrInfo.bid='DC25';
        attrInfo.clauses.remove(6);
        attrInfo.clauses.remove(3);
        attrInfo.clauses.remove(1);
    }else if (currentpolicyamount == '950万'){
        attrInfo.bid='DC26';
    }

    //保障期限
    var periodVal = productComponent.getPolicyPeriod(currentData.policy_period);
    prdDtlBody.meta.policyDate.end = productComponent.calcEndDate(prdDtlBody.meta.policyDate.begin,periodVal,age);
    prdDtlBody.meta.policyDate.period = productComponent.getPolicyPeriod(currentData.policy_period); //这一步的作用是自核保可直接获取保障期限出来用


}