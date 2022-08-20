function execute(input, output) {
    //v5
    logger.info("input---------------->>" + input)
    var BigDecimal = Java.type('java.math.BigDecimal');
    var Double = Java.type('java.lang.Double');

    var policyBeginDate = input.policyBeginDate;
    var beginDate = input.prdDtlBody.meta.policyDate.begin; //生效日
    var attrMap = input.rateComponent.getAttrMap(input.prdDtlBody);
    var jobClass = input.data.job_class;
    var policyAmount = input.data.policy_amount;

    //营业面积
    var business_areaSize = input.data.business_areaSize;
    //意外医疗
    var medicalAmount = input.data.medical_amount;
    //意外住院津贴
    var allowanceAmount = input.data.allowance_amount;
    //保障期限
    var policyPeriod = input.data.policy_period;

    var policyAmountMap={};
    policyAmountMap['100万']=1;
    policyAmountMap['200万']=2;
    policyAmountMap['300万']=3;
    policyAmountMap['400万']=4;
    policyAmountMap['500万']=5;
    policyAmountMap['600万']=6;
    policyAmountMap['700万']=7;
    policyAmountMap['800万']=8;
    policyAmountMap['900万']=9;
    policyAmountMap['1000万']=10;

    var areaSizeMap={};
    areaSizeMap['20平米（含）以下']=298;
    areaSizeMap['20（不含）-100（含）平米']=598;
    areaSizeMap['100（不含）-300（含）平米']=798;
    areaSizeMap['300（不含）-1000（含）平米']=1198;
    areaSizeMap['1000（不含）-3000（含）平米']=1598;

    var medicalAmountMap={};
    medicalAmountMap['不投保']=0;
    medicalAmountMap['0万']=0;
    medicalAmountMap['50万']=798;
    medicalAmountMap['100万']=1598;
    medicalAmountMap['200万']=2298;
    medicalAmountMap['300万']=2998;
    medicalAmountMap['500万']=4998;

    var allowanceAmountMap={};
    allowanceAmountMap['不投保']=0;
    allowanceAmountMap['0万']=0;
    allowanceAmountMap['0元/天']=0;
    allowanceAmountMap['20万']=500;
    allowanceAmountMap['20元/天']=500;

    logger.info("=====input=====" + input);
    logger.info("=============policyAmountMap[policyAmount]" + policyAmountMap[policyAmount]);
    logger.info("=============medicalAmountMap[medicalAmount]" + medicalAmountMap[medicalAmount]);
    logger.info("=============allowanceAmount" + allowanceAmount);
    logger.info("=============allowanceAmountMap[allowanceAmount]" + allowanceAmountMap[allowanceAmount]);
    logger.info("=============areaSizeMap[business_areaSize]" + areaSizeMap[business_areaSize]);

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
