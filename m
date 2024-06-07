Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D16C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 04:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PEyAq+BdU4nHnqAi1NmEDH0ouwrDiB2rCOjFHclR5M=; b=gNszrSsxxHiS2flR5SM6vdGkxD
	YNJpRnY0k0rNxBb9JRiAi77jTkmqk4pQyteqwxpUCuZj9IOPjLC82QYzBwRZm7Uvkvg1EeNDoNiYg
	g79Kg9WmdD/YWMWRLGIyi0inBAMeUL/IJaR0kz0UIFgPLq3BCUDhkapzs9ZFFR2Jlc25/FsrO5gOC
	/GEEWtjYHUtrga8aVXNcJygWWYCDTsJBnUcDYHZDYYLvFk4W9BGqGMIPENqbqIbwExUys8K2tuHZM
	xlT1vdFVM0Oiyp2MgO7NQDgNo1dlNEBmr4YBQGuSD5s/AJ0vFETAtCh23TOMxNbSqPPIzd8kV2zwy
	Vj6D6KVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRTr-0000000COIl-1xrc
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 04:45:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRTn-0000000COHO-48mz
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 04:45:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4570ZdGZ010981;
	Fri, 7 Jun 2024 04:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PEyAq+BdU4nHnqAi1NmEDH0ouwrDiB2rCOjFHclR5M=; b=hGW5+c0FgQyVwIkF
	DmZdJLqjVLEpXobCYHzII0ionk6VjNB3iHlzehD8Ime/N10LrqY9Lo5RgyrQXaNI
	kYhv9IgV+WfsV+vFUGtKnXfYSaX3/ysumdM4SVEbFPKni+VsXcrAoK4C3lALMPzX
	gqaGnrbYABDK/VvAGbAQnsmCBix0Hvtrc2PQ9HmOWdpxaXq0LWBb2QGvRQkxy5Yz
	iMGFgv6AfWmVdUN6Pmp9GWenWqD9r3Fw/5Ht/WTaI8sZ86S6WtGW4p30mBNExw1b
	WPtO2+IkqwQR8mQDUzYvsGEZa4qvwAX1dVEGQGCXQl+6z3J/zqTthwmV7SCoqbk2
	smoWYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjhw0wjte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 04:45:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4574jT21028927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 04:45:29 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 21:45:27 -0700
Message-ID: <cc9a3955-fd59-ff9b-c96b-560e620b916d@quicinc.com>
Date: Fri, 7 Jun 2024 10:15:24 +0530
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
X-Proofpoint-ORIG-GUID: 6ItY3x_ooy74lsn3WaQcf7jR7Qv2Q7Uq
X-Proofpoint-GUID: 6ItY3x_ooy74lsn3WaQcf7jR7Qv2Q7Uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=741
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_214532_188134_731F2C53 
X-CRM114-Status: GOOD (  15.19  )
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

...

>   
> +static u32
> +__ieee80211_get_radio_mask(struct ieee80211_sub_if_data *sdata)
> +{
> +	struct ieee80211_local *local = sdata->local;
> +	struct ieee80211_chanctx_conf *conf;
> +	struct ieee80211_link_data *link;
> +	u32 mask = 0;
> +
> +	for_each_sdata_link(local, link) {
> +		conf = rcu_dereference(link->conf->chanctx_conf);
> +		if (!conf || conf->radio_idx < 0)
> +			continue;
> +
> +		mask |= BIT(conf->radio_idx);
> +	}
> +
> +	return mask;
> +}
> +

I believe __ieee80211_get_radio_mask(sdata) should return the radio mask
used by this sdata right ?

if so, then you should not use "for_each_sdata_link(local, link)" 
because it iterate for all the sdata in the given local and give the 
radio mask. So always return all the radio (bitmap mask) used by the 
wiphy currently.

You can use either of below one

for_each_vif_active_link()

  or

for (link_id = 0; link_id < ARRAY_SIZE(sdata->link); link_id++)


> +int ieee80211_get_radio_mask(struct wiphy *wiphy, struct net_device *dev,
> +			     u32 *mask)
> +{
> +	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
> +
> +	*mask = __ieee80211_get_radio_mask(sdata);
> +
> +	return 0;
> +}
> +
> +static bool
> +ieee80211_sdata_uses_radio(struct ieee80211_sub_if_data *sdata, int radio_idx)
> +{
> +	if (radio_idx < 0)
> +		return true;
> +
> +	return __ieee80211_get_radio_mask(sdata) & BIT(radio_idx);

same here __ieee80211_get_radio_mask(sdata) usage

> +}
> +
-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

