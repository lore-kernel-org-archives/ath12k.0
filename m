Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D3C27C53
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOrzqPrbog8UmhYYC+TSD0vNVh1vf3Up5LY8FNHsu4s=; b=gOUy4TGQbgG+/ucdxuICMbi4h9
	palwH1UhpqM70v9lwrZrVefwzEkPAAK3m3XWjSbkr03HxKuGJ5cpp+SCGCatRKE56R9OW4eKZAKtT
	sEUF0U2Y+PHYDTzhokLq4hixErhAoN1RwcwhxcqnbagUJ8qArlZpxFG37aPvVgazQrO0QbQXOp9gu
	4kpKB773rqADlrs+h10XMNx0rnuGoJN6TjoPwZ6KcosNC4KzxUyxa67AfAyHWGC41ovqixUlG8oPy
	YCxB3u6xSAMBcwqyyTk5ArE2IMtTwT+xHzV77cvFnH1amCczNlckF0tEjcl7t1VezB9F1aF7oGdCL
	HBqMOGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHOsn-0000000CvoU-0Xwi
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 14:23:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHOsk-0000000Cvo5-3EzC
	for ath12k@lists.infradead.org;
	Wed, 12 Jun 2024 14:23:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8MGvQ012595;
	Wed, 12 Jun 2024 14:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOrzqPrbog8UmhYYC+TSD0vNVh1vf3Up5LY8FNHsu4s=; b=O2D5WlnitSw4paSC
	PUdWjLqV9sQeQk6kDEgDVL+6iNjlcOklZjjCzi4cWO7aZOyo/ePORgLG+F5sfsyg
	RAUUUEQMm0qEOnrBi1Dee0ZV3kctezJ+BU1wHGv7Oo8YLhkrkGvMzD0f42q0VvPl
	c7hXh275l0iEjpmCz3RmIeEYIGNctg6aslqTytleUI2vBu18GjkWXeo0S+P1LNuE
	d653cuBno8iQEOTIU5Gf9lcuJPNsws2ba/faaP6TNJh5UbpUqfVsMvIAx/DnZTu+
	LPp5XYTaTXwzjg2asYpK+21rlqcWGjCD14kjlUnZy9NmH5ySK8pn/OnzODhiPvrm
	qeHWwQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wgvb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:23:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CENJJM016302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:23:19 GMT
Received: from [10.50.27.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 07:23:17 -0700
Message-ID: <3483a69d-6918-c91c-6349-7f268fe44e15@quicinc.com>
Date: Wed, 12 Jun 2024 19:53:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC v3 4/8] wifi: mac80211: add support for DFS with multiple
 radios
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_adisi@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
 <7cc3d89225f365c85b363874725cfbc77c9c1db5.1717696995.git-series.nbd@nbd.name>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <7cc3d89225f365c85b363874725cfbc77c9c1db5.1717696995.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tIaClkHHTSZyIbImmjSjsPMUgtbq0owD
X-Proofpoint-ORIG-GUID: tIaClkHHTSZyIbImmjSjsPMUgtbq0owD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_072322_955287_BEAE66CB 
X-CRM114-Status: GOOD (  19.13  )
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



On 6/6/2024 11:37 PM, Felix Fietkau wrote:
> DFS can be supported with multi-channel combinations, as long as each DFS
> capable radio only supports one channel.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>   net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> index 40fbf397ce74..e9c4cf611e94 100644
> --- a/net/mac80211/main.c
> +++ b/net/mac80211/main.c
> @@ -1084,6 +1084,21 @@ static int ieee80211_init_cipher_suites(struct ieee80211_local *local)
>   	return 0;
>   }
>   
> +static bool
> +ieee80211_ifcomb_check_radar(const struct ieee80211_iface_combination *comb,
> +			     int n_comb)
> +{
> +	int i;
> +
> +	/* DFS is not supported with multi-channel combinations yet */
> +	for (i = 0; i < n_comb; i++, comb++)
> +		if (comb->radar_detect_widths &&
> +		    comb->num_different_channels > 1)
> +			return false;
> +
> +	return true;
> +}
> +
>   int ieee80211_register_hw(struct ieee80211_hw *hw)
>   {
>   	struct ieee80211_local *local = hw_to_local(hw);
> @@ -1173,17 +1188,18 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>   			if (comb->num_different_channels > 1)
>   				return -EINVAL;
>   		}
> -	} else {
> -		/* DFS is not supported with multi-channel combinations yet */
> -		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
> -			const struct ieee80211_iface_combination *comb;
> -
> -			comb = &local->hw.wiphy->iface_combinations[i];
> +	} else if (hw->wiphy->n_radio) {
> +		for (i = 0; i < hw->wiphy->n_radio; i++) {
> +			const struct wiphy_radio *radio = &hw->wiphy->radio[i];
>   
> -			if (comb->radar_detect_widths &&
> -			    comb->num_different_channels > 1)
> +			if (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
> +							  radio->n_iface_combinations))
>   				return -EINVAL;
>   		}

When driver advertise per radio iface combination, you are not checking 
the global iface combination. using the uncheck global iface combination 
lead to unknown issues.


> +	} else {
> +		if (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
> +						  hw->wiphy->n_iface_combinations))
> +			return -EINVAL;
>   	}
>   
>   	/* Only HW csum features are currently compatible with mac80211 */

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

