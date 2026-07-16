Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451ECC4450A
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnGeRaQiAEtcbHQhvvtOcosj/FA3UbBfncpYPLc5Bg0=; b=AQTRQ28oYQ059a4LZtccnZeCQW
	Vwv1sdRhsHVbUL6HCOT5WIiKTvqmWkBwpCwsnFKF1Vm7ggRUwL/9aDwizpFp3dPwx1BcylwSLsf51
	TUUuSjBhRcXj1nOp0xxkv0QodfuKWgr1rdtXUofh4jXYd12DpJb3js7qtfqws+trNdebiRZovKb9K
	eq3g42evFL/3l7ySyPgeF4Qa6w5n7j3W3m3Omi8AP9y+D7Yap37In9/kv8qV1lDyz79yMwCvNs/ml
	NrblfYEzz/DUj2w6aJVdzXp9KGi1F3hvstIA98V/8UDvAt6kOMd6iQx4bStMC0Zi/q8e6vxpoXyeq
	UUEv8hoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNV1-0000000HYJm-3dXK;
	Thu, 16 Jul 2026 14:55:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNUz-0000000HYIV-0wzn
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 14:55:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJhrJ2691620
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 14:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnGeRaQiAEtcbHQhvvtOcosj/FA3UbBfncpYPLc5Bg0=; b=jpaaMNCYpVyqE9N1
	U+spdRjza+9qRZYM1wttsMjZnE8BZaPLbtP4r9CBjIlz0HdLF4YRG/ZE6ZtiBBBM
	IgvIQvsE6ThQ/JJaV5Jt2svvuVgXdoDkJkzUDP7JUTgWKvfxWubnp7eBTBktKHmi
	B3rSVx1lg780f9VDjus1Jn/NsLwCXEcsngVdSqIkgTjOVlvhlaQTLFUz6lXPFJRR
	iJBh1Wq2tkcNeQ6Vi31PBZKGKIjmTel9sdnpwC+ZVQG+FmxlmV6LUxCFEeDa/5ck
	qqunz91blzW4onS/N3+S4C4V6b2y8C/xg7SeeoGM1C2GwTAwC5zW60selWaFZGRf
	4DTs/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7t1xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 14:55:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b719so3163761a12.2
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213733; x=1784818533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnGeRaQiAEtcbHQhvvtOcosj/FA3UbBfncpYPLc5Bg0=;
        b=ThsENW7927JHWz2rjbpaEIeNDb5aEA7mZKdhRS8aGwJyE374J/bsXWBGCytVXwuca0
         2/EmCPRyHsAvK/pkW5EqllY9bhOzJtVyFx4UtZVdFLyTES69iiJJLrgjZ3IEQKHGLrnX
         IyGzFOX1bnnSISOFvFdXqSKA/3EugNhF6+f6IALO89PxIrT3e6U3/MD6XdTAfERzSh19
         ClcOfeUlBWu+AiTYd+Wl8x6vYChTlksfLFAjuNOjoXFQTDRwMbrZD4FHICB3xHcpDk8Z
         uCDUU74NVDobnpCqg3IOW/HO/ef8TB5STzBL+esVdYfxhEQ6sA8VHAr4LDHEsdRfMZV8
         NGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213733; x=1784818533;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnGeRaQiAEtcbHQhvvtOcosj/FA3UbBfncpYPLc5Bg0=;
        b=B4BOcXv+vbb7jr6ALDT+hyI9oFbdLNLTUcuj8RYNCPsC/KxtdLx3zPZ3aLzZ+NEn2L
         uVr3QWiZlfjTa8UCZzyqhHDklPS3e9DGp07v6yihD+oNp5idJVF+2ucHmMkMNEUgCY0C
         aDBT/B8tPYj7+OoOm/okLqyDDbLF6udBbPhtAtXX2fyY+rSVtqO5ap9ztI60pzyquGAD
         J+sONLwXu0CfJEZE51tchKTqBrh5RnnyGf2z4buG2mUHWikgXK7UK31kyrhdQBuXKm3l
         jGcbBi69V5fQhVZ6JV6nIyDgW7nXPH+RxRb/BKuZpvOwBXMlaSsZeeJm7QjzM83MAKC5
         KeDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsMBe+02DfPG8XE6xR7RBxeLU2V7CDqbWQwiwaoZ7k4yeT4Is2uCl8sl8Xbxgdi7bv1dKuXgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMabKMRCgwnXUIPY38OH3WswT6eKoDyYA4ozPQ9JHE7IPHvHOy
	Q+7X74mSRfA/YDMb/G9rHYVY107qpWfKN3xal3y9UZIhBDBZviOaLI18hTzkpckbdvK+gpkpAV0
	GW3Sa15prVQ4NmpdQkLCNmmEB4qWjmJpRvg1Hfr+hXH4oRPmwcWVV5cgPAPesjrP8
