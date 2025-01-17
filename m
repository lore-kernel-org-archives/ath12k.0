Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B808AC02185
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 04:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E89dybjaPA3cOgxUl+Lo8Spm50soae98tpHODi5GOk=; b=JjzyLUwzutQV/XLYovu7Fw4CHf
	gZWavmItj2+QR3sWYJDEQpFJQwDKOfAlJF8FMkWDF3FTrV/OMnIiT2fK97NF4ptXHmIciJxvnjjnQ
	5NwcApBjwWTUBpy7NmIktNUzjXG1VeQC9j+eL5EiSsuCgUxt59i/V9VIc5w4evfa6NnUdKcYID0Jk
	2BHEM3XsfOWHpvpkzyJ6edOMhc0RYqfR0rS+VapS49gl9txCLNz1YAf6wiP4pPm2TK3IZzCk6nw9m
	RfutysrZpwH5sM1oS9WKiXt1++FM7myefStQQPBXC6cTzNJ8ImoySdy0zgokwyGlw0+AOpRJ/50tw
	rEK2h7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYe6q-0000000Gzrq-27eW
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 04:37:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYe6n-0000000GzqK-3Gk5
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 04:37:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKx9WL029080;
	Fri, 17 Jan 2025 04:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8E89dybjaPA3cOgxUl+Lo8Spm50soae98tpHODi5GOk=; b=B9RbpC960L1+ePhl
	5JwMruI8iyRNtRNLsP6XHQBCaffOENMrMRYdRmrOBQjhhR6dYY/v2aBaS8+52IBL
	8hY5Ad1y12AvwUciN0u+uXL4pKDY8RiOiF0GP49QRO/3qWWBdosCRqiTjYAuyAk7
	zgF4hlAk6bjqAop4wjRmhp6o6pLVnjb5c44vQA01YzAfKm/EwNj0TGxvRWJ0kndD
	m82m3fejc/6Q+TDW8EO5/J8FEdMjk5Ra0zSGorUFTd50QLwy04b7ZA8aR8005UT1
	JBo4A5P9joKExM7U7sF47o9rGRpOKJTD16tkSNoX/92IHFKadKypTy9PUFMdUDpc
	upOQWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4479mf8sfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:37:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H4bM05018643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 04:37:22 GMT
Received: from [10.216.26.179] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 20:37:18 -0800
Message-ID: <d9181c82-ffb1-e8de-c5c6-f58b73f9291f@quicinc.com>
Date: Fri, 17 Jan 2025 10:07:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gu27F9BVXJUP77n_dTSJzx82_00iJmOd
X-Proofpoint-ORIG-GUID: gu27F9BVXJUP77n_dTSJzx82_00iJmOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_203725_942552_3EA6B913 
X-CRM114-Status: GOOD (  16.03  )
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



On 1/15/2025 11:25 PM, Nicolas Escande wrote:
> On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
>> Currently, monitor interface not supported. Therefore, add the missed TLV
>> tags parsing in the monitor parser, configure the monitor vdev state
>> identifier with HTT filter setup.
>>
>> Depends-On:
>> 	[PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
>> 	https://lore.kernel.org/all/20241224143613.164921-1-quic_periyasa@quicinc.com/
>>
>> 	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
>> 	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quicinc.com/
>>
>> 	[PATCH v2 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs support
>> 	https://lore.kernel.org/all/20241224161442.263729-1-quic_periyasa@quicinc.com/
>>
>> Hari Chandrakanthan (1):
>>    wifi: ath12k: fix link valid field initialization in the monitor Rx
>>
>> Karthikeyan Periyasamy (1):
>>    wifi: ath12k: Replace band define G with GHZ where appropriate
>>
>> P Praneesh (5):
>>    wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
>>    wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
>>    wifi: ath12k: change the status update in the monitor Rx
>>    wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
>>    wifi: ath12k: add monitor interface support on QCN9274
>>
> [...]
> 
> Hello,
> 
> There might be something wrong with this series.
> 
> I applied it on top of ath-pending-202501150104 + the "ath12k: Add peer extended
> Rx statistics debugfs support" and now 'iw dev wlan0 station dump' shows me
> that the RSSI value seems to not be updated anymore after I stop a monitor
> interface on the same phy.
> 
> Steps to reproduce:
> iw phy phy0 interface add mon0 type monitor
> ip link set mon0 up
> # then just for 1 sec but it might not be usefull at all
> tcpdump -nepi mon0
> ip link set mon0 down
> watch -n1 iw dev wlan0 station dump
> # 'signal' seems to not be updating anymore, maybe some other fields too ?
> 

Not able to find the wlan0 interface details from the above steps ?


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

