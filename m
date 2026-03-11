Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04667FCC9AA
	for <ath12k@archiver.kernel.org>; Wed, 11 Mar 2026 05:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UUAg6t7pUhxYhtcm7b3DP+uRZEpBNBYRgazfpFcLas=; b=Jn5ggSK1DNoGHHE4+2z8fI6TtJ
	4J841SqLXCcdRbX9g4MVY7yRkKRDrq2pSBjJLR/OEFspBT5P0prwLP8Cvr8jvRMwIdVNVjKVQmMmi
	7graizUpEt5KBnO9h3MrU6ZCnkgqrEp4d4Ir/5qMfXbB0nT0YfKeImrWG9ksPFJF0aCOqpQrUTrm+
	3kKCc52rvElXAMsfQEmphaJaGTn+Qr/jjK8uJFNxoSSwMQo8MufU53oK+qFVP39etJJQ9ZuHAMUKD
	yRX2GU6HGcf5c2zjNg7jKCHlnVRKOcp757U/UUpAVR+yhAOWm/sXQ+0l7yGKtVn57p8/Ko8ppF7IC
	1bEmIySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0COh-0000000ApYp-2hrH;
	Wed, 11 Mar 2026 05:46:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0COd-0000000ApXr-0lcD
	for ath12k@lists.infradead.org;
	Wed, 11 Mar 2026 05:46:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5WNRK3295836
	for <ath12k@lists.infradead.org>; Wed, 11 Mar 2026 05:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7UUAg6t7pUhxYhtcm7b3DP+uRZEpBNBYRgazfpFcLas=; b=NyfZoP0Rlzuwzcud
	UUXFFfCYLQXewvKpkf9kzm0S/zc9j1zYYRyePHAstfL8RO1HNQTnrNz+ADi1N+6i
	Vf6EoryfibxrPOfx8+fGBY/1KVA7bMiVaeM/6v5dhXdY1bvTY6C80MJ7RUUdLUPO
	NfCV3IN+3YboCLnozCNLJD+LrOPFYd82taTCfHMT3ilEx1VXVA1QQnjeU1fx/d6C
	vTy0gBkCoNg8wZgzvnEGyXVZPJ2XK3Mysvh3j4x4WY4fVETE188G1a7QoM0e5NPR
	AfPpg6cJgOAAd9y05j+lQc1Qe+4U+zqRBpBSQbjm7Za3Okf15CsWXbQIr7SEBCWa
	YrlUow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mv5cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Mar 2026 05:46:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829aa961449so1967070b3a.1
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 22:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773207972; x=1773812772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7UUAg6t7pUhxYhtcm7b3DP+uRZEpBNBYRgazfpFcLas=;
        b=Fak8Gq+EJ8bm5k16HdJNikMY8xeeX2nKyAutQwTMlS1eXzC6a3xRUjbLAxMOLMF7J6
         7i6+QIsD2qg5shxyoIhx6YZp52sPpNWZgrRpz/MNp2obI/QM2sK6hGxuM8Nhc7PjS0+o
         PfunwGUKZbZKO1hY7HafoKY40z04C1NO2MOrA0rLDGkyNT74B4BMSnzT10ra8U9Xj+y8
         NmfAhr91CAtus8yj/bKAmjjO0a5QaO0yzBtRaf7QjmQMKOoup58BDqBHi1dru3Da2UGD
         t9k3YebWW5EMKsua/L7U0FDvnXdWL9wj+nQO40U4hATy0WJ5C0TrY8KB1uwMeyt5aeva
         J9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207972; x=1773812772;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UUAg6t7pUhxYhtcm7b3DP+uRZEpBNBYRgazfpFcLas=;
        b=ptQkNJO9OOPgKafI2wPI/6f9QEEBGAQhzcLMO2R3BckVj8AEPJQmv4Dymp30opIRyk
         Qf0Lx/VIlf3r88ywMiw92iRS60Crwtrc2T4zW2gWxQVYOXb6kHIVIU51I9BzcOjDB75U
         e+yhGQ+4nuJ+Jj0KeG0SPySbQlGwpUTOz2nvP0kmbvfHGHshUqKQagHRNGcBTvQKefCx
         N9GdDIE5njbtpyRsNFCu2oldiH8mdMbzJEfMgumsXiZUebs7NQ/zyKxw5VyXbXU9WA9O
         N/w7ONA4iqYJFAg6rkppTnPqq4NId7W2km/yyoyM5Jb7NPvoTon5X8INGKR3ki97wrvh
         kZHw==
X-Forwarded-Encrypted: i=1; AJvYcCWeuT+IrwMRcqk7MERYtRLtf0AQ0PH4NgZXxm+PDVZfTiDwx8gIniQNQYlWzK3Rl7ZxoxMqCdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK7poA4Z/guasn/eyFdVoRwK+UZ1TFwcho1Z7V907dQnp01k+f
	l+QMkbcp5YZz+DJMgq4T/RtX5kVQ+7ETlzenz4PV6Z4MaGML1g8pYjOBBDPQtZ4wpEVdFRju6xH
	wtxhXW3+DfdMETqtAfkzBau91OLRoTmrycLMCwn4wZNnJ2u98S0FVm59yYyClvfS4
