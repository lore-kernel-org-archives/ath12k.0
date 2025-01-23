Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399BC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHvSd1WT3SBkG9tz2wQb2UbWB64CD0js5I+DnfBw1Hc=; b=y9PwAOUUDguRnwSVbSwXxhRAGC
	kCB+mduhuD5s/PcQL++QiS6bo1B5vdDwmCJg9NM4y4EFwoGWF6+pDu/p+ckFxg3ZKbU8LI4CI+6xv
	8xGVnmq4XhhTI6GbWZb+3Uyzzu9sUiXB7Yxrp9af9R27oWEaM3quMRjX7Vs7/nnM+63FCiz7EuBHa
	HMzjaCPP4WLde5PfEa0vqW4PFZxHhaqa1wOTaoERhiZtqHJSiJ8q6hyK17muvd6SGhiwTUIHRfv6i
	eMKxPWRVnK/g4gNFVdtKttdC34LochWVqJpKwhiOImaZUq1k8UOu3OjAWd5XvTbBvrRc+UYTMNcV8
	JLY1eIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Xr-0000000DCoX-1FAv
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 20:11:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Xo-0000000DCoC-3GnW
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 20:11:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFUKbM009046
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 20:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHvSd1WT3SBkG9tz2wQb2UbWB64CD0js5I+DnfBw1Hc=; b=ZnXs6VbGViuqi7E1
	rrxkSp8hZSJgg2AocP2sknSnJ3qwe5g5O9wAIx4o85rHI850Gz1VY1YQgdI/ifGn
	PhIytD4zMnqF9p7uswkk6wlyh0o/YOnBvzoBj2s7Zmbgrw0DsinSMK1dol8TBA4r
	Hmx+Xuo260cA6C/P/thC9t70wz3Mad/1zNVfldzC++5V9X32gtiMhTtni44P9P2r
	yayzEejOJ25Y30l2viq0f4zIfSY50JfvLSvLLk+kC2CDcbgOsjPu0843ezkchlkW
	9UVUbFqUeGBgobjYj6jRS7Dvu/Zdm2LY2ifnx7QT7GS4LtN4SITroGqyvlsTTNwj
	SwKeAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brf50n88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 20:11:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-218cf85639eso36697435ad.3
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 12:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663075; x=1738267875;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHvSd1WT3SBkG9tz2wQb2UbWB64CD0js5I+DnfBw1Hc=;
        b=QbHRDHBH29FcGzULPoAB6HdDeBl/FvvXxbHbE8LYCVdw3VpZHBhfVb4GtLX8KRt+e4
         aXFpRi3LGz/sozUDc+uEyI72GQRdztGFEiOq4Vt3lPtRx3sqJlsZvh1+6sUtKQDmOnjY
         GyoAXJWVbr3W0dZvVg+cdGKYt6DuyQu6fA0slEXdEokotgMQqajGQl+sbf5Hn+Zc96pA
         9twMZPIdGiADGqhu5Ilkf89Kb+xQjvSKxLjftX/ZWr4p/cV32aeXkjPSuhw00SYXtO1a
         rLvzfGMnMdKsI/LMlEhf/Xczm/5XbtLsmCenjwOX8AOHnyEJxx5k2ksyue+cdiCLBE9c
         /lag==
X-Forwarded-Encrypted: i=1; AJvYcCVPc20S5mXks8ISqXvTgwXBvWU9IATvOu622trDJfzDjcDa0V5MTbG8ducGtJNTpnR6uo1HXxs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiR1MzIuW8UWjpnqBBEsjO202mcz46B5ILCejtjKWbbc0cuvkq
	Ok+H4TWPbhunusPyuoNbQrtTNOdavs3dV9Ppn8Vd/DOuOUROg9iR4TGhjODy6Vy3zxJFBV4CzSe
	LagIQ7imBwOqrNJeTeWnNfuHMWK+Vs3nlMZJhYXzyCZ0a/szsNdmsDXs8yvJt
X-Gm-Gg: ASbGncvxryuIA/EjkyBFwhUJLjhbYHXijJTpssfUl+iExTwleLGeQg8qP4ni7ZYhYEN
	fmv2uJSz+VnctaG8eE4wGBSVswnHrsiXQlzIa2erI37lyzZbeCPpffVoM646oRqgZGpmaXFElKy
	+AXyGdd8iEf8Xq4uyKXazH/SyLO/ATgdA6GAn8G09frkr6guKCIoiixNynXr1uGN3BqwCAMBvi9
	cKTZQsnO0cUv0PsvA6/b/uHHFI9cION60Q8naDdROYRgBHGpRZlJYdpk6zwHVOP2MOZ1HYz+C/p
	qgiG59g+2CPzhUoOpsuZxGTKtIGaQP7yaZlMAbzrD3tLNgXlZQI6Iknv1i+4vKQ=
X-Received: by 2002:a17:902:d4d2:b0:215:620f:8de4 with SMTP id d9443c01a7336-21c352de109mr426076325ad.2.1737663074763;
        Thu, 23 Jan 2025 12:11:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDxKcJEKy6x66XnF0OrNGHZ2Y0FB/BHCUKMrM/Y50SzSlM4B/qgSrvMNHPA2HcDQe/GBAZPQ==
X-Received: by 2002:a17:902:d4d2:b0:215:620f:8de4 with SMTP id d9443c01a7336-21c352de109mr426075965ad.2.1737663074321;
        Thu, 23 Jan 2025 12:11:14 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414edb3sm2861555ad.202.2025.01.23.12.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:11:14 -0800 (PST)
Message-ID: <076fa04b-b2e4-4831-86a9-bff21b8dc5fb@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 12:11:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] wifi: ath12k: report station mode signal strength
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250115063537.35797-1-quic_lingbok@quicinc.com>
 <20250115063537.35797-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250115063537.35797-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A6D_L8mPK41bn1fOivaa4osEm03vF4su
X-Proofpoint-GUID: A6D_L8mPK41bn1fOivaa4osEm03vF4su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_121116_908193_18258936 
X-CRM114-Status: GOOD (  11.88  )
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

On 1/14/2025 10:35 PM, Lingbo Kong wrote:
> Currently, the signal strength of "iw dev xxx station dump" always show an
> invalid value.
> 
> This is because signal strength is only set in ath12k_mgmt_rx_event()
> function, and not set for received data packet. So, change to get signal
> from firmware and report to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct signal strength.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  36 ms
>         rx bytes:       61571
>         rx packets:     336
>         tx bytes:       28204
>         tx packets:     205
>         tx retries:     49
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      83
>         rx drop misc:   66
>         signal:         -24 dBm
>         beacon signal avg:      -22 dBm
> 
> For WCN7850, the firmware supports db2dbm, so not need to add noise floor.
> For QCN9274, the firmware not support db2dbm, so need to add noise floor.
> 
> This patch affects the station mode of WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

FYI this patch did not apply cleanly to ath/main

* Applying v10_20250115_quic_lingbok_wifi_ath12k_report_station_mode_stats.mbx 
Applying: wifi: ath12k: report station mode transmit rate
Applying: wifi: ath12k: report station mode receive rate for IEEE 802.11be
Applying: wifi: ath12k: report station mode signal strength
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.h'
error: Failed to merge in the changes.
Patch failed at 0003 wifi: ath12k: report station mode signal strength

My trivial fixup in the pending branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=a94d6e4db20fa42180d576207de8d5e2f5533823

