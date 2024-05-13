Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F820C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd5G1vS7OgrCj4/8/GUWYn+CSWnQv8/Ka0YoKgujAcs=; b=HnWq3ykFC5y3jV3eZ15SVslK94
	YhswVjC3IKx5Re84uXticwCWynXetBSUEHPviJHHII2UrmF4JG69doqScD6Xof96v3FsylCMuU9uu
	jTAlLwqn7MFh2LSadd5qjka3ZlLlJrJ2n2g9zwuN6xlQ8htMqrEyGh8QEggLG3RYgArOTgNScLkas
	6aJujN1B+18Bk4krcur5t+ZQGd0ULRCDabNCTauibNwkiaQkWFZUY4IMMk0mk3TKKnkPWmdzyXdj5
	jcSBZp2aG0madxEcCvuLERs4F76rxMFydO8/ktPJgtacSfaIdfhOMQh0KDk2XEswTGcQ4q2Momsq2
	ILEeFJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6cbq-0000000EA7l-2rUP
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:49:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6cbo-0000000EA6o-0AQQ
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:49:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8uOE027896;
	Mon, 13 May 2024 20:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jd5G1vS7OgrCj4/8/GUWYn+CSWnQv8/Ka0YoKgujAcs=; b=R+
	z5Zek6v5YvFkKfKCFtFOXfvXBBg0miWvTtt/R2RRtaixoex1uKghUDiIqDYzI0Sx
	PDE1sNzNfKYuHxWItNrQYtgWLnwXKoqNBZ9EDckvvK03naOMOZoYuAAvhpOYfFtA
	BzI0SuR+6u1dtnXNvVQv5x/hb8mdyKKMEB0kRqeLTyCWxb/0UemmCdVvr2d5fL9N
	rAzmOXlt1BG0TDcE+jOiYiXCdkacvf87DRnmc2+rbn80BvCceIiPESmFMwy8Fdq2
	osZDdGObaz93YUn17/vBIeyxmlctH3R3aimkTHvw4L52PZ5HG+3yP5AagoqEitMG
	eg6wubR0ui/TDZZ5KlDQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9mcnm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:49:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKnFln026969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:49:15 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:49:14 -0700
Message-ID: <3b7be076-9aa6-4f21-b9dc-7ee04cf26ce7@quicinc.com>
Date: Mon, 13 May 2024 13:49:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-2-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ew-ubF6pmNfGnbv4ah-CYDJHCW4f7JTW
X-Proofpoint-ORIG-GUID: ew-ubF6pmNfGnbv4ah-CYDJHCW4f7JTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_134920_250248_F98D67C8 
X-CRM114-Status: GOOD (  15.35  )
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

On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
> to pass EHT MU-MIMO configurations from user space to driver.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  include/net/mac80211.h | 4 ++++
>  net/mac80211/cfg.c     | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index cafc664ee531..d7b6f75bc920 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -701,6 +701,9 @@ struct ieee80211_fils_discovery {
>   *	beamformee
>   * @eht_mu_beamformer: in AP-mode, does this BSS enable operation as an EHT MU
>   *	beamformer
> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or transmission

suggest you reformat to fit in 80 columns
(we allow code to exceed 80 columns when it improves readability, but comments
should almost never exceed 80 columns)

> + *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPDU
> + *	bandwidth
>   */
>  struct ieee80211_bss_conf {
>  	struct ieee80211_vif *vif;
> @@ -793,6 +796,7 @@ struct ieee80211_bss_conf {
>  	bool eht_su_beamformer;
>  	bool eht_su_beamformee;
>  	bool eht_mu_beamformer;
> +	bool eht_80mhz_full_bw_ul_mumimo;
>  };
>  
>  /**
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index b08e5d7687e3..96b2f31f0c8a 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -1379,6 +1379,11 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
>  				(IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
>  				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ |
>  				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ);
> +		link_conf->eht_80mhz_full_bw_ul_mumimo =
> +			params->eht_cap->fixed.phy_cap_info[7] &
> +				(IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_80MHZ |
> +				 IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_160MHZ |
> +				 IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ);
>  	} else {
>  		link_conf->eht_su_beamformer = false;
>  		link_conf->eht_su_beamformee = false;


