Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07832C3DA62
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzOu3z9NqFALwhTkqFZuanahE9f/4lVJF+uA3qhNUC4=; b=ucYMkJiFy+zVLl4Zy8ZPTgGqKs
	MDoaVf2nSGmC3N9SSmqoV70G49nxbWZu1PkjFJRQdA1KC8MNe7ixf91hcgZmjRMs4VwGJFOpH6Yzu
	cSBdfS5gtTniEZxv2KjBJvK7R4JFaLrE1wam3WI2gi0nq4OlmmknL8A1cAeScjUirzNGgFqwOgfhQ
	0I0+AHmLoBGWJc9Ng6F1Hu5BZ6EGath4zBnH12OOPgp5Uv2hEcK31WCJXWCFj5BeOppFA6dfx4rB5
	YK+C47RQacSVqQ9eYue4f3eI1NC3kElCgODRD7XgjZwSVsTH/vsX5Z723fSl8+ctzPr7opr9F3bRo
	oHvl78Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUA8b-0000000EhC8-2phx
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 19:16:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUA8Y-0000000EhBd-0OS5
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 19:16:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HErx7l008253;
	Wed, 17 Jul 2024 19:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DzOu3z9NqFALwhTkqFZuanahE9f/4lVJF+uA3qhNUC4=; b=kMbTnj5NU56di4YT
	FBXH7KkEyDsARgQ4u6wUo9F6wBXB0Q7xhX95P4yekhI92X61J2/O+hAFwqKUkTS/
	u2PI7K3jmRFktxzGnaOX4HCSvymb8zPcgIVCdUZdvsATKTBUbongrRscXiAcAJh5
	KMXGt/iahOsOwg1VMn1r+/GU3BJQtHw47zu6HfDlGYiAcqL5d0LNpDE/LXjEtWnY
	GA0IPJ+AzdRuWRK3lAJ7djRZOz8HwM52kKCae1GfWqkOkC9UnmCUM4g2aaNb/e0F
	Pv+/9uOBdA+N+ZCdTbluKzeL2TiII42gH8GgRHbYfFgE59F9Lb6EdmZjz0dQrGEU
	tWs4yw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfu3f87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 19:16:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HJGNuP023712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 19:16:23 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 12:16:17 -0700
Message-ID: <4514f5e3-32e0-4adc-ad89-36c6650f0079@quicinc.com>
Date: Wed, 17 Jul 2024 12:16:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: Dump PDEV transmit rate HTT stats
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240716024542.30339-1-quic_lingbok@quicinc.com>
 <20240716024542.30339-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240716024542.30339-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2M3khtnW7CyAQdZF7Pztc8_YmVR1ty-H
X-Proofpoint-GUID: 2M3khtnW7CyAQdZF7Pztc8_YmVR1ty-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_14,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=773
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_121626_549644_15A66AA1 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On 7/15/2024 7:45 PM, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> 
...
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index d52b26b23e65..a773be6384c9 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -129,6 +129,7 @@ enum ath12k_dbg_htt_ext_stats_type {
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_ERROR	= 5,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_TQM	= 6,
>  	ATH12K_DBG_HTT_EXT_STATS_TX_DE_INFO	= 8,
> +	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE   = 9,

nit: use TAB before = to be consistent with existing code

these same issues are in 2/3 and 3/3

also in 3/3 just one space after =

>  
>  	/* keep this last */
>  	ATH12K_DBG_HTT_NUM_EXT_STATS,
> @@ -151,6 +152,7 @@ enum ath12k_dbg_htt_tlv_tag {
>  	HTT_STATS_TX_DE_ENQUEUE_PACKETS_TAG		= 21,
>  	HTT_STATS_TX_DE_ENQUEUE_DISCARD_TAG		= 22,
>  	HTT_STATS_TX_DE_CMN_TAG				= 23,
> +	HTT_STATS_TX_PDEV_RATE_STATS_TAG                = 34,

nit: use TAB(s) before = to be consistent with existing code

>  	HTT_STATS_TX_PDEV_SCHEDULER_TXQ_STATS_TAG	= 36,
>  	HTT_STATS_TX_SCHED_CMN_TAG			= 37,
>  	HTT_STATS_SCHED_TXQ_CMD_POSTED_TAG		= 39,



