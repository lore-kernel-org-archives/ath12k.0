Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6AEC5B543
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxN/Shf4DptfhsgHLsd02KhhftUmjLujua1rgYzrW1w=; b=dgsOqwegdJ2rWci8NOc6Eq1mNv
	lJ4FTDwYvlBLMWYTzAbXzSdcvkoKmnAoe12nEsqJy48aGGRLVsp+TunPbPDeIQuRyCJNCIpYPC2ZE
	D3LoK1uBUgahCiZUusvIL6S9lOm4QwebwjljfOES/jHUPnvjpBe9l2oYPRxNr1TQVA0pevZexGDfq
	zILCMKOM0QKFUb0cQro6+8F71yYSUf3dQ95it+xDTcXUskFygTuzAXIdeb/5WZm1Ecb27gPnqx/tw
	5bIn4YUZPWB5NPFJW7Kpth1uqj3MqWB6EXK1pyl0fit+P/4+vQlum6ifW0jbp416uSlzKX6EotDRK
	3b6PXqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3uP-00000001SmF-0vmB;
	Fri, 30 May 2025 17:52:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3rn-00000001SAk-3asd
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 17:50:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBuDi7024022
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 17:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxN/Shf4DptfhsgHLsd02KhhftUmjLujua1rgYzrW1w=; b=f90mSX7wYK1LsSZr
	9uTzMjo8t5eHF5aV+rF3UFCa37cK/5NJFQRqDf/uC+TPDPH7O2uKzCdKTVmHQvES
	bnSOXn6Ps4NHPB0dG+KxgtKD0LW9SD9IxL36gkECZ+4riNhpHttBe5DQdzrXa2Gn
	56AkMmW4svLHf81yLreP579bmedev2gTtQaXwvrlEDaYaspUc6LyA8VJkriJtyL8
	j4VlLZzvBDJwhMUAPeAkYAJiXCNWl4vA86tqN6U6iIB+MkoISqWoeTdwIMvvP/Yq
	L8n2seebkGZ5WY0NM8/pNhkZjpxH+P9cFs+u/iOleKRGW77+Dmv7CnG5UABi7dlM
	HinG7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7envw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 17:50:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2323bd7f873so24032655ad.1
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 10:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627401; x=1749232201;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxN/Shf4DptfhsgHLsd02KhhftUmjLujua1rgYzrW1w=;
        b=dHcVSezwyU3bTzwlG8o5gB0YpjYD3UJJefp2uHz2meeMEIPxen2b9vI/QVb2nNmB/k
         3WO8slgp5cWKmcBoexbRDsmR8xxb+C5H4M2RwlG+PKNwjXeVDVhj6UMjHdyx6V+mfJNl
         njL4bB0aAKdZo5jIh/dkEyxnDQ2l/ZBvDvUmO4pjMXTR8w8rxLqz6eVg8+j3nLtPUK4d
         1U6cRhiHCSKaMJPR+GQP6D6l7fpPAJMGcreeCIMCQaDCwUBWqvDGYXJuHWqVff2v362L
         W5/2T34h1duiGgcxAz2sCOMTOmQ3qrT08BL+N3DqIGoK5qmETq161edsogC/n6aN0Yos
         2wmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgGeSws2ffMbN380Tc06LuC9FH/umR7OWRvHimgU6L4V2F4YNQ0kq09/6anbunOgwz7lttvOo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6epbElcXJhD3DFMHVysfOZD2X2ci2BZbIms2dYL/9Dab/f3hI
	dcJqceTyHlQZEmBUTStVnRu2eiibcjU2HE9sqBy6ETlTe//3Wb/iG2GYLP6BHzpNJ7dBDt+sE7n
	iuMQy93ILyBJW4NseTC3ikxlRrmcxi55Gs2P3gA3lWb1/YdGWbNaQYiyYIzhM85PP
X-Gm-Gg: ASbGnctPWGgWB4SUISL6fnNUE6wJCsGgjPVhAJY31wpsl8koSd7hi6oQLeG09ZKyC1M
	/06Rvu/XMFCo1I5rFppyqFkO31WWvN5D1bxriIUr8D5HVariqxvqWlfQYkr8MfJDc2XlejI8uOV
	ou5+QFLFuWbz/P5gBnBmXQFiaUR6DWV38UG35GjP2TDQqyPVP9D1R/BjIyF+VWa+/1hnk3aQbwg
	v1bTV+LKqN6sXcXetnTSYiojUAhkN2pblVHQDsf6vzi9QjzgTLgDGbTzCf6siRWtS5ccn+w4z6R
	5SH2oyLHZKnpRsszIJjv8xOutwYoPo6G8+VU7hzf0BaQXV7agrd09M56Er7jTDT2X/pOINX3wI6
	byhBN
