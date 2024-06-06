Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50813C27C52
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhZ1b1O39oD34yksHyaU4sQjHdDBGycMhRm7Rczsnxk=; b=j7s8XvbIiM+d0d9Cj0+Eh8F5+6
	hGPYEieeMhK+wQLcjSX3tdNY0kZQpn0KzrOZ0kGjABbw/SQfD5hGqGboyQ7M0diEm4FVkfghZ5Gka
	A+sDsw6FarjAtt+69j6KLcmF/2weV8WR7Mn9o98ZlPdb6pntElNR/Trge7w5jGueliR4sdI5h0VDn
	me2WRqpShbaaljHd0UVAj8/p+yDvcNHkWsblDLzvS34of3d0SqRE/h7SROLcKAhTpufe28IaYL7ON
	J++stIT6dtcER2YaVlAHt1OC5yRMxkFQ7762mKqBhk6RrYb48m8c+7cZBw0FvdyCmJXGswRlKdNQ6
	nfquXgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9up-00000009JL1-4ARH
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 10:00:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9un-00000009JJn-0Hiw
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 10:00:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4569niVf007052;
	Thu, 6 Jun 2024 10:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhZ1b1O39oD34yksHyaU4sQjHdDBGycMhRm7Rczsnxk=; b=Yz7rh6KT76ANWPpx
	z92vHR/PcD/bJWEWvXA5ZO28JXqToImt1Pwf72UZq2mAPCAKR/pHzZFKsJ3jNfeJ
	HOGjxLqPToFdy1jAc3asKUz0Aow8Twar9+9dOoW2UE1Ceq9Q92g3jJz49xRX8gNn
	kkWBdFAhY4Lf9pH35Q/JRn0BHwlntlsmC6a449Fhkl9YFb8BuRx7mpfYfecdyotG
	2bGsAG47KmHbAqGbTyU6oFOHyz2jaTY74V7J6W+0aco3L5iFeuLIE4i2sMpJ21zu
	aFxbKZoOq7Rf39Kbrt33HpmPIrr4p2yC4KRNl0kkmAXbc5YJ4ZyyVfo3J0lopOWK
	NSjiIg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7urcn54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 10:00:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456A09I3014072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 10:00:09 GMT
Received: from [10.216.0.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 03:00:07 -0700
Message-ID: <f751d310-4cbb-4562-947b-a0a76edb6b40@quicinc.com>
Date: Thu, 6 Jun 2024 15:30:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/7] cfg80211/mac80211: support defining multiple radios
 per wiphy
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <cover.c104c0bb3a14f4ac26aee71f4979846f6ad87742.1717611760.git-series.nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2G8BjylzToG8y2fxyyO1N61N1o5phNUM
X-Proofpoint-GUID: 2G8BjylzToG8y2fxyyO1N61N1o5phNUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=731
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406060073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_030013_429820_89E6422A 
X-CRM114-Status: GOOD (  15.66  )
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

On 6/6/24 00:01, Felix Fietkau wrote:
> The prerequisite for MLO support in cfg80211/mac80211 is that all the links
> participating in MLO must be from the same wiphy/ieee80211_hw. To meet this
> expectation, some drivers may need to group multiple discrete hardware each
> acting as a link in MLO under single wiphy.
> 
> With this series, the bands and supported frequencies of each individual
> radio are reported to user space. This allows user space to figure out the
> limitations of what combination of channels can be used concurrently.
> 
> Each mac80211 channel context is assigned to a radio based on radio specific
> frequency ranges and interface combinations.
> 
> This is loosely based on Karthikeyan Periyasamy's series
> "[PATCH 00/13] wifi: Add multi physical hardware iface combination support"
> with some differences:
> 
>   - a struct wiphy_radio is defined, which holds the frequency ranges and
>     a full struct ieee80211_iface_combination array
>   - a channel context is explicitly assigned to a radio when created
>   - both global and per-radio interface combination limits are checked
>     and enforced on channel context assignment
> 
> Changes since RFC:
>   - replace static per-radio number of channels limit with full ifcomb
>     checks
>   - remove band bitmask in favor of only using freq ranges

What about handling 2 GHz + 5 GHz issue we discussed in v1 related to 
radar detection width and num chan ctx? Is that taken care?

