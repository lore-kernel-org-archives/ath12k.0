Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE5CA1005
	for <ath12k@archiver.kernel.org>; Tue,  2 Sep 2025 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSw2655YMvUNqPTMaJbf41jnMm+ZEXJDI+ZAqRWqXxs=; b=4WdaXVpzKoTqQGPjj3xssIhcM5
	TOZdHM+dQ3Gbyw2mqdTRG7U936zDPrqXrDKzHfPiJYqOwgtTqs13UlpKCVWiBZsUbVrGrkqAOVfqc
	T0ZHbRmBUeb3Ny0XZAdzl/2RS6EiHV4D6eab40iKDertSa6a3ykstu78gVhRjy6PtmvtoJ/morYeA
	FslH3+5vtRsXcCtZSV1mm7f/9s/PIdccxh+/Izoo3j8Upwyzzpon27d7//patxSBGUSH2udNIp1od
	Xz+GKeOVBvNxeAfMjPAkZvcZrvI5V90xwirYD3EIxPZE3RXO8vXXRrrZn3pLHEWImjBj9OwY6Ti/S
	471bk6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM5a-0000000Fwpe-2egc;
	Tue, 02 Sep 2025 08:10:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsl-0000000FrYi-0QIV
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822TLZv017357
	for <ath12k@lists.infradead.org>; Tue, 2 Sep 2025 07:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSw2655YMvUNqPTMaJbf41jnMm+ZEXJDI+ZAqRWqXxs=; b=NfHY4aT+JSXG5HJm
	5WaBl//2A+N+Vetf7rT2Mze2NwOjn9fBjCHXmt38hW0gCzcK5d8+LMm+RvYDtA23
	D6D1SUmGQPUhKnI6YpBkIOI3W+18OP65Z/svmjIlPaaVcpLoyaxx2vG9y9k2xfiI
	v9VUhrZ7JWOZg1agTnfh1i5SmlDIlCMFKKkP0iP18AdkTEUU/oznwjuidALe2G95
	afjfRPCPG5AibnuBMHMn3QOJRkxgioy1KH1nRG51szxJicc41KUm8T9ef6gIU2Rw
	06rdoK5rIze1EqF0W59YweEg0nm8/Avgxs76+BIt9f+aH7JMsWVo4/LrD7ZEXLHK
	nDp1BA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyy0q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 07:56:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77253535b2cso2055262b3a.3
        for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 00:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799804; x=1757404604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSw2655YMvUNqPTMaJbf41jnMm+ZEXJDI+ZAqRWqXxs=;
        b=Z/numbzUEdi87g6mtVdTwykUwZGfybmt0uPNog2Mh2cVJ+/c9wpZ0/deFRljHrLSfV
         TNHAfOMJG+Blib+GzgjG9m9hdWhdszRo2fi0iXjWu4oOti/r9gwwPMiNJPw0ujqK2XNv
         eSP5Pd/xynXevwSJjpnk2jskZZKwV3Zdtpoi/E0mtMvVXcyvv45CIt4pm/xT37wc3Vn9
         vUsCbo6SQsOAZCtesuzQC2hp0SAzI7U7vzNsb0xvFWJsTjeOVuJ+KJ6NxEgJr7c7rgBD
         XelhintRMZLhNXUq6z0wbDHNyH7OeAr1qI76BWxXermIHb0uz+B8PNEjn2g+7F9p6pqP
         47fA==
X-Gm-Message-State: AOJu0YwuWYfVjUvrWrKvPTlU3PH6osTSVSMQNPmKNA7EcH+F4zH+P2KO
	9FJxxDSbAGiUAk3D4Vsi+m8ukH01HHC5NX5ptn7lDEnMXHk1ttpoCQfiBqNQY6IUACCP6Bh37N9
	n1EuCQSYn/WpwAIqzRYn4Wg1FxfBMIVaOyz8SPP7ng1fS61eo8CcFdOPdHS6wZS9z
X-Gm-Gg: ASbGncv3i5eMMpQ1dyNHtwbrHCCZjeJsagGf4y9+sUPm+mEMBT98HZB54rA+PUJsQ43
	8BmTcyndMJLnQV03x7PEq/7+7KWUFAibYPjtSum17KwuB6ARwkI5EgY5raQ0YIjeps3ZWJ4kfRY
	vB8YdgGXReMVkvlSC+EYW/gE4uIhtcYH7St46W8i6zHhEAl50WQLotRFz3NTXLodY3bXU2y/dHA
	w/+eLokqX6TswfQvYuPGYr7B19tzrPsbA1wYQAyW49f+teVSkf2qLF0dRSrHWKgBPC0Hne4Y/Ll
	Qgm5S0UF0ckKHwBzXYBPdowwsDzPt9UyqA/JYYseR8pe/vqQht1htHzG7P2++Lbcn8B6UFPTtOv
	DludDiG8QxYyc8Gvsvpv3dh7SXQkih4z471c=
X-Received: by 2002:a05:6a00:811:b0:772:4aa2:9779 with SMTP id d2e1a72fcca58-7724aa29f36mr10951588b3a.6.1756799803608;
        Tue, 02 Sep 2025 00:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiRoGj5ZcQ4Y3xrxT71n5tzApOELHCdasg12l2Npiy7VjllPryiPybS24f0OZcWucvSJ2Y8g==
