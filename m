Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61069C021B3
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx0UqVGkhKWBkaa1mMaE/JMLUCKUZ+tXgvAun+l0YII=; b=WW9uL5E4MCDHnQLLU/IJ9WF+JE
	AJhZyDZZfBlPzCunsYCN8qUghR27rgox76mKSXuqVzJpmmQn6hxDsZ+a8iG0R2zykRBUutsuTFzHJ
	cMnbTil0S/WnqcJmCNdgDglPdIoYR7+CxHMAzmSBUKxZ+Gwd2tRUGgeQK9iM8iscGcCSP6du3ZCf1
	SjYOi7dWiHaBTxAb8oz7P/ooEYKt9+YpXFZS6DZzUWODTk+ts1EA8Z2/kg7Zvm14CKP+7ek/pNoqk
	qK1COijLNsPlb3zPPpeLDzJbUWAKc4M3IrgzgfnFcHl2E3YMBxoq0yCWsIQNUM9VixFcBC0JSu1WA
	CZLJQTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWs4-00000006O59-0da8
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 17:31:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWs1-00000006O45-0Vxp
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 17:31:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDOkbX016262
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 17:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fx0UqVGkhKWBkaa1mMaE/JMLUCKUZ+tXgvAun+l0YII=; b=K9biuXYXYv9zXywN
	WOUnmmwyUYcxbAezF3gyylHaxO1VhTSVlcY0zc03lw7irQtvGCWAq3Fg2SirZr7h
	JEORy1rRVMWNYCHDmlo6rgtFPiF+ThJ/ljVv58e+EPNAE3tw6+mDMFGqMzHOIbAE
	E0x3CD7bhMSBrGBRWj39eAU0Nc+NJXy1vjR2MIGeR9y2ctQEkeLGK0CV/6zesO0O
	0QT/jSZj8T/Qo2sB3lb4aiExzs6UmKArJeOQzBCDEfxB/SIUNpfICMzV+HNfmVDV
	m5bto4OIVzHX5BnuEQdbksUuAk2D2F4+5Kwg6Vczw2d20dNuhnnACGNS/bsNrEth
	mdh5ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6t4ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 17:31:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220c1f88eb4so36552295ad.2
        for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 09:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159082; x=1740763882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fx0UqVGkhKWBkaa1mMaE/JMLUCKUZ+tXgvAun+l0YII=;
        b=XOquZirrZfWFONkeEGkLrOSxHywUf84oWQKPcR/2AogDO8gItqKiZzdLZD6BRneJRC
         cfqh147PTORf7N/5evWEQBUkYfNVrTleDFxvRhJ2PocVZIT+5yUAwvVKM7aPbXnp+oUt
         NGjDCkPRysEqS6wHUThyEkqsnnnHKXanxzJfY3j+DJcXk7KcmdGscbsNJxf03HL2Q0Mf
         bAzxeJ5ANI7rV2amzUAR437kwx1m4bCsnEqyMjcau6wnnKlKfV2z67QT4CfRzQa+yTlX
         JRdWAKX/njKarTqHdeDIMPR8K91BP1DtzzazM7tfRINa6chxGE+dL6rspGFJs26IA4lA
         1ZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEIFubW4a1l6jthk+eBh2yETIuOultxugmqWXpnQF/uI2lGjgcia4KmlINbJ70nVc27P92S8w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/DDyF9Tu8Bq1SA/jeSqAvsLcHRQPHT9F6glp1zW3cSSuMr6BO
	btbyppICUxjrra+0bzTDYgvfQzJz+E20nd+QqdxhDgox8NJvKiZ6OcQdFXdPLqjJyLqOld2TM8N
	MXKumwbl+tHf9+oBrtX94Fx53V6uWaW9B6hkAYGIIXoMrYObobXCXyDbsvsVSOEJt7lOZ
X-Gm-Gg: ASbGncsW3dzrtrYsCL37KOA8XfdQuyu7NK4c5oeVHZVeQHzgOeapIFdTxVtxfhgIqSM
	OnyO+V5dDHY05ovzs5RUVrY+vcNE83LkjNtlWcLd8bJc8u7/YG/jUQ0QPOGi7ehdJskuBa2/AhZ
	Bi12oZVcpJontQxsKzRynJZXdm2ckON+8RTzUQj9shzLyf5nlVo1i4aeU3VCtL23ojr18DiGvxN
	HdlkR71tHzp8ltOQJ9qzcqubHXVtB68L/cd2Qlpg9AIRJYR24nuT5FOyqJ9WDFKb84LWwSNwWh2
	z3n0dXWuLN6ZrxHWPa4HVT7HWIQkewZcWirfHE1k1xj4scFcreO+tMdC/vHx
