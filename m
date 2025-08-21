Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6A2CA0EEB
	for <ath12k@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+skZ8cNdqz/D37Oz19EMGUXV+lvtS8uVJDUr2Q9tiS8=; b=hud7Gl240DWWufXBqCeQTPOizQ
	vii4LQc5iaOPi3PNCMCknXX6F31uUzV6q7bxJCKZa2/y2dTER1DktBWorOdYOIJ7MRYSewRUrR2nV
	tUzBw81lAtPZ7FJDuEhHXRZdG9zEw8pkvWhVFdjmORzGYX4wMdCbtfjFNPIBJe9uPZfxkUMcn7EIh
	+i2gN2WKoXoHl2kEnYACP7p7VXQmP26kscU3tHMGRrTnboMJnS/Bnp5g2LAlN8fliFf0URdYLmGeg
	i+qQVTuNmMBI0c0qMSKM+wJfO60JD4X+p6wEDN0bmtvG2KAetQbiCvAqsGi0996TPmD7l0kQyV7yD
	24cp6+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8G-0000000Fek5-0avG;
	Thu, 21 Aug 2025 03:38:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouNd-0000000FUKE-3MgK
	for ath12k@lists.infradead.org;
	Thu, 21 Aug 2025 01:46:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIbtIF009680
	for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 01:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+skZ8cNdqz/D37Oz19EMGUXV+lvtS8uVJDUr2Q9tiS8=; b=JcMU9T6wH2KfOoIK
	y9unaBHlVXP5jl3XtFPbNJKM+GeH/2qRiXR/34zUVwb94laMQh1RrBazboSYBfXF
	Hj3R+WbNDR1ns5GLG2QVYC7sIN/5MXPW06LCZcLE2+AE9407oW61sh13rGHdukf5
	xpJ6cWZmxpyW3BdZSu4W9jy2MmbP2ViJ9IlPzHGgYyqkCdMvXyZ7HjNF0k2fOIXc
	WEPn49xcv2QdWMzQiGdmloezaKOPSS1GZuM5UtP4TVM5CIyQO6K80WAA3yY/G3tG
	+pk6LAXRv7JI9jzrwCtgKcbxn7DgL9PnQF6FgRlZvr9EMIftDIIt1HOMMGQ7Zerb
	Q6SxMg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a3npe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 21 Aug 2025 01:46:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so584734b3a.3
        for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 18:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755740775; x=1756345575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+skZ8cNdqz/D37Oz19EMGUXV+lvtS8uVJDUr2Q9tiS8=;
        b=QEJsRdKFkwVVdOrATHoDdu5jnR6zkuYV7Da4rhzpVSnJszQarIzVukUu9JgWsVq5JL
         3GCxv+fLa0A6JsD7fnqtu9RUVLfjk7K8MdcsgLVEcPR7w/W6fzrJXUePk8wK43Uv8UPg
         s0YvyU4lPdJQSTB5h0iqdhW0ViudQGiQUkKeN8MzcMihnQigGazmi7fZ77yG2NHyp+Oo
         qJQd93oGmopjhckDHBAMW1sKgx2ErJboGB9fkIOaIzVhz5kMhsAaxyjAaiZHmnEOBhyu
         EW0earEFj0D5EkR3QOxXuTGN+AlRxjnizmLZbvykiw7psneQ/vUHSC/iImetooEI2Fk0
         9dZA==
X-Forwarded-Encrypted: i=1; AJvYcCX+KUy+7QvOyq79aLmz1krQ9GqTuPVuuLDcahLfXOvw9Rne1e2Y541XX/bxKk2RpZQaUTfLlCI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TQpOvYfar20rrpe6WzWYcpLEYG20SKgkZd0xwZ8TCblTd3Q6
	kqCELHDxCYrQtBmoeuNrPdCR1scQgtNZCPKZs4N+MWUaw0sNlz72AjEq87eZgfiqwuZqV/ZVFCu
	0Q5VccLlw0kXklXn1xCoEcp1DuIqnyqXMKs0EA4m0xgtnj81ce3evRtC37/DJRXJ5+3wdqGwa
