Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F91F5A8D3
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/tQyHpTIj6gAoQkkZhhfUvw9xO+T3VL6kyfhHbNpMQ=; b=m7iTHNlUYIP3OZKkh4reBPI7zO
	eXQB7lEPqNqjcmOuX3Sgj6NDp7JYb/dqCEhZ/rdWvFc7KHSSjl3vGW7ly/0dH/KlFzufSefjZZVqh
	MWVh5eEzHWc6LGlQVRUSRhBrRCGKrU3OuVxS/ABXXy2MqmXsOAHq4diMQe+6EObgp6IdgC2PwDuCY
	av6HhlQbrsw/3GzEs0I6BYqKXyUgbsWgR01B9drNlSdCWkcs8cLTclOsXbdkvQta90fEkLYKMG2+F
	ag32phhoAaLnzgl/wLekXnR2Mu8GNe+VNtE/brtE4cumCTV7Tk7doLcJrXJsCOLipzGd8YiCPhzK6
	ddWnWuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1JQ-00000007y5a-3D2f;
	Tue, 21 Apr 2026 02:58:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1JN-00000007y55-0J4K
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 02:58:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHOPLb3015375
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/tQyHpTIj6gAoQkkZhhfUvw9xO+T3VL6kyfhHbNpMQ=; b=Hr/6XMlsbhqfNmj4
	8B7dAN4/ADgxz3y28fyMgmaPRzOn3fpS0SdfbJYc/uh9OtaftwZGLCOzvACt3eoE
	C9ZLZrVo9fLc+yIzW0MWQdUi/54IaTJcvrG9zw2X6/uNO22iogGsG6a9d+LLdxeh
	pYiiEK/5jRZufaCjj3rtINqNHSofp3y2H9aPEI7z7aQV4TQHmjqglIaUrlFLlqFo
	b+kCbQRcEHeYav9N09o8R5uTgfbkImeHq4DKJWZY0T0NlvVCT2KuNabYECPEU05b
	9LNios8uCyJVTtZWwmgWqaHp8sQgsBBCvJqS8gzWLqZ0r9dxqxVgC/jumQk99Q4S
	EVEOSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuku18w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:58:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b461b36990so38311085ad.3
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 19:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776740283; x=1777345083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/tQyHpTIj6gAoQkkZhhfUvw9xO+T3VL6kyfhHbNpMQ=;
        b=EYQg/zijk9yWNRM7iQi9ZJXq4WtHCnhQoSDWP3Pl63u4OeKk4vNsVlg7qRD+LgfZlL
         kyFydQJznpFFmhtL7ffYqftTcgtIpfBcEkJYVa68kl/g2Ca/VSvjl4yxBCLUJDosh33/
         OZXQUrKy2pKpOJP7fcHEbAnx3yhJYcueuzU9Tp5aMLo4SSSW2Cf5ZhTVtYT5Z7zd/zX0
         eFPBBgtt9zFO6X0cNDOftT3NufmFAj3+RoZj1yWRVUJbJvBF/u//ZD0rnNLd5nZQF9DK
         Qt2Wn/Pi5Gn3Fjo+eK3b4pXJz324YnI271+4J9VmHvVX2SylOIhv17v0L3aClKGGpeh2
         hSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776740283; x=1777345083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/tQyHpTIj6gAoQkkZhhfUvw9xO+T3VL6kyfhHbNpMQ=;
        b=iYcwb9LDP8XYYXKkZ1bWaGfx8cPYO/9sDnGGqs+dRJB6gRElwEgHY79Ym12CGmnL/X
         dvgI8CeaJRnr8jcMdgFrthIZiSjOZxUIxVAXzAMaOxJNeF6Tvy4r6fQmAhA1/ujcqvuL
         sBcPwn9a2zLBC8c4nJwHrvY4R1u2ANOogco/0RAygVyk5BMElsT/bvJx+G4y1E3gE86F
         /XO3g5+pa9WnjUgAiikBGmQMA1NOfPRiMywc91EY6RQY4ne4oDNrWBoM0Bw03s4WAS6R
         0C2Q+bWOMEuAP9G/c5N56pUd55AdiUUdJWRQ7pilHikGwWSUT9FMvK8kB3jOWA//mSfq
         aEQA==
X-Forwarded-Encrypted: i=1; AFNElJ/Fn17eQwlEjqkO1P0E9x/iKYzAwUXX+OEj0qEVMC3dc8GGNgpYL7OYOAppEGUC6rudHABreP0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSGc2o8ywJZ769+s/0ZPRmW8CAghQB29XSSyBXN/wmu5WW8qxe
	AQv2KUaZ8rTT1QYz5bx39mHWB6NVfjX3xioCVU9BzIXk7c4oWb6V9YJwwBM4F9brDks74A3Tzob
	ieLVJ98zM70UhbG2bZBa0xHYGpjPOGJTxLfVZbxMod+XMD+wbhZsx8kzxdpgxfH0A
