Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1546DF4612A
	for <ath12k@archiver.kernel.org>; Mon, 23 Mar 2026 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=; b=vL0BsBhEKC8/VtNj+SKf4fMRGQ
	3vquye+1QE9vAChf5LV3nYR8+2wx2zNh5Y46mIt2Zy+PvyjeAW/r868eP4zffnPyPuHoKdYgFjBgP
	UdpE3BhJtsUpMfSK2+RrCQ7+MehH4nLW2HpqKQSz7OulX6fyOUnvr6I/30K6LYS1olxGrbixfL3cb
	5+G5BY9n5d4KvLhUP/fQf6WzsbM6e8vniw+DnYN+iN14Wh8WKAnzp8VrKAnU5RyaekSDFagap4HmT
	3G7LMdMsdFrGP7v0jSrj9rr/O9zSBkR0lgluyT/f32QkiNu1+aY055ZNzCha7hmMtQGyJ9Rgkw+jd
	GUdVKkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gEP-0000000GviH-3Qfz;
	Mon, 23 Mar 2026 14:26:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gEM-0000000Gvhp-3qxp
	for ath12k@lists.infradead.org;
	Mon, 23 Mar 2026 14:26:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADvRp3539911
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=; b=FCEqIwQUe0G4B+4e
	zycwwl8D0aVorIfQgKi2f+U0Ie1Rsmy8mJcPQv9ta1zUjIRobIXPRX1FB+je6tFy
	lWD6YNGpm4ryD0UGclb1tO9bnvUzmsbC04jtc8zf25QkqKIzZMGBKlIgof23JVU5
	sSpH/Ka9AkItoR6abfTE9BQG/H6Q0/w+x+D1FGGxi7pQIk803hOvATDR/hHCEi9f
	P+qb9sVlsJrjZgOZiR/TEEvqsf79rCjhVZjXMDlHCecg6nKC8iaSqLczdOMn24Xx
	/eyehRrNiyyTuCjELGNSwoRzYFbrrH8hkneo/UREupc1mFc4RoKAp1GjUlNbF9ZO
	HLT3fA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30ukv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 14:26:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffd797184eso417325137.3
        for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275969; x=1774880769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=Wc18o3Qb7Xy5yNM9OT2DKO3B9hkTiwXHRxyoRbbfBg8MneVUkBHwovFADpZ7rchNyg
         AMa9YI/8tF579zQHf31a2BFXFS4/xPyw5i08FkpPgum/WRkt2Vrz7H+Qjq4+uAcaV+Od
         JueTGS8yoUr9xzZYzH8xEqb7xX4YTQ15k+nHPeDjM76PBK8Zjvh92U3U5lhAeJ6I2Fs4
         lWjjMCGaH+NwawiSl4mwkhcx6WTRmyQj79iR3+0Ixypua2aw1nq5s3QWmNg8imS4je6U
         96ytJAsovLlRSM1+AC+U8PZgp4Mgsg4e2rHoq2LFSkzSkYsvrAvHJAKjwuDIeKTMZc2/
         UL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275969; x=1774880769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=qhNTmiN44E7m04U5889rFQm+lLPp24VcpFcsm/fAOBh0BCD14Ym83589Agk5x6S1qd
         Nxacc5Gqjn/d9qHinvORDP48cgPj4YXA3LWnP8YkDWJrMtmO4VXhvYBzfFyqwxxLmetS
         q27baj9PnFkP8bGW/uthqOezDxkRaXC4V4zfJzldkdOUS7DmxP4O+kGochVMiV1pzozJ
         Go2uROqOMl3ZplnBIuktfTAbQx0UA6teLQSpUdqy1+sPUj0FJIy/pZsZedLnaaXnVdNo
         WlvHYZqwN/FlXJxXeb0yrSB5OGCSi2M7NyHm0aDH514kQLFdWX4e/IDivqgk0mAY1KY7
         e5rg==
