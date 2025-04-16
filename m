Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9ACC369BA
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 04:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWPEkmma4e919v7Fo7yYcsZdAb8gLvstwZg1mAkXsEI=; b=ytg9grVk7OlaPxcF2Nei9NxaMI
	GD/YdDDJr8KWj7MU5qXGmqiF/gNMIshr09NUoKecRHn2PELDUvsUpiBqXkd99PQWHtyltrowX1WEa
	b2Xo0JynGU8VdfctwGaq8gKmK1nzz4yDEg4mUw09uZPUfy4fItLCgnRWlC/GvSN8atOJi3eXjEPPt
	F8S6VZrSYDdswzb8E+OPlyoR/sAtj3yp5KWJCbFU/nM1F1NGD5VaXyVlPdHthjXhpsiFOxBXEM/jG
	DJKEbEwfZGO1uqJ7uZC8NxlAWaFkOED1KKoO8Ykj5p+IEvUYNvpV/VN0VOd7KEU3fyZYXc1ADsgMP
	wu2rk6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u64-000000087Ka-1kiS;
	Wed, 16 Apr 2025 04:10:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u60-000000087K7-2i1B
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 04:09:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIBWAH022962
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWPEkmma4e919v7Fo7yYcsZdAb8gLvstwZg1mAkXsEI=; b=otYQoEz3g7Hryyjs
	7fjLEV2eakQPVEvdPT6egfTDCJm2oNrqvX0A8qdi5nNSv51HCtG6zzSqHDvDlrzT
	JnPUqnodLbm+GBd5GvXdrKTqe8vEItiByIt3G5X6Es59yzRcpaaVdviuBlwtvZvz
	QlEhQTQpbnZynlYfIwVkFM+2nw7ZuYkpwz1Pjv/cekkr0b/PEM9YhBp4haG1Aea4
	8gfBCU0PBePHhYacR55GVB1gUsIL+dULLIrqM7FaJHZuhbf6Ro6qrQwbB9DRzs7h
	wDpYKORO7p14qq3Lx4dTAn/jXo6B23rj41oDMtGhXzjYWKkJvoUJEx1WbtL54ca+
	UaGYEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9a7sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:09:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2262051205aso43779825ad.3
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 21:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744776594; x=1745381394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWPEkmma4e919v7Fo7yYcsZdAb8gLvstwZg1mAkXsEI=;
        b=QesXqemyDSs1/WIY/jrOWwXposv3BeicYtMqQru8ZwS0F+2ZBPFRwF/WgsJBSKE+9/
         PLrccpZ7KXdqzh12t4gUFnnHRket2J8xyLLfas8k9V+7tsc4kw0v8OSA/yQbrinejin6
         syUREtZ2VvNIlW6BxGg4L552DikOdqlSbfRvRzIuMMtgEH2ecVOKOBLzH1CeSZ95bFkQ
         F130M9UFnA2Pkr8cTdUZP1QeMGK2ju0+CPH8H1kOKZ/SZSpV+MbpPr5sYWglix96csq8
         oPIUfsOIWEKU4Fi71R29yV/CpKrTqwKxdRuogXl9vRigM/3xOwtId0ZxIevayeF6E7BJ
         eE8g==
X-Forwarded-Encrypted: i=1; AJvYcCWt1nrBeuyLZag94fabYSfZAAox2DeyRP+Rt/ccaa1BukVTXTTM3Z0izKCcFkEDBneeCJs5L8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3BimE53mIKL/5TL3OAZbVmXN/UiT8bntX7KfpR85sPnvo3q9P
	D0fGDGfH8U9LouaYA/1l7n6L8nnsburHdKOqWqMVvBct9UACiCdAGcEAq2nPeUEC79qqrIZ9786
	W6OF5yYYz3wZb49t70kYc0GQPohD9WjWHBVHCFVoklXgXOeomPKvSnB9YWR7N
