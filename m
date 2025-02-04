Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5762C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwe9hhdmFgTmkl8rrqNn5Zm+ObxsRt3ZsPNu0jCzhXA=; b=WMt7t5IgvPVaft4Wlc/QUcN528
	4855efIccR5q4wM/CfHq3AwWB4b9R/xWeYJx9xMKGYa6jCtYmehMzf2UzJ/QonkzQB8c1D4s6+tFX
	/SlWx8GzuBGwOyas+/uVtyQ7a1iBatV4JyoVfYZu1kEMkimP/bT0aO7ZiUirYnnFSWnF+QLRx+Xdm
	CBA/XeC0hC8IKPQaidTzK6e9ZCkmzlr8rBY73YZme0cxga59/DbtcVSU0wofst/p/ygXXJvSK+tK3
	G/1RCv+CDfPyIgOexq4eb7ra+nL+0aJOWAl4VbBzRhXJbshYKPuEvhvcWOXUGORvD5AbqLieOvFS3
	sqnx85lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTc-0000000HQuK-2GOA
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:36:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTa-0000000HQtE-1TU3
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:36:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141BdXp021163
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwe9hhdmFgTmkl8rrqNn5Zm+ObxsRt3ZsPNu0jCzhXA=; b=Xj+UsbR9k9T9qio1
	Vth8Rn0GKSe5dC4Kn9pQ5/OJUXK371OuWVaANA/vBwemipTwqaD3zoAGKL3OkcD4
	/DLhB4sW1M0L2ISbPyPR2/5YUDa7cadcGnlKHsSnvFDKgHWJFPOPdUPFTfjE0gs1
	dRzSFTCaSoRq2SfYOAgfR7tpInQeQZqsCwF4fhu6VsqWkWNVQmQwfrBPEH9wdQRW
	RmqtZjf0rWE+3/P4q5QCMFxYba/tLphH2RJ0fyN0QU61BnG1/Cf+0fFMFPBJt6P/
	8UBG2S71uDW1rif0MkQBa6LjBDSsaFHXRDTzP0gkyvCu9TJA+tWnSV8sMXLRtfk8
	r3VjxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911gpg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:36:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2162f80040aso112575935ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654564; x=1739259364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwe9hhdmFgTmkl8rrqNn5Zm+ObxsRt3ZsPNu0jCzhXA=;
        b=V/eqGbbfJZPmpPTzzMIU0PCzmBaudx0zsu0Ce+vajrOXjKwoiL79hvmSYjfbEvBasg
         iFrW8Leny5BDYpnEUjiEzWHVy+jhU6Pxe9YJ5M81x9OquBCKG68yOxSPO32LZ4c7E3fG
         2nM0Drmrpj0M5M7tgsK7sBfAIfQw2a/0cgclefwvGkKqeqj3K4Yrm1GnIftUn96gXAPQ
         h4Y++XJF3KZMUqj7umHGl2uSU4gWlgTbxqBl13XGDlZrhSKkTYkrMSPud/s4/Khc4XqZ
         uKnzHXVTphx3K+9mdWkWG8v1oXjncWRmre8VWRWvtK2Ego1OVcvXw3eau5Q6oRQ6IL1H
         lD3g==
X-Forwarded-Encrypted: i=1; AJvYcCXY+wF/zrJEIJtnhB1FWbAMgK8N7fiBXMwA93Y4e/HLFTuxajvexqmensQMQNmu9FWtK9w1ABE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa8JW4S0ezn2yv6uA6KwB9KlVbGTYkEjPddRJB/ivr9DtT2nuh
	CYtbe+0JG178j2bA1ouhc9WDmKiUvYpi8aqkpelmbX5VE6jCeO2iY4WppUmV+i3wMUcjjQP6L3e
	fsSholNzVyxvovv5shIdnuSATT+GfIMRSPCD51I/2jpnCy6t2ByPRZRSU2fCQ
X-Gm-Gg: ASbGnctOPx4M/yaAgYhKN2DZvGQy43ftLwrRMHXPgSefXceHt9nbAHpuXaCHOcsV59v
	jv8cm89qYNKjaCOs1s1gsHBxUMcCjzlnduNMMwECHLhkAU4qO8VWnc+lG+BP3dUv/d7aArUfufa
	AinPtdjbK58kvmshwJCx6Mv090lSZ1V8M3WQ+YCWYQWWMztOOlqQgpcBME9hIaJ4WNJ3eWEbrwh
	yO47oRV84/nh8iEOKtBTjDg2hcYM7P3TXkf7IGM5uKjfBZdyTALes5F0mnZr1lV1GkP+KtF5xgT
	R4UKu310DZJUPSGV2d+Oxo5NRxXnM0ll61EavA4f0mViBoo=
X-Received: by 2002:a17:902:d545:b0:216:3b31:56c2 with SMTP id d9443c01a7336-21dd7e0ac70mr463120285ad.53.1738654564096;
        Mon, 03 Feb 2025 23:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq8LKo+cMyNzoWSHXi6DI8qCtmjVVFkX0lFaNK27TM/hf807aX/YBH8bXI2KOygnXzpPA3Pg==
X-Received: by 2002:a17:902:d545:b0:216:3b31:56c2 with SMTP id d9443c01a7336-21dd7e0ac70mr463120035ad.53.1738654563719;
        Mon, 03 Feb 2025 23:36:03 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f6f4bsm88244035ad.73.2025.02.03.23.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:03 -0800 (PST)
Message-ID: <b38ab288-bce3-db76-5ba5-f1a69f575291@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] wifi: ath12k: remove redundant logic for initializing
 arvif
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-4-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-4-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TCzzUUp1UGUQ_IxwwSJJZOJIBFe7j5_h
X-Proofpoint-ORIG-GUID: TCzzUUp1UGUQ_IxwwSJJZOJIBFe7j5_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=900
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233606_507494_771370B4 
X-CRM114-Status: GOOD (  10.55  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> The current logic for initializing arvif is present in both the add
> interface operation callback and ath12k_mac_assign_link_vif(). The former
> handles deflink initialization, while the latter is responsible for other
> links. This redundancy could be avoided by using a common helper function.
> 
> Hence, add a new helper ath12k_mac_init_arvif() which initializes a
> given arvif.
> 
> Since synchronizing rcu is not required after adding a rcu pointer, remove
> that now.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