X-Forwarded-Encrypted: i=1; AJvYcCVNhADdRT0k+L04gH9Fu8lh6IEDu8lyM71VZ81O4iCbnzhVE7WXAkQou/McDfy6ixJhrKqroyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBrOKndpCYmm3CONIUs2M8wsFRsLI3PahNE4EutdoEqqUgXA3K
	j1gt3NRUY1YyYb/fT875M1N4AO3CCv8eYRsx3e73Bn0iWWySRCPoWsydnm3ms80lAs5tyu2UF+M
	rWQLcbaPQWFLogo32d55zDVAacojDC+echhp9B/h6+SZdN9HdHeh3BQBLZi7kJXPcbgERoJ+r
X-Gm-Gg: ATEYQzwGVnzm6tgPQPezQQ6wUIamqvDxfSei+eyTX5svADZm+7YfwPoAtJZj0aHYo34
	3fJH9Y6BDWIyT8Mgr2xgS4gqUwDMcbki7Mqs/Ato6MQnJ3MGDJ2vZEDrqp18TYkoB6qhzgJ9bWg
	0zpKnEs5fFVjZzcr9uCgeUDlrWEHurPPx1cyn9izFVPCGeQR0ddMA2DEbe8jCWkZ3Gtp1lL5mU5
	hw2S+eTA9/wQnyju49MVuYvA3jUrNi1VTcAmlcqbNYHHsGzMo+CHz23KSkSfMTdl9cABxfpe2w8
	D9acyQYo/Jbw/YyBZm791XBExRIsLc+Bt8JIKl0piRPqWnUBMIVI3l8PbCD59+Q1jsBIls9dTi+
	72YdPQM02id1gHV3N9I0WLVVKC55JuPCwbXOyAvtn1ggRvOUrMWfl63K/vHxi9+/cATdozSt3Ih
	OH/as=
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933711137.3.1774275968547;
        Mon, 23 Mar 2026 07:26:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933671137.3.1774275967928;
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm398492366b.31.2026.03.23.07.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Message-ID: <2e55bdc3-54a1-4f18-b9ad-fe03f21fc4da@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <28d63822-f191-400a-8005-5185dd480dbb@kernel.org>
 <acE-kAi2tkPh2qie@sumit-xelite>
 <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c14d81 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RZWjG5IIt-miciyuqOEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfX84fm6qOyvywH
 4c+hLiAAjr7ZcBixjGxWg7X+hzD+Ye8nDVIdZ0b5OsituwbA7bRJbeApIbf634YgFl8wCPsuTuK
 0uhmpYSSaDVElocO3wJyFEGEbENrSTvECjrQvRNtUKyIeOALj/PPwY60unxcJPUVAq58qdnLYLL
 XWj3QgBTT5IaC6SEwj4cHTn/LSzvXFHG0y3KGVkCzYA3tU/aaSNz1HvSa/01bRvsD/zMw8BeBEM
 rUr7UMWVN0f1+OUjxxFpSuq2TvUeWaN8JkSCjPr+ymMbXmxqPeScqY+1J+QlZFEADkwWRBZ1doR
 G47xn6034ITGBq1sx4lhgfYzWN7Aa9A42/KyOzZdpcRNvmwf1M6YSlZD6orYZ6A6v04QIVG+zd6
 Chsy9ZXLXaVyLYKO8zITzP5Yuy3lK7194IuKL+WDGGj3kkdbzxTQLEEbvScAOxwPdfegDL6+Hg0
 xVEjAvbeQV5o6iig8ow==
X-Proofpoint-GUID: 0Ky0Vm80nCki6ijedmjAFfR0CtWmvbaa
X-Proofpoint-ORIG-GUID: 0Ky0Vm80nCki6ijedmjAFfR0CtWmvbaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_072611_080581_E5AD4983 
X-CRM114-Status: GOOD (  26.17  )
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

