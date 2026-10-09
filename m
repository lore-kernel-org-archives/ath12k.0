Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8B3CA5FED
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 03:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHiDjV2z2nC3iW+RoZ7ZflGg3VrbNf1FWrGfvymicZk=; b=jVYYmODMDUF56GeY2+EKJHL+pm
	OEq0ci4lJkAsQLRzN6k+pUh9SgBxQVJ7BvAwC8ZTNw0bCHIcV/P3RyjsEaMkaqwk2trsAsBXT7/eW
	YVQLjk2O5r9kWy6CkziGWLqrH8QzK3nVP72uuHo/Hf7+fWuCFhNfK6ykJjdzQu57Vs4NjiyN0nrhh
	VC4VI89/G/ET/n65rI0hHMDFPYOToUw5XvspC9fMAOEQRTIleXtXQi7HkLIHjUBBt2XO68JUU0r92
	3elvQdmnGMBegQuldnTU27ZIOFmx3tAHiuOHmCumwuZ5mi7GXk54z99+FTYxCCDL17MSDtR0g2UoD
	kCGB29SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1RO-00000005PAK-1I7M;
	Fri, 09 Oct 2026 03:38:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1RL-00000005P9r-2CtS
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 03:38:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HCri593957
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 03:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHiDjV2z2nC3iW+RoZ7ZflGg3VrbNf1FWrGfvymicZk=; b=oD9ooEr3LacX78wA
	Tus3NYLBUEx1A7UifeuGG9suKY7jEL2hncthcoUCo5FwQKAX/KlQgo7c2XObINSz
	nYXubymasqlZfCC0BIla6okzKZePR4jdoQvGQd89rEGhVHV33Ivrw/52ipugiDtH
	QQaT3yavuLHUFz8VkcTVuN9uni8qUT6WC+wd9MDLZLwzosy3I/5IqnErjP42JnxW
	UwjQrJk+lsfg8GEiJMQZWhOpYZ++3+5t7s+pDeGXeqKt7wP9y8e7eHrWz03mG0hm
	LghkopeKgU91+Yy9HnDjoFIa01mIJawwAmLR/IN16sbE7iHUupNl9TrJ1VygzqMw
	00ALLg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2wyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 03:38:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-149e8e8ad71so2364342c88.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791517114; x=1792121914; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHiDjV2z2nC3iW+RoZ7ZflGg3VrbNf1FWrGfvymicZk=;
        b=jlbooIxp3xdMpRdynD0iUzn3Mv4MJxrqtqR+5Pwjb501wICO1ehQvSmhk+yMuC3rZE
         xtwbPyD7GostAd8k/pxuPK9qUjIwn44oim0M23y9mrRpLDPX6IKyr6whWuK4gSETCRst
         Wo7c0q4Pz3UYmXSpJtu6IzUvMTGJlBcp4/2HLQJQu4l6HQlvZeChoQ7bah+yxyNlzm4v
         Cq5sB3m4REtFui32FeGyYnc6TnHWKDyt6v0KcuPgCQGNvsmSY1exXlegKAQjqWkjw9Qa
         v+yf+EoB3ZAb+irCI/Tp23kS6xpbf/egGk1iX+zA0y1P7ouo2ahoDjw/tTYZkQvufw7I
         94cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791517114; x=1792121914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHiDjV2z2nC3iW+RoZ7ZflGg3VrbNf1FWrGfvymicZk=;
        b=FtuISMyccgVxpa2fl4IDrVoKSL9ZBc/6zuUgnITGn+/K10P8J8H2dxEYSr6CU996PZ
         vbOvC/yGdUMzGzZ2hufOPSOVe2M89h6t5d/W86zi1n4mGEZrWK7fcrYmVzlXav9F5GXw
         FnbNaArNppkLmOtfY+qqNza3NOoHcw7g5qNF7mZa+8WcZaOh+yslFdwfQxEinLXep7lV
         MjYjp2i8+kcuM8tTuLOmTQob4FYg1tSGaoCf4JQcuwPOHKAZL5zFSv3crt7r/wmO3l4f
         HbZpyJyXRRb2fDZSRACf03WVdUsCtBdHkP3l/aUTo34Wo74h9AbC9aPwLnWaO3VI8PNp
         s9Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzGZaXiGfE4zUMCrll2ITxJBpM9dbQIJHZZSYvhtQ8rtak4pCWNwc124kEDUJOyYBnP15jJQ1w=@lists.infradead.org
