Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA3AC0219C
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1ydYqdxUaQdR84ztrvdijLhSPF6ft9fgqrdmrqBnDg=; b=NdpcI6Zn1sHBNV187nZO7L6v+n
	Qsn+zI2y+DBsYIOjFIUyOrGxVqRba9kDgVxbC8NCgomhQtdds6NDG4xUButqU8rF7PaDnASzfmxN0
	6i6aj3j6TziCR/llZxWJ37U21pJlIcIzNWJho+yiRTJiQooW5alSxDjDiZF+bBrrdYGRkNjVb126E
	mtaGt8n72zHdhLHGiyLmvOkWLr4TelOFgmZI9XW32MTfpmYRwvmzuGVxUBfoQZXiS0FxrabvKVhIN
	V/swkFs1SFKewl0VnBMcdCDUpS9r7sRxQ/DJeYrAeX+VCeyxzRU28J1AS3MiobO4uGaSpnHq6SW7y
	h9fiuTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNU5-00000009W31-2ecm
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 12:29:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNU0-00000009W0f-28xD
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 12:29:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770Omb016589
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 12:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1ydYqdxUaQdR84ztrvdijLhSPF6ft9fgqrdmrqBnDg=; b=UbHnSJNAW/9Y4DMQ
	nKYHo3EeCnaJi4XId5b4lKFS7Tg4qdGs8x73nG+8EyDwE9HaVf6yxmLDEUYw90Ac
	eNk22Xi190dMKAVh2fcuSqWE/+vCMzHmedMDmFKeQSODIdfi/eHTq1p/Zqh6NOyh
	UYgxT/U7ni/mF/xK9JXxTRUwq3hWFCB+aW0Q1IoF5AWX3IsC419AfcMWsQBsmcPD
	0UbwSXsq9aA3W1XDIPZr1NFHm8t39JVUsXLc8je+jA4t8Y6t2UeaFsBAO/+I7Ysc
	grEaqR08w4aAHrVBuo3VJxyaZ8xLAXnpBr6E/jSGwnm67J4AtYEW/NIjlk7BpNTq
	t0nv4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddh0u1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 12:29:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so4381081a91.3
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 04:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931359; x=1739536159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1ydYqdxUaQdR84ztrvdijLhSPF6ft9fgqrdmrqBnDg=;
        b=T4LTHrOGM1tY+Zkl86spqKxRgr7My7Qu/A2QeBykSmfreYHxufWLjYe0BiclkHG1SU
         xX9jhWsU8eJRAS5ZmgF9FLJYQG/DElKeN6McyTrz/MDqK+Rwymlcz5+uBJXEROlV4Ilp
         WP+5/dktVRAzuspkXkQUnQU2HDbxOpRPhMIonwt5hRmPN7PIMQpG7F1TWJUCeA6buCU3
         h3cHt5V8p4u6qbKuNz9L7Vl0eU+Cr3e66kX0ZMGwQPcnjliKGV5+KS8dKMDCjh+SWE2s
         XoZMPCiqvfytltnyC7vq80fT1kAXwCYtb1fYYnUZtneGm/J1bZ50WvhGEtH6MfSTsHdi
         FpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv+OMS5V53gGc5N8acEXMP7eSztzUD84RZ9BVkr6BwNGr7Hb1p1Qt7YIG+oo9+nM6uKJeBwE0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHFNvSBvOjuDr2swXl/+YMxvKObLyV/BfS6tjXcxEZZvjJq4IV
	0bLktJ4KFbFol84d4wIgHkU5+rXVe2KsETzCIOicGJVG45Qbg0gJ2V3oQXu43vsoTTRRXaLCQLT
	8WBvO1NNm0P/XAraZW6mhM0QgGtVDUHLPg1ZJ1xKDjARiCayJ7AgKq+dASOHc
X-Gm-Gg: ASbGncsqrU+1udyrogL9DDciuN2cF0zhGjfP7VYHynrOwrICFKIZDRqhCtWzvtZGxCG
	5mNLprh/9D9w6jCk/6bKtK6/EjTHFTXFG2AzY2mk/suuchqnz20oWxevZu6ejoy/T1dwEgcVG8R
	Uo/5ygm6bnNnA8HSZyp6l6Za/UoisDuBdbiFi6XAcKObp/2IPCwEtsBljr2risUTx0DodD9bkJw
	K1BAn2zj7fe+qZY5xQ383Y0/IOIil0gpKjr//r9LANzcQd6DwsftAyjA44/HR+jCtO5USqDwN0s
	dnMoAny6nEvCHpAxqP72KgHT3WziFBg/U+Ev1AtCLFmJVPGdrNTsWQ==
X-Received: by 2002:a17:90b:4b0b:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2fa23f550d5mr3969758a91.5.1738931359203;
        Fri, 07 Feb 2025 04:29:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMxgmlLbEWVbPgyaes/sOvd2b2YCpqqs/A9FAGdUJJ5nIjSP5Nr+2vmEqU0y759wPN5Y7OMQ==
X-Received: by 2002:a17:90b:4b0b:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2fa23f550d5mr3969729a91.5.1738931358769;
        Fri, 07 Feb 2025 04:29:18 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3e83esm3196336a91.38.2025.02.07.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 04:29:18 -0800 (PST)
Message-ID: <206a56d7-af6e-4fd5-c51f-43e38cdcdd19@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 17:59:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] wifi: ath12k: Remove dependency on
 single_chip_mlo_support for mlo_capable flag
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
 <20250207050327.360987-3-quic_aarasahu@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250207050327.360987-3-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QjLfCWxQDzgTwGXVcgjDUka3-uIuiGH0
X-Proofpoint-GUID: QjLfCWxQDzgTwGXVcgjDUka3-uIuiGH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_06,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=847 lowpriorityscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042920_557470_DA454F13 
X-CRM114-Status: GOOD (  15.19  )
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



On 2/7/2025 10:33 AM, Aaradhana Sahu wrote:
> The mlo_capable flag in structure ath12k_hw_group indicate that a device
> is capable of operating in multi-link mode. Currently this is enabled
> based on single_chip_mlo_support advertised by the firmware within
> ath12k_qmi_phy_cap_send().
> 
> Since the firmware advertises multi-link operation (MLO) support through
> the ATH12K_FW_FEATURE_MLO feature in firmware-2.bin, there is no need to
> rely on the QMI phy capability (single_chip_mlo_support). Therefore remove
> the dependency on single_chip_mlo_support to set mlo_capable flag.
> 
> Below is the impact on single split-phy PCI device with and without this
> patch:
> 
> Note: This patch does not change the existing behavior of the single
> split-phy PCI device.
> 
> 1. Driver without this patch + firmware with single_chip_mlo_support
>      as false: MLO is not enabled.
> 2. Driver without this patch + firmware with single_chip_mlo_support
>      as true: MLO works fine.
> 3. Driver with this patch + firmware with single_chip_mlo_support as
>      false: MLO is not enabled.
> 4. Driver with this patch + firmware with single_chip_mlo_support as
>      true: MLO works fine.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