X-Gm-Gg: ASbGncvGavVrPm7JqNa7zZuN7PEiciJdOJiQwld5oKKZqhaNqg03YY2pbrBGPaCy8IH
	2LTHgSWlNe/4uh1a1XuuNQNh0Ys118kmIb5fiTvjaxcgq+SOCwhpFGD3W89+U1Ssi5jHI1vmsBi
	whxsU2BXRQPl8PdV+3+jTJ6TW5XSAoesnWl+j5/trza6zPtK3pXOYLHpdDFRdwBRE9qYXpxtAPJ
	XcZkrhJru4+YYs8YeYVuIY0KAQa2YQlM93gey+3cv6LmUSim5DrMFnD9BvLmjZevi4YPvyZ10PJ
	iiq/ZFJBDhtb1qdrzZKcEpe3rPcKaKtT5O4gn44Lvd6BaRJ5v6guSEhiUwW6vnW309+M+Vs8gM9
	uhAkyQHjxCeL2b3tMlq8ecLrkJqNFJBut7Oq3
X-Received: by 2002:a05:6a00:cc7:b0:747:b043:41e5 with SMTP id d2e1a72fcca58-76ea323d221mr600931b3a.16.1755740775393;
        Wed, 20 Aug 2025 18:46:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1m+t5TPtRkC2LBlKD+WeAOeTQCXH5LiSwx3SBbSJSH/QO4VP/KUSioYDIkJCnWI+ixRwtg==
X-Received: by 2002:a05:6a00:cc7:b0:747:b043:41e5 with SMTP id d2e1a72fcca58-76ea323d221mr600905b3a.16.1755740774749;
        Wed, 20 Aug 2025 18:46:14 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d39e1sm6614270b3a.20.2025.08.20.18.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 18:46:14 -0700 (PDT)
Message-ID: <746724e2-8aae-4103-b53e-da8d45a3d697@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 09:46:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
 <110b6e64-7a9c-4a8f-9b1c-830251d6c733@oss.qualcomm.com>
 <02584bb9-364e-4391-957f-7833d6bc0f79@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <02584bb9-364e-4391-957f-7833d6bc0f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a67a68 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XBBnzUIGvRwb0vX7ptQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: wNRVIx1yr5_wSGXQmAWxr5Bh61kPDkBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4lzztYAAULB7
 uCwnOihwQZJ/yIIvAbWplSmwkS5MldW0mz+Qj1DyerGGaNoJIB7U5sriYy47CGK0x/kbQuGL/08
 LRVGxVWelIEDamzB0rFXy+Bg5uA1dMlbdtjjMKoZsuTb0guJxuixXCHPmXMBH/BMmtqVV/Ym/1B
 1/Plzr40g23esoRuyUxuwtwqvP7QJiH8+RSoGQhINiHWFxC7YDoA5La7BqIaEwEHUnIehO/sT03
 EvP3VexCM0ARP6Md5M3mrW7lD9gZB2Qfx6dlzNbftyuWiN3QPilh9zIP8b1zgvWHrxXB2QQS8mw
 5LIWJ1UGfhO3qKWnTUP84aBx5UBoXWmQUpiYew66t6aNXgFHxxW/zprTcRYhVhb9Kypxr2sO/K8
 Eitbviyi23DeqVCYLGBObGaCMC8gLQ==
X-Proofpoint-GUID: wNRVIx1yr5_wSGXQmAWxr5Bh61kPDkBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_184618_133227_B9EDAC0F 
X-CRM114-Status: GOOD (  16.43  )
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