X-Received: by 2002:a17:902:e852:b0:22c:3609:97ed with SMTP id d9443c01a7336-23529512d11mr57139135ad.30.1748627400763;
        Fri, 30 May 2025 10:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErin0UU/6VUHfd6GN4cEw0+jaeshx+4hVdxqr55icr+x252xs3WgjFE61xzZbD/2Yj2DQlbw==
X-Received: by 2002:a17:902:e852:b0:22c:3609:97ed with SMTP id d9443c01a7336-23529512d11mr57138765ad.30.1748627400266;
        Fri, 30 May 2025 10:50:00 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdce29sm30975565ad.100.2025.05.30.10.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:49:59 -0700 (PDT)
Message-ID: <d600579f-bb1c-43a9-960a-3f0453cea4b6@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:49:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start qcn9274 card under qemu/proxmox guest
To: Domenico Colella <medevil84@gmail.com>, ath12k@lists.infradead.org
References: <CAGKP1icLE=R91znFQF1qVP1VeKMyAheY92jY3n6PhJ1t_Nw2bQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAGKP1icLE=R91znFQF1qVP1VeKMyAheY92jY3n6PhJ1t_Nw2bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rfn5ydTvAS-Rd5MuW82KXWxpkftlyKpm
X-Proofpoint-ORIG-GUID: Rfn5ydTvAS-Rd5MuW82KXWxpkftlyKpm
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6839efca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KjpZlZH10C6pOJJUneYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NyBTYWx0ZWRfX9S00yjQVlzmn
 BQ7N/2IDuR0ynpHxaOjZ59reGkRZhZPmcs6fDnv2l6pk7G9lfOERBoQMnWxeUPRRt7XXcRLHfUd
 eX08F/Ngmg3iriXl8+LHl25DMkaykge/anygw8sBEYx9AJ53BZGUB02RSFITCPrSHby+3ABqFJn
 g1kyeylXh8SnxcNPlbORMmPquN9M4qwwrBo4Zg0saxW17KRj5b9DLf/PgtqKvHQPokjhHOjxWKn
 AQFqMRnxy2GxDELbuCGmcW/ATpmp1IVatxRrlZBqfMbWQ9I15nZXgtPZhNXS8byeCiQpPMxLBHF
 sgmCC3j4klbiDSoYCHofqr8hT9jpVH9bKFgNjtGbFDv6xVhIjynrrgMBbic6FQSL0ReVY115pbW
 Hm4QumV6as7DFGVMurQeZmQi2oPJVpiqvibRSSfrCF/+JoB3cXc9Yc30CTIqmagyU2OFcE/C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_105004_022946_3B7FF4EA 
X-CRM114-Status: GOOD (  19.90  )
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

