Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84201C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 05:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJwvAFHEK9s3I/8xFBiYMAEpBuQU4d5Kr8R3MMVnaSQ=; b=3+gz1POQYMvrlKCDODjQYyrTnt
	RAk9w8ZoqJ9mrAMOVGiJjXN+rzvoOlHrW++S2qXdEODkFaRIsO9P4nfLcHbUN1WUFoVO0sST7kX2S
	Ss6H/x0/GYJrFDEUG23ZCCRBAYhxJpdG14dSIrp8ZnWPk54/pu0zQCMVBDTG6b23Pf59gWPt291s+
	vOz351VqJyX9Gsd7dKsEi8Fdcjq3hMKePoXjUbybJsNhotogU5pwL5MpQVwg/MQUKWiv1X7OAZ1RA
	DM24+ohyp0+irSki7wD7zJ8vGJVBelpXrE7XXoemtmLr8UuOzks3Gom1EgfDWPdNqtW/d4m4mJso9
	c9aG/QGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weREp-0000000FqW0-4BpQ;
	Tue, 30 Jun 2026 05:42:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weREn-0000000FqVe-3pNx
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 05:42:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5c4Rn1011787
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJwvAFHEK9s3I/8xFBiYMAEpBuQU4d5Kr8R3MMVnaSQ=; b=Q6pwMwCh54V0WWRp
	satFpdSIUvnKGDKrwBslw297/nd+XE51zFVJSo/w/HCg3xdYXHRxw0VlmrFcMMWO
	siFq6dOMgnt6kSyzmi/uBSjzOcepEvD+ENSYMEigJw/Xyjy4zCE4tcTu8GohMh07
	rnEG3MRpSQ0TDoLwgcx0gkc26PRIp4582QheR4Xwh0STxQYe8LvwEXBhwNR9buN3
	78c1Mi9EitCybEqJaXnO6JmE1N1MSsW1ZWbWzo0lOHCQDvAO4roP0G/TglYVPxKh
	FdIpW4a45o5BSdKioI6u6MhzTETnbB5UTgSAnDQopHOWL9qLOx3xWCs1izecR+2K
	IFyeaA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfgt6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:42:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso6866429c88.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 22:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782798144; x=1783402944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJwvAFHEK9s3I/8xFBiYMAEpBuQU4d5Kr8R3MMVnaSQ=;
        b=H2hk1jN/T6rDkGEtAf528Slg7K+FXwvfkMfUhEOs/7LW+Zz0Qmo/C40j5UIbAILl8L
         ni0X1JCrOLDHJdpiITwoa5nZLZmXfOl3Y1CGi1YviDZ90iULBfmgPO6PdeLLiktzj+et
         bnpDGh9p7zlfKxWfnOYX9ivqcGnLsuliPJNfrG1LXtHb59UBG2vp+mAtLPsVYGNHRKCS
         4KyGhj/KTWwQuW8MfMsDhOBvcRHkoeTfS8sJ2bO7KNlOC3DodEya2tQ+ex0m+KPx7Kxc
         9dB+F5JCTrBt3N/ze6hmC8jdADh9OOfVnKgzqfOs/V0Qzey7BRP2LxvMn7OwpxgW06Pq
         neCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798144; x=1783402944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJwvAFHEK9s3I/8xFBiYMAEpBuQU4d5Kr8R3MMVnaSQ=;
        b=VnEFS6YgWDuAu/5FPkjqplq1nvwh8I0EGgQQEWRInfL95Ghn3sFl0LjWuIazzrb9pi
         eGcqev1R1k4LaCTHM8NGm/2WzuHBEMRzwpN6jPN02I04Utu1w6FrsNZpQFOw9eMmOlee
         /LFaV2cxNN9GTp7jSdMemhKWgaldZ7zKMetOemzCEssKL0PslihwZaCNmOP3qNb/whrE
         J1NnoX3fSyjAFSz76qxx5YQB166X9yy6Zsqz+iBjUkQS5Sefl6a3h2Pio5I9nPds5An7
         YxHBCggQFECs7pQfb2mY6VyymocvwokrLxYpFK55EP3Cc/5XmRnMDuo6tWwNizV5++8W
         6SjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WUINEKZY7d+OIMsnsSJySLHOrFKn2TIO1cmcoNmSyC5y2TYkklej0RFkAQm4SoMO/PrMjwJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCaotdSExEnkjg2sAqHreG1VPZsui7/bQaD55f9UE6/kCwwJsW
	CenkdWjmgO5Czjsr+N5QrVtiVKQYGSi8uFI8vW47MB/vSO5WiUs8Fa9eIrg3d11UBKNWX8p9xH0
	XCwDdZD4zPVK2prjSiXCSqNLhOKaK9WILn4czID7UsaL5fsnWkK5+evDjDaALdSwY