X-Gm-Gg: AfdE7ck3mE+Efyfmge/o2RLQQO/HdYK9pdj/zKQmdFbxjJwDVHH10f7Jjz0zm9oSdla
	KCiQbHm8z/9oaImO5HsV4HcY+RNlcKoRC9cTj7IjQLCwi3DhEuHMMc88oxPE9I6daK3gY9qD4TM
	CXlXu8G14PnFb2fAr3vT6CsMrUExwuCZ2mLra7XIvHO6vYuBXJOWv7hp+K+Ed4OupRasQ+rNtBp
	n9H637lFZFjXwVRUoJvlvZlib9R2afDRNI6L7GYVqhjl+I3ngpUYGN9XNmudy4iGKMr5DVU/xyh
	PVFn1rf+6HEND+a01Pur2j68JE0CH5LG67B+Ug1o91T16djklwxC2dABZq87p61mLAydhBP4uRW
	wdQ0wNOu9l+OYuKSFEj1uRchsXAYiIoa5o3KKp5cGuUPZ
X-Received: by 2002:a05:6a21:9d91:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c1108c1a5fmr22178802637.26.1784213732994;
        Thu, 16 Jul 2026 07:55:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d91:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c1108c1a5fmr22178776637.26.1784213732505;
        Thu, 16 Jul 2026 07:55:32 -0700 (PDT)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm15727803eec.11.2026.07.16.07.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:55:32 -0700 (PDT)
Message-ID: <a906aae4-b695-4f5f-9ee7-51d40700f8c8@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:25:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 5/8] wifi: ath12k: introduce host_alloc_ml_id
 hardware parameter
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
 <20260713-ath12k-fw-allocated-ml-peer-id-v1-5-d0a2a1a519eb@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-5-d0a2a1a519eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MyBTYWx0ZWRfX5AfjSKYk/gwO
 6qVOsCKgE7ncFkXEYqM95jyvndyo+THrLfznnW+d7BIW3DAzaAP+UxBMLV309J49xWhHeoZ4GMt
 831AADLESZb/ezVrgzexiF1O3hLgD2I=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58f0e5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dNVfuQA5Ti0aT4DNj2cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MyBTYWx0ZWRfX6gfhBDqx/HMW
 CbZcN4NfQyUry4SsyuloAwIOBy0wMv3I73twP1FPjNhuusqcIv0DlIAG/6fN5xKDIbZaXjJ3Vrk
 sr+Az2siO8UgOr4n/0IfcJwwecIdjnC3tqKaDk2Mgop9jXhOHrsAHwyzn4pCseUugToPkgh2o7I
 JxRbOp+lDwpUxPDyJkgxCncK8LXy3MwesFFE1FMg6eyYEtYdUKGH83+2MAsKf420eq9lNvCJDtU
 0NbdPywtayrLxsQsw4LcRGcora3ebtBwaYDlJRYu3ffMRxz6CSSQm8AKX2jTpbmMB5lVzGJdDv8
 RxuZH9CrUb3SSTWU76fgjBL72BzlWUf5hH4L6V22e5PC3zBTkLowSecZVj3lCe/If1j2aUuXIrp
 kquT8HQ8YG9yyiQC22LjgyiMzk+6BTmwbTa50lHFyAkCzKCvlMWe8LLLTgkTqBO/WP4nEuVUJJJ
 q3IzX5CHX1Rb3EkE6KA==