On 5/29/2025 6:07 AM, Domenico Colella wrote:
> Hi everyone,
> I'm having some trouble using my wifi card (Compex WLE7002E56) in a
> virtualized environment (I tried both qemu 10 on debian and proxmox
> 8.4); the card works fine under the host os but fails to start in the
> guest.
> The problem seems to be present regardless of the type of kernel in
> the host (I tested debian 12 with default kernel, from backports and
> manually compiled) and in the guest (both debian and openwrt with
> kernel 6.8, 6.12 and from git ath).
> Here's a log from openwrt guest with the compiled kernel from the ath
> git repository (i'm manually loading the module with
> debug_param=0xffffffff) running on proxmox 8.4.1 (with default kernel
> 6.8.12-10-pve):
> 
> [ 1112.284527] ath12k_pci 0000:03:00.0: BAR 0 [mem
> 0xc1c00000-0xc1dfffff 64bit]: assigned
> [ 1112.285027] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> [ 1112.287138] ath12k_pci 0000:03:00.0: boot pci_mem 0x00000000b852f5e1
> [ 1112.287140] ath12k_pci 0000:03:00.0: pci probe 17cb:1109 17cb:1109
> [ 1112.287155] ath12k_pci 0000:03:00.0: pci tcsr_soc_hw_version major 2 minor 0
> [ 1112.288698] ath12k_pci 0000:03:00.0: MSI vectors: 16
> [ 1112.309015] ath12k_pci 0000:03:00.0: msi base data is 0
> [ 1112.309017] ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
> [ 1112.309734] ath12k_pci 0000:03:00.0: boot firmware request
> ath12k/QCN9274/hw2.0/firmware-2.bin size 15376448
> [ 1112.309736] ath12k_pci 0000:03:00.0: found fw timestamp 1726657435
> [ 1112.309737] ath12k_pci 0000:03:00.0: found m3 image ie (421888 B)
> [ 1112.309738] ath12k_pci 0000:03:00.0: found fw image ie (7372800 B)
> [ 1112.309743] ath12k_pci 0000:03:00.0: found dualmac fw image ie (7581696 B)
> [ 1112.309744] ath12k_pci 0000:03:00.0: found firmware features ie (1 B)
> [ 1112.309744] ath12k_pci 0000:03:00.0: features
> [ 1112.309745] ath12k_pci 0000:03:00.0: using fw api 2
> [ 1112.309752] ath12k_pci 0000:03:00.0: dualmac fw selected for board id: 1006
> [ 1112.309753] ath12k_pci 0000:03:00.0: Assign MSI to user: MHI,
> num_vectors: 3, user_base_data: 0, base_vector: 0
> [ 1112.309753] ath12k_pci 0000:03:00.0: Number of assigned MSI for MHI
> is 3, base vector is 0
> [ 1112.313035] ath12k_pci 0000:03:00.0: Assign MSI to user: CE,
> num_vectors: 5, user_base_data: 3, base_vector: 3
> [ 1112.313586] ath12k_pci 0000:03:00.0: Assign MSI to user: DP,
> num_vectors: 8, user_base_data: 8, base_vector: 8
> [ 1112.313590] ath12k_pci 0000:03:00.0: irq:54 group:0
> [ 1112.313659] ath12k_pci 0000:03:00.0: irq:55 group:1
> [ 1112.313728] ath12k_pci 0000:03:00.0: irq:56 group:2
> [ 1112.313794] ath12k_pci 0000:03:00.0: irq:57 group:3
> [ 1112.313858] ath12k_pci 0000:03:00.0: irq:58 group:4
> [ 1112.313929] ath12k_pci 0000:03:00.0: irq:59 group:5
> [ 1112.313994] ath12k_pci 0000:03:00.0: irq:60 group:6
> [ 1112.314049] ath12k_pci 0000:03:00.0: irq:61 group:7
> [ 1112.314107] ath12k_pci 0000:03:00.0: irq:54 group:8
> [ 1112.314109] ath12k_pci 0000:03:00.0: irq:55 group:9
> [ 1112.314111] ath12k_pci 0000:03:00.0: irq:56 group:10
> [ 1112.314111] ath12k_pci 0000:03:00.0: pci after request_irq msi_ep_base_data 0
> [ 1112.314113] ath12k_pci 0000:03:00.0: unable to get wsi info from
> dt, grouping single device
> [ 1112.314114] ath12k_pci 0000:03:00.0: wsi group-id 255 num-devices 1 index 0
> [ 1112.314114] ath12k_pci 0000:03:00.0: num devices 1 num probed 1
> [ 1112.314152] ath12k_pci 0000:03:00.0: pci ltssm 0x11
> [ 1112.314160] ath12k_pci 0000:03:00.0: pci pcie_hot_rst 0x3
> [ 1112.319190] ath12k_pci 0000:03:00.0: cookie:0x0
> [ 1112.319203] ath12k_pci 0000:03:00.0: WLAON_WARM_SW_ENTRY 0x2
> [ 1112.339220] ath12k_pci 0000:03:00.0: WLAON_WARM_SW_ENTRY 0x2
> [ 1112.339232] ath12k_pci 0000:03:00.0: soc reset cause:0
> [ 1112.402449] ath12k_pci 0000:03:00.0: link down error during global reset
> [ 1112.414092] ath12k_pci 0000:03:00.0: MHISTATUS 0xffffffff
> [ 1112.424128] ath12k_pci 0000:03:00.0: pci link_ctl 0xffff L0s 1 L1 1
> [ 1112.425042] ath12k_pci 0000:03:00.0: pci reg 0x3164 instance 0x3
> read val 0xffffffff
> [ 1112.425044] ath12k_pci 0000:03:00.0: setting mhi state: INIT(0)
> [ 1112.425063] mhi mhi0: BHI offset: 0xffffffff is out of range: 0x200000
> [ 1112.425449] ath12k_pci 0000:03:00.0: failed to set mhi state: INIT(0)
> [ 1112.425779] ath12k_pci 0000:03:00.0: failed to start mhi: -34
> [ 1112.426080] ath12k_pci 0000:03:00.0: failed to power up :-34
> [ 1112.475594] ath12k_pci 0000:03:00.0: failed to create soc core: -34
> [ 1112.476021] ath12k_pci 0000:03:00.0: unable to create hw group
> [ 1112.476333] ath12k_pci 0000:03:00.0: failed to init core: -34
> [ 1113.130301] ath12k_pci 0000:03:00.0: probe with driver ath12k_pci
> failed with error -34
> 
> Can somebody help me with this issue?
> 
> Thanks,
> Domenico.
> 

This use case is not currently supported. Discussion and proposed workaround
for this issue with ath11k discussed at the following link:

https://lore.kernel.org/linux-wireless/adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com/


