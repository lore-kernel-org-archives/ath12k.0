Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF4C10F15
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85pKbVDjhJPOQX2m4EyatzAdR3L6uwClLPrOHfj/1QM=; b=qvQXkFtHZFkgkWdpjjr8Amlqnt
	skpHoAx2yz+5aoQ/k3A+06JnEURlkh4Ghffz8avqa7r+sF9rqlstb4jcVnUMWV2ACk7RJ2HDz9A5k
	SVJjd9w63vmAN/q5yCgpwi1zFwZmSN0sMh5mSJOLg+W1vGwoSp4M8Y/yRKcfyo6jX8HKLxgrP75NH
	4BcWn0paLxN29TDel2iZBi2KRmZgnpN8XdxpVpxgIfNaFf9mWOmL+UHZYmf8VqxQcwlz7Q+lNEidk
	CJygG55dkAoVqxPYgdkluIcclZVZOcZJuZa8c3IIaCj6iA4bYgGBCwHKQqkT7Rf6qUFERkGR1QB57
	c4j152+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03QH-00000009ed8-0VFZ
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 18:02:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03QD-00000009ebo-482z
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 18:02:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P9wccu030769;
	Thu, 25 Apr 2024 18:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=85pKbVDjhJPOQX2m4EyatzAdR3L6uwClLPrOHfj/1QM=; b=fR
	VxcZEP6LOiFVGMVVMBQnMLDgADBF5MjHF8iLjag7FZ1Mh42r6+ac5SH4PuvS5vFu
	k1qZ44XCZcOihKcqemH9g7N0CxlEOg24F/WM5ajkrr/5QRMy+C6V3q46AFBganud
	mk1lpefKQ4aV6A+WGXCwvXUBcbyi1WgFEU40pYxxrQj63Rjxa/vToWmGCCLrYqqR
	8DeXwlpFQD7ioj7wpu6d7IFHGAOBOc/PKTLCcyoFTGvDKl+CZt8Y1qTcRhePt4O/
	R49DORl06blX6rnSKbMI9KHr0PxYtDjde3JiEgM7S4bpgb+VI3paFSkRatyoPBsY
	1iGMSlx1/dDfzRDAwAbg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqn0whg4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 18:02:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PI2CfW031380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 18:02:12 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 11:02:12 -0700
Message-ID: <abefe407-4b06-4ee3-8394-417598f69f07@quicinc.com>
Date: Thu, 25 Apr 2024 11:02:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 6/6] wifi: ath12k: support SMPS configuration for 6 GHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <20240424191141.32549-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b0S97NYwPWE3jU26F6HG_dQt9ST6B9S-
X-Proofpoint-GUID: b0S97NYwPWE3jU26F6HG_dQt9ST6B9S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_110214_066367_5A170E5F 
X-CRM114-Status: GOOD (  11.44  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> Parse SMPS configuration from IEs and configure. Without this,
> SMPS is not enabled for 6 GHz band.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 29 ++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 65688e55c285..44e853893ec5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2086,13 +2086,18 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
>  				     ampdu_factor)) - 1;
>  }
>  
> -static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
> -					    int *smps)

the inline removal should be fixed in 5/6 since that is where it was added

> +static int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
> +				     const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
> +				     int *smps)

rest of the patch LGTM

