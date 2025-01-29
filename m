Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4E8C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpDPGZAt32x2qtb9rOMytGeeU5xBCoZJIR5b+56ludg=; b=fu28svvacg7fUplGW08ayaLoMm
	h9AfzSf+2yOv4/ow3anjnzx/i4IwkjOzFF6cpsMHy1ecsaEMjzzYFT6uXh2vwhLMJcdWnuhXsEzrf
	f3k++pUrhlWEO37uDr5MmNAf1LIagoQdYZCquwvRoQThZbsPk3dRWtmayGIb8Q0uvBQtlleZKI+hF
	awyZ/6sdb/FF7Acb6A43tQ7S97Auroh4v96f0Vv4iiUf2+f8xlEJAf2+7XP9fM4Jxfiy9AsRHZHt1
	4gNMoHHaHXEFHkBBgVFEdxU32CDVzh7uoBloeILKI7C+FBCO7JRXoJjgGSbs9R6dbPgk7kkdCQR+B
	V/jS7gig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td0vJ-00000006MxS-0ZMl
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 05:47:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td0vH-00000006Mx7-0vTw
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 05:47:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gsrp032250;
	Wed, 29 Jan 2025 05:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpDPGZAt32x2qtb9rOMytGeeU5xBCoZJIR5b+56ludg=; b=bawjb2LInjeWXZPn
	vbdUg/K6DG78sSHVE5mhMlnVwM+Z0pYlg02Ye2506m9g/B7tY0nwMYg4m6+gYfc1
	K2f46bSwdYxLqVxqB5h/7CXiqpNLN2p7TS6AJtPqHFXnTeUMgIjfDVGC4aziBKLx
	0A7y34nI/xqX7fiH+VrBRie9vG4oSS5j6/0zQfOidWncMMyoYnOcKqhpnR56JtWv
	IVtT5cceafUhqPp2NqUnGNVyleKT8BDGFAelJ5rg0WLFMQOk4blg1gxJlmfo4PTG
	CeJDWxjmCarxlak13GnJWu0pOrDD1xKIpZVy5VF3qwrMarUo/MX9jFG1MBcL1dit
	OdAhog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f7fcgny7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:47:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T5lY9w024842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:47:34 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 21:47:32 -0800
Message-ID: <d2b8ee2c-f14d-2300-f679-6e3fdcfb0ba2@quicinc.com>
Date: Wed, 29 Jan 2025 11:17:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 5/9] wifi: ath12k: Update the peer id in PPDU end user
 stats TLV
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20250127104738.4174862-1-quic_periyasa@quicinc.com>
 <20250127104738.4174862-6-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250127104738.4174862-6-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2iLicyEZFHPPAq9qkaNY9GhkuMCjrYM5
X-Proofpoint-ORIG-GUID: 2iLicyEZFHPPAq9qkaNY9GhkuMCjrYM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_214735_268976_E946A762 
X-CRM114-Status: GOOD (  12.94  )
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



On 1/27/2025 4:17 PM, Karthikeyan Periyasamy wrote:
> Currently, peer id get reported in the PPDU end user TLV tag. But the
> monitor status handler is inherited from ath11k, but it was not updated
> to incorporate the changes made to ath12k 802.11be hardware architecture.
> Therefore, update the peer id from the PPDU end user TLV data to get latest
> peer id update, it helps to populate accurate peer information on the
> statistics data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 8ded73d87c73..8c283e7c7dde 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -1535,6 +1535,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
>   		ppdu_info->num_mpdu_fcs_err =
>   			u32_get_bits(info[0],
>   				     HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR);
> +		ppdu_info->peer_id =
> +			u32_get_bits(info[0], HAL_RX_PPDU_END_USER_STATS_INFO0_PEER_ID);
> +
>   		switch (ppdu_info->preamble_type) {
>   		case HAL_RX_PREAMBLE_11N:
>   			ppdu_info->ht_flags = 1;

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