X-Gm-Message-State: AFuF++lhXJPoW/K9xiB/c8PM7Y4GVioiGczJR1ohcnN/QLi1f8sFygHR
	RqhIx46uEzn+xd4FT/yRHhGpl5DGALRmHcPkdbQC+HCV43D99mqPB9ZrwwA0smLC27zeP7gBrxj
	hfNrDdNM7XyLjfrGLZmWuns3xNPFWb32SYmwf5RbkiVbyeLGG/VO0mPWG4YomZgx8
X-Gm-Gg: AYBFou0CXTwXO31TIGHYKhfa310KXsauO2awv409LMFJv2/vwt+6n4O1oETQXYwWLCT
	xqQfzDK/Dcd3vvyeh4N6Yf7O1MkkLpZotpxu1/G33wkFOk/Lg/WF+GmU9LaBAKxRKpMq21y/5i+
	3Dibej6CnWt9CDqE0WYZLioPjkeDnGHL153h1hR/oTSg8p5cv12Ax+LhlQ1fHU1ZNxpWSeKsB3U
	aYctLz2GBmx2UPAkmO3zfLF2O7ecshlJl+BrR7HOYWXh4kR3ieOL2dRSwsTWtx/EL7bckUjFfdB
	ScrMtl17edYV1CbowzwxKxfP6t/LLhFHehS7UX5Cbj0G1+u1Mm1+QUZaK/LDj1XoMKzz/NvO0xh
	rz98pTLCGsxQW/oNeJPpE6YamZo30cN0sow==
X-Received: by 2002:a05:7022:b052:20b0:14d:444b:1ae5 with SMTP id a92af1059eb24-16a6260178bmr871195c88.33.1791517114201;
        Thu, 08 Oct 2026 20:38:34 -0700 (PDT)
X-Received: by 2002:a05:7022:b052:20b0:14d:444b:1ae5 with SMTP id a92af1059eb24-16a6260178bmr871165c88.33.1791517113525;
        Thu, 08 Oct 2026 20:38:33 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm2284833c88.15.2026.10.08.20.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:38:33 -0700 (PDT)
Message-ID: <2d52c324-59e3-411a-8012-e530426eed3a@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:08:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
 <ad47c905-7865-4283-99ba-e246ae44d25b@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <ad47c905-7865-4283-99ba-e246ae44d25b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfX6XsiVp+8kvF4
 bnByXPvU+9p6n/uHPLGxQtn/xHeBWRYIvTGBk+GQNPh0z9VOE/Njv48MA8k5euqyQwylWzItG23
 BIlL5KHEAXjpu8NGGhpoELDonGp4Hf40c6lbCZn4hGWTVFusbLfdbAq2QrGk5vmQRosT/+QAASO
 a5sHJFcnLXkj3bILNMSqCEvWs5+Eioy5Psi7VDM7qY4iEinoWJiQSkwXP5KB8rGt/QoZysZ/BW1
 4o6BKiuJMfsQd36pQjQmgp+mNH6inIsC4lcmI61pofBxPe26rblRAhiPls+XUtqUImYoMLVR62Q
 +4poNEQoRbesx+DOVVNc3pP5+m5Z8MF7bsqwQ8wEvVcK0+KIXah+eKpMFDcngnIN9ov6vfgWCc3
 y5Bv8exY040NuAulGUNTvAGGVw/G5FYhQm6ggI0wDXrkeHlVhTmWPuJNVghpHiBb2av6UaIjwRY
 Pj82xKdnbzNcyUITBvQ==
X-Proofpoint-GUID: 8KMMvJRyi4XOSuCljIafZQSpyHL1NZCP
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac861bb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=T0alG8a80v0CmeRluKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 8KMMvJRyi4XOSuCljIafZQSpyHL1NZCP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNCBTYWx0ZWRfXxQV3TdszXk2n
 fl+Q+8XOCdyvictguRZtIEuQBq6xCcWJFzT54FCt0T34ShTcrsdQ8TmMPwmyLYh1vW46EWYfyNH
 GysXmTk+lhE9TFE9/AodkTFstAePyKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_203835_643924_06941743 
