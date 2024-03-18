Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D5CC54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bQsqWgfUFujzVFeTwFeUVkAYfND/3fNKXs1gywvY5E=; b=BcQguKeYruMSKrqWm2ecCK129w
	TCudiupdmVBXnfmy0oFB5TQJs9NhO9MZb55z3U1QsJDLhtlDmyztvD5qwX7sItnfDdy7KCLyf/sBB
	XEwDJr9AKYOPwrStCg7F2F7Q1eaK/unJL0bn3un5pkFOz57OrLFlLIKIyjs+UpeFcMrqkNoQLODsF
	gvVtAx2ZBhNETPwfzaN31/jJ4UVPqsfzJSmXCwTDbehCCrr3KgWOwT5up7A4xWg9NP/17gIP20KVk
	OMikkkmDOvm/07Nmfa75BGJpC1/IQpLeZaTLOLo1EzfPdlUmT1h3ROyHihmQAOB+scHcOP1weIOEm
	2vMeFidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8nV-00000007pQS-1acU
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 08:56:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8nS-00000007pO8-2scU
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 08:56:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I7TwC7018604;
	Mon, 18 Mar 2024 08:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+bQsqWgfUFujzVFeTwFeUVkAYfND/3fNKXs1gywvY5E=; b=E0
	Ww54xJSpDpynCQIu+IqZpCtn64AY1na+xpGinAoJP3f3hBRI/219S+O9+eWtBlF/
	qc+RFVF78UMIUNoex2bUuAuSbmhc7HINksaRSgHKNUq/EzoZoPiTALPoJEAKCeCC
	72+GlarKvoETcWJCPcKajJVsuaEgF1qpza4BZtCGiQSUIwtejHBiIOBuW/nV3slL
	CrAzQwGF1FqOnjpxdEAZCYg9T6XvZ77mOlzZ8e6GsFSc6fQng7xgt9zxcO2vDSJm
	FEL9/JYTcy0DkIo5JztJecjppf2TUA77/fikQsRLJv3aLRb0tDUg8bV/hL3DARXM
	mzriBtxyabrFxAIj05kg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtdsftx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 08:56:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I8uda7006223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 08:56:39 GMT
Received: from [10.253.10.164] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 01:56:37 -0700
Message-ID: <bc8c8fe4-dc72-4657-925b-eefbaacdedc9@quicinc.com>
Date: Mon, 18 Mar 2024 16:56:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: dynamically update puncturing bitmap
Content-Language: en-US
To: <ath12k@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
 <20240312045947.576231-3-quic_kangyang@quicinc.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <20240312045947.576231-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B5ywjPCWNoJZsCPxACnRGNjpjxN1a1rt
X-Proofpoint-ORIG-GUID: B5ywjPCWNoJZsCPxACnRGNjpjxN1a1rt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_015642_800216_E98FC93F 
X-CRM114-Status: GOOD (  19.73  )
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



