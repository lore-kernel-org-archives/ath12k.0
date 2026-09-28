Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9F8CA5FA1
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g5rk72sPsp3Y6F3QPQcKiPf1dfTSfp3yBs9EajvEyw=; b=CvYbuWQrJisBg6p7e6Mj8OIdYD
	YwI2A/jzbQKWdlVwbxn5P7DBVn9IosbYSiUDkSqVMMfqwI+k0iXHFKzPKJakRqoZwyi1oi956bVe0
	Ib+dxQdbnB6uri7qviJ9Wfrqtu/mdLm2ZskKaX/NDQd69nqywZuh/UFPDWapRLLBnJJ7AzBZhajVI
	ONHcrrSSpGv2QTztIUUN8p+gMNOZ3XY37tbZFbX8VYEI/hcXpuiw3KQH8Mpt5Sv5djTWVS3i0/B1C
	KCh4xRu8cwdgEwNEyyBX6UF/JNfJZn9QYdbIPMSrsGcuXRZIho18iiqCB3T1/isgFRf3TEMZMJUXC
	H8q1kKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF5s-000000019gg-2IfG;
	Mon, 28 Sep 2026 17:24:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF5n-000000019fV-1BiP
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 17:24:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe6vK1647286
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 17:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0g5rk72sPsp3Y6F3QPQcKiPf1dfTSfp3yBs9EajvEyw=; b=N4U2uJv3zZMvMt0G
	dBWBodm93IsZJjS3KIeBFMx3CJNrmFn6HMgE8jAkUFD31QmYB6K8uOjLS7KMFMs0
	y+SVyzgJn1TjN7li7f50fnXd1/t5zAxTrEajHU0JT0Kq7bZyp2gFYmCaYFfvADB8
	x4MgKs2HQPgbfX2Z5PS9soapdudcUjEJImiw0X+dlvVYnoxLU4YMpKTT4XDeiCx2
	Xx5qu2iEB1SoPYHPxA8vpDmB/ApaveI5ZzmUKefDdS2mGM6x4OzL21bkscWYmemO
	7CVhPfj6DDOi7NeXRpOZmskuv2PufrF4J+Qa8hPOOzvw1pfw6ZI3EDwO+Wj4hV0j
	/jVSVQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc1xfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 17:24:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so4765271eec.0
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616281; x=1791221081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0g5rk72sPsp3Y6F3QPQcKiPf1dfTSfp3yBs9EajvEyw=;
        b=Z55JQIYWif9DPULCJenbqRrUo/anRJQECgwvr7k9iClgz1f+MwuL2VDpbKgKwtqX6e
         Bv8jRmHZ8f4SG708UfaBWXI1Hgj8eGXgpG0xaEdfePrXZU6xS6UnPSwzOiyTN600JjJ6
         Pcvs7VcXharVipf7PRohicaSv17/Y+eRvaNouHYs34DrKnCX2WHYl8xi1/ZKQwmG3WTO
         fCKjK5Ih5bzfnTI7oHUjGl1ZWzoBBHvqEmedVCYv0wkWBAVuBAobhY8LrmlssNKTePBQ
         0MufgivGos+jcOTpENZ2NZUk8RjOUMm6GmrYHYjFbzcfqtV5f3HptU91yC6zyhDUg1RO
         Htzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616281; x=1791221081;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g5rk72sPsp3Y6F3QPQcKiPf1dfTSfp3yBs9EajvEyw=;
        b=Cklq0eK1n7VRy0HP15GXroNwgDLAC4otRlX+uogUZd4QsKGf+Rt/G4AQ4bI5ipsFYr
         ZNRnn2A5OMJ4uU5r6AE8DhElSqPttvLYs/aC+bD2XduS0Su7QLz2v89pa9/zAJlknwOJ
         AZpsKBFRrquj++4hu1h5n5vlah/pt5N3U2C+ACbqxS3w7Qs81Y+QBN8MMYJkBqqqa+Qn
         IdjE5H18kcImwpc34Gb0L0e6e8noz1A4FfJEKWbEPx7Jap41K3X+MFxF3Q9zoq2YaHcg
         LLvnradjzom+IFOmJ08aYWbBynDMQbQNKrDTsjjQil+BzhHTLM73qe40l4RHC8mmvJ2o
         TsVg==
X-Forwarded-Encrypted: i=1; AKwUvBx5RUZ5yvArgae55UvnvhQTO2vNSp5EcCfGwsxMgoBi/uGqUATfkSYgx6gvVhqSQ1laGgaYtRk=@lists.infradead.org
X-Gm-Message-State: AFuF++kzzfmFYvY2jfw4jORS5rRllRBfNvVf21fJsVPj1jAM9X8Lv/j6
	Xkte2Ih1ykFpTe6NdLwsn0r40PbRXENK5sdQggAGlqCSdJfoOUY/GksJnmOO+/d6aexrKICLjsL
	NaSIUM3ylm46CBY8aPLVlNSOO+uo9Z5+NyWpNPs0tHUc9DYDi0qrfjLzHVM2yTyK3
