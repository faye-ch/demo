function execute(input, output) {
    var orderDtlBody = input.orderDtlBody;
    var prdDtlBody = input.prdDtlBody;
    var productComponent = input.productComponent;

    if (!orderDtlBody || !orderDtlBody.meta || !orderDtlBody.products) {
        output.errCode = "E01";
        output.errMsg = "参数不完整";
        return;
    }

    var meta = orderDtlBody.meta;
    var product = orderDtlBody.products[0];
    var insured = product.insured[0];

    var prdAttrInfo = prdDtlBody.attrInfo;

    var attrs = prdDtlBody.planInfo.premCalcAttrs;
    var attrsObj = {};
    for (var i = 0; i < attrs.length; i++) {
        attrsObj[attrs[i].enName] = attrs[i];
    }
    logger.debug("common_check_order coming...");
    //判断维度属性
    var props = product.props;
    for (var p in props) {
        var attr = attrsObj[p];
        if (!attr) {
            output.errCode = "E29";
            output.errMsg = "商品不存在[" + p + "]维度属性";
            return;
        }
        
        if(p == "policy_begin_date" || p == "policy_end_date" || p == "custom_premium"){//选定的日期及自定义保费，无法校验值
            continue;
        }
        var ext = attr.values.ext;
        var options = attr.values.options;
        var opt_index = -1;
        if (options && options.length > 0) {
            for (var i = 0; i < options.length; i++) {
                if (options[i] == "" + props[p]) {
                    opt_index = i;
                    break;
                }
            }
            if (opt_index == -1) {
                output.errCode = "E30";
                output.errMsg = "商品[" + p + "]维度属性值不正确";
                return;
            }
        }
        // if (p == "sex") {
        //     if (insured.sex != attr.currentData) {
        //         output.errCode = "E31";
        //         output.errMsg = "被保人性别与产品指定性别不一致";
        //         return;
        //     }
        // }
        if (p == "birthday") {
            var range = ext.range_ext;
            if (!range) {
                range = (ext.option_ext)[opt_index].range;
            }
            //var min = calBeforeDate(range[0], true, product.policy_begin_date.parseDate());
            //var max = calBeforeDate(range[1], false, product.policy_begin_date.parseDate());

            //兼容新旧两种计算年龄边界的方式，对于作用于某个产品的脚本只需选取一种计算方式
            var min;
            var max;
            if(attr.calculateCode && attr.calculateCode.trim() != ""){
                min = productComponent.getStartBirthday(attr.calculateCode, range[0], product.policy_begin_date).parseDate();
                max = productComponent.getEndBirthday(attr.calculateCode, range[1], product.policy_begin_date).parseDate();
            }else{
                min = calBeforeDate(range[0], true, product.policy_begin_date.parseDate());
                max = calBeforeDate(range[1], false, product.policy_begin_date.parseDate());
            }

            var _birthday = insured.birthday.parseDate();
            if (_birthday < min || _birthday > max) {
                output.errCode = "E32";
                output.errMsg = "被保人年龄不在规定范围内";
                return;
            }
        }
    }

    //核投保人信息
    var applier = product.applier;
    if (!applier.name || !applier.name.isValidName()) {
        output.errCode = "E09";
        output.errMsg = "投保人姓名不合法";
        return;
    }

    // if (applier.sex != "男" && applier.sex != "女") {
    //     output.errCode = "E10";
    //     output.errMsg = "投保人性别不合法，值只能为“男”或“女”";
    //     return;
    // }

    var certTypes = "身份证";
    //使用attrInfo配置的投保人证件类型(使用,隔开)，如果不配置就使用默认的身份证
    if(prdAttrInfo.appier_certification_type){
        certTypes = prdAttrInfo.appier_certification_type;
    }
    if (certTypes.indexOf(applier.certification_type) == -1) {
        output.errCode = "E11";
        output.errMsg = "投保人证件类型不合法";
        return;
    }
    if (!applier.certification_no) {
        output.errCode = "E12";
        output.errMsg = "投保人身份证号码没填";
        return;
    }
    if (!applier.email || !applier.email.isEmail()) {
        output.errCode = "E17";
        output.errMsg = "投保人邮箱没填或格式不正确";
        return;
    }
    if (!applier.mobile || !applier.mobile.isMobile()) {
        output.errCode = "E18";
        output.errMsg = "投保人手机号码没填或格式不正确";
        return;
    }
    if (applier.certification_type == "身份证") {
        var idCardObj = new clsIDCard(applier.certification_no);
        if (!idCardObj.IsValid()) {
            output.errCode = "E13";
            output.errMsg = "投保人身份证号码校验错误";
            return;
        }
        // var sex = idCardObj.GetSex() == 1 ? "男": "女";
        // if (applier.sex != sex) {
        //     output.errCode = "E14";
        //     output.errMsg = "投保人性别与身份证性别不符";
        //     return;
        // }
        // if (applier.birthday != idCardObj.GetBirthDate()) {
        //     output.errCode = "E15";
        //     output.errMsg = "投保人出生日期与身份证不符合";
        //     return;
        // }
    }

    //核被保人信息
    if (!insured.name || !insured.name.isValidName()) {
        output.errCode = "E19";
        output.errMsg = "被保人姓名不合法";
        return;
    }

    // if (insured.sex != "男" && insured.sex != "女") {
    //     output.errCode = "E20";
    //     output.errMsg = "被保人性别不合法，值只能为“男”或“女”";
    //     return;
    // }

    // if (!insured.birthday) {
    //     output.errCode = "E21";
    //     output.errMsg = "被保人出生日期没有填写";
    //     return;
    // }

    if (!insured.certification_no) {
        output.errCode = "E23";
        output.errMsg = "被保人身份证号码没填";
        return;
    }

    var insuredCertTypes = "身份证";
    //使用attrInfo配置的投保人证件类型(使用,隔开)，如果不配置就使用默认的身份证
    if(prdAttrInfo.insured_certification_type){
        insuredCertTypes = prdAttrInfo.insured_certification_type;
    }
    if (insured.certification_type == "身份证") {
        var idCardObj = new clsIDCard(insured.certification_no);
        if (!idCardObj.IsValid()) {
            output.errCode = "E24";
            output.errMsg = "被保人身份证号码校验错误";
            return;
        }
        // var sex = idCardObj.GetSex() == 1 ? "男": "女";
        // if (insured.sex != sex) {
        //     output.errCode = "E25";
        //     output.errMsg = "被保人性别与身份证性别不符";
        //     return;
        // }
        // if (insured.birthday != idCardObj.GetBirthDate()) {
        //     output.errCode = "E26";
        //     output.errMsg = "被保人出生日期与身份证不符合";
        //     return;
        // }
    // }else if (insured.certification_type == "户口簿") {
    //     var insuredAge;
    //     //兼容新旧两个计算年龄的方式，对于作用于某个产品的脚本只需选取一种计算方式
    //     if (attrsObj.birthday && attrsObj.birthday.calculateCode && attrsObj.birthday.calculateCode.trim() != '') { //新方式，针对于设置了calculateCode的维度
    //         insuredAge = productComponent.getAge(attrsObj.birthday.calculateCode, insured.birthday, product.policy_begin_date);
    //     } else {
    //         //旧方式
    //         insuredAge = new calAge(insured.birthday, product.policy_begin_date).getYear();
    //     }
    //     if (insuredAge > 16) {
    //         output.errCode = "E34";
    //         output.errMsg = "户口簿只支持16岁以下使用";
    //         return;
    //     }
    // }else if (insured.certification_type == "出生证") {
    //     var insuredAge;
    //     //兼容新旧两个计算年龄的方式，对于作用于某个产品的脚本只需选取一种计算方式
    //     if (attrsObj.birthday && attrsObj.birthday.calculateCode && attrsObj.birthday.calculateCode.trim() != '') { //新方式，针对于设置了calculateCode的维度
    //         insuredAge = productComponent.getAge(attrsObj.birthday.calculateCode, insured.birthday, product.policy_begin_date);
    //     } else {
    //         //旧方式
    //         insuredAge = new calAge(insured.birthday, product.policy_begin_date).getYear();
    //     }
    //     if (insuredAge >= 3) {
    //         output.errCode = "E34";
    //         output.errMsg = "被保人年龄超过3周岁，不可使用出生医学证明，请使用其他有效证件投保。";
    //         return;
    //     }
    // } else if (insured.certification_type == "其他") {
    //     if (!insured.certification_no.isDate()) {
    //         output.errCode = "E27";
    //         output.errMsg = "其他证件只允许填写出生日期";
    //         return;
    //     }
    //     if (insured.birthday != insured.certification_no) {
    //         output.errCode = "E28";
    //         output.errMsg = "被保人出生日期与证件不符合";
    //         return;
    //     }
    } else if (insuredCertTypes.indexOf(insured.certification_type) == -1){
        output.errCode = "E33";
        output.errMsg = "被保人证件类型不正确";
        return;
    }

    if (prdAttrInfo.insured_relation && prdAttrInfo.insured_relation.data.indexOf(insured.insured_relation) == -1) {
        output.errCode = "E22";
        output.errMsg = "投保人与被保人关系跟商品信息不匹配";
        return;
    }

    var applierAgeObj = new calAge(applier.birthday);
    var applierAge = applierAgeObj.getYear();
    var minApplierAge = 18;//默认18周岁
    var maxApplierAge = 80;//默认999周岁（不限制年龄）
    //投保人年龄校验
    if(attrsObj.applier_birthday){
        applierAge = productComponent.getAge(attrsObj.applier_birthday.calculateCode, applier.birthday, product.policy_begin_date);
        minApplierAge = productComponent.getAge(attrsObj.applier_birthday.calculateCode, attrsObj.applier_birthday.values.ranges[1], product.policy_begin_date);
        maxApplierAge = productComponent.getAge(attrsObj.applier_birthday.calculateCode, attrsObj.applier_birthday.values.ranges[0], product.policy_begin_date);
    }else if(prdAttrInfo.applier_age && prdAttrInfo.applier_age_range){//attrInfo配置了投保人年龄信息，"applier_age":{"calculate_code":"SNF", "value":"/018/00/00-/80/00/00"}
        var calCode = prdAttrInfo.applier_age.calculate_code;
        var minApplierAgeRange = prdAttrInfo.applier_age_range[1];
        var maxApplierAgeRange = prdAttrInfo.applier_age_range[0];
        applierAge = productComponent.getAge(calCode, applier.birthday, product.policy_begin_date);
        minApplierAge = productComponent.getAge(calCode, minApplierAgeRange, product.policy_begin_date);
        maxApplierAge = productComponent.getAge(calCode, maxApplierAgeRange, product.policy_begin_date);
    }

    if (applierAge < minApplierAge) {
        output.errCode = "E16";
        output.errMsg = "投保人需年满" + minApplierAge + "周岁";
        return;
    }
    if (applierAge > maxApplierAge) {
        output.errCode = "E16";
        output.errMsg = "投保人需小于" + maxApplierAge + "周岁";
        return;
    }


    var insuredAge;
    //新版关系校验模板逻辑
    var applierInsuredRelationBase = product.attr_info ? product.attr_info.applier_insured_relation_base : 1;
    //兼容新旧两个计算年龄的方式，对于作用于某个产品的脚本只需选取一种计算方式
    if (attrsObj.birthday && attrsObj.birthday.calculateCode && attrsObj.birthday.calculateCode.trim() != "") { //新方式，针对于设置了calculateCode的维度
        insuredAge = productComponent.getAge(attrsObj.birthday.calculateCode, insured.birthday, product.policy_begin_date);
    } else { //旧方式
        insuredAge = new calAge(insured.birthday, product.policy_begin_date).getYear();
    }
    if ((applierInsuredRelationBase != 2 && insured.insured_relation != "父母")
        || (applierInsuredRelationBase == 2 && insured.insured_relation != "子女")) {
        if (insuredAge < 18) {
            output.errCode = "E34";
            if (applierInsuredRelationBase == 2) {
                output.errMsg = "被保人年龄小于18周岁时， 投保关系仅限子女";
            } else {
                output.errMsg = "被保人年龄小于18周岁时， 投保关系仅限父母";
            }

            return;
        }
    }

    if (insured.insured_relation == "父母") {
        //applierInsuredRelationBase，1=投保人是被保人的（旧版本使用），2=被保人是投保人的（新版使用）
        if (applierInsuredRelationBase == 2) {
            if (applier.birthday <= insured.birthday) {
                output.errCode = "E36";
                output.errMsg = "父母关系下，投保人年龄需小于被保人年龄";
                return;
            }
            /**if (insuredAge-applierAge < 18) {
				output.errCode = "E37";
				output.errMsg = "被保人与投保人关系为“父母”或“子女”时，投被保人年龄差距不得小于18岁";
				return;
			}*/
        } else {
            if (applier.birthday >= insured.birthday) {
                output.errCode = "E36";
                output.errMsg = "父母关系下，投保人年龄需大于被保人年龄";
                return;
            }
        }
    }

    if (insured.insured_relation == "子女") {
        if (applierInsuredRelationBase == 2) {
            if (applier.birthday >= insured.birthday) {
                output.errCode = "E37";
                output.errMsg = "子女关系下，投保人年龄需大于被保人年龄";
                return;
            }
            /**if (applierAge-insuredAge < 18 ) {
				output.errCode = "E37";
				output.errMsg = "被保人与投保人关系为“父母”或“子女”时，投被保人年龄差距不得小于18岁";
				return;
			}*/
        } else {
            if (applier.birthday <= insured.birthday) {
                output.errCode = "E37";
                output.errMsg = "子女关系下，投保人年龄需小于被保人年龄";
                return;
            }
        }
    }
    if (insured.insured_relation == "配偶") {
        if((applier.sex == "男" && insured.sex == "男") || (applier.sex == "女" && insured.sex == "女")){
            output.errCode = "E35";
            output.errMsg = "配偶关系下，投保人与被保人应为异性";
            return;
        }
    }

    //校验受益人
    //logger.info("ben123-----------------product.insured:"+product.insured);
    var benifits = insured.benifits;
    var benifitLength = 3;//默认三个，从attrInfo取配置值，如果有则用它
    if(null != benifits) {
        if(prdAttrInfo.benifitLength){
            benifitLength = prdAttrInfo.benifitLength;
        }
        if( benifits.length>benifitLength) {
            output.errCode = "E43";
            output.errMsg = "受益人数量不能超过" + benifitLength + "个";
            return;
        }

        var parentNum = 0;
        var DadNum = 0;
        var MomNum = 0;
        var couple = 0;
        for (var i=0;i<benifits.length;i++) {
            var identityCard = benifits[i].certification_no;

            var len = (identityCard + "").length;
            var strBirthday = "";
            if (len == 18)//处理18位的身份证号码从号码中得到生日和性别代码
            {
                strBirthday = identityCard.substr(6, 4) + "-" + identityCard.substr(10, 2) + "-" + identityCard.substr(12, 2);
            }
            if (len == 15) {
                strBirthday = "19" + identityCard.substr(6, 2) + "-" + identityCard.substr(8, 2) + "-" + identityCard.substr(10, 2);
            }

            var benifitAgeObj = new calAge(strBirthday);
            var benifitSex = benifits[i].sex;

            //受益人姓名校验
            var beNameReg = /^[u4E00-u9FA5]{2,4}$/;
            if(!benifits[i].name || !benifits[i].name.isValidName()){
                output.errCode = "E61";
                output.errMsg = "受益人姓名不合法，请检查重新输入";
                return;
            }

            //受益人身份证有效期判定
            if(benifitAgeObj.getYear() >=16  && benifitAgeObj.getYear()< 46){
                var certification_valid_date = benifits[i].id_type_validate;
                certification_valid_date = certification_valid_date.parseDate();

                if( benifitAgeObj.getYear() >=16  && benifitAgeObj.getYear()< 26  ) {
                    certification_valid_date = certification_valid_date.addYears(-10);
                }else if( benifitAgeObj.getYear() >= 26  &&  benifitAgeObj.getYear()< 46 ) {
                    certification_valid_date = certification_valid_date.addYears(-20);
                }
                logger.info("certification_valid_date================"+certification_valid_date);
                var toDay = new Date();
                if( certification_valid_date > toDay ) {
                    var n = i+1;
                    output.errMsg = "受益人"+n+"身份证有效期止期不正确，请重新输入";
                    return;
                }
            }


            //统计父母关系时父母的人数
            if(benifits[i].relation_to_insured == "父母"){
                parentNum++;
                if(benifitSex == "男"){
                    DadNum++;
                }else{
                    MomNum++;
                }
            }
            //被保人与受益人关系为“父母”或“子女”时，投被保人年龄差距不得小于18岁
            if(insured.insured_relation == "本人"){
                if (benifits[i].relation_to_insured == "父母") {
                    if (benifitAgeObj.getYear()-applierAge < 18 ) {
                        output.errCode = "E51";
                        output.errMsg = "被保人与受益人关系为“父母”或“子女”时，被保人与受益人年龄差距不得小于18岁";
                        return;
                    }
                }

                if (benifits[i].relation_to_insured == "子女") {
                    if (applierAge - benifitAgeObj.getYear() < 18 ) {
                        output.errCode = "E51";
                        output.errMsg = "被保人与受益人关系为“父母”或“子女”时，被保人与受益人年龄差距不得小于18岁";
                        return;
                    }
                }
            }else{
                if (benifits[i].relation_to_insured == "父母") {
                    if (benifitAgeObj.getYear()-insuredAge < 18 ) {
                        output.errCode = "E51";
                        output.errMsg = "被保人与受益人关系为“父母”或“子女”时，被保人与受益人年龄差距不得小于18岁";
                        return;
                    }
                }

                if (benifits[i].relation_to_insured == "子女") {
                    if (insuredAge - benifitAgeObj.getYear() < 18 ) {
                        output.errCode = "E51";
                        output.errMsg = "被保人与受益人关系为“父母”或“子女”时，被保人与受益人年龄差距不得小于18岁";
                        return;
                    }
                }
            }

            //被保人与受益人关系为配偶时，校验
            if (benifits[i].relation_to_insured == "配偶") {
                if((benifitSex == "男" && insured.sex == "男") || (benifitSex == "女" && insured.sex == "女")){
                    output.errCode = "E35";
                    output.errMsg = "被保人与受益人关系为配偶时，投保人与被保人应为异性";
                    return;
                }
                if(benifitSex == "男" && insured.sex == "女"){
                    if(benifitSex < 22 || insuredAge < 20){
                        output.errCode = "E52";
                        output.errMsg = "被保人与受益人关系为配偶时，男性年龄不得小于22周岁，女性年龄不得小于20周岁";
                        return;
                    }
                }else if(insured.sex == "男" && benifitSex == "女"){
                    if(benifitSex < 20 || insuredAge < 22){
                        output.errCode = "E52";
                        output.errMsg = "被保人与受益人关系为配偶时，男性年龄不得小于22周岁，女性年龄不得小于20周岁";
                        return;
                    }
                }
                couple ++;
            }
        }
        if(parentNum > 2){
            output.errCode = "E50";
            output.errMsg = "受益人关系为父母关系时最多只能有一个父亲和一个母亲";
            return;
        }
        if(DadNum > 1 || MomNum>1){
            output.errCode = "E50";
            output.errMsg = "受益人关系为父母关系时最多只能有一个父亲和一个母亲";
            return;
        }
        if(couple > 1){
            output.errCode = "E54";
            output.errMsg = "受益人关系为配偶关系时最多只能有一个";
            return;
        }

    }

    //核保费
    if (parseFloat(insured.prem).toFixed(2) != parseFloat(prdDtlBody.meta.price).toFixed(2)) {
        output.errCode = "E02";
        output.errMsg = "被保人保费不正确";
        return;
    }

    var total_price = (parseFloat(insured.prem) * parseInt(insured.copies)).toFixed(2);
    if (total_price != parseFloat(meta.total_price).toFixed(2)) {
        output.errCode = "E03";
        output.errMsg = "订单中的保费不一致";
        return;
    }
    //核起保日期
    var policyDate = prdDtlBody.meta.policyDate;
    var period = policyDate.period;
    if (!policyDate) {
        output.errCode = "E04";
        output.errMsg = "不存在policy_date参数";
        return;
    }
    if (!period || ["D", "M", "Y", "A"].indexOf(period.substr(period.length - 1, 1)) == -1) {
        output.errCode = "E05";
        output.errMsg = "policy_date参数不合法";
        return;
    }
    var validPolicyBeginDate = policyDate.begin.parseDate();
    var validPolicyBeginEndDate = policyDate.end.parseDate();

    if (!product.policy_begin_date || !product.policy_end_date) {
        output.errCode = "E06";
        output.errMsg = "参数缺少起保或终保时间";
        return;
    }
    var policy_begin_date = product.policy_begin_date.parseDate();
    var policy_end_date = product.policy_end_date.parseDate();

    if (policy_begin_date < validPolicyBeginDate || policy_begin_date > validPolicyBeginEndDate) {
        output.errCode = "E07";
        output.errMsg = "起保日期不在有效范围内";
        return;
    }

    var validPolicyEndDate = policy_begin_date;

    var isMarchSt = false;
    if (validPolicyEndDate.getMonth() == 2 && validPolicyEndDate.getDate() == 1) {
        isMarchSt = true;
    }

    validPolicyEndDate.addDays( - 1);
    var periodNum = parseInt(period.substr(0, period.length - 1));
    if (period.endsWith("D")) {
        validPolicyEndDate = policy_begin_date.addDays(periodNum);
    } else if (period.endsWith("M")) {
        validPolicyEndDate = policy_begin_date.addMonths(periodNum);
    } else if (period.endsWith("Y")) {
        validPolicyEndDate = policy_begin_date.addYears(periodNum);
    } else if (period.endsWith("A")) {
        if (!insured.birthday) {
            output.errCode = "E21";
            output.errMsg = "被保人出生日期没有填写";
            return;
        }
        validPolicyEndDate = insured.birthday.parseDate().addYears(periodNum+1).addDays(-1);
    }

    if (isMarchSt && ((validPolicyEndDate.getFullYear() % 4) == 0) && ((validPolicyEndDate.getFullYear() % 100) != 0) || ((validPolicyEndDate.getFullYear() % 400) == 0)) {
        if (validPolicyEndDate.getMonth() == 1 && validPolicyEndDate.getDate() == 28) {
            validPolicyEndDate.addDays( + 1);
        }
    }

    if (validPolicyEndDate > policy_end_date || validPolicyEndDate < policy_end_date) {
        output.errCode = "E08";
        output.errMsg = "终保日期计算错误";
        return;
    }


}