X-Gm-Gg: AeBDietneVwr9wl9WllbHwNgBLWehyMVT76R0mxdiRP+XKBAexUcGwHtAl/KQXjvJeV
	JlrDY+N/qAnTXOFKpuQTSAnui7E1arj6a2HjoONeTQACcPcZ52yZ21MTLnbbVDxtfX12XW2Kxbz
	AE5oHmu+GCpxWk0kJOXVgzK9/PUsVmIJ2PeG3rBM6Sr4Pdi8VaeATmtAlG8UL5IkcF5CKpe/JrH
	/eausab/81UAUWw0q59wPSnZ7n4Y3PHzlMzvCtyM6h7TtGTdGuUbIdKRmFZ6n+xerRUd2j6/XJS
	HkNwnKMBWHl2CIx3snSXGx/A0TsXHdoR61q+eTe+jpoAr79nBIPjyhUNGscaKzEhqGyYu3ar17A
	yQhVqbMMWWgtiwl+vzpMzWjpmhLPKLix3VEwAekg/er3CJTVpqBIjAvF8tTfy5WdkZvdl+lE4+F
	eb/seIOOEeREQwPmIQDCpT5FIt6mPYCQ==
X-Received: by 2002:a17:902:ce0e:b0:2b4:5c20:ec7 with SMTP id d9443c01a7336-2b5f9fddaf4mr161038955ad.41.1776740282742;
        Mon, 20 Apr 2026 19:58:02 -0700 (PDT)
X-Received: by 2002:a17:902:ce0e:b0:2b4:5c20:ec7 with SMTP id d9443c01a7336-2b5f9fddaf4mr161038755ad.41.1776740282243;
        Mon, 20 Apr 2026 19:58:02 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm146196885ad.7.2026.04.20.19.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:58:01 -0700 (PDT)
Message-ID: <8dee7c0f-ab0a-4b49-9c66-e80c9c305522@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add channel 177 to the 5 GHz
 channel list
To: Yingying Tang <yintang@qti.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yingying.tang@oss.qualcomm.com
References: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1xFzmJk7iu-ykl6dkrhxaa7fUx_RzO7H
X-Proofpoint-ORIG-GUID: 1xFzmJk7iu-ykl6dkrhxaa7fUx_RzO7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyNyBTYWx0ZWRfX32Py1EI4Wrdd
 rvcuJF2KedDwsGGA1RDp5gfi5tNeY7/OWGzfDzxnKCB3e+hgNk2mx0ztRR95r3yAwQjd2Q4h5fL
 l5rMDP/Bz7hK8zWAy4AS7kMZmFAeebr0sWzFNohLILox9ml7YeS0xmD0ooVPlGgN/9gbfkVdK33
 g2uvtDq6ny9LegnMHZhfqF2jcAQoDnS6RZoc1cWYX5eDO9d/soRIVbCEr7WQ0vYw+MUZq66V+gn
 IhAIHpbmY8oIEhlIBCK3Pkda4PG5VilcRrk7IJz5d57WseeMI5XiMomrsLPCtvJnJsw28qGm4K5
 vzJ1beHSCDjGt6DZWKbjECdBHnszOl/lRHJbacjaP1vAF1z35USUfCvRcFaFtjDAX5tuGv1YFm/
 /8nyhZsmsd5P9Qnq4qVj+LJh7lMoa1xK11cfug2epkesHgQRxx3C0/kw6CF9iW7U6hzHJOC+7US
 8QlbOJFR913Erht8ZRA==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6e7bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dw5P4lFgFakpHNxb41EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_195805_240331_ACC9EE8D 
X-CRM114-Status: GOOD (  22.58  )
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



