Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92457D7495C
	for <ath12k@archiver.kernel.org>; Wed, 30 Oct 2024 04:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Rdo6ulYw0tRvnn2Gcx4YZ8PYC9DH6YfHABu8VFgs04=; b=T+Zh1X3lstGe9e4ahA5bWankQ0
	Rx2RoGa43LOuCgXygMxEEWIPoWyhe3vKdPsUwVcSRuV5sRxpDs0VNxvi6Fouc/vbJXXa9d2Z2Jtlv
	ok0XiJJMurAhXohtgTUymH3FzNefBRWH9et32D62K8ag89cvzAtDPAXmw8Yvpk376KLl0A3tFMwph
	4r1Acf7jsnGLeJRvHS8IzrQdEClxbGubeL9M4Sqrzcfht9ErnaTrnDClOG23o7dkFhjmG0y9EL+5D
	SfEWBcO0bMb0OMBSbHa9VYk9Dw6E8Dc8QSrTt+84uaWnmOlLCk1sVk34vVmE0qi9cO7fE/CPbvsm0
	JKBUfahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zzM-0000000Ge1H-0vNm
	for ath12k@archiver.kernel.org;
	Wed, 30 Oct 2024 04:07:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zxt-0000000Gdqu-0nhh
	for ath12k@lists.infradead.org;
	Wed, 30 Oct 2024 04:05:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEebdZ027398;
	Wed, 30 Oct 2024 04:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Rdo6ulYw0tRvnn2Gcx4YZ8PYC9DH6YfHABu8VFgs04=; b=Pg7M2n1tyW31/7Do
	5Kqjgkr1RJj4WUGMqQIkIRF46/PTxPrO3XH2Dj6b6d32lDtXfWRSOJffuL3iL9M4
	a8CxVQQmpW4rsENusO1/oz0QxXAAggLZzUZh7dGSG5ih/PSiavdxxoPaRbcSBihz
	qt0Qtny3GhwhxVjWMqWaOa6097OnYacJQcTLAZ7DUYeLOyiZwjZfbhP7s3bFpTIj
	3zNfXrVOG6Zw1V7GTMduHFlO6jYUDQLKAA0IXFV30jS49V9enoP+TbhFBR/Bc+Iu
	1b+G84I/uN7CfRLcUtq8HjFInmGcREdK7GcsCDkOSiB19rszfWEswNfx0x8MFr59
	udeNZw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p31vwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 04:05:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U45gbE026513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 04:05:42 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 21:05:40 -0700
Message-ID: <cd19db4a-953d-4230-85b1-695140bb185c@quicinc.com>
Date: Wed, 30 Oct 2024 09:35:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] wifi: ath12k: Refactor sta state machine
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-4-kvalo@kernel.org>
 <a4b92b80-ec57-4db3-acd7-9c6c7644d7c9@quicinc.com>
 <875xpahqc5.fsf@kernel.org>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <875xpahqc5.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3BeXbF90L541wORic7JaI7Qa7sRYVaBd
X-Proofpoint-ORIG-GUID: 3BeXbF90L541wORic7JaI7Qa7sRYVaBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_210549_387949_809D1D2E 
X-CRM114-Status: GOOD (  16.37  )
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

On 10/29/24 21:08, Kalle Valo wrote:
> + aditya
> 
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>>> +static int ath12k_mac_station_unauthorize(struct ath12k *ar,
>>> +					  struct ath12k_link_vif *arvif,
>>> +					  struct ath12k_link_sta *arsta)
>>> +{
>>> +	struct ath12k_peer *peer;
>>> +	int ret;
>>> +
>>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>>> +
>>> +	spin_lock_bh(&ar->ab->base_lock);
>>> +
>>> +	peer = ath12k_peer_find(ar->ab, arvif->vdev_id, arsta->addr);
>>> +	if (peer)
>>> +		peer->is_authorized = false;
>>> +
>>> +	spin_unlock_bh(&ar->ab->base_lock);
>>> +
>>> +	/* Driver should clear the peer keys during mac80211's ref ptr
>>> +	 * gets cleared in __sta_info_destroy_part2 (trans from
>>> +	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC)
>>
>> I'm unable to understand this comment
> 
> Indeed, that's weird. Aditya, do you have any idea what the comment is
> trying to say?
> 

At present, ath12k clear the keys in ath12k_station_disassoc() which 
gets executed in state change from IEEE80211_STA_ASSOC to 
IEEE80211_STA_AUTH.

However, in mac80211, once the station moves from 
IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC itself, the keys are 
deleted. Please see - __sta_info_destroy_part2() -> 
ieee80211_free_sta_keys().

Now, ath12k peer object (struct ath12k_peer) holds the key reference 
from mac80211 (see ath12k_peer::keys[]). Hence, once mac80211 deletes 
the key, driver should not keep a reference to it or else it could lead 
to issues.

Therefore, it is important that the driver should clear the peer keys 
during transition from IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC 
it self since we know that once we return from here, mac80211 is going 
to remove the keys.

ath12k_mac_station_unauthorize() gets called when station moves from 
state IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC hence call to 
ath12k_clear_peer_keys() is moved from ath12k_station_disassoc() to 
ath12k_mac_station_unauthorize().

Is this clear now?

May be the comment in the code could be re-written as below?

/* Driver must clear the keys during the state change from
  * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC, since after
  * returning from here, mac80211 is going to delete the keys
  * in __sta_info_destroy_part2(). This will ensure that the driver does
  * not retain stale key references after mac80211 deletes the keys.
  */

-- 
Aditya


