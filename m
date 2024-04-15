Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC2C4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5+tUN4C4jg3ZaTthoSN+BkkmuK9D3uVFpoJmF2w3Bw=; b=SStahotqlS/odbJJvbWq4DIQX+
	JJqY0/lnaZjU1Ot5dgnZPCjOWwxifRBjeBDmuBStmNPeXj2Eo2ur/2ig6CL3qu05aW6bserswStU+
	6ID2+gjsCZSHvN6ezK+ktVHmWO0gWXV79Phyw5NSe3Q4P+Tfw7m7hOOOqit9G3Mljqg4iICfpxSaF
	NRfQd46I+y5BOA7rK7VFZOWs+FrViLoInnhlnIai9Zpq46I13S+NzwHEURKFwTKWOfEJnybdHlYGq
	SUy2FJ8n1ymxY3OOBSMXSaUgPki/aAZ6f8jsiw8Jr1DL1fa4S4A7GOY0cnaNc9RBbqiDjjFMy3HY9
	5f+gKQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFFe-000000073sg-1tgd
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 05:51:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFFa-000000073rh-3RVO
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 05:51:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43F3wbcU010411;
	Mon, 15 Apr 2024 05:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=w5+tUN4C4jg3ZaTthoSN+BkkmuK9D3uVFpoJmF2w3Bw=; b=Vg
	6ubj8o8pq/kAvhH0vn60nkhRFiGcGuhNwiISQTQIABHxDofs2C7tdYzfsQf1+IEt
	S2iRpGZ9c9bvPl0TI4vN/lMiqzIqubucpDfasLCYZp+tDnjKnL72hXMVpmcNuR6X
	IIl8F80IfsCkWsHs7Of8j85/+BMcct6LqRuQxW8NYrPuh/pMHzd9JApBTpHGmHj0
	NpdLsK6DmjEr+33GfFgmIW+cdTwecmn7UsFH3N9TgwvTAyYcvDu0ytRGzYaxUEpo
	0TZtbQ/Hs5GNKddj316lEWW9j3BkG5aN8+YRIIHi7RqTQdwYXfSPvN7PhEVhkLQ9
	16bdg5sZPNDEkwoMXCnw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xfkbdjtqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 05:51:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43F5pTGR022710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 05:51:29 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 14 Apr
 2024 22:51:27 -0700
Message-ID: <76ef11b2-c477-ff11-df72-e8d934c00831@quicinc.com>
Date: Mon, 15 Apr 2024 13:51:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 00/10] wifi: ath12k: support suspend/resume
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TuFSr1x7ZQfxrAUHdds4go3yNf-e-xCD
X-Proofpoint-GUID: TuFSr1x7ZQfxrAUHdds4go3yNf-e-xCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_225130_906915_C5FCDCA3 
X-CRM114-Status: GOOD (  17.43  )
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


On 4/13/2024 2:05 AM, Jeff Johnson wrote:
> On 4/11/2024 11:06 PM, Baochen Qiang wrote:
>> Now that the MHI&QRTR patches [1] are merged, we can add
>> suspend/resume support for ath12k.
>>
>> The whole design is quite similar to that in ath11k: firmware
>> is powered down when going to suspend and powered up when
>> resume, this makes hibernation work as well in addition to
>> suspend.
>>
>> To summary, this series first does some preparations in the
>> first 8 patches. Then in patch [9/10] suspend/resume callbacks
>> are implemented. And at last in [10/10] we enable suspend/resume
>> functionality for WCN7850 because it's the only chip supporting
>> it for now.
>>
>> [1] https://lore.kernel.org/linux-wireless/20240305021320.3367-1-quic_bqiang@quicinc.com/
>>
>> Baochen Qiang (10):
>>   wifi: ath12k: rearrange IRQ enable/disable in reset path
>>   wifi: ath12k: remove MHI LOOPBACK channels
>>   wifi: ath12k: do not dump SRNG statistics during resume
>>   wifi: ath12k: fix warning on DMA ring capabilities event
>>   wifi: ath12k: decrease MHI channel buffer length to 8KB
>>   wifi: ath12k: flush all packets before suspend
>>   wifi: ath12k: no need to handle pktlog during suspend/resume
>>   wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
>>   wifi: ath12k: support suspend/resume
>>   wifi: ath12k: change supports_suspend to true for WCN7850
>>
>>  drivers/net/wireless/ath/ath12k/core.c  | 108 ++++++++++++++----------
>>  drivers/net/wireless/ath/ath12k/core.h  |   4 +
>>  drivers/net/wireless/ath/ath12k/dp_rx.c |  48 -----------
>>  drivers/net/wireless/ath/ath12k/dp_rx.h |   2 -
> My Qualcomm Innovation Center copyright checker reports:
> drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2024
Got it.
>
>>  drivers/net/wireless/ath/ath12k/hif.h   |  14 ++-
>>  drivers/net/wireless/ath/ath12k/hw.c    |   2 +-
>>  drivers/net/wireless/ath/ath12k/mac.c   |  28 ++++--
>>  drivers/net/wireless/ath/ath12k/mac.h   |   1 +
>>  drivers/net/wireless/ath/ath12k/mhi.c   |  91 +++++++-------------
>>  drivers/net/wireless/ath/ath12k/mhi.h   |   5 +-
>>  drivers/net/wireless/ath/ath12k/pci.c   |  41 +++++++--
>>  drivers/net/wireless/ath/ath12k/pci.h   |   2 +-
>>  drivers/net/wireless/ath/ath12k/qmi.c   |   3 +-
>>  drivers/net/wireless/ath/ath12k/wmi.c   |   1 +
>>  14 files changed, 175 insertions(+), 175 deletions(-)
>>
>>
>> base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
> patch 6 of this series conflicts with:
> wifi: ath12k: add support to handle beacon miss for WCN7850
>
> So I was not able to take this series into my local verification tree
>
> patch 7 of this series conflicts with:
> wifi: ath12k: fix mac id extraction when MSDU spillover in rx error path
>
> So this conflicts with a patch already in the pending branch
>
> So FYI at some point you'll need to rebase.

So I should rebase after these two patches got merged in master branch?


