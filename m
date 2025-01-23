Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B2C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlxbvaCX9NmA6y/u8QnhKeBlS7TBRAu0ZEid7fzMqA8=; b=V66Ws6953qxEtOTK2Fo3JSQ6I8
	Mb4asGWbn95vFEMd/SmOXLwtljWZzgYGb1YxDc/uYxXvz8XMODalZMqvRwzRugnybnQt/n+tbxyQ8
	prwBF6ARoMnkSqh0+WyF8V+STnoB2IsqOKv34gV6q5J1ZqNlsS1KhKbbqXABPxUwU74+Zh9YUMHlF
	nRGx7jJd0YvOMRVIK25QAtI2xyoyk7wC5WbcV+bCCk3nnS9pBBXZyT2j/FtL2jbaOAPAbr9Sovs0C
	EhGjsyZjc7H5NWEZl0dR9s7iuDKrep69/jlO1otv/xq7BLef7lxYPaMSiHVVoJ5eCAdwCfStyOZU9
	t9Vu9aeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tat0o-0000000C2it-3FwF
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 08:56:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tat0m-0000000C2hx-24Iv
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 08:56:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5CrSC021423
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlxbvaCX9NmA6y/u8QnhKeBlS7TBRAu0ZEid7fzMqA8=; b=mhY1TUxIRwnabJt4
	1HFRHdUMJt8KHviYuxLUB9EVOEOHnc77p3J+mDQK96Z/mjC1VNnxU4hVmAyvozCH
	wa63iQTIZ1egAu0o82tjVwpm5ef9uqgon9YNfPzJ0f4snl4qrWNEXxFKwup3nGqS
	GdNX8TTAClF2jhWSPJH4uooqK/s2Fr2+Rwtfc9Om9S0fA2XIMcgXjxkmJf7NDaea
	obY+5dKzbp52SuuejqA6F+24jiPFtvmbTuzQj2njVFW+2AppehKC2oRu4S2jJ7K5
	T6gCr4qdxpJb8A6MffZND5kFTceD4pX+XfQLNweJcZU8qTr7ybfQZfLuJotGjn+P
	vUzUAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bfe4rfnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 08:56:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216387ddda8so15792655ad.3
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 00:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737622586; x=1738227386;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlxbvaCX9NmA6y/u8QnhKeBlS7TBRAu0ZEid7fzMqA8=;
        b=IDw41Bo9wZerr/q/CbtVAA3bFDL2Z3RXYshcCebMFT+CnVcrYDUke1RxlOlXpNsC4Z
         Ogig6ymspNlZa/mw2sG1vVaWATRgcNR/tNI8kNqe8n7vt1vjPXZP6PTlnFMuVfJgYazr
         yq2ZG1dXMxD2llwKv5+CahC62a+fr20OZqWUwkapdL0y4x3Rx+GBkfFxIQwv4u4rL5tR
         xXu2h7+jt0kG2GJSsdkMPQa1rQw6dRVlJ+7f55T87HmblYJubouCPQ9pAvhdg0ZD1efa
         7Bw/nLNkN2UVjZO34OB8gSNQLJvqLmj69FxAJeemMi/476oNNAq5YEexWkYetz+H845R
         IwfQ==
X-Gm-Message-State: AOJu0YzyMoFDxVzNNs9G2mEvI2C3j0F8E9saNwNauLIeHleyBV/k3ln0
	WazHMtzvsWMorwVudBMMd23sHJObCnU0A4AwFN020bMQ7QIMZpWMnMxJWp0V/sa92EIo5dos4Fc
	Xc2zytY/DDo5RE+Pz/L+3BG25bcW3DpIeu7k9rDvdqiQWqiyESGSqACv3qeWT
X-Gm-Gg: ASbGncs6pa9RXkFw09vD/sgvmlYKeGM1hR0E9+E7ZzpEvk5YuZ99ipOFGGu7iLfRNIt
	ia3Gz+3oZ0fzlZertFYWUq9a+pGfnAPSrwW4tIyDwcwxhWmDg2qDn3r3ksUnjhXYM2I4ohbjH0I
	lB3ZOQ/a20WeiEEIHKpRK1cxePDvub/+poj8HdAekItMEndopq4RydGzTU/WH/L8/Q+aSPJ0pTh
	GDOR2tjrkxciTUSOjvb36IOqH+D5t1IA/G7WZzgE3osw4+Q2QjCxI8FUZUDti9+pzs21U/Mk/cq
	dpWoj4MB39o1nCh1jitvGM57Uwmu
X-Received: by 2002:a05:6a20:565a:b0:1e1:aa24:2e5c with SMTP id adf61e73a8af0-1eb215eff85mr28108191637.38.1737622585734;
        Thu, 23 Jan 2025 00:56:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgHy6cXovfwkt5X6/yo7RKkzjIvA2/ze7qFbc41us030sNbtYXYDcDt3yHm/uwGPapYbm5zA==
X-Received: by 2002:a05:6a20:565a:b0:1e1:aa24:2e5c with SMTP id adf61e73a8af0-1eb215eff85mr28108171637.38.1737622585355;
        Thu, 23 Jan 2025 00:56:25 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab814955sm12431470b3a.48.2025.01.23.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 00:56:25 -0800 (PST)
Message-ID: <d45aeb9a-7817-49cb-be9a-2526c4eb7838@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 14:26:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix memory leak in ath12k_pci_remove()
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, kvalo@kernel.org,
        quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250123080226.1116479-1-quic_miaoqing@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250123080226.1116479-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QC4OmeCJ97WkJE3vuVx9m3GcHczbohuP
X-Proofpoint-ORIG-GUID: QC4OmeCJ97WkJE3vuVx9m3GcHczbohuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=906 mlxscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_005628_680043_6DE0CB02 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 1/23/25 13:32, Miaoqing Pan wrote:
> Kmemleak reported this error:
> 
>    unreferenced object 0xffff1c165cec3060 (size 32):
>      comm "insmod", pid 560, jiffies 4296964570 (age 235.596s)
>      backtrace:
>        [<000000005434db68>] __kmem_cache_alloc_node+0x1f4/0x2c0
>        [<000000001203b155>] kmalloc_trace+0x40/0x88
>        [<0000000028adc9c8>] _request_firmware+0xb8/0x608
>        [<00000000cad1aef7>] firmware_request_nowarn+0x50/0x80
>        [<000000005011a682>] local_pci_probe+0x48/0xd0
>        [<00000000077cd295>] pci_device_probe+0xb4/0x200
>        [<0000000087184c94>] really_probe+0x150/0x2c0
> 
> The firmware memory was allocated in ath12k_pci_probe(), but not
> freed in ath12k_pci_remove() in case ATH12K_FLAG_QMI_FAIL bit is
> set. So call ath12k_fw_unmap() to free the memory.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.2.0-02280-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Miaoqing Pan<quic_miaoqing@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

