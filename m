Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240C1CFA450
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeKLR4uxyzGrO4FstQE70WV0o3YGqCUm8oouXg1xeKQ=; b=qnvRFH27B495obFoO7vAOOIOqf
	cirEjDsmmbZmNL89SBXw07qTBzgbj4LOnEAe3E6M2p3TcH7or9n3H/Bn1kGoNEhHZhgigJyUBFPC0
	qO5Yrm49yUV9sJSbBfJdRgSqv4xIS/PKwHom0Wx3b9O/LpW9C8VLWVTrPDPtnxuAet9oBx8osDMTP
	v5OPEMla5SWkTdD8hRLIsqw1QnJ9r+VWirwkRO79A7fU+J6RJPfJq7rVRN1IzChUdvrovgr3KRZV3
	m4Q3pM6CWxSkjF1Eq6WQV6p4Mua5yE8WJDzUczO9lb0y8zVZN3YsAsAQJPYAc3VzfFAVO6lo5RY2S
	exVIhOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egU-0000000FFOJ-2Uu2
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 16:58:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dnI-0000000F4Ag-15QV
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 16:01:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9h1bc025464;
	Wed, 23 Oct 2024 16:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LeKLR4uxyzGrO4FstQE70WV0o3YGqCUm8oouXg1xeKQ=; b=hbboorP65gCj0GQC
	H9I4uPs7uE+wbo6lsp4xh0efEUUuCwjxZwNlZQusxJTdmB03n5QvE7PXKm7UrjRP
	ah9m7zguZiR1CQ2bnYcYzbepO6yyB/Vo1+IZxr7RAzL4J1fm8wCfN5lG/Fjwsb2j
	Lzq8V03KFhVKZgKnBLM7swqRmE+7y+uoUy/6jqcGkgk7NHfTqKMZd70k/yyovzYR
	cny5x+DbX9RWo+hMt7grWX98gOufgwLEM20w78t1GbEWXAOaJtwRV4Uhzd+1fnSo
	/AqotZEFs3AGjsoNH8ROa7HrBG6hlDX2qoWG9ODcxZ2Wsaq/lKauvemK2kEzrWft
	VzxRhg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41tqp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 16:01:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NG12j3021796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 16:01:02 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 09:01:01 -0700
Message-ID: <05f2ef12-5176-4742-adb7-04da614995fc@quicinc.com>
Date: Wed, 23 Oct 2024 09:01:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] wifi: ath12k: add helper to find multi-link station
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-8-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241023133004.2253830-8-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _OmP7eIGgBZb2fBMjjhFFc6cGg63gwFr
X-Proofpoint-ORIG-GUID: _OmP7eIGgBZb2fBMjjhFFc6cGg63gwFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_090108_459638_67FA31DF 
X-CRM114-Status: GOOD (  20.72  )
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

On 10/23/2024 6:30 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Multi-link stations are identified in driver using the multi-link
> peer id. Add a helper to find multi-link station using the ML
> peer id.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h   |  2 ++
>  drivers/net/wireless/ath/ath12k/peer.c | 17 +++++++++++++++++
>  drivers/net/wireless/ath/ath12k/peer.h |  2 ++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index 2e05fc19410e..66b60f772efb 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -1796,6 +1796,8 @@ static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
>  	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
>  }
>  
> +#define ATH12K_ML_PEER_ID_VALID         BIT(13)
> +

this seems to be randomly placed without any context

>  int ath12k_dp_service_srng(struct ath12k_base *ab,
>  			   struct ath12k_ext_irq_grp *irq_grp,
>  			   int budget);
> diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
> index 39b371c7433c..c7eb60723d83 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.c
> +++ b/drivers/net/wireless/ath/ath12k/peer.c
> @@ -80,6 +80,20 @@ struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
>  	return NULL;
>  }
>  
> +static struct ath12k_peer *ath12k_peer_find_by_ml_id(struct ath12k_base *ab,
> +						     int ml_peer_id)
> +{
> +	struct ath12k_peer *peer;
> +
> +	lockdep_assert_held(&ab->base_lock);
> +
> +	list_for_each_entry(peer, &ab->peers, list)
> +		if (ml_peer_id == peer->ml_peer_id)
> +			return peer;
> +
> +	return NULL;
> +}
> +
>  struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
>  					   int peer_id)
>  {
> @@ -87,6 +101,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
>  
>  	lockdep_assert_held(&ab->base_lock);
>  
> +	if (peer_id & ATH12K_ML_PEER_ID_VALID)

where is code that sets the bit?

does other code elsewhere need to mask this bit off to have the "true" peer_id?

the commit text for this patch seems to need a lot more description

> +		return ath12k_peer_find_by_ml_id(ab, peer_id);
> +
>  	list_for_each_entry(peer, &ab->peers, list)
>  		if (peer_id == peer->peer_id)
>  			return peer;
> diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
> index b91bb2106b76..5b718fc5c795 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.h
> +++ b/drivers/net/wireless/ath/ath12k/peer.h
> @@ -47,6 +47,8 @@ struct ath12k_peer {
>  
>  	/* protected by ab->data_lock */
>  	bool dp_setup_done;
> +
> +	u16 ml_peer_id;
>  };
>  
>  struct ath12k_ml_peer {