X-Gm-Gg: AYBFou0U32ycD/SFrK53Ep6/2iPqyZ8drWSmeJs2fABgXvrTeb9+dB3OvNURj6VU06h
	bPnhwLu3h5WijQfk0/MYnL7OZK7MNVyrntayWmjgA7wU1SGRWupFhrdjxiJGJk3rep67mD1D1g+
	B3FOreCFzA03iBTzcSAYAhTmoGQn2/EwCkF7vFzKBbrsfT7lMJlSOCz6fcOGZ5CwSoUVxz6fHXc
	kaXdyCwuP0GWMl57/mdoYgHGUkVvdqiSUvMeQCsd8nGkbAUiuG3j1w5mzEgU5lVnrnuR/9EakZG
	P9GbDwfIwsnziJQZ9OeAJAEuIIwl31fPLsqkebO/piLU27uCnBzR85MlQenIf/aBzdiNzEihfcm
	VCrNTwfadIpSot0ExtA+kqrEIuHDUSIh8rpzfHV+YijE=
X-Received: by 2002:a05:701b:4292:20b0:143:298d:c1eb with SMTP id a92af1059eb24-146d096b191mr11011462c88.43.1790616280814;
        Mon, 28 Sep 2026 10:24:40 -0700 (PDT)
X-Received: by 2002:a05:701b:4292:20b0:143:298d:c1eb with SMTP id a92af1059eb24-146d096b191mr11011430c88.43.1790616280163;
        Mon, 28 Sep 2026 10:24:40 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm30595645c88.12.2026.09.28.10.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:24:39 -0700 (PDT)
Message-ID: <494ab3a5-7f36-47ad-bf14-0b7cac74b70f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:54:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Add EHT capabilities to scan probe
 frame
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
References: <20260921043148.3071142-1-gaole.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260921043148.3071142-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6abaa2da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f8BdWhLognpqapH-X3EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: t-NGClcpRp8PtVRKKRHnDxCGBYre_2Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX5vaNCA63pmMs
 D9UQpt74bFiI4Ch1gwVZg39GvVcRoxBDIfdh73gjDBWFHfwFYJmfSOlTXSrz+NBWYIzytkqSJBo
 QxOwUMXiYvNRsNlMXddbRXoi/M9ywxByLlIbAdQdlx5rYx+l/jQyr3PnWp7ZbXpLVWHY9Wdt17g
 +LvQ4h9hFy5jz1ywUR2ayzdfTL6+MWh+AGg316CCRnqPPv0g6r80v4Dg2LpMRJejDqepn47/YIy
 eRqOvIfejB+XlbGgOLbKIAHi0I2ROUyjQuaY4cX3uMRYugkz4SQAGwPnLWHYBgCtmmlMHltIE0E
 xvdjd64hxS7chc6rPtjhQ3CFD6O6yQdLfpcsFmeNdaLb5uLpaSJsYuWwGHTvnms8DlGbOSakckw
 Usuenwm7cZ+UN3yZOruZUIamHt8IK7FbupokbD4umGLuNhUefn9+Gn1XDbLgqnEElpihEz0PBpW
 El1W1Y3iPTjkjg7gAyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX7HkOQsdsjQUX
 2PKN1QQBiLsa2qh2ohcqCcK92IzVeH2ILVFJUDTeVcrcu2WAjlOmvuaHBeKWtOyZuHkM0cbIth+
 QG85kpSVWTk1x9Do+7S3q9AgP5YFcpg=
X-Proofpoint-ORIG-GUID: t-NGClcpRp8PtVRKKRHnDxCGBYre_2Z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_102443_448644_7C9A17EE 
X-CRM114-Status: GOOD (  26.93  )
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

