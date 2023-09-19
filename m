Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4315BCE79A9
	for <ath12k@archiver.kernel.org>; Tue, 19 Sep 2023 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed3J0Zz06OoOccjhniOwNUswP2Xnfo5yAopF827+YlI=; b=lEO/rTwdvuRvqM
	bFmSluSivSwuJMOdVTtR0y75pINKhI2SfsPbK6umvADzZBuzxx6bnFgRyK4qSASZKt6BLdXFiG8aD
	nGOXBBS6vZ225l5a/sjw9v5M8n84+6P40hat1wUSvN8b9Hth8zfFDnaSjKgIlNkkLBx6LunlXRyGn
	wM7ChNHNQPyaY5PH4j2EmNdk9KxIt3wby6y4Myu0KSkjvF6UKFrr9qWHRRZIAo2CxVF5hSy361WnW
	4+kcfLPDmnh95rI2AK8d+h+L5C6PdwNOSfa8GpS+q4uk42Otiy23ofEoZq30wTwgyZqiNzm017YkL
	KrFv95Hid4OLFL0g5yQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qigsx-001CKe-3D
	for ath12k@archiver.kernel.org;
	Tue, 19 Sep 2023 19:59:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qigsv-001CK0-08
	for ath12k@lists.infradead.org;
	Tue, 19 Sep 2023 19:59:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38JJn2A4013407;
	Tue, 19 Sep 2023 19:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=63W2IAvA0IG1FQKgGuqoGTIoaVW4nn9+mb9tTJpChJw=;
 b=WMS5b/qYPSpNhx682gJMgaP/p06pfZPMwhG79Mfw9R6Rlgq3r8aZENTuG+leFbQ7uJSi
 HbogBrxlCLToxznwhRzcpnA2RUKaksfTJZRmyQ+89zbve82+sa4XNipW8HFoHC3cuNZf
 7QOa9kzw63YT/DY7iOW5ja4czZR1bYJbzIg2wois2P0nH51MI7vGcQYKeyzk3L+dnmXY
 pjxxMJ7ND3M6YOIk8/DuQabyTpGCDL1cKXXxflEVXQEAhTks7ImI2wux5a8PzRoTy/Rc
 emOe8gX6JKXFEDUluQpTyrhuPkCvXDOqh1tHMrfDg4jE2kz5liWsCZF9RPPCAKZRkZe0 Xg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6vcmaju7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 19:59:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38JJxlaG017673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 19:59:47 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 19 Sep
 2023 12:59:46 -0700
Message-ID: <0457896f-2d58-4a4f-9be3-77c30b2d0585@quicinc.com>
Date: Tue, 19 Sep 2023 12:59:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] wifi: ath12k: get 6 GHz power type from HE operation
 element
Content-Language: en-US
To: Aishwarya R <quic_aisr@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230919071724.15505-1-quic_aisr@quicinc.com>
 <20230919071724.15505-4-quic_aisr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230919071724.15505-4-quic_aisr@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pq0gaCDMKfbpDvidnIzcMLS3c0sq2H9m
X-Proofpoint-GUID: pq0gaCDMKfbpDvidnIzcMLS3c0sq2H9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_125949_192007_AE2A5584 
X-CRM114-Status: GOOD (  19.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/19/2023 12:17 AM, Aishwarya R wrote:
> When 6 GHz AP or STA is assigned a channel ctx, it needs to

here again, what is "it"?
and why does "it" need the power type?

> extract the power type from HE operation element.
> If unset power type is present, by default IEEE80211_REG_LPI_AP
> power mode will be used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 5b9af264d305..01f81b087fa2 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5823,6 +5823,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
>   	struct ath12k_vif *arvif = (void *)vif->drv_priv;
>   	int ret;
>   	struct ath12k_wmi_peer_create_arg param;
> +	enum ieee80211_ap_reg_power power_type;
>   
>   	mutex_lock(&ar->conf_mutex);
>   
> @@ -5830,6 +5831,16 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
>   		   "mac chanctx assign ptr %pK vdev_id %i\n",
>   		   ctx, arvif->vdev_id);
>   
> +	if (ar->supports_6ghz && ctx->def.chan->band == NL80211_BAND_6GHZ &&
> +	    (arvif->vdev_type == WMI_VDEV_TYPE_STA ||
> +	     arvif->vdev_type == WMI_VDEV_TYPE_AP)) {
> +		power_type = vif->bss_conf.power_type;
> +		ath12k_dbg(ab, ATH12K_DBG_MAC, "mac chanctx power type %d\n",
> +			   power_type);
> +		if (power_type == IEEE80211_REG_UNSET_AP)
> +			power_type = IEEE80211_REG_LPI_AP;
> +	}
> +
>   	/* for some targets bss peer must be created before vdev_start */
>   	if (ab->hw_params->vdev_start_delay &&
>   	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