On 3/23/26 3:19 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 14:22, Sumit Garg wrote:
>> On Mon, Mar 16, 2026 at 08:51:16AM +0100, Krzysztof Kozlowski wrote:
>>> On 12/03/2026 07:27, Sumit Garg wrote:
>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>
>>>> Qcom platforms has the legacy of using non-standard SCM calls
>>>> splintered over the various kernel drivers. These SCM calls aren't
>>>> compliant with the standard SMC calling conventions which is a
>>>> prerequisite to enable migration to the FF-A specifications from Arm.
>>>>
>>>> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
>>>> support these non-standard SCM calls. And even for newer architectures
>>>> with S-EL2 and Hafnium support, QTEE won't be able to support SCM
>>>> calls either with FF-A requirements coming in. And with both OP-TEE
>>>> and QTEE drivers well integrated in the TEE subsystem, it makes further
>>>> sense to reuse the TEE bus client drivers infrastructure.
>>>>
>>>> The added benefit of TEE bus infrastructure is that there is support
>>>> for discoverable/enumerable services. With that client drivers don't
>>>> have to manually invoke a special SCM call to know the service status.
>>>>
>>>> So enable the generic Peripheral Authentication Service (PAS) provided
>>>> by the firmware. It acts as the common layer with different TZ
>>>> backends plugged in whether it's an SCM implementation or a proper
>>>> TEE bus based PAS service implementation.
>>>>
>>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> ---
>>>>  drivers/firmware/qcom/Kconfig          |   8 +
>>>>  drivers/firmware/qcom/Makefile         |   1 +
>>>>  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
>>>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>>>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>>>>  5 files changed, 401 insertions(+)
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>>>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>>>>
>>>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>>>> index b477d54b495a..8653639d06db 100644
>>>> --- a/drivers/firmware/qcom/Kconfig
>>>> +++ b/drivers/firmware/qcom/Kconfig
>>>> @@ -6,6 +6,14 @@
>>>>  
>>>>  menu "Qualcomm firmware drivers"
>>>>  
>>>> +config QCOM_PAS
>>>> +	tristate
>>>> +	help
>>>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
>>>> +	  by the firmware. It acts as the common layer with different TZ
>>>> +	  backends plugged in whether it's an SCM implementation or a proper
>>>> +	  TEE bus based PAS service implementation.
>>>> +
>>>>  config QCOM_SCM
>>>>  	select QCOM_TZMEM
>>>>  	tristate
>>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>>> index 0be40a1abc13..dc5ab45f906a 100644
>>>> --- a/drivers/firmware/qcom/Makefile
>>>> +++ b/drivers/firmware/qcom/Makefile
>>>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>>>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>>>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>>>> new file mode 100644
>>>> index 000000000000..beb1bae55546
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/qcom/qcom_pas.c
>>>> @@ -0,0 +1,298 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/device/devres.h>
>>>> +#include <linux/firmware/qcom/qcom_pas.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +
>>>> +#include "qcom_pas.h"
>>>> +
>>>> +struct qcom_pas_ops *ops_ptr;
>>>
>>> Same comment as before. Don't create singletons. And for sure not global
>>> ones.
>>
>> This pattern has been carried from the PAS API contract among kernel
>> clients and the SCM PAS service earlier. The clients don't hold a
>> reference to the PAS data like underlying platform or TEE device etc.
>> Hence the need to have a global data pointer to hold reference to the
>> ops data structure registered by drivers having different lifetime of
>> devices. Also, the PAS APIs can be called from very different client
>> driver contexts.
>>
>> Surely, avoiding global data is always better given a better alternative
>> is there. Do you have any better alternative proposal here?
> 
> Why it cannot be part of the context?
> 
> Look at your API, e.g.:
> qcom_pas_init_image(). It takes struct qcom_pas_context which should
> contain the ops.

This would make the client have to select the ops. The whole point is to
avoid that, since the client has no clue (and is supposed not to have any).

What Sumit does is to bind the ops based on the runtime-discovered
mechanism (which needs to only happen once, given we're not replacing the
TZ at runtime)

Konrad

