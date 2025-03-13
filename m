Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40EBC28B28
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 09:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HyeXeAM5I0N01bDf9ebH+DFt5nfOBM5wrbXpzWaBXI=; b=drR7eXeIPqiGok29NJyo+3ZP62
	rwwtKyMbBA7bJgp82jIwtfWJNHfYip9egnxK0BOkGMgOiwMQ0qdfA6pwguycwLzDIqFzRGaGm0G/L
	8hAKxjHLLIxydRvq4WQON9XC0hkZvLC0t7jySuC+46EnwrSRy4BbUu7GrZvn1D54Pc72jc2TnsxLh
	ItUUPTmgmA/YqKMfC5Iqr5qxa1tTSQdbtRrFu/HrktqZwrjJUAMfuOCd9sP0CEal1g+yEmRulxZ9M
	TXcRMcK0gaRN56n0Oe46qglDfgwb85bFXAFUjhi0vxFFPiwTOzKTeO1addHZRqbTt+XaCmL/UiW81
	GGREYW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsezM-0000000Ajz0-1Z7G
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 09:36:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsezK-0000000Ajyc-1Mov
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 09:36:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMGa64023865;
	Thu, 13 Mar 2025 09:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HyeXeAM5I0N01bDf9ebH+DFt5nfOBM5wrbXpzWaBXI=; b=IIOXMuRF15RzT45V
	fo8DrVQeh9R936qWACLoWyuNZYife0NUiBRIyObDau9jj/gQLgr+Qz+PHh/U1P4y
	ZHFs1vuxogi7yFGegpVVHqn6uII+OQNL5qLAvsZYIXoyQ0Oo4KOu1GJldAgsX8uL
	nASxn9aTyF2ullOg/bKF1ee0P7S+pNVjMhVz0DoPqIYuHZf6A4tWNqA1xvB7JKZk
	3tljtHHd+1ohy+3GDXtJuqsx4fXTVOiOZ7VTIT+E1J6NNybT2E31yC10+QH1Z/q1
	Uod29X/QtGVpbYm3FD3VkS7o/ZIZHXAM88s/iioaxVrnw7ZvWiUNvWVGM0d/Sa6L
	Cx8HcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mnatt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:36:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D9aLae016587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:36:21 GMT
Received: from [10.152.204.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 02:36:19 -0700
Message-ID: <c10b95de-f3b3-9506-f4eb-3d668faa9165@quicinc.com>
Date: Thu, 13 Mar 2025 15:06:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: fix 5GHz operation on wideband QCN9274
 radios
Content-Language: en-US
To: Mantas Pucka <mantas@8devices.com>, <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250313-ath12-wideband-caps-v1-1-23ac4247cd8a@8devices.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250313-ath12-wideband-caps-v1-1-23ac4247cd8a@8devices.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sXjcTNW5s4P6bFTfUl4avTYvehS7VKN9
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d2a716 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=mO_DyvKKAAAA:8 a=LMgdiH69iM9wwdmua80A:9 a=QEXdDO2ut3YA:10
 a=9yN1G2m4-WCtQnHix7J8:22
X-Proofpoint-ORIG-GUID: sXjcTNW5s4P6bFTfUl4avTYvehS7VKN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_023626_386317_EFACD9DA 
X-CRM114-Status: GOOD (  13.65  )
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



On 3/13/2025 2:30 PM, Mantas Pucka wrote:
> Currently ath12k_mac_setup_ht_vht_cap() incorrectly assumes that QCN9274
> radios with 6GHz band can't support 5GHz as well. This prevents the
> addition of HT and VHT capabilities for the 5GHz band. Since QCN9274 is
> capable of operating in multiple bands, remove the 6GHz support check and
> exception for single_pdev_only (i.e. WCN7850).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index dfa05f0ee6c9f7356634ab55a6d9c0b4064645a9..aea3ad01b0671fd236ee70864aee4c1e65f564db 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -6484,9 +6484,7 @@ static void ath12k_mac_setup_ht_vht_cap(struct ath12k *ar,
>   						    rate_cap_rx_chainmask);
>   	}
>   
> -	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
> -	    (ar->ab->hw_params->single_pdev_only ||
> -	     !ar->supports_6ghz)) {
> +	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
>   		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
>   		ht_cap = cap->band[NL80211_BAND_5GHZ].ht_cap_info;
>   		if (ht_cap_info)
> 

NAK

Multi-band configuration is supported for scan radio only even that requires
additional driver changes.

