Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A777C30653
	for <ath12k@archiver.kernel.org>; Thu,  4 Jul 2024 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMWuoFQwbU1BG74aga67MsrRmSrjD0PN9R9Fz1l3bhc=; b=w9E9DcFxbB2fgNoSJGcY4dOH48
	R861ECxy2/pW5TBUPX5xlJBkCAWzeVu2oSdMSAr6iJDkV7l/ThpfAwQ2yN+oxE+j1XP9OdVjkEOQq
	xT1djxO+QS4LogqnOvJO2eG7+JsMItdJGmHHMHe7UXW/rBY7g4nv61emV3SN7xrjJ6XyN2auYNxqj
	bcGkGpEBNPFFSmObCp9NUds4eMrVBhfNDNFvaG63AkYxlplY1AeEOpHcNPNHEPLHpARTH+RQXF7P7
	MtaEluxSDOpAVrmTmh7/aIxErC9wZ1TsVIFSGu8VQ1yy+IKP17XSNZyPgDbq/x4kR/pAkiv9IAgMA
	aUIPW7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFbf-0000000CIE9-0G1E
	for ath12k@archiver.kernel.org;
	Thu, 04 Jul 2024 06:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFbc-0000000CIDS-2DL8
	for ath12k@lists.infradead.org;
	Thu, 04 Jul 2024 06:06:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46462sZX011027;
	Thu, 4 Jul 2024 06:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMWuoFQwbU1BG74aga67MsrRmSrjD0PN9R9Fz1l3bhc=; b=b9m1TK0f4crqjh6T
	8uc4pN9O82rslEAUyutdgCafEHbTG+S927VUkNY2H2BDSlE0s2ehKa8wfO7p9n5r
	DdTsJTZ9+v9K/1KLteGKVfCTCB3F7fp4+ehB8Bi5JaNM0HsoubfB5hyCJh057pzJ
	kKf8rc/EzYfizEbcYBJBkn/tbwgcGxqdQhRxxQ93goxYcwGim10ohpgIK9Ea7Q0y
	Bk2oj8a7aMZZ2iYsJZs+nKQ2cSjvTOoePRTunA2SRQt9cAD7EU9JnwwBjr/QXWhE
	w18k2rR6fkkMN6gq6vCbdJxvAp/xDnvxWd2G/PFy9uv7A4jr4SAJcUR9o6J4oDwX
	QE/GMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr9aufb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 06:06:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464662X3028115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 06:06:02 GMT
Received: from [10.38.245.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 23:06:00 -0700
Message-ID: <3085cd30-cc71-4eed-ae68-07ce64e45405@quicinc.com>
Date: Thu, 4 Jul 2024 14:05:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
 <20240419032122.7009-2-quic_lingbok@quicinc.com> <87bk5xs7qj.fsf@kernel.org>
 <050ae0d4-c879-40c2-b2ac-1766aaa2c789@quicinc.com>
 <87v844qsih.fsf@kernel.org>
 <4fdfdb34-7892-4bf9-8da1-e09cf6ff7731@quicinc.com>
 <e28947fe-c0a7-4445-9e02-7224f733553b@quicinc.com>
Content-Language: en-US
In-Reply-To: <e28947fe-c0a7-4445-9e02-7224f733553b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pl0JoMPxEhMT8v4Tas9GQshqLhykfa0a
X-Proofpoint-ORIG-GUID: Pl0JoMPxEhMT8v4Tas9GQshqLhykfa0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=760 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_230608_599374_BF4A4AF3 
X-CRM114-Status: GOOD (  21.17  )
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



On 2024/6/17 19:50, Lingbo Kong wrote:
> 
> 
> On 2024/6/5 14:31, Lingbo Kong wrote:
>>
>>
>> On 2024/4/26 19:21, Kalle Valo wrote:
>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>
>>>> On 2024/4/26 0:54, Kalle Valo wrote:
>>>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>>>
>>>>>> +static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct
>>>>>> hal_tx_status *ts)
>>>>>> +{
>>>>>> +    struct ath12k_base *ab = ar->ab;
>>>>>> +    struct ath12k_peer *peer;
>>>>>> +    struct ath12k_sta *arsta;
>>>>>> +    struct ieee80211_sta *sta;
>>>>>> +    u16 rate;
>>>>>> +    u8 rate_idx = 0;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    spin_lock_bh(&ab->base_lock);
>>>>>
>>>>> Did you analyse how this function, and especially taking the
>>>>> base_lock,
>>>>> affects performance?
>>>>
>>>> The base_lock is used here because of the need to look for peers based
>>>> on the ts->peer_id when calling ath12k_peer_find_by_id() function,
>>>> which i think might affect performance.
>>>>
>>>> Do i need to run a throughput test?
>>>
>>> Ok, so to answer my question: no, you didn't do any performance
>>> analysis. Throughput test might not be enough, for example the driver
>>> can be used on slower systems and running the test on a fast CPU might
>>> not reveal any problem. A proper analysis would be much better.
>>>
>>
>> Hi, kalle,
>> I did a simple performance analysis of the 
>> ath12k_dp_tx_update_txcompl() function on slower systems.
>>
>> Firstly, i use perf tool to set dynamic tracepoints in 
>> ath12k_dp_tx_complete_msdu() function, and then used the command of 
>> "iperf -c ip address -w 4M -n 1G -i 1" to do traffic test.
>>
>> During this process, use ./perf record -a -g to detect the performace 
>> of the system.
>>
>> Finally, compare the results with and without this patch.
>>
>> without this patch
>> ./perf report output
>> children    self    command        symbol
>> 7.28%       0.08%      ksoftirqd/0 ath12k_dp_tx_complete_msdu
>> 5.96%      0.03%      swapper     ath12k_dp_tx_complete_msdu
>>
>> iperf output
>> [  1] 0.0000-62.6712 sec  1.00 GBytes   137 Mbits/sec
>>
>> with this patch
>> children    self       command         symbol
>> 7.42%       0.08%      ksoftirqd/0  ath12k_dp_tx_complete_msdu
>> 6.32%      0.03%      swapper      ath12k_dp_tx_complete_msdu
>>
>> iperf output
>> [  1] 0.0000-62.6732 sec  1.00 GBytes   137 Mbits/sec
>>
>> As can be seen from the table above, with this patch, the CPU time 
>> percentage will increase by 0.5%.
>>
>> So, i think applying this patch will definitely have an impact on 
>> system performance, but the impact is not that big and i think it can 
>> be ignored:)
>>
>> Best regards
>> Lingbo Kong
> 
> Hi, kalle
> do you have any comments regarding the above content?:)
> 
> best regards
> Lingbo Kong

hi，kalle，

In this patch, ath12k utilizes base_lock because it needs to invoke the 
ath12k_peer_find_by_id() function to find the peer using peer_id, and 
subsequently access ieee80211_sta through the peer. The base_lock is 
used to protect data like peers.

I've contemplated an alternative approach that can avoid the use of 
base_lock. we could consider using the ieee80211_find_sta_by_ifaddr() 
function to directly locate ieee80211_sta based on hdr->addr1, thus 
potentially eliminating the need for base_lock.

It's important to note that the ieee80211_find_sta_by_ifaddr() function 
call must be placed under an RCU lock. Fortunately, the 
ath12k_dp_tx_complete_msdu() function already incorporates rcu_read_lock().

I can rebase on the latest code and post v5:)

Best regards
Lingbo Kong