X-Gm-Gg: ASbGncszkn1QucJa4JCQeEcHfqMsuNSbS+y2cOWHv1rWifD5mLyWC2494Ks9UfexW60
	MByAglDg4cLMo5elyCtSMSQfvdjKzJnovFg0H3bwyAjet1SPkPJ5NjPMdB8fi4j17dJP9QnylkY
	BlgkMVM9rrMrDfO+3A/jwbLqbiEnK3m/XWfv+JUV0S5OnBmEwbyGLf+Xu3Qje9LehGChSvNoL/i
	Z7rQmaorUe/mOF/IqmDy2e+FnToL9eEXeygWavYqC9Ifj8vqASlnOlRuZN8nK6W8U2Yuv2C1zzs
	3NozBJ6aRYjuWDwq0njmVvaHhJUc1+E5ty90zSE+FYHdp0+BCLLPDA==
X-Received: by 2002:a17:902:ea06:b0:224:216e:332f with SMTP id d9443c01a7336-22c35985b76mr5316275ad.48.1744776593821;
        Tue, 15 Apr 2025 21:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBhkelHgI83PIttWeBMPxd6pmY0OjAfrGUcozBkqmgnCpV3zVjhV96f5VroGDLfyseFjm6ug==
X-Received: by 2002:a17:902:ea06:b0:224:216e:332f with SMTP id d9443c01a7336-22c35985b76mr5316025ad.48.1744776593454;
        Tue, 15 Apr 2025 21:09:53 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1035sm9369218b3a.114.2025.04.15.21.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 21:09:53 -0700 (PDT)
Message-ID: <e789aa3d-ab12-ed19-0d58-012004e365d1@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:39:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: Fix frequency range in driver
Content-Language: en-US
To: Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-3-quic_rajson@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408042128.720263-3-quic_rajson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Olim2VkngRJ2KWpugPycBcS99QCDDlPf
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ff2d93 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-MRtn_aAFlfTcB5G1b8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Olim2VkngRJ2KWpugPycBcS99QCDDlPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_210956_812375_229B26AF 
X-CRM114-Status: GOOD (  18.59  )
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



On 4/8/2025 9:51 AM, Rajat Soni wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> During the initial WMI exchange, the firmware updates the
> hardware-supported start and end frequencies in the
> ath12k_wmi_hal_reg_capabilities_ext_arg structure. These frequencies,
> being hardware-supported, may not always align with the current
> regulatory operating frequencies. When operating as multiple grouped
> hardwares under a single wiphy, the driver advertises these values
> directly to the upper layer in the per-radio frequency range,
> which can be misleading.
> 
> Sample output snippet from iw phyX info command -
> 
> [..]
> Supported wiphy radios:
>            * Idx 0:
>                    Frequency Range: 2312 MHz - 2732 MHz
> 		 [..]
> 
>            * Idx 1:
>                    Frequency Range: 5150 MHz - 5330 MHz
> 		 [..]
> [..]
> 
> The frequency range displayed above is incorrect because the driver
> directly advertises the hardware-supported values to the upper layer.
> 
> The driver is aware of the current operating regulatory rules, and
> hence it can use this information to determine the final operating
> start and end frequencies.
> 
> To resolve this issue, add support to store the start and end
> frequencies received during the regulatory update event.
> Then, intersect these with the hardware-supported start and
> end frequencies, and finally, advertise the intersected values to the
> upper layer.
> 
> Sample output snippet from iw phyX info command after the fix -
> 
> [..]
> Supported wiphy radios:
>            * Idx 0:
>                    Frequency Range: 2402 MHz - 2472 MHz
> 		 [..]
> 
>            * Idx 1:
>                    Frequency Range: 5170 MHz - 5330 MHz
> 		 [..]
> [..]
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h |  9 ++++++
>   drivers/net/wireless/ath/ath12k/mac.c  | 39 ++++++++++++++++++--------
>   drivers/net/wireless/ath/ath12k/reg.c  | 13 +++++++++
>   3 files changed, 49 insertions(+), 12 deletions(-)
> 

You may need to rebase the series

Applying: wifi: ath12k: Add helper function ath12k_mac_update_freq_range()
Applying: wifi: ath12k: Fix frequency range in driver
error: patch failed: drivers/net/wireless/ath/ath12k/core.h:1122
error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
Patch failed at 0002 wifi: ath12k: Fix frequency range in driver

