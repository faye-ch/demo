function execute(input, output) {
    //v5
    logger.info("input---------------->>" + input)
    var BigDecimal = Java.type('java.math.BigDecimal');
    var Double = Java.type('java.lang.Double');

    var policyBeginDate = input.policyBeginDate;
    var beginDate = input.prdDtlBody.meta.policyDate.begin; //生效日
    var attrMap = input.rateComponent.getAttrMap(input.prdDtlBody);
    var jobClass = input.data.job_class;
    
    //附加水管破裂责任
    var allowanceAmount = input.data.allowance_amount;
    //保障额度
    var policyAmount = input.data.policy_amount;

    var policyAmountMap={};
    policyAmountMap['100万']=1;
    policyAmountMap['300万']=2;
    policyAmountMap['950万']=3;

    var allowanceAmountMap={};
    allowanceAmountMap['不投保']=0;
    allowanceAmountMap['0万']=0;
    allowanceAmountMap['0元/天']=0;
    allowanceAmountMap['20万']=500;
    allowanceAmountMap['20元/天']=500;

    logger.info("=====input=====" + input);
    logger.info("=============policyAmountMap[policyAmount]" + policyAmountMap[policyAmount]);
    logger.info("=============allowanceAmount" + allowanceAmount);
    logger.info("=============allowanceAmountMap[allowanceAmount]" + allowanceAmountMap[allowanceAmount]);

    var mainprice = new BigDecimal(policyAmountMap[policyAmount]).multiply(new BigDecimal(areaSizeMap[business_areaSize]));
    var medicalAmountprice = new BigDecimal(medicalAmountMap[medicalAmount]);
    var allowPlanPrice = new BigDecimal(allowanceAmountMap[allowanceAmount]);

    var totalPrice = input.rateComponent.addPrice(mainprice, medicalAmountprice, allowPlanPrice).setScale(2,4);

    output.mainprice = totalPrice;
    output.price = totalPrice;
    output.dirPrice = totalPrice;
    output.allPrice = input.rateComponent.createList(mainprice + "," + mainprice + ",1", medicalAmountprice + "," + medicalAmountprice +
        ",2", allowPlanPrice + "," + allowPlanPrice + ",3");
}