On 8/21/2025 4:57 AM, Jeff Johnson wrote:
> On 8/20/2025 12:11 AM, Baochen Qiang wrote:
>>
>>
>> On 8/13/2025 1:09 AM, Kiran Venkatappa wrote:
>>> Current ath drivers have separate implementations for different
>>> classes of devices. For example, ath11k supports WiFi-6 devices,
>>> while ath12k supports Wi-Fi 7 devices. However, there is significant
>>> common functionality across these generations due to shared firmware
>>> and hardware architecture. In the existing driver code, this leverage
>>> is achieved through code duplication. As a result, when a new driver
>>> is introduced, many features are missed, and new additions require
>>> porting across different generation drivers.
>>>
>>> To improve reuse and maintainability, ath12k should be split into common
>>> and device-specific modules. Common code can be shared across multiple
>>> architectures, enabling better leverage for future hardware generations.
>>> generation drivers.
>>>
>>> Firmware interfaces and core initialization sequences are typically common
>>> across different device families. In contrast, hardware register offsets, copy
>>> engine mappings, and HAL configurations are usually hardware-specific.
>>>
>>> Common components include:
>>>       - mac80211 interface: Control path operations are mostly common across
>>>         different ATH hardware and will be shared as much as possible.
>>>       - Firmware interface (WMI, HTT, HTC, QMI): Firmware messaging and
>>>         sequences are common and maintained with backward/forward compatibility
>>>         using TLVs.
>>>       - Datapath: Data path files are also separated similarly. More information
>>>         will be provided in later patches.
>>>       - Core initialization, reset, and recovery sequences: These will be part
>>>         of the shared code.
>>>
>>> Device-specific code includes:
>>>       - Hardware capabilities, configurations, HAL, and other
>>>         architecture-specific logic.
>>>
>>> The original ath12k.ko is split into these two modules as depicted below.
>>>
>>>                                       +-----------------+
>>>                                       |                 |
>>>                                       |   ath12k.ko     |
>>>                                       |    (common)     |
>>>     +---------------+                 |                 |
>>>     |               |                 +-----------------+
>>>     |   ath12k.ko   | ===========>
>>>     |               |                 +------------------+
>>>     +---------------+                 |                  |
>>>                                       | ath12k_wifi7.ko  |
>>>                                       | (wifi7 family)   |
>>>                                       |                  |
>>>                                       +------------------+
>>>
>>> The ath12k.ko module will serve as the common component, while ath12k_wifi7.ko
>>> will be the architecture-specific module for WiFi-7 devices.
>>>
>>> After this modular separation, adding support for a new device will
>>> primarily involve implementing device-specific code, while reusing the
>>> majority of the shared common components.
>>>
>>> ---
>>> Kiran Venkatappa (13):
>>>       wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
>>>       wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
>>>       wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
>>>       wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
>>>       wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
>>>       wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
>>>       wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
>>>       wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
>>>       wifi: ath12k: Move hw_init invocation to target-specific probe
>>>       wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
>>>       wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
>>>       wifi: ath12k: Remove HAL defines from shared PCI code
>>>       wifi: ath12k: Remove HAL define dependencies from shared AHB code
>>>  
>>>  drivers/net/wireless/ath/ath12k/Makefile         |   4 +-
>>>  drivers/net/wireless/ath/ath12k/ahb.c            | 139 ++--
>>>  drivers/net/wireless/ath/ath12k/ahb.h            |  27 +-
>>>  drivers/net/wireless/ath/ath12k/ce.c             | 301 -------
>>>  drivers/net/wireless/ath/ath12k/ce.h             |   5 +-
>>>  drivers/net/wireless/ath/ath12k/core.c           |  38 +-
>>>  drivers/net/wireless/ath/ath12k/core.h           |   7 +
>>>  drivers/net/wireless/ath/ath12k/debug.c          |   4 +
>>>  drivers/net/wireless/ath/ath12k/dp_rx.c          |   3 +
>>>  drivers/net/wireless/ath/ath12k/hal.c            |   4 +
>>>  drivers/net/wireless/ath/ath12k/htc.c            |   2 +
>>>  drivers/net/wireless/ath/ath12k/hw.h             |   2 -
>>>  drivers/net/wireless/ath/ath12k/mhi.c            | 130 ---
>>>  drivers/net/wireless/ath/ath12k/mhi.h            |   4 +-
>>>  drivers/net/wireless/ath/ath12k/pci.c            | 215 ++---
>>>  drivers/net/wireless/ath/ath12k/pci.h            |  28 +-
>>>  drivers/net/wireless/ath/ath12k/peer.c           |   2 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/Makefile   |  10 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c      |  71 ++
>>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.h      |  20 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/ce.c       | 973 +++++++++++++++++++++++
>>>  drivers/net/wireless/ath/ath12k/wifi7/ce.h       |  22 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/core.c     |  44 +
>>>  drivers/net/wireless/ath/ath12k/{ => wifi7}/hw.c | 798 +++----------------
>>>  drivers/net/wireless/ath/ath12k/wifi7/hw.h       |  13 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c      | 138 ++++
>>>  drivers/net/wireless/ath/ath12k/wifi7/mhi.h      |  11 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/pci.c      | 188 +++++
>>>  drivers/net/wireless/ath/ath12k/wifi7/pci.h      |  12 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/wmi.c      | 105 +++
>>>  drivers/net/wireless/ath/ath12k/wifi7/wmi.h      |  15 +
>>>  drivers/net/wireless/ath/ath12k/wmi.c            |  97 ---
>>>  drivers/net/wireless/ath/ath12k/wmi.h            |   4 -
>>>  33 files changed, 1956 insertions(+), 1480 deletions(-)
>>> ---
>>> base-commit: d9104cec3e8fe4b458b74709853231385779001f
>>> change-id: 20250812-ath12k-mod-bd00156df202
>>>
>>
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>>
> 
> I dropped the extra ">" when applying to the patches in 'pending'

My bad! Didn't notice that, Thanks!

> 
> /jeff


