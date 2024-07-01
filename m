Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C3FC3065A
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbVhLc6/koF2x/qir6yEyR52lJ0YasrLyzsL92gUMkk=; b=m5qgewA8vOeFvhGaxiVTSWnxQP
	GrP0leh+h9IhyHdSmVuhthfM+iZUYhiS7XMZw39aA5q6mvPDtbIOxKbEQTX+Dm6YNolI0ibzceYt5
	xw7zjGPPfWm/f9tlEqw5uTC9rBZr8KRfks+tILB04vLE8To3BpCpcGbvx+WtutMwjImcb+XasIU3y
	BCtu04kw+dYMs7Mw7yLac/OJwOzwgcaDynjv0jH0dWkZ78/ZgWTGx9FLnRtS9lTt358FsgXTOGdDv
	WzoKQ9CgACei0XKJ3cwBdSuy6BQT2LiYabeQRQJiEFfB20OdZ6usfb+W581X6zQLvTd5LSpdHb+Kf
	zrakyLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIsx-00000003vfb-0Fo2
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 15:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIst-00000003ves-3824
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 15:24:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4619iL56030283;
	Mon, 1 Jul 2024 15:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbVhLc6/koF2x/qir6yEyR52lJ0YasrLyzsL92gUMkk=; b=PH5iVmceB6MRxMe1
	W/IZM3uCTQuoxkJclxcLpEhJe+ihxLkynfWk+dWP2SqzzjE2JOevhv3448QxypWb
	LiffSVqOHzftg60VkMz/2RUQbt8Qz3ztnQT04qxnj+AHHwUeqEszCSrbn96srX59
	QncEXMw7YX2aqMSbkQebJBTNbuSyGr/0iN75Q3pUsnPp0IWWp+yw5TH3WMKviCrl
	Qz/SzdcJphbeeC5qEIN0hj/gvWG+UMCXZ9L/cCl+OlU2oXLwCYlEIMTz5pZW5mQu
	7FGi3lxNodPxJ9ceTXX+PQ3dv2vV6lXhg4yajC7zZDd0LDS3cVwPa7pUWYCzQcJ0
	MVpxew==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnmxxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 15:24:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461FO08s031850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 15:24:00 GMT
Received: from [10.50.63.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 08:23:58 -0700
Message-ID: <ff362ca2-361d-5da7-9d8d-299ba1200bf0@quicinc.com>
Date: Mon, 1 Jul 2024 20:53:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 03/10] wifi: cfg80211: extend interface combination
 check for multi-radio
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_adisi@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.a50ea6fd728e14cfdaafeb9cfac003364713c8e7.1719843147.git-series.nbd@nbd.name>
 <18a4aae4b14f1005fb5b1ed98173e31b18914155.1719843147.git-series.nbd@nbd.name>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <18a4aae4b14f1005fb5b1ed98173e31b18914155.1719843147.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aB7sLNel07RTawiptQ6CnE4qN6ySzFhJ
X-Proofpoint-GUID: aB7sLNel07RTawiptQ6CnE4qN6ySzFhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_15,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=855 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_082403_926643_AD9C5E51 
X-CRM114-Status: GOOD (  16.92  )
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



On 7/1/2024 7:43 PM, Felix Fietkau wrote:
> Add a field in struct iface_combination_params to check per-radio
> interface combinations instead of per-wiphy ones.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>   include/net/cfg80211.h  |  5 +++++
>   net/mac80211/util.c     |  5 ++++-
>   net/wireless/rdev-ops.h | 12 ++++++++++++
>   net/wireless/util.c     | 33 ++++++++++++++++++++++++++-------
>   4 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index a3cdad3a9305..bb3b803e5468 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -1598,6 +1598,7 @@ struct cfg80211_color_change_settings {
>    *
>    * Used to pass interface combination parameters
>    *
> + * @radio_idx: wiphy radio index or -1 for global
>    * @num_different_channels: the number of different channels we want
>    *	to use for verification
>    * @radar_detect: a bitmap where each bit corresponds to a channel
> @@ -1611,6 +1612,7 @@ struct cfg80211_color_change_settings {
>    *	the verification
>    */
>   struct iface_combination_params {
> +	int radio_idx;
>   	int num_different_channels;
>   	u8 radar_detect;
>   	int iftype_num[NUM_NL80211_IFTYPES];
> @@ -4580,6 +4582,8 @@ struct mgmt_frame_regs {
>    *
>    * @set_hw_timestamp: Enable/disable HW timestamping of TM/FTM frames.
>    * @set_ttlm: set the TID to link mapping.
> + * @get_radio_mask: get bitmask of radios in use.
> + *	(invoked with the wiphy mutex held)
>    */
>   struct cfg80211_ops {
>   	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
> @@ -4941,6 +4945,7 @@ struct cfg80211_ops {
>   				    struct cfg80211_set_hw_timestamp *hwts);
>   	int	(*set_ttlm)(struct wiphy *wiphy, struct net_device *dev,
>   			    struct cfg80211_ttlm_params *params);
> +	u32	(*get_radio_mask)(struct wiphy *wiphy, struct net_device *dev);
>   };
>   

No documentation for the global iface combination when multi-radio 
combination present ?

/* 4.  Radio specific iface combination...
  */
struct ieee80211_iface_combination {
...
};


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