X-Received: by 2002:a05:6a00:811:b0:772:4aa2:9779 with SMTP id d2e1a72fcca58-7724aa29f36mr10951558b3a.6.1756799803089;
        Tue, 02 Sep 2025 00:56:43 -0700 (PDT)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723d79fed2sm9439024b3a.9.2025.09.02.00.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 00:56:42 -0700 (PDT)
Message-ID: <554aa5b1-3004-4e98-8f4d-280440f21412@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 15:56:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-mainline-6.17rc3-1-x86_64] RIP at qmi_handle_release with
 ath12k on a MSI x870e Carbon WiFi - mainline kernel.
To: a-development@posteo.de
Cc: ath12k@lists.infradead.org
References: <fabc97122016d1a66a53ddedd965d134@posteo.net>
 <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
 <d8e395e714f33e596884a8f1443347b6@posteo.net>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <d8e395e714f33e596884a8f1443347b6@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bJ1lHjY7NIPpZAb0vLugAuFBMPIAusfd
X-Proofpoint-ORIG-GUID: bJ1lHjY7NIPpZAb0vLugAuFBMPIAusfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+3X6486v0B9V
 dCBjrIDfij3CcPNrSSDgnUdZiY9vldakbZ2W2jhBpDrbtqNzQo9ww+q8RKlBGGFk5ThO+B97Hzb
 MJ8pvILseNEhgxsR4R2J3LlbZDV/+rQV8e/jwcra2/+0UrYhyU8INl6dmZOKoN1fc/OB4LkFykX
 CTG/HQglrBF87xJG+gTIXmu5SttRZC7Q+X3AzkuslXAUlaMAAA4OsgqAi5/icXstUO5qwp3DNhi
 CIqVXH1+ttixd85kNh+uUqIji+koFp8+Kem0klyb/33XYaJHEd8VI5TIFCVp+Tqxh0y5fxrNSuY
 B483X/CtxDeyF8ksTlYF70xhPN7NHZG/67e5FWbpA3Urp0lhXXDi2RlMAqxCajyrmlhXayf0+hP
 3WQD99tv
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6a33c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=OeuxIFDhAAAA:8
 a=_AGzQDloAAAA:8 a=kypAalfu3sRR6my1ReYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=USl8sPKdY6I_7jokSFGp:22 a=16XsjWzRKMd84bghDgc2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005647_253510_C64182D4 
X-CRM114-Status: GOOD (  23.08  )
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



On 9/2/2025 3:11 PM, a-development@posteo.de wrote:
> Hello - the below diff fixes my issue.
> I can finally boot/reboot/shutdown AND use my WiFi module - and not only Bluetooth.
> 
> Thank you so much!

Thank you for quick testing!

Would you mind providing a 'Tested-by:' tag such that I can include it in the patch?

> 
> Can you push the fix upstream?
> Also maybe have a look at the linked issue which now would be resolved if patch is published?
> https://bugzilla.kernel.org/show_bug.cgi?id=220518

This seems the same issue, so yeah I think it should be resolved with the diff here.

> 
> On 02.09.2025 04:51, Baochen Qiang wrote:
>> On 8/31/2025 11:36 PM, a-development@posteo.de wrote:
>>> Had the joy to build a new machine.
>>> I had to switch to mainline kernel to boot at all.
>>> Blacklisting with kernel 6.16 allows me to boot, or using latest mainline kernel.
>>>
>>> Hardware is NEW.
>>>
>>> Log: https://0x0.st/KH4D.txt
>>> Alternative: https://paste.gg/p/anonymous/52779beef5144f2fbe74be2673951f50
>>>
>>> What should I do?
>>
>> Could you try if below diff can fix your issue:
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c
>> b/drivers/net/wireless/ath/ath12k/core.c
>> index 8d2839cf1de3..bc40958e885d 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -2109,14 +2109,27 @@ static int ath12k_core_hw_group_create(struct
>> ath12k_hw_group *ag)
>>                 ret = ath12k_core_soc_create(ab);
>>                 if (ret) {
>>                         mutex_unlock(&ab->core_lock);
>> -                       ath12k_err(ab, "failed to create soc core: %d\n", ret);
>> -                       return ret;
>> +                       ath12k_err(ab, "failed to create soc %d core:
>> %d\n", i, ret);
>> +                       goto destroy;
>>                 }
>>
>>                 mutex_unlock(&ab->core_lock);
>>         }
>>
>>         return 0;
>> +
>> +destroy:
>> +       for (i--; i >= 0; i--) {
>> +               ab = ag->ab[i];
>> +               if (!ab)
>> +                       continue;
>> +
>> +               mutex_lock(&ab->core_lock);
>> +               ath12k_core_soc_destroy(ab);
>> +               mutex_unlock(&ab->core_lock);
>> +       }
>> +
>> +       return ret;
>>  }
>>
>>  void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
>> @@ -2191,7 +2204,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>>                 if (ret) {
>>                         mutex_unlock(&ag->mutex);
>>                         ath12k_warn(ab, "unable to create hw group\n");
>> -                       goto err_destroy_hw_group;
>> +                       goto err_unassign_hw_group;
>>                 }
>>         }
>>
>> @@ -2199,8 +2212,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>>
>>         return 0;
>>
>> -err_destroy_hw_group:
>> -       ath12k_core_hw_group_destroy(ab->ag);
>> +err_unassign_hw_group:
>>         ath12k_core_hw_group_unassign(ab);
>>  err_unregister_notifier:
>>         ath12k_core_panic_notifier_unregister(ab);
>>
>>
>>>


