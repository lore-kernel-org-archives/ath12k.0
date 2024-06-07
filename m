Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B81C27C55
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuh1Ri4Fw+IdW7OKtyJJMHHfUPgurMEw3zuy2ksfZ+I=; b=ocV2sQnAmGBf+Cem1yelK+k/+Z
	ahj4XuGAEoL1E+ddDGEhJaZnhWr923e6i1c1xbAzbEfLkRHhTXNYJ5c9zL4Z+J726qVsha1XfR0DO
	MbLpBx8EbfFI4oLIGRfAj9TcgnrkiJAZkshLufblWs2klnO+h73i8HkFtQUIPaYQXRUmrxfrvQdqj
	+dJVCatDi3P75AWVo6AzoVoclwb6OwgMqoa9c9TxMiSTGBWkXHb7zpPA+yi1WaXb3fIkKMVTpGXCF
	xeTSjT0hnuNLdLTPjLJVr7p2/FLMHCPIunTUVYC+aNWRtZXuaiukkYqCvYFrRPjU0ZgX0FxNLotd2
	ouVziggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFWVX-0000000DT4n-3VDh
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 10:07:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFWVU-0000000DT3U-3aSu
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 10:07:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4571Uohg031628;
	Fri, 7 Jun 2024 10:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuh1Ri4Fw+IdW7OKtyJJMHHfUPgurMEw3zuy2ksfZ+I=; b=CwjGjwjkxl17Daz/
	wW2iOlwqYS+7UptahBqAdhIWmNCbhGW+48AOK+OkGjz7coW+nQbXSGRXYNTyvZ42
	LBgQvYyS+NtgUna6dyzSvKGS2KVxQIrZpyGmgPmH1PLrvP8JuirtyRQ+jtKjLCrS
	12In44zQ5YNFFvEfsk3mdgEuMYe9a0cBorq1yN0X5xiLFy2mXIIiYEvfMQx3hkcw
	3hoyycuN71GGYJev7i6YXd0GIcLu6p9sh6zBQhE7SxD/2zFfiLe0knWEvETP8jxU
	pxFjPdNSsWf8f2YLn+EcDAOhgrBCHpBwmKDVmjqedVy2ys8s8ENQ+r8fnLXfJcyN
	nTwxwA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk89e0p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 10:07:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457A7XRd024462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 10:07:33 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 03:07:31 -0700
Message-ID: <a337de2e-fe3e-18ed-b55b-9ea2cd21baed@quicinc.com>
Date: Fri, 7 Jun 2024 15:37:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC v3 6/8] wifi: mac80211: extend ifcomb check functions for
 multi-radio
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_adisi@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
 <bc603fc671010bb720e75881ef0e22d81ec6e2eb.1717696995.git-series.nbd@nbd.name>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <bc603fc671010bb720e75881ef0e22d81ec6e2eb.1717696995.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kMSX_GTKPWH2ZMoOIp15BsFcDGtX8eIB
X-Proofpoint-ORIG-GUID: kMSX_GTKPWH2ZMoOIp15BsFcDGtX8eIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=809 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406070073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_030737_044527_69DCFFC0 
X-CRM114-Status: GOOD (  13.43  )
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
> Add support for counting global and per-radio max/current number of
> channels, as well as checking radio-specific interface combinations.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>   net/mac80211/cfg.c         |   7 +-
>   net/mac80211/chan.c        |  17 +++--
>   net/mac80211/ibss.c        |   2 +-
>   net/mac80211/ieee80211_i.h |   6 +-
>   net/mac80211/iface.c       |   2 +-
>   net/mac80211/util.c        | 131 +++++++++++++++++++++++++++-----------
>   6 files changed, 116 insertions(+), 49 deletions(-)
> 
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 62119e957cd8..950b7b72f0b8 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -263,7 +263,7 @@ static int ieee80211_start_p2p_device(struct wiphy *wiphy,
>   
>   	lockdep_assert_wiphy(sdata->local->hw.wiphy);
>   
> -	ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
> +	ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -285,7 +285,7 @@ static int ieee80211_start_nan(struct wiphy *wiphy,
>   
>   	lockdep_assert_wiphy(sdata->local->hw.wiphy);
>   
> -	ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
> +	ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -4001,7 +4001,7 @@ __ieee80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
>   		goto out;
>   
>   	/* if reservation is invalid then this will fail */
> -	err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0);
> +	err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0, -1);

Once we reach the global limit, all the -1 passing caller get fail 
becuase the iface check param (existing and new) is validated against 
the global limit. since global limt as a sort of union of all per-radio 
limits.

Ex:
Global iface = 6 (Radio iface 2GHz:4, 5GHz:4, 6GHz:6)


So far 6 iface created (Radio iface 2GHz:2, 5GHz:3, 6GHz:1)

In this case, new iface creation get fail because caller uses 
ieee80211_check_combinations() with -1 as radio idx, so it checked 
against global limit


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