X-Proofpoint-ORIG-GUID: CO0ced7e1wR-wL4Am5AQyv7cT0JuIhIc
X-Proofpoint-GUID: CO0ced7e1wR-wL4Am5AQyv7cT0JuIhIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075541_274162_6451C7B5 
X-CRM114-Status: GOOD (  26.31  )
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

On 7/13/2026 1:03 PM, Baochen Qiang wrote:
> Different ath12k devices diverge on who allocates MLD peer id:
> WCN7850/QCC2072 have the firmware allocate it and notify the host via
> HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP event; While others let the host allocate
> it and pass it down through WMI_PEER_ASSOC_CMDID with
> ATH12K_WMI_FLAG_MLO_PEER_ID_VALID set.
> 
> Currently ath12k host allocates this ID and sends it to firmware by
> default for all devices. This breaks WCN7850/QCC2072, because the host
> maintained ID may be different from the firmware-allocated one.
> Consequently data path may fail to find the dp peer and drop some received
> packets. From user point of view, this results in bugs reported in [1] or
> the 4-way handshake timeout issue.
> 
> Add host_alloc_ml_id flag to struct ath12k_hw_params (and a copy on struct
> ath12k_hw for hot-path access) so subsequent patches can branch on it. Set
> true for QCN9274/IPQ5332/IPQ5424, false for WCN7850/QCC2072. The flag will
> be consumed by subsequent patches.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221039 # 1
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h     |  1 +
>   drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
>   drivers/net/wireless/ath/ath12k/mac.c      | 17 ++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 12 ++++++++++++
>   4 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index fc5127b5c1a3..1f56474efbea 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -793,6 +793,7 @@ struct ath12k_hw {
>   	enum ath12k_hw_state state;
>   	bool regd_updated;
>   	bool use_6ghz_regd;
> +	bool host_alloc_ml_id;
>   
>   	u8 num_radio;
>   
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index d135b2936378..8091501cf742 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -232,6 +232,8 @@ struct ath12k_hw_params {
>   		u32 max_client_dbs;
>   		u32 max_client_dbs_sbs;
>   	} client;
> +
> +	bool host_alloc_ml_id;
>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 7d0d7d5fbf53..9e5fcbf8c730 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -15382,8 +15382,9 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   	int mac_id, device_id, total_radio, num_hw;
>   	struct ath12k_base *ab;
>   	struct ath12k_hw *ah;
> -	int ret, i, j;
> +	bool conf = false;
>   	u8 radio_per_hw;
> +	int ret, i, j;
>   
>   	total_radio = 0;
>   	for (i = 0; i < ag->num_devices; i++) {
> @@ -15423,6 +15424,19 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   			}
>   
>   			ab = ag->ab[device_id];
> +
> +			/*
> +			 * the assumption is all devices within an ah
> +			 * share the same host_alloc_ml_id configuration
> +			 */
> +			if (j == 0) {
> +				conf = ab->hw_params->host_alloc_ml_id;
> +			} else if (conf != ab->hw_params->host_alloc_ml_id) {
> +				ath12k_warn(ab, "inconsistent ML ID config within ah, device 0 uses %s allocated ID, while device %u doesn't\n",
> +					    conf ? "host" : "firmware", device_id);

a garbage ret will be returned in this err path.

> +				goto err;
> +			}
> +
>   			pdev_map[j].ab = ab;
>   			pdev_map[j].pdev_idx = mac_id;
>   			mac_id++;
> @@ -15447,6 +15461,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   		}
>   
>   		ah->dev = ab->dev;
> +		ah->host_alloc_ml_id = conf;
>   
>   		ag->ah[i] = ah;
>   		ag->num_hw++;

--
Ramesh

