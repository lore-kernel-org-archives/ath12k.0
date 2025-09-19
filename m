Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF0CAC59A
	for <ath12k@archiver.kernel.org>; Fri, 19 Sep 2025 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2Rn0Zhk2qgPlF/bJPji0KgeEB74Opf+t5Tm2Q0n1/w=; b=Uc9CFaZvTHLIwLt3MMo65pdyfu
	gOVIPrQo+nRPoiCcAA5ipmKAEefe8MI7+ks6nCwriYnk+adqvDKeX0WFdWsVF/0gLbBsXivm/LMbb
	mLf2e6Duwm6bexRwWHDzqpB2AhRBvOhJhvrzxdA6kzEAD5ErOSoxqOiEE70DyOAN0rVEIef7rshzN
	m+gFIUAV5/81UYCqo3Yp7Z3M0+jszgWGw/qrPjIgPZzVHCfPgEcgPSaGCs2bnpNGTIzobVM5UBOOR
	IiNiS6ELHNVCf1WXnLyRH/F6HR7nXxGWPdhGS0CdCEuY2gVJAtVHMsCQwoj6U3O/6wWCgakjAzLBk
	z5IbgLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzflY-00000003knI-1kEj;
	Fri, 19 Sep 2025 18:23:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzflW-00000003kme-01BV
	for ath12k@lists.infradead.org;
	Fri, 19 Sep 2025 18:23:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JAr4HG004305
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 18:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2Rn0Zhk2qgPlF/bJPji0KgeEB74Opf+t5Tm2Q0n1/w=; b=pBI8VajJQpCv0y8r
	ng1nup7uOt4/HbABfBpalOq8BFXke5Ysktwl/FHNyGRG/Mf/iTOp0/1iiHaKGNQh
	LRsu1C1aAtFw9Rba6HMies2sVcZMWncqB8+e60FXeJ1ykTe2ySTyjDSUA7nHwPrc
	tq0zluMNISUwnlPQGMkj7E9uBPXucO0Z6C0AJebUlTAiUFExLfouX4C7sO9kwFsX
	uqIqMi4u94DgvzCHlz5dcbYvwsva3JB5Gw8Ey2awCbDfDJpN8Qoq82ae/OS0wzCM
	HC9HrMUKY+F/Ccg1AhmPBiCCT5PiEIHhbLgMzEDu5GT/grIqNBVVxHv0d2pvlX6A
	hYx56A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqh107f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 18:23:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329b750757aso2114118a91.1
        for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 11:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306203; x=1758911003;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2Rn0Zhk2qgPlF/bJPji0KgeEB74Opf+t5Tm2Q0n1/w=;
        b=LA4bTCr3DBkA40CoBFEbR/pfayvM9ReXNUtTpNZAQko1BAwT9GbydUQR815y63/lsn
         aUHGenp2CnOujOFJZITGim+5YOxkH1Rwx7sSkqDGHiZVNsUEHY2UeJ8QH/hSMk+NRSCo
         7ISKSahRTzDIaflbgF0zl+Djd4iLL9dr++H4wyZeDPLBkFQhnMbE55kRd0BNxSjq5PEj
         l3+Hh/Z3RGdBeMy7Ts4gb4YLGG8v4IfBJ5Xc33ZdyFKKAiWFBbk/WHVaPyzIaK4sIuzL
         gX4hM2s+2jZIt5pHPoL+1bC0h24goVo/+0B0noG4I9Vy0o1xRNxeCE+FgeURBu9aZI80
         +gUw==
X-Forwarded-Encrypted: i=1; AJvYcCUDJrMgBJCPJkQI+z7lNhI3dkDQ2wiq1UAfFEAwKCsSS1X1msc8KcGwnX5n2LS54yHVZrFG1es=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/h7+r5Lo6vTs3dDMtjIep2U4HwC+i7F3x8QTHWrAQGzQiVH40
	kX2tGi9RP649SaiKOjogGQgK9ttsP46+eJgX42EniuXEyOpxVvTEDzO+I+emPlDG+qTRJLIxbDA
	qfPOoSFdq48UZlG9evR3BTLa/CbMmyutkaWlmQllt9fSLpbF0CJH1srd7kJxqkP0Xpm3cOC8Z