On 9/21/2026 10:01 AM, Gaole Zhang wrote:
> Currently, ath12k does not set the EHT flag in scan channel
> information and does not send WMI_VDEV_SET_IE_CMDID with the EHT
> Capabilities element configuration. As a result, EHT-capable STA
> Probe Requests do not contain the EHT Capabilities element.
> 
> Without this element, AP can't identify the STA as EHT-capable
> during active scanning and may omit EHT-related information from its
> Probe Response. This can result in incomplete scan information and
> prevent userspace from correctly determining the AP's EHT capabilities.
> 
> Set the EHT scan flag and configure the EHT Capabilities element so
> that ath12k includes it in STA Probe Request frames.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h |  6 ++++
>   drivers/net/wireless/ath/ath12k/mac.c  | 29 +++++++++++++--
>   drivers/net/wireless/ath/ath12k/reg.c  |  4 +++
>   drivers/net/wireless/ath/ath12k/wmi.c  | 50 ++++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h  | 23 +++++++++++-
>   5 files changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index a98fc6e0699d..e7373a523dc3 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1394,6 +1394,12 @@ static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
>   	return &ah->radio[radio_idx];
>   }
>   
> +static inline bool ath12k_is_11be_enabled(struct ath12k_base *ab)
> +{
> +	return test_bit(WMI_TLV_SERVICE_11BE, ab->wmi_ab.svc_map) &&
> +	       !ath12k_acpi_get_disable_11be(ab);
> +}
> +
>   static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
>   {
>   	return ar->ah;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..f353af63c5eb 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5602,6 +5602,25 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
>   	return ATH12K_FIRST_SCAN_LINK;
>   }
>   
> +static int ath12k_mac_set_scan_eht_cap_ie(struct ath12k *ar,
> +					  struct ath12k_link_vif *arvif,
> +					  const u8 *ies, size_t ies_len)
> +{
> +	const struct element *eht_cap;
> +
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> +
> +	eht_cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies,
> +					 ies_len);
> +	if (!eht_cap || eht_cap->datalen <= 1)
> +		return 0;
> +
> +	return ath12k_wmi_vdev_set_ie(ar, arvif->vdev_id,
> +				      WLAN_EID_EXTENSION,
> +				      eht_cap->data, eht_cap->datalen,
> +				      WMI_SET_VDEV_IE_BAND_ALL);
> +}
> +
>   static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>   				       struct ieee80211_vif *vif,
>   				       struct ieee80211_scan_request *hw_req,
> @@ -5718,6 +5737,13 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>   			goto exit;
>   		}
>   		arg->extraie.len = req->ie_len;
> +		ret = ath12k_mac_set_scan_eht_cap_ie(ar, arvif, req->ie,
> +						     req->ie_len);
> +		if (ret) {
> +			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
> +				   "failed to set eht cap ie, ret %d\n", ret);
> +			goto exit;
> +		}
>   	}
>   
>   	if (req->n_ssids) {
> @@ -8983,8 +9009,7 @@ static void ath12k_mac_copy_eht_cap(struct ath12k *ar,
>   
>   	memset(eht_cap, 0, sizeof(struct ieee80211_sta_eht_cap));
>   
> -	if (!(test_bit(WMI_TLV_SERVICE_11BE, ar->ab->wmi_ab.svc_map)) ||
> -	    ath12k_acpi_get_disable_11be(ar->ab))
> +	if (!ath12k_is_11be_enabled(ar->ab))
>   		return;
>   
>   	eht_cap->has_eht = true;
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 89abf2e87ad1..0aba1e74a3e9 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -140,6 +140,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>   	enum nl80211_band band;
>   	int num_channels = 0;
>   	int i, ret = 0;
> +	bool has_eht;
>   
>   	if (ar->ah->state == ATH12K_HW_STATE_RESTARTING)
>   		return 0;
> @@ -180,6 +181,8 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>   
>   	ch = arg->channel;
>   
> +	has_eht = ath12k_is_11be_enabled(ar->ab);
> +
>   	for (band = 0; band < NUM_NL80211_BANDS; band++) {
>   		if (!(ar->mac.sbands[band].channels && bands[band]))
>   			continue;
> @@ -201,6 +204,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>   			ch->allow_ht = true;
>   			ch->allow_vht = true;
>   			ch->allow_he = true;
> +			ch->allow_eht = has_eht;
>   
>   			ch->dfs_set =
>   				!!(channel->flags & IEEE80211_CHAN_RADAR);
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index a63bbda0219c..5fe7af731a4e 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2005,6 +2005,54 @@ int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
>   	return ret;
>   }
>   
> +int ath12k_wmi_vdev_set_ie(struct ath12k *ar, u32 vdev_id, u32 ie_id,
> +			   const u8 *ie, size_t ie_len, u32 band)
> +{
> +	struct ath12k_wmi_pdev *wmi = ar->wmi;
> +	struct wmi_vdev_set_ie_cmd *cmd;
> +	struct sk_buff *skb;
> +	struct wmi_tlv *tlv;
> +	size_t aligned_len;
> +	int ret, len;
> +	void *ptr;
> +
> +	aligned_len = roundup(ie_len, sizeof(u32));
> +	len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
> +
> +	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	ptr = skb->data;
> +	cmd = ptr;
> +	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_VDEV_SET_IE_CMD,
> +						 sizeof(*cmd));
> +	cmd->vdev_id = cpu_to_le32(vdev_id);
> +	cmd->ie_id = cpu_to_le32(ie_id);

This appears to be passing only WLAN_EID_EXTENSION.

How does the firmware make use of this IE identifier, and why is this 
required only for EHT Capabilities? Are HE Capabilities and other 
extension-based IEs handled differently?

Also, this command is sent for every hardware scan request. Does the 
firmware use the host-provided IE only for the current scan and then 
discard it afterward, or is the IE retained across scans?

It would be helpful to capture these details in the commit message 
and/or code comments.

-- 
Ramesh

