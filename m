Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA4EC636EA
	for <ath12k@archiver.kernel.org>; Wed, 28 Aug 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cWTMt3BYfOLF042WYf91QRF2pi2hXY/XyzwTlFgNHk=; b=gwZkDy9wATS6hOEvl38xhQ3sIH
	RfPxxN7J0MEewYmrskB3CODWvyHb5+1vlMG5Az1/t3+Piq/IsbFQBNe71ssRL/4DuL3Em/VPGmvlv
	Yt+dlKZutxDLzIgJeYuxK2N6978xzsdB9e+o/O7p7hjlUGkbFmwSngcrw2ywXdUESFb0EvrNX8bXn
	iuSgHaknfoh3lvaOLoP+ugP+fWazTtTMAjUZ3tWgMyWzRWru9bCXBz1RYe4dZjBipx+l9rqsiQzP7
	fz8wAKAMDC7zzW5Ih8FUdB4i7Yfyd0dHXBc/SQ1zgV+TmsiAgPH/w1bUsjLubEEhWOhRX1bKEI+7q
	rOT81nsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjM0d-0000000GGuq-0kzW
	for ath12k@archiver.kernel.org;
	Wed, 28 Aug 2024 16:59:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjM0a-0000000GGuG-3uXh
	for ath12k@lists.infradead.org;
	Wed, 28 Aug 2024 16:59:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SBWm30018748;
	Wed, 28 Aug 2024 16:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cWTMt3BYfOLF042WYf91QRF2pi2hXY/XyzwTlFgNHk=; b=XyPADTYzuUpjr/gl
	87jr6tPDYoYvqA9O3lOQAHWDpuUQc2yGw4Py7jAHl+xuX84tjKZEtfXLEoZy7qtB
	vfMUw8ZGtVXnlXiw1dBBKh3lWCsWw0iT9M3VpsO86D/EyzIgTW8kvkpM1R/UVt4/
	ESm+UEyOWleA7iSqR0dqtygrGOOuLBzUAJUVrlSqkb0BawVwL/oRZkHn8V/94Rhc
	Tevg5942YWp/tdSy+zyuJp4nPyvg68xWz3ikcxk8teTQNwRHX7KvKYX9AWzilEC7
	tpxtazn6bM/QmvV7BUNlyua1Miz67yHq+GYjTB1foVGQbAeAN99ZwsK6nEk2a/dB
	exZ8Dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0afvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 16:58:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SGwvsI011584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 16:58:57 GMT
Received: from [10.50.38.254] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 09:58:55 -0700
Message-ID: <ce8201cc-f01f-77e1-f5eb-ab0d6e0bd36a@quicinc.com>
Date: Wed, 28 Aug 2024 22:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Wrong place for rxbaddr/txbaddr to be in struct ath12k_spt_info
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <repk@triplefau.lt>
References: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t2qNJKAc79VMUZMFWyYoQHMy5Yx8-___
X-Proofpoint-ORIG-GUID: t2qNJKAc79VMUZMFWyYoQHMy5Yx8-___
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_07,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_095901_230756_66117809 
X-CRM114-Status: GOOD (  24.44  )
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



On 8/28/2024 7:34 PM, Nicolas Escande wrote:
> Hi there,
> 
> Looking into a problem we have on an ath12k platform at work with a colleague,
> I stumbled upon something that seems weird.
> 
> The interresting parts of dh.h:
> 
> struct ath12k_spt_info {
> 	dma_addr_t paddr;
> 	u64 *vaddr;
> 	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
> 	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
> };
> 
> ...
> 
> struct ath12k_dp {
> 	struct ath12k_base *ab;
> 	...
> 	struct ath12k_spt_info *spt_info;
> 	u32 num_spt_pages;
> 	u32 rx_ppt_base;
> 	...
> };
> 
> In dp.c we have ath12k_dp_cc_desc_init that allocs arrays of ath12k_rx_desc_info
> stores the addresses of the individual desc in each of the spt entries using
> ath12k_dp_cc_get_desc_addr_ptr(), but we also save the address of the whole
> array for later cleanup by dp->spt_info->rxbaddr[i] = &rx_descs[0];
> 
> Surely this is wrong, with the current code we always use the first element of
> dp->spt_info to store all the descriptors arrays. And the same goes for txbaddr.
> I mean it works, but we loose memory for no purpose & make this part of the
> driver harder to understand.
> 
> It should be something like:
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 61aa78d8bd8c..ecd3b5c76d26 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1162,7 +1162,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
>   	spin_lock_bh(&dp->rx_desc_lock);
>   
>   	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
> -		desc_info = dp->spt_info->rxbaddr[i];
> +		desc_info = dp->rxbaddr[i];
>   
>   		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
>   			if (!desc_info[j].in_use) {
> @@ -1181,11 +1181,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
>   	}
>   
>   	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
> -		if (!dp->spt_info->rxbaddr[i])
> +		if (!dp->rxbaddr[i])
>   			continue;
>   
> -		kfree(dp->spt_info->rxbaddr[i]);
> -		dp->spt_info->rxbaddr[i] = NULL;
> +		kfree(dp->rxbaddr[i]);
> +		dp->rxbaddr[i] = NULL;
>   	}
>   
>   	spin_unlock_bh(&dp->rx_desc_lock);
> @@ -1220,11 +1220,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
>   
>   		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
>   			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
> -			if (!dp->spt_info->txbaddr[tx_spt_page])
> +			if (!dp->txbaddr[tx_spt_page])
>   				continue;
>   
> -			kfree(dp->spt_info->txbaddr[tx_spt_page]);
> -			dp->spt_info->txbaddr[tx_spt_page] = NULL;
> +			kfree(dp->txbaddr[tx_spt_page]);
> +			dp->txbaddr[tx_spt_page] = NULL;
>   		}
>   
>   		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
> @@ -1415,7 +1415,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
>   
>   		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET + i;
>   		cookie_ppt_idx = dp->rx_ppt_base + ppt_idx;
> -		dp->spt_info->rxbaddr[i] = &rx_descs[0];
> +		dp->rxbaddr[i] = &rx_descs[0];
>   
>   		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
>   			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(cookie_ppt_idx, j);
> @@ -1445,7 +1445,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
>   			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
>   			ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET + tx_spt_page;
>   
> -			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
> +			dp->txbaddr[tx_spt_page] = &tx_descs[0];
>   
>   			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
>   				tx_descs[j].desc_id = ath12k_dp_cc_cookie_gen(ppt_idx, j);
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index b77497c14ac4..28c8bf22810c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -300,8 +300,6 @@ struct ath12k_tx_desc_info {
>   struct ath12k_spt_info {
>   	dma_addr_t paddr;
>   	u64 *vaddr;
> -	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
> -	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
>   };
>   
>   struct ath12k_reo_queue_ref {
> @@ -352,6 +350,8 @@ struct ath12k_dp {
>   	struct ath12k_spt_info *spt_info;
>   	u32 num_spt_pages;
>   	u32 rx_ppt_base;
> +	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
> +	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
>   	struct list_head rx_desc_free_list;
>   	/* protects the free desc list */
>   	spinlock_t rx_desc_lock;
> 
> Right ?
> 

Yes, we always use the first element of dp->spt_info to store all the 
descriptors arrays.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

