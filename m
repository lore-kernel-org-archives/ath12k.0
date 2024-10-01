Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4CCE7CE1
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1L6zDyJJ5aRxsDPMlRN5N+LdZjElwdZMnDh218SWhU=; b=lsnLl/FAU9yppv6zmRoe3LYhpR
	RYN4TmMfR602IZkceFeQZFfNNzD0sKkkiGVo6i0Y7hQTWXI5ZMlrSdcMKX/vtFmZUn5u2rJhQGeGd
	snokOCiIh0IXAh2wBl5QLcf9W3RbVQB42qGYXKIcLSAvsl7E3hXgkSfyEhqVcK7GRVSaKTAE31kH8
	SpyN6uxFKeDEZZFAXHUyGv1G0yNf2uzwz/c7cQsdIVfvrzgy6inynuHxpoNUrxJLLwzlo5LS31Bfj
	V/PgxqWKp+FzV5UbhWkZ9++sgTV9RNOJNVnRSDn/yqVuwdd3SJO8mOiqObxo16itoYMo7J56IDVLj
	PweQU+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXS3-00000001ut6-3Qe1
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 07:37:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXS1-00000001usT-0a9i
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 07:37:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4911Qi7B001965;
	Tue, 1 Oct 2024 07:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1L6zDyJJ5aRxsDPMlRN5N+LdZjElwdZMnDh218SWhU=; b=a5IPkuJXez6QWsPt
	AkO7H6wwkGIxhMM21hGbbsTMs/WiO6CNoPw9Vh5W/BVr71UXC+a4ezy32RL61m6W
	l3L3JWdwlmltHsn6B006dByrL6JhM5cM6gOQRI/zwd4uQew/eWQHiy30S2rzny49
	CWUcu7fk9tUkJJUK1pC1ow35EMD3AYw2kx+lS77vzbLm40WPQjmcbpuaGh9vW7d6
	1JGebOFENQLAkqFNH1dic5bZBclggWpoo14SQVaABcnKjENlSiX51bcC2nYECYy8
	pMt/48c4Wuir/tQ8SQqa+iGgMV2bLtSb+KlR+Gk1JuzA2pWHMpfgiItQrqp04uns
	/Wk2fA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x7ge7jyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 07:37:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4917bdov029736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 07:37:39 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 00:37:37 -0700
Message-ID: <5fe9fdf2-ae5c-4d15-a095-0203a814e4ba@quicinc.com>
Date: Tue, 1 Oct 2024 13:07:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
 <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
 <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PQJwDVaSsyHlzYqx2dKvA8WamPyLlSsg
X-Proofpoint-GUID: PQJwDVaSsyHlzYqx2dKvA8WamPyLlSsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_003741_219093_52379FB4 
X-CRM114-Status: GOOD (  16.41  )
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

On 10/1/24 12:52, Johannes Berg wrote:
> But that doesn't explain the*comment*, which literally says:
> 
>     inform about the link info changed parameters after all stations are
>     also added
> 
> but you
>   (a) don't add stations here
>   (b) if you're thinking about link stations, the link stations are
>       only added_after_  this comment and the link info change ...
> 

Oops! my bad. Previously I was thinking like this -

First iterate and do only _ieee80211_link_use_channel() this part. Then 
let the flow as usual and after stations are added, do the 
link_info_changed() part.


> 
>> Later, in the loop for_each_set_bit(link_id, &add,
>> IEEE80211_MLD_MAX_NUM_LINKS), channels are added. At this stage, the
>> driver will actually create the link on the interface at its own level.
>> Since here using the channel information, appropriate firmware can be
>> picked. For example 2 GHz or 5 GHz or 6 GHz firmware.
> Picking "firmware" sounds very odd here, I'd say you mean "which device
> to pick"?

:) Yeah.

> 
>> hmm... yeah true that. May be I will move this once the old links are
>> removed?
>>
> I'd think at least that?
> 
> But also this seems to break out driver for other reasons, because it
> initializes rate control somewhere here and needs a station for that.
> Didn't look deeply into that yet though.

Okay so doing as I said above could work -

if (add) {
	...
}

for_each_set_bit(link_id, &rem, ..) {
	...
}

for_each_set_bit(link_id, &add ...) {
	_ieee80211_link_use_channel()
}

list_for_each_entry(sta, &local->sta_list, list) {
	...
}

...

for_each_set_bit(link_id, &add ....) {
	now call
	ieee80211_mgd_set_link_qos_params()
	ieee80211_link_info_change_notify()
}

...


At least I tried both of these ways in hwsim. I dont see any failures. 
Hence I thought why not move whole for loop to top instead.


-- 
Aditya


