Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDADC4706C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wAIbQZ/OE9RX7AchYjlMnl8kxaKodRBO+ZNSGanaqA=; b=TvuIYEtGE+VfnhxvFFyJtuikPE
	2U8IP6h0kYqSSp9PUjTqw93XSozNEcfanZ1+SsaowlwLTb7Pvd1w6DozUznlkGf5TK60keD6EnlbH
	ORepF42PofUEOE8xT0jhU8j2M/Rztoh2+edyj9f78uZDTUARtiZl/1i3hUWxXznW9824fqafgx8os
	VbzVe3KhFNhsHJPZOzCO/9gy4UeQH68fGvtppsulxbs9fwF1NknUJH9LYdVEonOb14PBwUEDcdgQS
	rVCpEBXuiUrH+9b73CjW4mbhF4avjfa7nmQ5CSeTERdhyIzYwLbVW1k3xJiQRtJXQRZBuPOxwZw5x
	uNuYuG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOLGH-003Sw5-1f
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 17:24:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOLGE-003Sum-1T
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 17:24:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFRUrw002077;
	Fri, 12 Jan 2024 17:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9wAIbQZ/OE9RX7AchYjlMnl8kxaKodRBO+ZNSGanaqA=; b=Zj
	3riIqV0WAkyRO4XFwe6fW5kdOlG4C2xZgoCMA7y4rPQmE8QxJK/tHynkeBoPRe9/
	/2BRa3D+gWCBdTlApKZWP+8n/eYkrwBFiF+/D/AcdFoy6fugCSCNjU6G0MxdJ+KV
	Ms1pD8jsrtu7T6v6KerRM/z0Adsflff6aFPoZ4lvFpEOEQs3AkH75bE9rC0O4v4s
	8gjvp+B5krPmfxLZoYLReaFxp8yEAitgrO+XfEnoCrrUvOzNS2oFMMIRQcwzkSuL
	U7bo+sIAVIwhA9T/6aAn+08y2KeoPV6euec1v/HGnrN07F60U2OwFC6awfoYWQ8K
	E0WQGuPXXi/5Sg9yN27Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk18d1crv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:24:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CHO0GA008909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:24:01 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:24:00 -0800
Message-ID: <c35da30b-335c-4418-9d7c-0784ec9e8d30@quicinc.com>
Date: Fri, 12 Jan 2024 09:23:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] wifi: ath12k: Cache vdev configs before vdev create
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-8-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-8-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y1ESbIqP0ukk0ytPZw8tYbPG_N7LJhBY
X-Proofpoint-ORIG-GUID: y1ESbIqP0ukk0ytPZw8tYbPG_N7LJhBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 mlxlogscore=701
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_092402_502080_382B2EFF 
X-CRM114-Status: GOOD (  15.87  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> Since the vdev create for a corresponding vif is deferred
> until a channel is assigned, cache the information which
> are received through mac80211 ops between add_interface()
> and assign_vif_chanctx() and set them once the vdev is
> created on one of the ath12k radios as the channel gets
> assigned via assign_vif_chanctx().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> ---
...
> +static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> +				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
> +				 struct ieee80211_key_conf *key)
> +{
> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct ath12k *ar;
> +	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
> +	int ret;
> +
> +	/* BIP needs to be done in software */
> +	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
> +		return 1;

I know this in the existing code, but what is the significance of
returning 1? Should this be returning a -errno like the error cases that
follow?

> +
> +	if (key->keyidx > WMI_MAX_KEY_INDEX)
> +		return -ENOSPC;
> +
> +	mutex_lock(&ah->conf_mutex);
> +
> +	ar = ath12k_get_ar_by_vif(hw, vif);
> +	if (!ar) {
> +		/* ar is expected to be valid when sta ptr is available */
> +		if (sta) {
> +			mutex_unlock(&ah->conf_mutex);
> +			WARN_ON_ONCE(1);
> +			return -EINVAL;
> +		}
> +		arvif->cache.key_conf.cmd = cmd;
> +		arvif->cache.key_conf.key = key;
> +		arvif->cache.key_conf.changed = true;
> +		mutex_unlock(&ah->conf_mutex);
> +		return 0;
> +	}
> +
> +	mutex_lock(&ar->conf_mutex);
> +	ret = ath12k_mac_set_key(ar, cmd, vif, sta, key);
>  	mutex_unlock(&ar->conf_mutex);
> +
>  	mutex_unlock(&ah->conf_mutex);
>  	return ret;
>  }


