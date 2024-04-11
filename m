Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C2C00A94
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEGXvIgBrqclXOoSKQ712D+KL6n0S2D53O1A/6qY7d8=; b=LXIVEhA/vAhI4+zN6zcCwv+0YU
	jx3BGx5G36uboVzgw9ZwuNH24MhEhoK/Ys3Z0XLXd55cvUZUO7buLytaGLWYr8Z2NJRr8YCvpsUG+
	l2rYJQK6E5HYI6f1hwTHXvMspJY5Qh7BgLKlME+qvlAO5gq9f4tu5/7xi1fUnNHOhDsGs1XYEEcSu
	gyADFt8y49jSGgt/HXGO0i1b3zuHr4sSxBV/bpgS+3obc58qa9zEJ4dGRiyGFw+EvbQhyaVVVrqhu
	rFdpWYjVi6HVCsE4EQhxskNGCOExVohbTqL+RDOT0gU3PrzNqxnwVrRyR4FAMcK09vAnuP6yg5vGc
	35EOAyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0J9-0000000DvZv-0YIf
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 19:42:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0J5-0000000DvYl-0gkk
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 19:42:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BJcD39012420;
	Thu, 11 Apr 2024 19:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bEGXvIgBrqclXOoSKQ712D+KL6n0S2D53O1A/6qY7d8=; b=Bv
	5qq/r1z3rbIU4agK9Vj4C4VJn8GKA6PF2vUwN7c9n/3mgP4wm7oHxpX03JzzXlGW
	3WNqQbJkPXlncZNDfuvz4EBqADSUTJ9i1xzumRBnFtEEkITf99rHOFopa/kNS95o
	SeXTtLqlkdQgSAmw4UrA0cMIbuRqgg74t8MybDUH+IDr4k+mRtmL3i0rzvVBTJL9
	6zzoCdQpdJXHPOj6Hjy8hAMe2prgjhwkcRj9V2F0QWaMrQO0X3C2mnokI9UPnPkV
	qIewgRUcMl9mmAMWAKa2wKzqsLLALwIvF2iAos2nI4aBAoMBg3v/O0vhuJdFGehC
	N/Bkko2HuRgzDjrKMaqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xep6fg06k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 19:41:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BJfovX008411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 19:41:50 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 12:41:49 -0700
Message-ID: <e8618364-e547-41e1-b18f-4cddeafd3371@quicinc.com>
Date: Thu, 11 Apr 2024 12:41:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411165645.4071238-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240411165645.4071238-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QRqDyjhaD8zlQDfnDVj_H6IN-g3KkDFX
X-Proofpoint-ORIG-GUID: QRqDyjhaD8zlQDfnDVj_H6IN-g3KkDFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_124159_375671_4103B0AB 
X-CRM114-Status: GOOD (  17.19  )
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

On 4/11/2024 9:56 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> ath12k will support Multi-Link Operation (MLO) in the future but not yet. A
> major change with MLO is that cfg80211 will disable Wireless Extension (WEXT)
> user space interface. To avoid having inconsistent user experience, first
> supporting WEXT and later not, disable WEXT already now.
> 
> Now ath12k claims that WEXT is not supported:
> 
> $ iwconfig wlan0
> wlan0     no wireless extensions.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index f15dcd75157d..e989628d7d72 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8556,6 +8556,12 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
>  				   NL80211_FEATURE_AP_SCAN;
>  
> +	/* MLO is not yet supported so disable Wireless Extensions for now
> +	 * to make sure ath12k users don't use it. This flag can be removed
> +	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.
> +	 */
> +	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
> +
>  	hw->queues = ATH12K_HW_MAX_QUEUES;
>  	wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
>  	hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
> 
> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9

Currently on my version of Ubuntu when I switch to Hotspot mode I'm seeing:
[   55.189623] warning: `iwconfig' uses wireless extensions which will stop
working for Wi-Fi 7 hardware; use nl80211

So are userspace folks aware of the need to move away from iwconfig?
Is there a Ubuntu / Network Manager fix fir this?

/jeff

/jeff


