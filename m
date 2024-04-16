Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022CC4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfxBhNcHTp6rosHCfxl1lr6W6uZBHS1zFih12ed4yso=; b=Y39x8hjMQ8WfKS+29ictWxFVoE
	nsJLYU963FfsjzZ6HSn687ylmvTupCUB/XwoN4F+p2rKCPLLAMj6vzvSoHbGKr6gfojwEuRyDgDXn
	kMLlNXGyKWdPoG6fG76y55PoWpGW0pUfKeAFl56/rUzfMPQ49JpbvJy0vSv8H/SibPqE/8JVWYzwU
	seiGj3DspiYNbJQJASjaeUTbn+fhMiM88PT8lGEr3UtAF4VlULPclARImdseizYGf+F1fpOw/54f9
	PxFbW8hWENheVKKPl025ISjVBaTTp6aK8tRm4tv4xgR/Ue0x6/vQOaJBiklmcGpNJxqNF7St6sNmf
	BYmsdyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwYcx-0000000AYOc-2D0l
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 02:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwYct-0000000AYNw-35wS
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 02:32:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FNlXlc011240;
	Tue, 16 Apr 2024 02:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JfxBhNcHTp6rosHCfxl1lr6W6uZBHS1zFih12ed4yso=; b=os
	Ey2wogRQuP4rAaBju+KbijsxMPbChBuqyGCrgRXJ9RUvCUFovRG4Ms9hGJ9kO1Qs
	wyUwAw7V4lwtwEOUUOPxHyalwbucKzzDO93bXv9spITXgbQ+KU9/uIgIDIMqzSYv
	NDG+eLewf5SqV+Te2o5FzOn+5RRxuq2Aau4ieAXy//1/q8jyG92/yjb315obuU1Q
	BCtQsnTP7vInXdKTE9uohDAyF8iiVMoIQkrB1gPCUt94oehtPTzI5dNFFkZ/rVcR
	9i6p9RqjikpM8RD4uke0Ur+B4NRQ3d48qEtG7l91LY59gCJndZ4YI16xmaW1nE0y
	JPHRHi/nm7oZpAgUX4Nw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xh5jx9fa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 02:32:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43G2Wmew004565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 02:32:48 GMT
Received: from [10.110.8.16] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Apr
 2024 19:32:47 -0700
Message-ID: <4658e8e9-9720-4622-9cd1-03faf790ea21@quicinc.com>
Date: Tue, 16 Apr 2024 10:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] wifi: ath12k: report station mode stats
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240414131008.71519-1-quic_lingbok@quicinc.com>
 <3103b7cf-fa1a-4bfc-ad78-301965b72035@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <3103b7cf-fa1a-4bfc-ad78-301965b72035@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ri2_7CtGdfN1OFgsnvHK_2Yj8P0iGCVl
X-Proofpoint-ORIG-GUID: Ri2_7CtGdfN1OFgsnvHK_2Yj8P0iGCVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_01,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_193252_263081_E390BE4E 
X-CRM114-Status: GOOD (  10.52  )
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



On 2024/4/16 0:51, Jeff Johnson wrote:
> On 4/14/2024 6:10 AM, Lingbo Kong wrote:
>> Currently, the transmit rate, the receive rate and signal strength of
>> “iw dev xxx station dump” always show an invalid value.
>>
>> This is because ath12k has no logic to handle this relevant information.
>>
>> To solve this issue, ath12k parses the information passed by the firmware
>> and passes it to mac80211.
>>
>> After that, "iw dev xxx station dump" show the correct value.
>> Such as:
>>
>> Station 00:03:7f:12:03:03 (on wlo1)
>>          inactive time:  600 ms
>>          rx bytes:       4642228
>>          rx packets:     23796
>>          tx bytes:       933967
>>          tx packets:     8761
>>          tx retries:     66
>>          tx failed:      0
>>          beacon loss:    0
>>          beacon rx:      8925
>>          rx drop misc:   191
>>          signal:         -20 dBm
>>          beacon signal avg:      -18 dBm
>>          tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>>          tx duration:    0 us
>>          rx bitrate:     1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
>>          rx duration:    0 us
>>
>> v3:
>> 1.change wmi_vdev_stats_event to wmi_vdev_stats_params
>>
>> v2:
>> 1.change copyright
>> 2.change name according Naming conventions for structures
>>
>> Lingbo Kong (3):
>>    wifi: ath12k: report station mode transmit rate
>>    wifi: ath12k: report station mode receive rate for IEEE 802.11be
>>    wifi: ath12k: report station mode signal strength
>>
>>   drivers/net/wireless/ath/ath12k/core.h    |   5 +
>>   drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 ++-
>>   drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
> 
> My Qualcomm Innovation Center copyright checker reports:
> drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2024
> 
> However note that "wifi: ath12k: support suspend/resume" is modifying the same
> file, so if you rebase on that you'll pick up the copyright change
> 

Ok, thanks for pointing out.

Best regards
Lingbo Kong

>>   drivers/net/wireless/ath/ath12k/dp_tx.c   | 147 +++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/hal_tx.h  |   9 +-
>>   drivers/net/wireless/ath/ath12k/mac.c     | 180 +++++++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/mac.h     |   3 +
>>   drivers/net/wireless/ath/ath12k/rx_desc.h |   2 +
>>   drivers/net/wireless/ath/ath12k/wmi.c     | 130 ++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++
>>   10 files changed, 538 insertions(+), 9 deletions(-)
> 