X-Gm-Gg: ASbGncuaekZAT7YlKjry4W9ilxlgqcbX5zOKNoShXl/sTe2NqJbJFJVTYsvAsgQVmmP
	+srEhcDawMyOlgyhJIl8oivqBpWhqW1uLVt12v2GY1B5g5hAUBeLJ+rMAp3gddRGaMxElXwV+tm
	cPK547REJnVQ4E+VZ69Kfb7VobLtXlasqyxOa4x7dToc3qXNTNGGXoIcGQ8V8mMfYdumU4Lh/XY
	FGSk3QnvDIJ/ahziPBOvZ+Tbp+UV2vcaoUwmiFQQy12Dn1LCpwfCDsB1FB8UNraA/5j1/4meVHI
	tg9Fj6dzutEMOlxaTqGIq30UP/Mr0iCTh2vkHx+ShcTZn5ut09YoUz0uXg25BRmdIhZPCKaZsFe
	wY8eBItNYSvBpqxBAfanYN9G9hLn95pADVXtK
X-Received: by 2002:a17:90b:3c85:b0:32e:a54a:be5d with SMTP id 98e67ed59e1d1-33097fd51bemr4758855a91.2.1758306203193;
        Fri, 19 Sep 2025 11:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrPPr/A79RaXqsrPS/Xqqb+C4t+vc2ZLNFhqzMrVIkwPB4cvK1/aMVX2xJwlhu213uyd53HQ==
X-Received: by 2002:a17:90b:3c85:b0:32e:a54a:be5d with SMTP id 98e67ed59e1d1-33097fd51bemr4758834a91.2.1758306202765;
        Fri, 19 Sep 2025 11:23:22 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551c279cd5sm2292066a12.3.2025.09.19.11.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 11:23:22 -0700 (PDT)
Message-ID: <dd5add54-c121-49dd-a3bd-0acc51fc3a33@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 11:23:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: enforce CPU-endian format for all
 QMI
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250918085406.2049559-1-alexander.wilhelm@westermo.com>
 <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
 <e8d283aa-fb73-45d6-a89a-54ff31f205c8@oss.qualcomm.com>
 <aM0BRto3lYNJdBYz@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aM0BRto3lYNJdBYz@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pUFIjEuRfkepArEE01WX9tku1iIrcNHw
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cd9f9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GsdoeonjsfuC13c6vpsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pUFIjEuRfkepArEE01WX9tku1iIrcNHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX9ZQGCk9T5sYe
 CgYq0oNZRgoOE2lEbAICagai8oMvpTPH9R7WO0HpQ8lYfv91YdnIZugOjesq2x/wRT0pAaVC0uq
 1ifsMqvdl8y0xAzAQv8armUsIUH49E9QF2J7jlgRPXcZD4x8jjUG+u3cMeGeyKi5a2/LShlXJS5
 JUMr1Hgd4AsN5G/D7Bt758dTki+18R1+LJcqVCqi8tIezxnVrftuPJQmAOyaAeTOV1WdmyQTPkt
 Q3iyS3iz5syf+/cqSa6td3mR/uIqYs/OnqgORxHCW+2zhkYL4kzzbjqu+jLCQDWZl4x2y6jn3eY
 YFv5vjSDXEJAGclnDN+rxttiWpO8HNYwYr4q2jy9/wSBXEHlAOz1DVImB3V14k8IJDhsUopLkCy
 FaZm6A05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_112326_166410_9C9AE222 
X-CRM114-Status: GOOD (  15.30  )
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

On 9/19/2025 12:07 AM, Alexander Wilhelm wrote:
> On Thu, Sep 18, 2025 at 09:31:18AM -0700, Jeff Johnson wrote:
>> On 9/18/2025 1:53 AM, Alexander Wilhelm wrote:
>>> Due to internal endianness handling within the QMI subsystem, all QMI
>>> requests and responses must now be provided in CPU byte order. Replace all
>>> QMI-related data types with CPU-endian types and add the necessary
>>> conversions to ensure correct interpretation across architectures.
>>
>> I think you can break this out into a separate patch, but reword in a manner
>> that doesn't indicate any dependency upon your series (it can be a predecessor)
> 
> Sure, I will do that. I have only two questions:
> * If I split this patch series, should I start on each one with v1 again, right?

for the qmi series use v2 and in the rev history note you dropped the ath12k
patch. for the ath12k singleton use v1

> * When I mention that BE support will only work on future kernel version, should
>   I better avoid the "Fixed:" tag or not?

i'd avoid the Fixes tag.
If you eventually need this series backported, you can do it yourself rather
than have the stable team unnecessarily backport it.

/jeff

