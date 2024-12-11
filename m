Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CEAE77180
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 04:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U/u+vpPVj8dah+3GtxLkG1w6Oqc7y2qL+GFzHEN8GQ=; b=TV/0UtM8qRyivqYxxjmuYuXBGu
	8ieTWmtCIEiVwNwAsiiOQHPW7nK+Slm4l/7B9v1xkEHNIbjuPycav3CTWc/mN5qdxwFtyvjlpdSJM
	k2yAiNcVKGicaIZeRCpQL/PlZT4ndjscw/YGNNMMQ9bgzBHdJ9f4fMamkBTkwYinmWNVVkNESF41/
	wapXkgy8fi5+Ya9ynP/BvihdlEJDyQ5vBNJuq51lABB83wtzeN6FYVeImkdCMfRBuByI2mGUWerPI
	Xv/TfsNptvvD4mViUhFDJ0P3dLSkPlogk59chrGif490wmVJjakb82BNpNCcD5gjCuKvOe8UAmsAE
	mnIXqoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLEOv-0000000Dkvm-2BRR
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 04:32:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLEOs-0000000Dkv1-1jLU
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 04:32:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB2OrCC001564;
	Wed, 11 Dec 2024 04:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9U/u+vpPVj8dah+3GtxLkG1w6Oqc7y2qL+GFzHEN8GQ=; b=eXzt9wMhzvkg0Zef
	/fQGdASQ8zf2LuhYJ+GDOi4eqJzBy7bRkSI7IepW76opY0/QC4w57LaHFwD3nT1d
	5oqlXn5CD5IvOQeQkxdwT6xk/TqOtCZ8Caa8O+M6WmJQ3dXp5Xo19p8qvTIw8TE+
	KhQe436xyTxR4ry7Qkmj2d87wGIOiVnSNDeDCKQuz5wfMGtCwbMXN8kdX4W5jOis
	graBaW+lUab2IYYFdAsVJpnbap7sMcXc17N24yHuxssWo5j25WgEKeG+7wRcHF7B
	Kd2hzAv8GnW9QXnMgc3ZID/kdCZzeYjL0ZJrvokZ/bXgaK3ioLaDZF+FBeViZROH
	cefR0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f1xd0ahv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 04:32:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB4WWmb014356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 04:32:32 GMT
Received: from [10.253.11.142] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 20:32:31 -0800
Message-ID: <43036212-8411-45e5-b9fe-017ee9f0b990@quicinc.com>
Date: Wed, 11 Dec 2024 12:32:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Mihai Moldovan <ionic@ionic.de>, <ath12k@lists.infradead.org>
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
 <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 18eJFRMi37KI15PAR6ma9A8svZsu56Lp
X-Proofpoint-GUID: 18eJFRMi37KI15PAR6ma9A8svZsu56Lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_203238_578233_54E96ACF 
X-CRM114-Status: GOOD (  30.17  )
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



On 12/2/2024 4:47 PM, Mihai Moldovan wrote:
> * On 12/2/24 02:53, Kang Yang wrote:
>> On 11/29/2024 8:18 PM, Mihai Moldovan wrote:
>>> Have you tested this in AP mode or was testing limited to STA mode?
>>
>> Not yet.
> 
> Okay, so a useful heads-up, I guess!
> 
> 
>>> Even with this patch set, hostapd fails to start on a channel that is
>>> disabled in the default regdomain, even if 11d is enabled and a CC
>>> specified, even after a CC update is requested and CHANEL_LIST_UPDATE is
>>> being received.
>>>
>>
>> What is the probability of failure?
> 
> In my tests, 100 % reproducible, but I admit I haven't stress-tested it.
> 
> It always fails the first time hostapd is started if the default rules 
> define NO_IR on the channel you want to use (even if CC rules disagree) 
> and can also easily be reproduced by, e.g., using channel 100 with 
> hostapd and setting CC for instance to DE or US in the hostapd config file:
> 

root@NUC8:/home/yk/Desktop/sigma-script# wls1: interface state 
UNINITIALIZED->COUNTRY_UPDATE
Frequency 5500 (primary) not allowed for AP mode, flags: 0x100959 RADAR
Primary frequency not allowed
wls1: IEEE 802.11 Configured channel (100) or frequency (5500) 
(secondary_channel=0) not found from the channel list of the current 
mode (2) IEEE 802.11a

Don't know how you test with channel 100, it's a DFS channel.
Can you show me your whole hostapd.conf?


> # Chinese regulatory does not allow operation on channels 96 to 128.
> iw reg set CN; hostapd ... => fails
> iw reg set DE; hostapd ... => works
> 
my steps:
rmmod ath12k
insmod ath12k
iw reg set CN
hostapd...

> Luckily it's really easy to reproduce.
> 
> 
> hostapd is special in the sense that it's using netlink directly and 
> this is probably very fast.
> 
> I was never able to reproduce the issue with iw reg set CN; iw reg set 
> DE; iw list, but I don't find that surprising due to all the overhead 
> and highly different code path.
> 
> 
>>> You recently re-submitted a patch set for ath11k by Wen Gong[0] that is
>>> supposed to fix a race condition during reg updates and this smells like
>>> the same issue. I'll try to port it to ath12k on top of this patch set
>>> to see if it fixes this issue.
>>>
>>>
>>
>> Thanks for trying, currently, i'm occupied by other tasks...
> 
> All good.
> 
> If and when you try, another heads-up: ath12k is currently running into 
> an rtln deadlock quite often (but not always) when hostapd is stopped 
> (or fails) because that's also bringing the interface down.
> 
> Fortunately, Baochen Qiang ported the fix for this issue from ath11k to 
> ath12k[0], but it wasn't applied to ath-next or main yet, so you will 
> likely see a very irritating deadlock requiring a hard machine reset if 
> you don't also use his patch when testing.
> 
> His patch, apart from fixing the deadlock, also ports some parts of the 
> ath11k patch set I mentioned in my previous mail, but unfortunately 
> doesn't fix the chan list update race I'm seeing.
> 
> I'll dig further into it and hope to come up with something usable in 
> the next few days.
> 
> 
> 
> Mihai
> 
> 
> [0] https://lore.kernel.org/ath12k/20240830023901.204746-1- 
> quic_bqiang@quicinc.com/


