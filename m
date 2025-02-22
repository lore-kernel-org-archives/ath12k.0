Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34655C021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11Ysi9GncpivA4iZhlsuFvjSxWJFI3QjA/kbsHHdxxM=; b=m6bggUmS3DVSqU6g0NFKPSupR0
	EoEyfLrZyiQei/SLG2cbHWkb+n02rOFoxPA9pcDDFer6lGbgauuvm53qL4kCSmJ9tJuxJmj4LLDyN
	Fp7cxZcpjt0PY06bIpkG5tgLKizD9drISLNE/25XODQ9lB1Qn570kI4yqyhA0nLHCIF+/8j5sMyzN
	ugo08GXbKFVzczCQ10+XfK25XxuNAMUyKlLnNTWjoBTnbQhLK7DRFZyITtjgtTjqegPHPFmaHWSg8
	QvFNdlns6bD2W4y9jtUU/NsX0PB+GYMJOIQzURqLBdLOaN5Yj8SKjJSfHKQy85vqZDVcpkTuofscI
	263LgAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqGj-000000088YR-3wkT
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 14:14:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqGh-000000088Y6-1w9P
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 14:14:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51MDhorO013051
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 14:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11Ysi9GncpivA4iZhlsuFvjSxWJFI3QjA/kbsHHdxxM=; b=kF2cwUdpMYe7ArLe
	aM7iPtR0elv6DvqbCvmI+2SWd7cMXhRDgpCdfgsNgGJRu5OTTf32kwf33riFyu/i
	A+3cpIJXCjG6/u6607IFuQW/WGm08BoSHHKzbY4M51jTTv5yTLq+vljqSEJpC6Tg
	u9xAlz0vBsPMK6NZeTA61XBnmspo1G0QuUNHrJMO6/bzt1SbxKDmCu1B3+37dPcq
	08xIR+kglfzeH1y2DpRzJGOAx39yqFag4DuL8olFGiYtE3KvfRCKcw5QSGQx8Xke
	m32dKe6cOBa8gwkdjx6VtEAjzfAz9FR+HkwMrdO7/Wleg9RH50Hu7miw/F1EFHmq
	bGPdKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5hrrvbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 14:14:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220fff23644so78994405ad.0
        for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 06:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740233649; x=1740838449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11Ysi9GncpivA4iZhlsuFvjSxWJFI3QjA/kbsHHdxxM=;
        b=JeVFV9sMSKIvCccBBkrBuV1ooHWorKE64dwvzGysQbk94htPMhQIeuzuExULefn7H+
         ABEP31T745LzFMrVSiRheY/ZpwBlUYV4hfWR/LB9bYahyq+VAq3pYkPGTQWKsKFQlon5
         StrbbF7WlCF1eKzFVYylm329GJ8UNNsw+vojkPbzhARBlNTJLEOD35z5w+GzuhK37qxD
         TKrOUaJ8zVblxAoNq9i2z0m/Supu9EcLEs2zUVFfP/qcZ9K6ltcYbthl/YR96OidR5rz
         jlapaMRUIrQgqhlLFFfR1wawZL7HH5hG6SRCBxmKsY5884+NXw7WAi33JuBWxvmVeMC7
         9PWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9Ot32HUEKxKnDuqb5CDLJIeW06x2PtQbSPwlc1EyZ7gLKcpDUrAQEovQiGC9PvdHbYfGm0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2MrXzhOhPpwRGq3aO9G8S4UX31Dj+R1sMqTHSKriWd9+8zPn
	JLpM8hbbi1yGT+IYWZbpVq+Jcj2ndbC3ejyxlwrXDkUisCoRNnUUP3WwXLOUSe9EparZ3OW829C
	qitnvveJ4yEqIXIy6G5uaBwITMCjQBW/eMyHFAFYK5PE/Hwn1K5J9l+7LOvaY3VVl+NUk
X-Gm-Gg: ASbGnctkTKjNSA6akIXAadOYKKQ4r78yMVrYRqsLM6/riXuTZcKtWkf/uNe4q90x9i6
	emutUkBop8/EXEP1B8r2JToz3aFtAsj0OTae9S0aY5sD8dLErD1tP3bO0JkwoBLBGyiUbqLRinl
	PKi+KIFIyhLNwhX4odjWomJuht5cm6T5vcle3uhYD+Jquq+elQUM7puo4wmOj88iM5u8FESkAGK
	weVrcYoOhK+45MnThJRfvJVwWnAUIs1+dbRD+gyuJWhl5nIoxlb+X8HH0scsfRvqDKmFBVNRc+Z
	tO0itjiSfsMzMz8nscKcCGS6Jtv58MY61frRmrYaUHhotiRs7yx7h3Ba3AP8
X-Received: by 2002:a17:902:f712:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-2219ff515dfmr133984495ad.14.1740233649318;
        Sat, 22 Feb 2025 06:14:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH8sD4+nQjwo6K4SBTdob+GiTVg6eTkZ8AQCtt9sa0XWlNmOlScXD/NaeiBJYaHF2Y5/CBJQ==
X-Received: by 2002:a17:902:f712:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-2219ff515dfmr133984105ad.14.1740233648944;
        Sat, 22 Feb 2025 06:14:08 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7340a4b3779sm6768454b3a.109.2025.02.22.06.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 06:14:08 -0800 (PST)
Message-ID: <8385965d-1be7-12e7-b636-1a0750ee8762@oss.qualcomm.com>
Date: Sat, 22 Feb 2025 19:44:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 9/9] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250222033002.3886215-1-quic_periyasa@quicinc.com>
 <20250222033002.3886215-10-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250222033002.3886215-10-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HfeBF7qa46DRPp_-8Ah0UF5DQyhjDBN3
X-Proofpoint-GUID: HfeBF7qa46DRPp_-8Ah0UF5DQyhjDBN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_061411_527386_D4276183 
X-CRM114-Status: GOOD (  22.82  )
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



On 2/22/2025 9:00 AM, Karthikeyan Periyasamy wrote:
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
>   drivers/net/wireless/ath/ath12k/core.c  |  5 +++++
>   drivers/net/wireless/ath/ath12k/dp_tx.c |  6 +++++
>   drivers/net/wireless/ath/ath12k/hw.c    |  4 ++--
>   drivers/net/wireless/ath/ath12k/mac.c   | 30 ++++++++++++++++++++++++-
>   4 files changed, 42 insertions(+), 3 deletions(-)
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
> index 54af9cbbf7cb..b90dad5cb2e0 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1349,9 +1349,15 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
>   		return ret;
>   	}
>   
> +	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "fail to set monitor filter: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ar->monitor_started = true;
>   	ar->num_started_vdevs++;
> -	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> +
>   	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac monitor started ret %d\n", ret);
>   
>   	return ret;
> @@ -7334,6 +7340,11 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>   	u8 link_id;
>   	int ret;
>   
> +	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
> +		ieee80211_free_txskb(hw, skb);
> +		return;
> +	}
> +
>   	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
>   	memset(skb_cb, 0, sizeof(*skb_cb));
>   	skb_cb->vif = vif;
> @@ -8083,6 +8094,9 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>   
>   	lockdep_assert_wiphy(hw->wiphy);
>   
> +	if (vif->type == NL80211_IFTYPE_MONITOR && ar->monitor_vdev_created)
> +		return -EINVAL;
> +

Some comment on the scenario that is being handled here might be helpful?


Vasanth