X-CRM114-Status: GOOD (  22.53  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 10/8/2026 10:46 PM, Rameshkumar Sundaram wrote:
> On 10/1/2026 10:24 AM, Aaradhana Sahu wrote:
>> Currently, NAPI instances and their associated netdevs allocated for AHB
>> external IRQ groups are not released when external IRQ configuration
>> fails. They are also not freed when arch_init() fails after
>> ath12k_ahb_config_irq() succeeds during probe, or when the driver is
>> unloaded.
>>
>> Fix this by adding a common cleanup helper to release the NAPI instances
>> and associated netdevs. Call it from the external IRQ configuration error
>> path, probe error path, and driver cleanup path.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>> v2:
>>    -Remove unnecessary irq_grp->napi_ndev NULL check.
>> ---
>>   drivers/net/wireless/ath/ath12k/ahb.c | 41 ++++++++++++++++++++++++---
>>   1 file changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
>> index 85360365aa4b..9b77632bd1bf 100644
>> --- a/drivers/net/wireless/ath/ath12k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
>> @@ -191,6 +191,26 @@ static void __ath12k_ahb_ext_irq_disable(struct ath12k_base *ab)
>>       }
>>   }
>>   +static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
>> +{
>> +    netif_napi_del(&irq_grp->napi);
>> +    free_netdev(irq_grp->napi_ndev);
>> +    irq_grp->napi_ndev = NULL;
>> +}
>> +
>> +static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_ext_irq_grp; i++)
>> +        ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
>> +}
>> +
>> +static void ath12k_ahb_free_ext_napi(struct ath12k_base *ab)
>> +{
>> +    ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
>> +}
>> +
>>   static void ath12k_ahb_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
>>   {
>>       int i;
>> @@ -622,8 +642,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>>           irq_grp->grp_id = i;
>>             irq_grp->napi_ndev = alloc_netdev_dummy(0);
>> -        if (!irq_grp->napi_ndev)
>> -            return -ENOMEM;
>> +        if (!irq_grp->napi_ndev) {
>> +            ret = -ENOMEM;
>> +            goto free_napi_ndev;
>> +        }
>>             netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>>                      ath12k_ahb_ext_grp_napi_poll);
>> @@ -675,12 +697,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
> 
> 
> platform_get_irq_byname() can return a negative error code. Should we handle that explicitly before calling devm_request_irq()?
> 
> Something like:
> 
>  irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
>   if (irq < 0) {
>     ath12k_warn(ab, "failed to retrieve irq number for %s\n", irq_name[irq_idx]);
>         ret = irq;
>         ath12k_ahb_free_napi_for_group(irq_grp);
>         goto free_napi_ndev;
>   }
> 

You're right, thanks for pointing this out. This patch focuses on fixing the NAPI resource leaks.
Since handling the IRQ retrieval error is an existing issue, would it be okay to address it in a
separate patch?

> 
>>                              ath12k_ahb_ext_interrupt_handler,
>>                              IRQF_TRIGGER_RISING,
>>                              irq_name[irq_idx], irq_grp);
>> -            if (ret)
>> +            if (ret) {
>>                   ath12k_warn(ab, "failed request_irq for %d\n", irq);
>> +                ath12k_ahb_free_napi_for_group(irq_grp);
>> +                goto free_napi_ndev;
>> +            }
>>           }
>>       }
>>         return 0;
>> +
>> +free_napi_ndev:
>> +    ath12k_ahb_free_napi(ab, i);
>> +    return ret;
>>   }
>>     static int ath12k_ahb_config_irq(struct ath12k_base *ab)
>> @@ -1353,7 +1382,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>>       ret = ab_ahb->device_family_ops->arch_init(ab);
>>       if (ret) {
>>           ath12k_err(ab, "AHB arch_init failed %d\n", ret);
>> -        goto err_rproc_deconfigure;
>> +        goto err_free_irq;
>>       }
>>         ret = ath12k_core_init(ab);
>> @@ -1367,6 +1396,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>>   err_deinit_arch:
>>       ab_ahb->device_family_ops->arch_deinit(ab);
>>   +err_free_irq:
>> +    ath12k_ahb_free_ext_napi(ab);
>> +
>>   err_rproc_deconfigure:
>>       mutex_lock(&ath12k_rproc_info_lock);
>>       ath12k_ahb_deconfigure_rproc(ab);
>> @@ -1409,6 +1441,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
>>       struct platform_device *pdev = ab->pdev;
>>       struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>>   +    ath12k_ahb_free_ext_napi(ab);
>>       ath12k_hal_srng_deinit(ab);
>>       ath12k_ce_free_pipes(ab);
>>       ath12k_ahb_resource_deinit(ab);
>>
>> base-commit: b64812cb6cec118f6c59a4ec2bd4848db17f6bb2
> 
> 


