Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46355CD128A
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 06:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wfZ8rzLe2A5JyPkL2g/V330bdgr7WTFR55jMBA7TEA=; b=e/b0cJKYQmPG1jhzA45ml09u7U
	12PjXJ/Ei73879XbTGggHo/5gI7RVt5gqK1ltoWGUkZN2F2JgNB4XytjIKGe0CqX9zhFLeFSxXmPh
	ySWWWJI2RmVVlHLAD9utA1oYglNjHQvh6uKAhGoWOlfDFW5Xo65E0T66qtL3HEw4fAYYwhpTSrcfH
	0aDpRMjVIpdholuEKUpdtf6sIixCO0JPcOyEO3kbe8P8tqD6Wqk03luWkfo5H7dBqarzRuKUTgyam
	N3vLMEF6D8VIuNKAUMCx5/w4ydknO+nSYdQehQBiGA0rSSYpN8CSiBDDc5tgx1kIMaTJEL30vE2JS
	yb6A/5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiCj-0000000EThe-3em7
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 06:10:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtiCh-0000000ETgr-3ClE
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 06:10:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4385iWJm010956;
	Mon, 8 Apr 2024 06:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0wfZ8rzLe2A5JyPkL2g/V330bdgr7WTFR55jMBA7TEA=; b=fp
	3mxkvy377shkTe6NqhDMyK8VQqsTLdPM4AcSZyOlhowD1hcEBxdwWY54maPbd479
	hL/4i7AVefRc9ktsQAcjFcCo11fMlFe6UaEZM9uSUjplXguFJzYYdAuu3XFqZo4+
	ttDy6GKUlROsxRhiU8h7BE0+46L9lgi8bRxkIYKAgDLP3lQOhFzU0gNE7SvcztOx
	x9IefMdIGoSFK7DUMZTVOGHAqQpW1ZNyhMvBytW31rcV8R29dAx2nyYNC5N+UviV
	eq9ofk/6Sam81bcRmZCVPEXD6feww9YiGnhvTlQFi/0r3dNLXgpQlzVZWFdqBT4b
	SXUNAVac47dJorC/NuhA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xc79vgb4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 06:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4386A1uO012228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 06:10:01 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 7 Apr 2024
 23:10:00 -0700
Message-ID: <73d44b87-57d1-4737-b6ff-c312a6b64852@quicinc.com>
Date: Mon, 8 Apr 2024 14:09:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 disconnects and reconnects in a loop
To: Gregoire Stein <gregoire.s93@live.fr>, <ath12k@lists.infradead.org>
References: <adf6e7df-11c7-4692-ab8d-d53eb5675045@quicinc.com>
 <AS8P190MB12056A9DFE1C0A1C6BB12EBB873C2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <AS8P190MB12056A9DFE1C0A1C6BB12EBB873C2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 26iqS3EBcr3X53hn5-WjS9jr_Kc5qCI1
X-Proofpoint-ORIG-GUID: 26iqS3EBcr3X53hn5-WjS9jr_Kc5qCI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_04,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=965
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_231003_854118_B8BFE5FF 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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



On 4/4/2024 11:41 PM, Gregoire Stein wrote:
> Hello,
> now i'm on the last commit of master-pending 
> (6.9.0-rc2-wt-ath-1-mainline-g853450ce5ca0)
> here are the various logs you asked for: 
> https://gist.github.com/GreyXor/927e7871e70630beabb522aeddc5891e

Thanks for the logs.

 From dmesg and NetworkManager logs, connection and EAPOL frames are 
good, but DHCP transaction fails. IWD logs show 'Del Station' event 
received after EAPOL is done. So guessing 3rd party triggers 'Del 
Station' due to some unkown reasons (DHCP session failed?).

In order to know who triggers 'Del Station', could you help reproduce 
this issue and collect mac80211/cfg80211 trace?

Below steps for your consideration:

1. enable tracing on mac80211/cfg80211
	# echo 1 > /sys/kernel/debug/tracing/events/cfg80211/enable
	# echo 1 > /sys/kernel/debug/tracing/events/mac80211/enable

2. recording trace to local file
	# cat /sys/kernel/debug/tracing/trace_pipe > trace.log

3. reproduce this issue

4. share full/verbose kernel/ath12k/IWD/NetworkManager logs, just like 
before, and trace log to us. Air sniffer logs are useful as well if 
possible.

> There are iwd, networkmanager and dmesg
> iwd is launched with -d and the ath12k module with the debug flag
> thanks
> 
And one more question, is this issue specific to AP? could you try other 
APs or could you try other client with this same AP? We can do 
comparison to narrow down.



