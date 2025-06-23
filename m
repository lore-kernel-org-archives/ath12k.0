Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FEC7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYYI1PSVSslndP+Y1vEtSWhPe5cDz1pruNBScyDqPIM=; b=rKu8+eoSGHGpcUb1nfgITaAlix
	+rs1P+FFpC6I2XVgseq6Eaa3Fu0X8i0RPWvDCpABm/4Ne2yM7w9UaFpgff1QsjBJKhEm8Cv4sQp7S
	LKMWDk223KxtHqrHQmRW06O2/4u1JVvJOBhjI8TxloNda271A7e/Ot1vc/uikIO7R2vv2MUSZTaGy
	m4sfDrAtraSIWLu9fgj4hBEUU4i0mW/xMT9IAgX9XydHYDBsuh0hHiHhLcKIwmnyP8bt6ERDOPJ4N
	RZcpvKgBAzPpVKE/wC9pXjpjCBIxItlP5CUdPk/bcwesXz6Fan/jJ48uh+kRSWyjali+FNwBNOsIw
	/wZT9oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3a-00000003pU7-3M5Z;
	Mon, 23 Jun 2025 19:42:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjSE-00000003JW4-2m8Z
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 15:51:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9U1Pc021986
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYYI1PSVSslndP+Y1vEtSWhPe5cDz1pruNBScyDqPIM=; b=pivD3wi+mToh+Aj4
	iusKU7MzEl1DNzvcwUV9uWR9giA/Uh4clsHW2ze/6FeHCN7H0NuWti5nsNw0VLB3
	JL2BBbjd6H/7iMzJfzCs2dGHh8Fr1Y22bXa90iOa4iyLj3Z/ESJzteuuAS5lifM5
	1AG4gil4mmdm76m7GKQ6bUeUHiOHeC+FwBGLZGM/cqfqNksyZj5YbJzgMjGOmyMy
	2sQuVLcTHdh3nLZsr1TRMFf2F8i1LXUxhbX/A0x0TU0/brfVFDD5Qtv9+bt5bCL7
	e6FCSgjvI5rPKtRp/zkuWiL0zWY2jPRsczMBxc8wmMG9Q/KcNKoPjqJ2s2lfd/UR
	7nW+Yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3s2wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:51:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so2778065a12.1
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 08:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693889; x=1751298689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYYI1PSVSslndP+Y1vEtSWhPe5cDz1pruNBScyDqPIM=;
        b=mewIaKEtsN3jsC5jUeD2ivh9Rmm7JLlMKJnIfNC/y12KFLEt0YDhbdDqmXtbc0+FTh
         L7xfgJ/aEw5jD3oopj9V+uGeN8iwCanjoSKQNzZ6udNLq6U1wg692JEKbgJHOYMbjXi0
         jm+PTifDavpSGNuZBo1p177T6TpArLQ5RwT7cg2U/4FsAEGNSIqGaAole6bvM0uxiTBY
         dVmRzuhjcAYSkG9NGp8/aoWrM3zt9ZUJ9vQwhNeCzf4AlKtdShwNCRcNM4SrMshXXc6k
         absgpR7R3DTmijl40vzrrnwrhHHD91jRXfhHpBwNYvzdx4qA4LiM6WdSAPshiFVtwjON
         5nTw==
X-Forwarded-Encrypted: i=1; AJvYcCUfVJY0Iy87aGzPEFJ6ii1DfkFCDm470VBmCnTwhV0EzcVuv0zIrtLqN3vUEseSfaXl3Mq9Bbg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4cQw+n5I18mesJnsO4SEVJAk6gU50HHcyrb8Rzmmo6fm92dwy
	uTm0MvCmcJJMdrIu50kg53vDEKXcTaszOOuf7j9vx+lBdEXVyoP8mopSjz5JIJPOCHKHDjVVar7
	6sEJ2xEulGCzCi/wpgQUeqPush/IrCoRXTcQzfFLIIEgqMEugTtaoUBtgS1gg2Bmd
X-Gm-Gg: ASbGncuZzbbaAZZkHNk4q2DKaWUk2uFI5d+9OGNqrhz+0yR/w+7Ha0elcUseMXqR7Hr
	IOQua7foWuQEid/zL/Tg2Zcul03k4hNU1uqSPV0Uy84W3D0KsNSzUvtJNU7NNgTJYIazYzBpxwR
	G5xFb4YaRyNTZNW0UrIG3qfEj6iv4hXq5QMa1R8FDSiqBwN6AMOhp3C8ZNHDel2th6aYToaEobr
	O6J18yfBIs/yiKrW2zfrpidsxbOJ/jOC3FlWSNhsvxTDCZPeVv1M4NRem4TZ1hE2yqEZbijLySl
	zCxxe2c7grrrTTlqTRyLNpvJvelsq48XSYzpdaddVoHaFsPRVv200bVVpRR5rg==
