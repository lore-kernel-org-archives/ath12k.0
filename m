Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3075AC3DA7F
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fN8SHihm27y1/SQOsRD6lqRNmPd8YJizkOqvQugAfM=; b=gry82Ue2YEreymOhozp50vUcDN
	Y+FsFVo+SckdHJzA78+xh4rgb4J2dJdcV62Pj8XtvE09FOPgiyBo8rRPGdtJgdPwTTiK6baQTnj/s
	aDzcUsE7azRi++KdD0flg42jM5ftyDWi0A/SYyn4tb7eStVlCV/3WOL2BOQb/zeIZwmf4Vwl60tQG
	lC5JXlfCgRgES8pRM1ftGqJnaTIzUoc+Spi9uzepOFXuzeDG5FsvI2jnvpl5fiMimRmeDjiMBzCeN
	DfUZEbA49Xe2V8HjjyLXEzvdVDiZkJDOnUYgbMHeG+ESz25GfAmhAVLzTs+G6pA87M+O6IkXWk+B1
	+COSBkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8es-00000002VDc-207V
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:18:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8ep-00000002VCN-3bEW
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:18:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PNUYV7031523;
	Fri, 26 Jul 2024 00:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fN8SHihm27y1/SQOsRD6lqRNmPd8YJizkOqvQugAfM=; b=JVGxOIgYY/lNiQKp
	tEJn+pRqNW4rSFNzvz0DlEMIoLuHJ4FGu5tkatFjkLsp9RiWefe5PuIKobHvSwLp
	4nqZMUejqsYy2X31e61lwo4V2+rKh4dz+qnDEquDXuh4ERl0QFdnjtbXEwAG9JKW
	JL0cgWonvirvU1uoTWTvXTc92zBAIsqxnIHg8+mu4RI2dLJiKQRRvRCH57Lvpa/3
	Q9+TKWSxSNVgV8jrbz5YPeis+lN148ZrA0mbEQF/Zw2E9eW/Hf87dTmu80Wtb2wj
	a1Hxlu4rnyzqptDWDlOU2hIdaHPVB+2qgYKNhG7ZqeRalConPz+jm6O7UiYP0f8x
	r4vQog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40jxxbmxg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:18:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0I2OY004143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:18:02 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:18:02 -0700
Message-ID: <2a44b24b-f122-44de-a053-fee07753eb7e@quicinc.com>
Date: Thu, 25 Jul 2024 17:18:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] wifi: ath12k: delete mon reap timer
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-12-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-12-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: An4BC6sdUtOYyepNGPPQ1Kcx7Bbsv1ol
X-Proofpoint-GUID: An4BC6sdUtOYyepNGPPQ1Kcx7Bbsv1ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=846 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171803_938287_8DF6A56A 
X-CRM114-Status: GOOD (  17.62  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> Currently mon reap timer is not used, and it is not needed anymore.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  2 --
>  drivers/net/wireless/ath/ath12k/dp.c   | 25 -------------------------
>  2 files changed, 27 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index daf7c04bb728..83ef92ecdc39 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -888,8 +888,6 @@ struct ath12k_base {
>  	struct ath12k_dbring_cap *db_caps;
>  	u32 num_db_cap;
>  
> -	struct timer_list mon_reap_timer;
> -
>  	struct completion htc_suspend;
>  
>  	u64 fw_soc_drop_count;
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 61aa78d8bd8c..547ecb419809 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -974,8 +974,6 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
>  {
>  	int i;
>  
> -	del_timer_sync(&ab->mon_reap_timer);
> -
>  	for (i = 0; i < ab->num_radios; i++)
>  		ath12k_dp_rx_pdev_free(ab, i);
>  }
> @@ -1020,27 +1018,6 @@ void ath12k_dp_hal_rx_desc_init(struct ath12k_base *ab)
>  		ab->hal_rx_ops->rx_desc_get_desc_size();
>  }
>  
> -static void ath12k_dp_service_mon_ring(struct timer_list *t)
> -{
> -	struct ath12k_base *ab = from_timer(ab, t, mon_reap_timer);
> -	int i;
> -
> -	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++)
> -		ath12k_dp_mon_process_ring(ab, i, NULL, DP_MON_SERVICE_BUDGET,
> -					   ATH12K_DP_RX_MONITOR_MODE);
> -
> -	mod_timer(&ab->mon_reap_timer, jiffies +
> -		  msecs_to_jiffies(ATH12K_MON_TIMER_INTERVAL));
> -}
> -
> -static void ath12k_dp_mon_reap_timer_init(struct ath12k_base *ab)
> -{
> -	if (ab->hw_params->rxdma1_enable)
> -		return;
> -
> -	timer_setup(&ab->mon_reap_timer, ath12k_dp_service_mon_ring, 0);
> -}
> -
>  int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
>  {
>  	struct ath12k *ar;
> @@ -1051,8 +1028,6 @@ int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
>  	if (ret)
>  		goto out;
>  
> -	ath12k_dp_mon_reap_timer_init(ab);
> -
>  	/* TODO: Per-pdev rx ring unlike tx ring which is mapped to different AC's */
>  	for (i = 0; i < ab->num_radios; i++) {
>  		ar = ab->pdevs[i].ar;


