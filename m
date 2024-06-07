Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C1CC27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLjRyFZvABbimdq+0skb07AjOJ/EOU+r7LoUC5u9r94=; b=gIlW82ROBbc3HBr3o2KNVFgq30
	MaF/jxxc2tewmP5yij5/FNADyCIOaCctaeZEvcxRVbxPlQO/CXv6q406Yh9bdgN5pCwCpxkx4fwpK
	kXTYY9ols3itZ5UllRSmIZQ9xaYuSQPdP0zWXYdHIiZoKO00Ji5YkXxJU4oQObjeK5m7Cup+omQkn
	nz0aCJuNhVk9DBBaazih4y1xdyQTj70fU1XdTx1lvFFz7QDqdZ3MBkbmFy1TVWSSQrjNeWMhHnGT+
	oXvS634zfMCC1qj2T/gBEUaOTN0eFAH1Y5PkRdVAsx0BdgOIfJNMJrAZBy3sb0cVcXWu6AngUuNKJ
	RTKjOshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXEX-0000000Dc6J-2e3b
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 10:54:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXEU-0000000Dc5n-0P2P
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 10:54:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4573smrS005110;
	Fri, 7 Jun 2024 10:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLjRyFZvABbimdq+0skb07AjOJ/EOU+r7LoUC5u9r94=; b=cUAaXVdEXdI0V8Zn
	tSN66ZZjQR7Kvqsnr6Vy4a6FA3esvZnqBzrEyIQcESfCA/DiudGwiRcUfgSvSj3G
	9z+h/CxJu1NuktuSm4GnwRZTyZaQ+YwH9+44X0rmIe3moKaCOJe7rVBprCm7Uq35
	fMeEfbOdMZh7K1fAeXG42w8+QGl3sXXzqBcALxfnvPt+VcCGRlqgEFONUe+01VMf
	nVwoRajLObcrR3YcZEs8w4Qvxy6a9kYmJhOHI34XE2Zv7crIbIjRHFxtXYddeO4w
	u4cwzGVLLlqMSxU6M6Bx05mv9i/NLjYmMDlL2NTi3Kt/4oB+LZfqBBNYZZ0Bi5qB
	P98Akg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tngfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 10:54:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457As0aF028432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 10:54:00 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 03:53:58 -0700
Message-ID: <479752f5-221d-746b-7513-ba27ef547ac1@quicinc.com>
Date: Fri, 7 Jun 2024 16:23:55 +0530
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
 <a337de2e-fe3e-18ed-b55b-9ea2cd21baed@quicinc.com>
 <1f32cb6c-6be8-4e3d-8e8f-2d3c728875a9@nbd.name>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <1f32cb6c-6be8-4e3d-8e8f-2d3c728875a9@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: icognQ9Ic54dwplhKoCE2ZSNit5uEZqJ
X-Proofpoint-ORIG-GUID: icognQ9Ic54dwplhKoCE2ZSNit5uEZqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_05,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=803 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_035406_168320_2B4D4121 
X-CRM114-Status: GOOD (  12.71  )
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



On 6/7/2024 3:52 PM, Felix Fietkau wrote:
> On 07.06.24 12:07, Karthikeyan Periyasamy wrote:
>>
>>
>> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>>> Add support for counting global and per-radio max/current number of
>>> channels, as well as checking radio-specific interface combinations.
>>>
>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>> ---
>>>   net/mac80211/cfg.c         |   7 +-
>>>   net/mac80211/chan.c        |  17 +++--
>>>   net/mac80211/ibss.c        |   2 +-
>>>   net/mac80211/ieee80211_i.h |   6 +-
>>>   net/mac80211/iface.c       |   2 +-
>>>   net/mac80211/util.c        | 131 
>>> +++++++++++++++++++++++++++-----------
>>>   6 files changed, 116 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
>>> index 62119e957cd8..950b7b72f0b8 100644
>>> --- a/net/mac80211/cfg.c
>>> +++ b/net/mac80211/cfg.c
>>> @@ -263,7 +263,7 @@ static int ieee80211_start_p2p_device(struct 
>>> wiphy *wiphy,
>>>       lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>> -    ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
>>> +    ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -285,7 +285,7 @@ static int ieee80211_start_nan(struct wiphy *wiphy,
>>>       lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>> -    ret = ieee80211_check_combinations(sdata, NULL, 0, 0);
>>> +    ret = ieee80211_check_combinations(sdata, NULL, 0, 0, -1);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -4001,7 +4001,7 @@ __ieee80211_channel_switch(struct wiphy *wiphy, 
>>> struct net_device *dev,
>>>           goto out;
>>>       /* if reservation is invalid then this will fail */
>>> -    err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 0);
>>> +    err = ieee80211_check_combinations(sdata, NULL, chanctx->mode, 
>>> 0, -1);
>>
>> Once we reach the global limit, all the -1 passing caller get fail
>> becuase the iface check param (existing and new) is validated against
>> the global limit. since global limt as a sort of union of all per-radio
>> limits.
>>
>> Ex:
>> Global iface = 6 (Radio iface 2GHz:4, 5GHz:4, 6GHz:6)
>>
>>
>> So far 6 iface created (Radio iface 2GHz:2, 5GHz:3, 6GHz:1)
>>
>> In this case, new iface creation get fail because caller uses
>> ieee80211_check_combinations() with -1 as radio idx, so it checked
>> against global limit
> 
> Use the sum of the number of interfaces from each radio instead of the 
> maximum.

Oh, then legacy user have misconception of the global interfaces 
advertised and try to fail for the allowed limits.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