X-Received: by 2002:a05:6a20:3d1a:b0:218:5954:128c with SMTP id adf61e73a8af0-22026f666ecmr17570754637.21.1750693889166;
        Mon, 23 Jun 2025 08:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTB8GCNbc/2fzaaqVs5wa367l84r5Matp1+jHk+iiUoxVmPBfLwYPyatl5Ffn2X2iX0KN87Q==
X-Received: by 2002:a05:6a20:3d1a:b0:218:5954:128c with SMTP id adf61e73a8af0-22026f666ecmr17570718637.21.1750693888678;
        Mon, 23 Jun 2025 08:51:28 -0700 (PDT)
Received: from [192.168.29.88] ([49.37.214.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a62633fsm8440158b3a.84.2025.06.23.08.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:51:28 -0700 (PDT)
Message-ID: <8e774154-1594-452c-858a-e16376dee09d@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 21:21:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: use real noise floor value
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
References: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
 <500a10c9-c56e-4192-818e-8e07ef6c51f4@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <500a10c9-c56e-4192-818e-8e07ef6c51f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NiBTYWx0ZWRfXxvMbm9bHpHS9
 W/pE0lUJ7tabVO8VQMmVNTSlR/PgNz/pI9NIc2uGxMukyv0qdkOBS8yjt8uSZklvE+4TM1+95cb
 qov3EJODd/R/qRWbfrOYu9b/gftrPyel1ESQimzVfHsUh1ajwyzXY9xip/o9PRWXyWNZRFhn71S
 QjnbzrmuwoeByooHRDruv+gQManarp3f0bkvlMcWvZrjbbOam2LMQ3nbtCg5kDZEnq4JP+h5bVd
 xZ+UMOO9ScG68+mXHoGaI84R4dipSXkJUwLvA9SW+2aIK154zIpScrG3ivATliqhjOpDCfAhptX
 KEx0XUAtedACWyRVCdpGMP1wRiBJrya8sT+JYl9kpHeaVdTcu5NcQCSiMeh/qJm6qQHLXIWbOYX
 bNAghxqLTnIP+b1/XgvoKbiGqITbkDUuA9vSaEySjlVLHzcgIzrkGkwBlXK5mbEW7zxYD56S
X-Proofpoint-ORIG-GUID: 822JWaXjUMN9WRuLuHRkAP2vFE4SwZ8S
X-Proofpoint-GUID: 822JWaXjUMN9WRuLuHRkAP2vFE4SwZ8S
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68597802 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=wMrS+Y4uhDqG1CA/WHymIw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=eRXGc6zcnUY8UlbqGOwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_085130_708196_83F5D5FB 
X-CRM114-Status: GOOD (  17.77  )
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

On 6/23/2025 8:30 PM, Jeff Johnson wrote:
> On 5/28/2025 4:23 AM, Aditya Kumar Singh wrote:
>> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
>> value, providing an estimated noise floor value. Consequently, the RSSI
>> value is also approximate. This works but however, using actual noise floor
>> value will enable the reporting of the true RSSI value.
>>
>> The firmware possesses the necessary data to determine the actual noise
>> floor. This data is provided to the host via the WMI event
>> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
>> runtime parameters needed for calculating the real noise floor in dBm. This
>> event is triggered by the firmware during channel changes, temperature
>> offset adjustments, and hardware chainmask modifications.
>>
>> Add support to handle and parse this WMI event. Use the received values to
>> calculate and store the noise floor value and use at the required places.
>>
>> ---
>> Raj Kumar Bhagat (2):
>>        wifi: ath12k: handle WMI event for real noise floor calculation
>>        wifi: ath12k: use real noise floor instead of default value
>>
>>   drivers/net/wireless/ath/ath12k/core.h   |  17 +++
>>   drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
>>   drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
>>   drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
>>   drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
>>   6 files changed, 324 insertions(+), 9 deletions(-)
>> ---
>> base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
>> change-id: 20250513-support_real_noise_floor-205986936cd3
> 
> This series no longer applies cleanly on ath/main, please rebase
> 
> Applying: wifi: ath12k: handle WMI event for real noise floor calculation
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/core.h
> M       drivers/net/wireless/ath/ath12k/mac.c
> M       drivers/net/wireless/ath/ath12k/wmi.c
> M       drivers/net/wireless/ath/ath12k/wmi.h
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.h
> Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
> Auto-merging drivers/net/wireless/ath/ath12k/mac.c
> Auto-merging drivers/net/wireless/ath/ath12k/core.h
> Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.h'
> error: Failed to merge in the changes.
> Patch failed at 0001 wifi: ath12k: handle WMI event for real noise floor calculation

Done. Rolled out the rebased next version.

-- 
Aditya