On 4/15/2026 2:38 PM, Yingying Tang wrote:
> From: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> Add support for 5 GHz channel 177 with a center frequency of 5885 MHz and
> Operating Class 125 per IEEE Std 802.11-2024 Table E-4.
> 
> Channels 169, 173, and 177 are in the 5.9 GHz band and must be disabled
> when 5.9 GHz service bit is not supported. The 5.9 GHz band is only permitted
> for WLAN operation under FCC regulations.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c   | 26 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h   |  1 +
>  4 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..17b31c969cd9 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -541,8 +541,8 @@ struct ath12k_sta {
>  #define ATH12K_MAX_5GHZ_FREQ	(ATH12K_5GHZ_MAX_CENTER + ATH12K_HALF_20MHZ_BW)
>  #define ATH12K_MIN_6GHZ_FREQ	(ATH12K_6GHZ_MIN_CENTER - ATH12K_HALF_20MHZ_BW)
>  #define ATH12K_MAX_6GHZ_FREQ	(ATH12K_6GHZ_MAX_CENTER + ATH12K_HALF_20MHZ_BW)
> -#define ATH12K_NUM_CHANS 101
> -#define ATH12K_MAX_5GHZ_CHAN 173
> +#define ATH12K_NUM_CHANS 102
> +#define ATH12K_MAX_5GHZ_CHAN 177
>  
>  static inline bool ath12k_is_2ghz_channel_freq(u32 freq)
>  {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index f0b4f607b845..5327a427c26c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -17,6 +17,11 @@
>  #include "dp_mon.h"
>  #include "debugfs_htt_stats.h"
>  
> +#define ATH12K_2GHZ_MIN_CHAN_NUM 1
> +#define ATH12K_2GHZ_MAX_CHAN_NUM 14
> +#define ATH12K_5GHZ_MIN_CHAN_NUM 36
> +#define ATH12K_5GHZ_MAX_CHAN_NUM 177
> +
>  static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
>  					   struct ath12k_dp_rx_tid_rxq *rx_tid);
>  
> @@ -1284,9 +1289,11 @@ void ath12k_dp_rx_h_ppdu(struct ath12k_pdev_dp *dp_pdev,
>  	    center_freq <= ATH12K_MAX_6GHZ_FREQ) {
>  		rx_status->band = NL80211_BAND_6GHZ;
>  		rx_status->freq = center_freq;
> -	} else if (channel_num >= 1 && channel_num <= 14) {
> +	} else if (channel_num >= ATH12K_2GHZ_MIN_CHAN_NUM &&
> +		   channel_num <= ATH12K_2GHZ_MAX_CHAN_NUM) {
>  		rx_status->band = NL80211_BAND_2GHZ;
> -	} else if (channel_num >= 36 && channel_num <= 173) {
> +	} else if (channel_num >= ATH12K_5GHZ_MIN_CHAN_NUM &&
> +		   channel_num <= ATH12K_5GHZ_MAX_CHAN_NUM) {
>  		rx_status->band = NL80211_BAND_5GHZ;
>  	}
>  
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..7fb6507cebf8 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -51,6 +51,9 @@
>  	.max_power              = 30, \
>  }
>  
> +#define ATH12K_5_9_GHZ_MIN_FREQ 5845
> +#define ATH12K_5_9_GHZ_MAX_FREQ 5885
> +
>  static const struct ieee80211_channel ath12k_2ghz_channels[] = {
>  	CHAN2G(1, 2412, 0),
>  	CHAN2G(2, 2417, 0),
> @@ -96,6 +99,7 @@ static const struct ieee80211_channel ath12k_5ghz_channels[] = {
>  	CHAN5G(165, 5825, 0),
>  	CHAN5G(169, 5845, 0),
>  	CHAN5G(173, 5865, 0),
> +	CHAN5G(177, 5885, 0),
>  };
>  
>  static const struct ieee80211_channel ath12k_6ghz_channels[] = {
> @@ -13900,6 +13904,26 @@ static int ath12k_mac_update_band(struct ath12k *ar,
>  	return 0;
>  }
>  
> +static void ath12k_mac_update_5_9_ghz_ch_list(struct ath12k *ar,
> +					      struct ieee80211_supported_band *band)
> +{
> +	int i;
> +
> +	if (test_bit(WMI_TLV_SERVICE_5_9GHZ_SUPPORT,
> +		     ar->ab->wmi_ab.svc_map))
> +		return;
> +
> +	guard(spinlock_bh)(&ar->ab->base_lock);
> +	if (ar->ab->dfs_region != ATH12K_DFS_REG_FCC)
> +		return;
> +
> +	for (i = 0; i < band->n_channels; i++) {
> +		if (band->channels[i].center_freq >= ATH12K_5_9_GHZ_MIN_FREQ &&
> +		    band->channels[i].center_freq <= ATH12K_5_9_GHZ_MAX_FREQ)
> +			band->channels[i].flags |= IEEE80211_CHAN_DISABLED;
> +	}
> +}
> +
>  static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					   u32 supported_bands,
>  					   struct ieee80211_supported_band *bands[])
> @@ -14033,6 +14057,8 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  			band->n_bitrates = ath12k_a_rates_size;
>  			band->bitrates = ath12k_a_rates;
>  
> +			ath12k_mac_update_5_9_ghz_ch_list(ar, band);
> +
>  			if (ab->hw_params->single_pdev_only) {
>  				phy_id = ath12k_get_phy_id(ar, WMI_HOST_WLAN_5GHZ_CAP);
>  				reg_cap = &ab->hal_reg_cap[phy_id];
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 5ba9b7d3a888..8fab8ddaae59 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2259,6 +2259,7 @@ enum wmi_tlv_service {
>  	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
>  	WMI_TLV_SERVICE_EXT2_MSG = 220,
>  	WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT = 244,
> +	WMI_TLV_SERVICE_5_9GHZ_SUPPORT = 247,
>  	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
>  	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
>  

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

