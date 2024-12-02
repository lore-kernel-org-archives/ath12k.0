Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75082D49793
	for <ath12k@archiver.kernel.org>; Mon,  2 Dec 2024 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtAeZk2MikDau0Y0Dt6u/Ua0pnePXAY8MpzaryhQ138=; b=u7mvaKEG/rtrfgpDr9RldlGIHC
	iY+beLGntECr0OPTVWgi8Da9b5jWc+994ikrv48uQ/vjR7vANT9B9nopsFvzAOuqIIgzkZp3zOI0O
	YccxRaXNEEjOi9kI5xEuws/9cx7q/AxdM00WbFHD5fMvLnGtCGdmyVtLDULqvyiTsTRwBjENY2zhf
	u9xrzAwYzjZm5cKqI5dJub2vl1yWiI9z2wUhT5VrcVXhVUkgoOSznnV/5gipoddarZcxphzz819MM
	9DXjo4+WVw//V31pd5USeKtB98yRIkAxCruIbERK7TRPzlo8ayAoUpO4AN0w3FaEpICgIzwT2wvE+
	SOdG69YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvdb-00000004kt7-0NtG
	for ath12k@archiver.kernel.org;
	Mon, 02 Dec 2024 01:54:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvdY-00000004ksV-3Rl9
	for ath12k@lists.infradead.org;
	Mon, 02 Dec 2024 01:54:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1MlIbJ023063;
	Mon, 2 Dec 2024 01:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DtAeZk2MikDau0Y0Dt6u/Ua0pnePXAY8MpzaryhQ138=; b=kzxW12PIcNSyHOci
	d3Lu813iidRoQPiogaZMDk591mdC+yFj+t8ciQbiH+TsygfhrOcQkb5FIzESTEXs
	3GSarK9uM0kJz0Cs+E8NLvqpRrCY/0E4lA7VoqegBrWOf6vxiTq91IsaepN7IxsA
	BWuNXbilBaPm2yzJKuteSriRZm6HsXccr/uOqgUWOqI6WpDgYL0HvBHPFttwVrTP
	Si5QjbRiz9hoByff0BjcToQEJcudWI5tfccfgcjosSIh2PhorT76A9IyV6oQulW/
	42qFG2rGf6NMQHtJ7RWngPERT8jz+q3u/87/z3J7XDHwo+b9ctvfRUlMqWMJYMKh
	aVlcoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gb3xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 01:54:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B21s1bb007096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 01:54:01 GMT
Received: from [10.253.11.108] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 17:54:00 -0800
Message-ID: <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
Date: Mon, 2 Dec 2024 09:53:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Mihai Moldovan <ionic@ionic.de>, <ath12k@lists.infradead.org>
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1aF7MAM0bbHnxWAgGBTiChwkOECWTkZ7
X-Proofpoint-ORIG-GUID: 1aF7MAM0bbHnxWAgGBTiChwkOECWTkZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_175408_986022_0EC504CF 
X-CRM114-Status: GOOD (  18.73  )
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



On 11/29/2024 8:18 PM, Mihai Moldovan wrote:

> 
> Have you tested this in AP mode or was testing limited to STA mode?
> 

Not yet.

> Even with this patch set, hostapd fails to start on a channel that is 
> disabled in the default regdomain, even if 11d is enabled and a CC 
> specified, even after a CC update is requested and CHANEL_LIST_UPDATE is 
> being received.
> 

What is the probability of failure?


> ---
> 1732881245.637059: wifibe: interface state UNINITIALIZED->COUNTRY_UPDATE
> 
> 1732881245.637268: Previous country code na, new country code DEI
> 1732881245.637283: Continue interface setup after channel list update
> 1732881245.637291: ctrl_iface not configured!
> 1732881245.637318: RTM_NEWLINK: ifi_index=6 ifname=wifibe operstate=0 
> linkmode=0 ifi_family=0 ifi_flags=0x1043 ([UP][RUNNING])
> 1732881245.637371: RTM_NEWLINK: ifi_index=6 ifname=wifibe operstate=2 
> linkmode=0 ifi_family=0 ifi_flags=0x1003 ([UP])
> 1732881245.637404: RTM_NEWLINK: ifi_index=6 ifname=wifibe operstate=2 
> linkmode=0 master=5 ifi_family=0 ifi_flags=0x1003 ([UP])
> 1732881245.637434: RTM_NEWLINK: ifi_index=6 ifname=wifibe operstate=2 
> linkmode=0 master=5 ifi_family=0 ifi_flags=0x1003 ([UP])
> 1732881245.637464: RTM_NEWLINK: ifi_index=6 ifname=wifibe master=5 
> operstate=2 ifi_family=7 ifi_flags=0x1003 ([UP])
> 1732881245.637505: nl80211: Add ifindex 5 for bridge brvswitch
> 1732881245.637514: nl80211: Add own interface ifindex 5 (ifidx_reason 6)
> 1732881245.637521: nl80211: ifindex 5 already in the list
> 1732881245.637540: nl80211: Event message available
> 1732881245.637563: nl80211: Drv Event 36 (NL80211_CMD_REG_CHANGE) 
> received for wifibe
> 1732881245.637574: nl80211: Regulatory domain change
> 1732881245.637580:  * initiator=1
> 1732881245.637590:  * type=0
> 1732881245.637595:  * alpha2=DE
> 1732881245.637609: wifibe: Event CHANNEL_LIST_CHANGED (27) received
> 
> 1732881245.637619: Channel list updated - continue setup
> 
> 1732881245.638475: nl80211: Regulatory information - country=na
> 1732881245.638499: nl80211: 2402-2472 @ 40 MHz 20 mBm
> 1732881245.638512: nl80211: 2457-2482 @ 20 MHz 20 mBm (no IR)
> [...]
> ---
> 
> Interestingly, iw reg get shows the new CC/regdomain after hostapd 
> terminates, so I suspect a race condition:
> 
> ---
> phy#0 (self-managed)
> country DE: DFS-ETSI
> ---
> 
> Starting hostapd again after it failed the first time around works, 
> since the CC + regdomain are correctly updated by that time.
> 
> 
> You recently re-submitted a patch set for ath11k by Wen Gong[0] that is 
> supposed to fix a race condition during reg updates and this smells like 
> the same issue. I'll try to port it to ath12k on top of this patch set 
> to see if it fixes this issue.
> 
> 

Thanks for trying, currently, i'm occupied by other tasks...

> 
> Mihai
> 
> 
> 
> [0] https://lore.kernel.org/ath11k/20241129070714.226-1- 
> quic_kangyang@quicinc.com