X-Gm-Gg: AfdE7cmMpbMRYEB0FsQJNHw76D7SwGnrQBmP9Fsu7h4Faqm1NWy4hHwceBmoxXQa5+i
	4jVGswPB1JGbaZGv/7kT0JYVjtfKFk0hefXMeOIIFya4T1R3gXpJlbm+JC9yNpF94srvEiwhYF6
	JJw/llI/ylpOLB5mZLhly7YSNbjGdYvbwcIgzB5QLyGdOBOsbBlE6CC+EZEcsoUbWk48wuU2TQY
	qAesBg2f5m7czye8VUynQR5vY15A6YLNZbf8qqPkAZrOsI689VQfzE1YYIAImwikD+1WJ3wkkMI
	kvFFyh+RKHIz0+SqjnMoeNACdGjU0chN2w9MqKq0qrUKoXFE6PDbYz3MBU/uRqjcuQFedwRYRPT
	DXGX5tOzPNHH3fe2s5Ssc8wPMkXaWj86emSdOjaPXb6px
X-Received: by 2002:a05:7022:ec2:b0:13a:f1bc:b0fd with SMTP id a92af1059eb24-13b2a1a6073mr1391872c88.25.1782798144431;
        Mon, 29 Jun 2026 22:42:24 -0700 (PDT)
X-Received: by 2002:a05:7022:ec2:b0:13a:f1bc:b0fd with SMTP id a92af1059eb24-13b2a1a6073mr1391850c88.25.1782798143850;
        Mon, 29 Jun 2026 22:42:23 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm3121437c88.11.2026.06.29.22.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 22:42:23 -0700 (PDT)
Message-ID: <4b5e5931-7bd9-42ec-9d02-cc60ba5b3425@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:12:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: switch to name-based reserved
 memory lookup
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
 <20260611033314.2330-2-aaradhana.sahu@oss.qualcomm.com>
 <7fd9e186-fce6-4c81-8aa5-f0de961fdefe@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <7fd9e186-fce6-4c81-8aa5-f0de961fdefe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V8-om69J9ROveNZlMNzFRqzSVM0bQp7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX1P5MYEA7y7x1
 lHTnsxXI/Enh61gH/8XFDBB+PjLxTZYJABiLhoum5BAd15yzIz8QlU5tig85x8u6RGLnyEhmiV0
 IyBEAi9BnJT2l2AZ25RaW7751MNdvst2hBDSy5Ft3xGIrZFK2bPdjNo8++NAMUUr1DuFk1WiY/T
 iQTd4oQO6aWirdIPCYWgqOiLQzyVof7LiQ5U3Ir3byVLG6Abiq53h5hNwOUZbkELmf+Hj8MPuJp
 rsLvqnmBOb1Z8w4zq6dAeb+xrAE7b/lYsuocV6/jWubHi0qZITtxFvOnH1U/TMWM4QjSJ3FxFzG
 blym/BrmGGKS5J9IhDCNTIqxXvCcwdi9Bgc+e3ftftMypAq0zcJbwWfRn/Kum+n5uFBTSAzlqEa
 vvj2XA+efYDeXTUTKc7ev/bBcqXc/BKiWfbn7P0Pb9G+jE6gQYkuS2nSyickNGpxQjHpUb4VNB8
 joX1vDxqNLsOosWmdYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0MiBTYWx0ZWRfX+aDkDX2n7vSb
 3LPxsGahfElegWMrnKzE1Pwhn4fYcvVqfdMJXYLZBnFSW8i2uYjze6s9exzaFlUQEr0iS1AlzxB
 q4W6rbCY4qj1/6/L+fknfHI2bjyyzmw=
X-Proofpoint-GUID: V8-om69J9ROveNZlMNzFRqzSVM0bQp7U
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a435741 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EpDD1ZJ3bB9NxIIftg4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_224225_964991_9E2F281F 
X-CRM114-Status: GOOD (  19.30  )
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



On 6/30/2026 6:00 AM, Jeff Johnson wrote:
> On 6/10/2026 8:33 PM, Aaradhana Sahu wrote:
>> The driver currently retrieves reserved memory regions using index-based
>> lookup, which depends on the ordering of reserved-memory nodes in the
>> device tree. Since different platforms define these regions in varying
>> orders and combinations, this approach is not compatible and can result
>> in incorrect memory region access.
>>
>> Switch to looking up memory regions by name instead of index so it does
>> not depend on node order.
>>
>> Use names already defined in qcom,ipq5332-wifi.yaml, so there are no
>> backward compatibility issues.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/ahb.c  | 18 ++++++------
>>  drivers/net/wireless/ath/ath12k/core.c | 25 -----------------
>>  drivers/net/wireless/ath/ath12k/core.h |  2 --
>>  drivers/net/wireless/ath/ath12k/qmi.c  | 38 +++++++++++++-------------
>>  4 files changed, 29 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
>> index 30733a244454..695b605a92fd 100644
>> --- a/drivers/net/wireless/ath/ath12k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
>> @@ -15,6 +15,7 @@
>>  #include "ahb.h"
>>  #include "debug.h"
>>  #include "hif.h"
>> +#include <linux/of_reserved_mem.h>
> 
> system includes should come before the local includes. I'd fix this in my tree
> except there is another issue in the 3/3 patch so I'll want a v2 for the
> entire series.
> 

Sure, I will fix this and the 3/3 patch review comments and send the next version
of the series. 