X-Received: by 2002:a17:902:e74b:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2219ffb37fbmr67335975ad.42.1740159082333;
        Fri, 21 Feb 2025 09:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8zNaLjhEOj/4DPWXsp279Wbgk/TSxyoepH6AEAKBqWke58jY+4KeodCTob3iAc4+0GT9row==
X-Received: by 2002:a17:902:e74b:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2219ffb37fbmr67335405ad.42.1740159081865;
        Fri, 21 Feb 2025 09:31:21 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d608sm140143445ad.171.2025.02.21.09.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:31:21 -0800 (PST)
Message-ID: <413d7f5b-c959-5af0-b001-d3b9d487268b@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 23:01:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 8/8] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250221164110.3277222-1-quic_periyasa@quicinc.com>
 <20250221164110.3277222-9-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250221164110.3277222-9-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9KKi-mmJr6CPxGhsMmOaU6Lo7B7GDWOh
X-Proofpoint-GUID: 9KKi-mmJr6CPxGhsMmOaU6Lo7B7GDWOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_093125_280766_A6C0A2EA 
X-CRM114-Status: GOOD (  23.14  )
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



On 2/21/2025 10:11 PM, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 NO_VIRTUAL_MONITOR feature and
> prevent monitor interface to transmit packet. Therefore, add these
> procedures to add monitor interface support and enable the monitor
> interface support on the QCN9274 platform through the hardware parameter.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c  |  5 +++
>   drivers/net/wireless/ath/ath12k/dp_tx.c |  6 +++
>   drivers/net/wireless/ath/ath12k/hw.c    |  4 +-
>   drivers/net/wireless/ath/ath12k/mac.c   | 53 +++++++++++++++++--------
>   4 files changed, 50 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0b2dec081c6e..ed7365ce7f95 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1306,6 +1306,11 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   				     ath12k_mac_tx_mgmt_pending_free, ar);
>   			idr_destroy(&ar->txmgmt_idr);
>   			wake_up(&ar->txmgmt_empty_waitq);
> +
> +			ar->monitor_vdev_id = -1;
> +			ar->monitor_conf_enabled = false;
> +			ar->monitor_vdev_created = false;
> +			ar->monitor_started = false;
>   		}
>   	}
>   
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 46a55554c19c..a74afa8b2236 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -7,6 +7,7 @@
>   #include "core.h"
>   #include "dp_tx.h"
>   #include "debug.h"
> +#include "debugfs.h"
>   #include "hw.h"
>   #include "peer.h"
>   #include "mac.h"
> @@ -1431,6 +1432,11 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>   					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
>   					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
>   					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
> +	} else {
> +		tlv_filter = ath12k_mac_mon_status_filter_default;
> +
> +		if (ath12k_debugfs_is_extd_rx_stats_enabled(ar))
> +			tlv_filter.rx_filter = ath12k_debugfs_rx_filter(ar);
>   	}
>   
>   	if (ab->hw_params->rxdma1_enable) {
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index a106ebed7870..021a4b565e8b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/types.h>
> @@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>   					BIT(NL80211_IFTYPE_AP) |
>   					BIT(NL80211_IFTYPE_MESH_POINT) |
>   					BIT(NL80211_IFTYPE_AP_VLAN),
> -		.supports_monitor = false,
> +		.supports_monitor = true,
>   
>   		.idle_ps = false,
>   		.download_calib = true,
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index c0e50cc5c024..b90dad5cb2e0 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1323,19 +1323,9 @@ static int ath12k_mac_monitor_vdev_delete(struct ath12k *ar)
>   	return ret;
>   }
>   
> -static void
> -ath12k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
> -				struct ieee80211_chanctx_conf *conf,
> -				void *data)
> -{
> -	struct cfg80211_chan_def **def = data;
> -
> -	*def = &conf->def;
> -}
> -
>   static int ath12k_mac_monitor_start(struct ath12k *ar)
>   {
> -	struct cfg80211_chan_def *chandef = NULL;
> +	struct ath12k_mac_get_any_chanctx_conf_arg arg;
>   	int ret;
>   
>   	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> @@ -1343,22 +1333,31 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
>   	if (ar->monitor_started)
>   		return 0;
>   
> +	arg.ar = ar;
> +	arg.chanctx_conf = NULL;
>   	ieee80211_iter_chan_contexts_atomic(ath12k_ar_to_hw(ar),
> -					    ath12k_mac_get_any_chandef_iter,
> -					    &chandef);
> -	if (!chandef)
> +					    ath12k_mac_get_any_chanctx_conf_iter,
> +					    &arg);
> +	if (!arg.chanctx_conf)
>   		return 0;

Can this particular change be in a separate patch?

Vasanth