On 3/12/2024 12:59 PM, Kang Yang wrote:
> Every time EHT Operation element changed, mac80211 will parse it and
> extract the valid puncturing bitmap according to the bandwidth.
> 
> So update bandwidth and puncturing bitmap once they changed. Then
> send them to the firmware by WMI event.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 58 +++++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h | 16 ++++++++
>   2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 52a5fb8b03e9..94ebc14e7f35 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -6502,6 +6502,54 @@ ath12k_mac_change_chanctx_fill_iter(void *data, u8 *mac,
>   	arg->next_vif++;
>   }
>   
> +static u32 ath12k_mac_nlwidth_to_wmiwidth(enum nl80211_chan_width width)
> +{
> +	switch (width) {
> +	case NL80211_CHAN_WIDTH_20:
> +		return WMI_CHAN_WIDTH_20;
> +	case NL80211_CHAN_WIDTH_40:
> +		return WMI_CHAN_WIDTH_40;
> +	case NL80211_CHAN_WIDTH_80:
> +		return WMI_CHAN_WIDTH_80;
> +	case NL80211_CHAN_WIDTH_160:
> +		return WMI_CHAN_WIDTH_160;
> +	case NL80211_CHAN_WIDTH_80P80:
> +		return WMI_CHAN_WIDTH_80P80;
> +	case NL80211_CHAN_WIDTH_5:
> +		return WMI_CHAN_WIDTH_5;
> +	case NL80211_CHAN_WIDTH_10:
> +		return WMI_CHAN_WIDTH_10;
> +	case NL80211_CHAN_WIDTH_320:
> +		return WMI_CHAN_WIDTH_320;
> +	default:
> +		WARN_ON(1);
> +		return WMI_CHAN_WIDTH_20;
> +	}
> +}
> +
> +static int ath12k_mac_update_peer_puncturing_width(struct ath12k *ar,
> +						   struct ath12k_vif *arvif,
> +						   struct cfg80211_chan_def def)
> +{
> +	u32 param_id, param_value;
> +	int ret;



I found i should add a check to avoid duplicate setting for WIN AP, will 
do it in v2.





> +
> +	param_id = WMI_PEER_CHWIDTH_PUNCTURE_20MHZ_BITMAP;
> +	param_value = ath12k_mac_nlwidth_to_wmiwidth(def.width) |
> +		u32_encode_bits((~def.punctured),
> +				WMI_PEER_PUNCTURE_BITMAP);
> +
> +	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
> +		   "Set puncturing bitmap %02x and width %d for vdev: %d\n",
> +		   def.punctured, def.width, arvif->vdev_id);
> +
> +	ret = ath12k_wmi_set_peer_param(ar, arvif->bssid,
> +					arvif->vdev_id, param_id,
> +					param_value);
> +
> +	return ret;
> +}
> +
>   static void
>   ath12k_mac_update_vif_chan(struct ath12k *ar,
>   			   struct ieee80211_vif_chanctx_switch *vifs,
> @@ -6594,6 +6642,16 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
>   				    arvif->vdev_id, ret);
>   			continue;
>   		}
> +
> +		ret = ath12k_mac_update_peer_puncturing_width(arvif->ar, arvif,
> +							      vifs[i].new_ctx->def);
> +		if (ret) {
> +			ath12k_warn(ar->ab,
> +				    "failed to update puncturing bitmap %02x and width %d: %d\n",
> +				    vifs[i].new_ctx->def.punctured,
> +				    vifs[i].new_ctx->def.width, ret);
> +			continue;
> +		}
>   	}
>   
>   	/* Restart the internal monitor vdev on new channel */
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 103462feb935..d0599a6dce4d 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2199,8 +2199,11 @@ enum wmi_peer_param {
>   	WMI_PEER_SET_MAX_TX_RATE = 17,
>   	WMI_PEER_SET_MIN_TX_RATE = 18,
>   	WMI_PEER_SET_DEFAULT_ROUTING = 19,
> +	WMI_PEER_CHWIDTH_PUNCTURE_20MHZ_BITMAP = 39,
>   };
>   
> +#define WMI_PEER_PUNCTURE_BITMAP		GENMASK(23, 8)
> +
>   enum wmi_slot_time {
>   	WMI_VDEV_SLOT_TIME_LONG = 1,
>   	WMI_VDEV_SLOT_TIME_SHORT = 2,
> @@ -2604,6 +2607,19 @@ struct ath12k_wmi_soc_hal_reg_caps_params {
>   	__le32 num_phy;
>   } __packed;
>   
> +enum wmi_channel_width {
> +	WMI_CHAN_WIDTH_20 = 0,
> +	WMI_CHAN_WIDTH_40 = 1,
> +	WMI_CHAN_WIDTH_80 = 2,
> +	WMI_CHAN_WIDTH_160 = 3,
> +	WMI_CHAN_WIDTH_80P80 = 4,
> +	WMI_CHAN_WIDTH_5 = 5,
> +	WMI_CHAN_WIDTH_10 = 6,
> +	WMI_CHAN_WIDTH_165 = 7,
> +	WMI_CHAN_WIDTH_160P160 = 8,
> +	WMI_CHAN_WIDTH_320 = 9,
> +};
> +
>   #define WMI_MAX_EHTCAP_MAC_SIZE  2
>   #define WMI_MAX_EHTCAP_PHY_SIZE  3
>   #define WMI_MAX_EHTCAP_RATE_SET  3

