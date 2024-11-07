Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCA4D5AE6C
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GyVFeKjPDh+r9v38j1LkPtGP9YGIVQdB+W3N7dW7gU=; b=qSGpgQthN01vJADa9Flu0H3DCq
	68aAs6eWWSBf2HwszPX+b9qitJwMWBBN35eQGq99EEBGZC7QZD3e5luNtAmiJPO8Z4yWd0WDpjm7r
	nHA8ikoJ0nCUTZDv/BgtI1eKuMAtslOV4vG3AEk+oKOCq+UuJqxpChW+KLNzj2RdOabzX1TVGEviQ
	Ef7Iy5hMCPu50Z7SeZFhroUB8LEMDulMNv1sWfJIxMGSh42mlzBA+k/WSISyj1gYmq3rz8z9UPucL
	4oGsILLmVpvKSk8c3u5DRhNx0Er+Mhr5dbryYlf/U8EB8CWfK1fkzo+Md8EeJCRkPRBlnL29qxRKm
	WdYQB9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wjS-00000005wZd-1GUb
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 07:15:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wjP-00000005wYU-0aqz
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 07:15:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6GR5xw024800;
	Thu, 7 Nov 2024 07:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GyVFeKjPDh+r9v38j1LkPtGP9YGIVQdB+W3N7dW7gU=; b=CiI28Nu60RgjTjm4
	r2s8b9mXiT+S6i72iMlwCo/z/vdWhiCAJ0JGHQELtKvGZeCx8FzPG2LvLArUfHcs
	uyRl4cpLtRwtP1WOPUBuXb7/SYoEzGCp9asDjlF+ab+R6tk4ULqQB7QrjjjNR/d/
	5c9e7S9DVdNd/FqqzcMJmeP1aH2nNJr+SbFcA9ABD6MfbkQkiqs1/4EzWnWUTmu9
	wQHXGNls36qIXDApCaT0KIAkSqebhbGYSWejERXd+vcsVwJrvfKrH3y2RBYpuOk4
	ndima01wBa4Ba8/nkPSMv4qn5rB9JXK7qeVDkb8jW6sMTY5H7/UHRB3EmQe6n8cC
	hH7MnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r2uguhhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 07:14:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A77Ev23013015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 07:14:57 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 23:14:56 -0800
Message-ID: <e028f65c-9faa-46e0-ae34-35815a121ba9@quicinc.com>
Date: Thu, 7 Nov 2024 15:14:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] wifi: ath12k: support change_sta_links() mac80211 op
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-3-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241106142617.660901-3-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 08IIgzso3jVlBt8-RTdl8tny2qgCyD5n
X-Proofpoint-GUID: 08IIgzso3jVlBt8-RTdl8tny2qgCyD5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231503_337264_530C8371 
X-CRM114-Status: GOOD (  16.29  )
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



On 11/6/2024 10:26 PM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Add ath12k_mac_op_change_sta_links() for adding and removing
> link station.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 97 ++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 0ff886e4b3ed..c0cc4e51a4d1 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5572,6 +5572,101 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>  	rcu_read_unlock();
>  }
>  
> +static struct ath12k_link_sta *
> +ath12k_mac_alloc_assign_link_sta(struct ath12k_hw *ah,
> +				 struct ath12k_sta *ahsta,
> +				 struct ath12k_vif *ahvif, u8 link_id)
> +{
> +	struct ath12k_link_sta *arsta;
> +	int ret;
> +
> +	lockdep_assert_wiphy(ah->hw->wiphy);
> +
> +	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
> +		return NULL;
> +
> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
> +	if (arsta)
> +		return NULL;
> +
> +	arsta = kzalloc(sizeof(*arsta), GFP_KERNEL);
kmalloc() is preferred as ath12k_mac_assign_link_sta() will do 'zero'?

> +	if (!arsta)
> +		return NULL;
> +
> +	ret = ath12k_mac_assign_link_sta(ah, ahsta, arsta, ahvif, link_id);
> +	if (ret) {
> +		kfree(arsta);
> +		return NULL;
> +	}
> +
> +	return arsta;
> +}
> +

