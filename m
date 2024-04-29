Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A091FC4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhfC0FKN1/e9C+cslhqrtC283YJ4UQDA0JWyc3sUgs0=; b=mPXRkKAKlxkWJnqdTYhsHBE+MZ
	jF6PJGIYSTPvkCNsGvQlbCd7RMTDakk7YoqqN8ySjYVuId77k1a8GNNtIqA1ErjDMEQH9Q8wwb+Yc
	iZz+xMz7+JpKgTBctJI5yrh7uRCnGM8KiAjFyhoLxDZGKeiyQ1hJ945ZzSrZBdYBCn3QQw+3ESy00
	rrcVWC1XZ6dPHBhhZcUU3GpXEeZxjy44Ln0eMq8aRcdoYXmdvIA90X44zRO8St7QwjLsL4dxsdZPw
	uOKdRNoveRtghX1Y08rrduBIJs4JqQ4VJG9KtfJTWe22+UwLNL5CMKjl9QtFN9Z5Zni+jrwjFN5XQ
	p3/JA2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1W11-00000003uTr-40DU
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 18:46:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1W0x-00000003uQ9-43Ls
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 18:46:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43THqxn2025648;
	Mon, 29 Apr 2024 18:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JhfC0FKN1/e9C+cslhqrtC283YJ4UQDA0JWyc3sUgs0=; b=k4
	wVrQRkjnEmcDmZlsfxu8Y8mY01X5/gde165mm54YIV9Ct5RR1eAcTaFqum35Lq+O
	jjO0Tcc/supspGqOtlltj+MAYek25KQXTeZb/o/DfE3Mpgvssezn4m5cdAgN8XDO
	RdSpGq/fw5EiqOCeoMWQc77XslVNd5x4gA0h8KZTfKMFKFAlzcuHl5MT17Ef50Ia
	hmafmroxCymumV+HCMyqYZQM4lOuQjI/jxd8WCE2+JDFV2PQAx1QUyvXcVLT/SoP
	4k6SCx7fUpj8jQUo7i5yTxwyxNmtzseX0HAjfm5UXDrg2nPTTiSoBKLWu6VkPNrY
	Zsi89nFhggjjqzNZttRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtaf2jh7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 18:46:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TIk9QC015212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 18:46:09 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 11:46:09 -0700
Message-ID: <e1d428ee-0a16-4fc6-be0b-4c41036ff919@quicinc.com>
Date: Mon, 29 Apr 2024 11:46:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] wifi: ath12k: drop failed transmitted frames from
 metric calculation
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429114841.413901-1-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429114841.413901-1-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UozGWburqt9uSqU_56ypRCiCrQ5vzJPh
X-Proofpoint-GUID: UozGWburqt9uSqU_56ypRCiCrQ5vzJPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_16,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_114612_147384_8FEF74DC 
X-CRM114-Status: UNSURE (   8.03  )
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

On 4/29/2024 4:48 AM, Karthikeyan Kathirvel wrote:
> - Use ieee80211_free_txskb() instead of dev_kfree_skb_any().
> - Drop failed transmitted frames from mesh metric calculation to avoid
> false link metric averaging.
> 
> Karthikeyan Kathirvel (1):
>   wifi: ath12k: drop failed transmitted frames from metric calculation.
> 
> Sven Eckelmann (1):
>   wifi: ath12k: Don't drop tx_status in failure case
> 
>  drivers/net/wireless/ath/ath12k/dp_tx.c    | 43 ++++++++++++++++------
>  drivers/net/wireless/ath/ath12k/hal_desc.h | 22 ++++++++++-
>  2 files changed, 52 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9

'b4' is barfing on this series since you posted 3 patches instead of 2:
[PATCH v3 1/2] wifi: ath12k: Don't drop tx_status in failure case
[PATCH v3 1/2] wifi: ath12k: Don't drop tx_status when peer cannot be found
[PATCH v3 2/2] wifi: ath12k: drop failed transmitted frames from metric calculation.

Why are there two different 1/2 patches?

