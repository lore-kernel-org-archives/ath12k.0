Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215EDC54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkQHLHyq4cVwkJk3mD/wGcJnZMLcVvzDd74G/l4eGgc=; b=p+x6ZFF040PbUcIBGbG+DWQqOL
	nVOmS8RBqJIo0WNFqhYyV8xWre1XBg/9EoURIUBxHgl7VIzzdoHEUSKDGMiPA/qxrOftF2Ejvhc/I
	uIGjSkpZAG6Mn/DyiU+7h4NBcCA0a8i4slCpSrlLFEky34b8UqtbyJDzkHJ15JyD02PGeYHUQ4ShJ
	6QkYFavmv0in1yEgH/rkyq2b0EnS1gQfZDZZNn4qzNod5AA31ABwqR2KowUZrntM+DH8C/k3nH4iO
	yFyWqEzRiJCvTRojGoQsJNbNp+G1xU2lp229Zu7GtdS1efWFlZqOJ2UT+nl1YyRy1jkwPIxkov8tr
	Sh1eNlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAN8-00000007l5q-3Qyg
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 22:13:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAN2-00000007l4d-3rZo
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 22:13:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CKcdjG018900;
	Tue, 12 Mar 2024 22:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IkQHLHyq4cVwkJk3mD/wGcJnZMLcVvzDd74G/l4eGgc=; b=aC
	I/BmfpscaEO8tRQZ5akPynex7Ipcs810YalhAOBviBF3XC/hfwDBzsxcFGKn6SH9
	Vj42hDFdhek/8G7uXkI5967Ic8ti++UeDR7Wuk/2ZRKrhWGz4RjDqfOcToJrlObZ
	fmK4nAmPMbqKE9tHuYeW8cxpnS48fGEk9RkCWdVyPCNLG/F7otLIF+8IoyzKlKPv
	SR1DisnUJVnAWXT/xSRzciWd7ULljUNP6z9NuCgh29zc2+gJ8TEJ8hWKRLvihU8X
	JduerFDRu/1cNo9bOWJLiCNkIK56nsPot9y7XP0ii1RqgIWUYwOARbQr1fHQ8q97
	16rU6645+ByYqIZv2thA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtmewhqjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 22:13:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CMDEur028467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 22:13:14 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 15:13:14 -0700
Message-ID: <c0756266-1f45-4b31-83e8-a8b8c31fafc6@quicinc.com>
Date: Tue, 12 Mar 2024 15:13:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] wifi: ath12k: modify ath12k mac start/stop ops
 for single wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-4-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240312135557.1778379-4-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iCKUeSodEyQTg5-4cExUZXhy6zxmwSoz
X-Proofpoint-GUID: iCKUeSodEyQTg5-4cExUZXhy6zxmwSoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_14,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=917 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_151317_017678_9F2DA566 
X-CRM114-Status: GOOD (  20.93  )
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

On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> When mac80211 does drv start/stop, apply the state change
> for all the radios within the wiphy in ath12k.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 43 +++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 0f33f5615170..4afaba3ba934 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -243,6 +243,7 @@ static const u32 ath12k_smps_map[] = {
>  
>  static int ath12k_start_vdev_delay(struct ath12k *ar,
>  				   struct ath12k_vif *arvif);
> +static void ath12k_mac_stop(struct ath12k *ar);
>  
>  static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
>  {
> @@ -5472,23 +5473,39 @@ static int ath12k_mac_start(struct ath12k *ar)
>  	return ret;
>  }
>  
> +static void ath12k_drain_tx(struct ath12k_hw *ah)
> +{
> +	struct ath12k *ar;
> +	int i;
> +
> +	for_each_ar(i, ah, ar)
> +		ath12k_mac_drain_tx(ar);
> +}
> +
>  static int ath12k_mac_op_start(struct ieee80211_hw *hw)
>  {
>  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> -	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
> -	struct ath12k_base *ab = ar->ab;
> -	int ret;
> +	struct ath12k *ar;
> +	int ret, i;
>  
> -	ath12k_mac_drain_tx(ar);
> +	ath12k_drain_tx(ah);
>  
> -	ret = ath12k_mac_start(ar);
> -	if (ret) {
> -		ath12k_err(ab, "fail to start mac operations in pdev idx %d ret %d\n",
> -			   ar->pdev_idx, ret);
> -		return ret;
> +	for_each_ar(i, ah, ar) {
> +		ret = ath12k_mac_start(ar);
> +		if (ret) {
> +			ath12k_err(ar->ab, "fail to start mac operations in pdev idx %d ret %d\n",
> +				   ar->pdev_idx, ret);
> +			goto fail_start;
> +		}
>  	}
>  
>  	return 0;
> +fail_start:
> +	for (; i > 0; i--) {

should this be >= 0? otherwise you never stop radio 0
also note that this has a dependency upon how the macro is implemented since
that determines when i is incremented.

> +		ar = ath12k_ah_to_ar(ah, i);
> +		ath12k_mac_stop(ar);
> +	}
> +	return ret;
>  }
>  
>  int ath12k_mac_rfkill_config(struct ath12k *ar)
> @@ -5584,11 +5601,13 @@ static void ath12k_mac_stop(struct ath12k *ar)
>  static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
>  {
>  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> -	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
> +	struct ath12k *ar;
> +	int i;
>  
> -	ath12k_mac_drain_tx(ar);
> +	ath12k_drain_tx(ah);
>  
> -	ath12k_mac_stop(ar);
> +	for_each_ar(i, ah, ar)
> +		ath12k_mac_stop(ar);
>  }
>  
>  static u8