X-Gm-Gg: ATEYQzzZj725ijT/p49iB7+hTlrm66Mw8BaM2dhhUOzkjHCVDfrN1+3Ki2Ow5QbXTHD
	xHSoPVadJUeoC7rG/0TPpRu/tjq+owUTwsfu1xYwxD0tJGcW2qnI2uhOMubJzxMCY3nuibYu1tQ
	vNZGa/HUVrDca15GZEXBEvknyKE3nUQFNoyYKi9y3CxN29iAdISI0vL7RGNiuto//6WLzUgjHRR
	2PTeAALhMkH0vvYxImaGfBetDXlq0mh3LkayhrlE4MnpqYlKrdapYhpARyrDQ00ZEdwPFRpVXR9
	Rx0LrXnP+FFTQATIi35d1jTpGNCE8QUR5H5Ks3kW6yuQX50bKlmMT0TU2Xl2oNa6saroefMzik7
	r62hMdzwUOgGC77LHzKkifJMjEfzH35+TbNgKAbJpiA7xT3IlJtpjgHGCZT/imDF5pruj91AdEZ
	coLVCvxhw71OmD1Xm48A==
X-Received: by 2002:a05:6a00:4104:b0:829:8942:2ca1 with SMTP id d2e1a72fcca58-829f70a6ba8mr1274216b3a.44.1773207971996;
        Tue, 10 Mar 2026 22:46:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4104:b0:829:8942:2ca1 with SMTP id d2e1a72fcca58-829f70a6ba8mr1274194b3a.44.1773207971426;
        Tue, 10 Mar 2026 22:46:11 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc15a1sm1073789b3a.11.2026.03.10.22.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 22:46:11 -0700 (PDT)
Message-ID: <adcb0245-6514-42f7-a47d-f6d8b3f79dff@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 13:46:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260309152050.191820-1-nico.escande@gmail.com>
 <04d268a7-8f6e-4aa4-b366-0dc38c355de7@oss.qualcomm.com>
 <DGZ17385SNYX.3149KUG92UUU1@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DGZ17385SNYX.3149KUG92UUU1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b101a5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=TeFbt6PBOGW2pFLE-ZcA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7KJ09mRjNlEtwkYxts8m0X1ZGrHzVYR1
X-Proofpoint-GUID: 7KJ09mRjNlEtwkYxts8m0X1ZGrHzVYR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NiBTYWx0ZWRfXx8BpCeEmIaZt
 6D0a9qvSHlTnqyarroydzkofVwaPJbgWH3Ym5yfZXa4bJtWyLAkn0Wa+8nCzj3bs1qQAgjaS/aY
 4myn0YTzQX/wRTA4qo44G0yD09z87HyoHkYEEXW36jyQCUJDCE6lQTpRq2kKaqJ/Dd0UvMN3NDa
 8gO5YKqtu/S80yQkckxjsrbyeH01U7WkpDFeLfV1T69aT8lTZwtwjOIS7nbdwyLNNAATN0xNTk7
 JMoT4fLeI+8WC2w6Qm6m4H2huV5I8gRW3FeNcyVop2j45rltMXmbILerB0nQ29s0I/rDWpBeIWR
 ms47wqfwL9531xOppDfwnzKqQZDsVHTsM5PVDpEGBuBjNX1WomqOciTp1tuwcsNFWGB9a4UhBHg
 8aSZlre/m+CIFRUk733K4ejLQKOKaAJ3/bX4fk5t4bdrT2pOjcEfmGlsCuSW3S6ojutw1jPUpuZ
 IEiZKlsEjPPJzZ0dcMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_224615_386465_D7341181 
X-CRM114-Status: GOOD (  24.00  )
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



On 3/10/2026 6:31 PM, Nicolas Escande wrote:
> On Tue Mar 10, 2026 at 3:05 AM CET, Baochen Qiang wrote:
> [...]
>>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>>> index 59c193b24764..ebe7b94fd712 100644
>>> --- a/drivers/net/wireless/ath/ath12k/core.h
>>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>>> @@ -19,6 +19,7 @@
>>>  #include <linux/average.h>
>>>  #include <linux/of.h>
>>>  #include <linux/rhashtable.h>
>>> +#include <linux/percpu.h>
>>>  #include "qmi.h"
>>>  #include "htc.h"
>>>  #include "wmi.h"
>>> @@ -937,6 +938,7 @@ struct ath12k_base {
>>>  	struct device *dev;
>>>  	struct ath12k_qmi qmi;
>>>  	struct ath12k_wmi_base wmi_ab;
>>> +	void __percpu *wmi_tb;
>>
>> any reason why my v1 suggestion is not considered?
>>
> 
> I considered it but I for sure did not write enough about it in the changelog.
> Sorry about that, see my thoughts bellow.
> 
>> instead of allocating it per device, how about making it global and define/allocate once
>> when loading driver. This way we may save some memory in case where more than one devices
>> get probed?
> 
> So what I did try first is to use DEFINE_PER_CPU() directly in wmi.c to have
> this as a static array, directly in the compilation unit where it is used.
> But this failled at runtime as the allocated size it too big and it would have

hmm, I didn't expect that.

> needed modifying the max alloc size that the module loader would allow. 

Let's not do this.

> 
> My second option was to add something in the module_init so ath12k_wifi7_init().
> But as there is no ath12k 'global' struct, it meant adding a global variable to
> hold the per cpu array, that would be alloced in wifi7/core.c and used in wmi.c.
> And that felt weird too, the wifi version specific part of it at least.

Agree.

> 
> So I stayed with the per ath12k_base, which as relatively low overhead for a
> clean consistant interface.
> 
> But if you guys don't want it that way, I can rework it. Just tell me in more
> details what you think is the right way and I can modify it.

then how about adding module init path to ath12k module and do percpu allocation there:

in ath12k/core.c

+void __percpu *wmi_tb;
+
+static int ath12k_core_module_init(void)
+{
+       wmi_tb  = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
+                             __alignof__(void *));
+       if (!wmi_tb)
+               return -ENOMEM;
+
+       return 0;
+}
+
+static void ath12k_core_module_exit(void)
+{
+       free_percpu(wmi_tb);
+}
+
+module_init(ath12k_core_module_init);
+module_exit(ath12k_core_module_exit);


> 
> Thanks


