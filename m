Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C573C25B76
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 06:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YegnvcHPKiUXxCBaWXUkOZrxWCuc3GNdaBCAVJPvomo=; b=NkLtZjekq2qqThbE431XjwF7pq
	DFsgdBszxOcUoSGIVfNmGn+IaGXv8wtadRb9Sm1Mrw+TXlFAuxXSFz9hKZKgmAPDax6sVaVbHcUIe
	V85w9oTAR3mLeAUDTrhBPrfeD26n1W8xq4euubrNx+HXih6/KQ7INj5Bdd7Nlknqw9WgrXKgSBJZF
	OLMrPy2z+XHqYlRGg9lElAmKzkbZUph3m5gpqscWQESWEiZOl/sPIA7QIl6/2KeHYvvv1vz0xHKa8
	IYwU6bWkLnsqMmk8uZpdMXY8qsR9F9EykapX+zJcjrE5iCUwGUIMiwHwdVbpg/p/5eqoQfh4K7CU4
	Hf8f9/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEkBs-00000004nmu-2tMi
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 06:32:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEkBS-00000004nQS-1yLX
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 06:32:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45506PX0021521;
	Wed, 5 Jun 2024 06:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YegnvcHPKiUXxCBaWXUkOZrxWCuc3GNdaBCAVJPvomo=; b=Ss2owffJSJP9yVjt
	4CoE6+ikTOK1Y8jj2BzMpaOKWnSsYKyuB2tksJ9Iz0lsOjZ5JuVTSZYkzlGS1p7J
	dAJOoIKN3OrdDrj0Z1Hn91iVFBUXeRb4t95Iesi0xPnQLvrwL2QeL+bvSE3cV4NQ
	ue5QUtOIlXCoD74Vs6rNsdlkubxRZ/6cwa4+Jjfcu3nfvx1WrlHSWF6YfDjwaQPs
	QLuvW5/np3R0oKYkPoBkqUH/78PIdZMmKi3GUWiYQvzX18OVxfNGmTn2TvR/mzM0
	CKEYudz+VTu0vr6vuIH/kJgGcEI2tuPr3YISkWh30D1HJTIXmF6b9sTU7aohxw+m
	V/nMbQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj13xjb5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 06:31:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4556VaPT017732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 06:31:36 GMT
Received: from [10.111.167.179] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 23:31:34 -0700
Message-ID: <4fdfdb34-7892-4bf9-8da1-e09cf6ff7731@quicinc.com>
Date: Wed, 5 Jun 2024 14:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
 <20240419032122.7009-2-quic_lingbok@quicinc.com> <87bk5xs7qj.fsf@kernel.org>
 <050ae0d4-c879-40c2-b2ac-1766aaa2c789@quicinc.com>
 <87v844qsih.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87v844qsih.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N3FyGgkTWHJeM6gpA6ZJNo4CHfODFim-
X-Proofpoint-GUID: N3FyGgkTWHJeM6gpA6ZJNo4CHfODFim-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=947 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_233143_034629_31502431 
X-CRM114-Status: GOOD (  14.71  )
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



On 2024/4/26 19:21, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> writes:
> 
>> On 2024/4/26 0:54, Kalle Valo wrote:
>>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>>>
>>>> +static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct
>>>> hal_tx_status *ts)
>>>> +{
>>>> +	struct ath12k_base *ab = ar->ab;
>>>> +	struct ath12k_peer *peer;
>>>> +	struct ath12k_sta *arsta;
>>>> +	struct ieee80211_sta *sta;
>>>> +	u16 rate;
>>>> +	u8 rate_idx = 0;
>>>> +	int ret;
>>>> +
>>>> +	spin_lock_bh(&ab->base_lock);
>>>
>>> Did you analyse how this function, and especially taking the
>>> base_lock,
>>> affects performance?
>>
>> The base_lock is used here because of the need to look for peers based
>> on the ts->peer_id when calling ath12k_peer_find_by_id() function,
>> which i think might affect performance.
>>
>> Do i need to run a throughput test?
> 
> Ok, so to answer my question: no, you didn't do any performance
> analysis. Throughput test might not be enough, for example the driver
> can be used on slower systems and running the test on a fast CPU might
> not reveal any problem. A proper analysis would be much better.
> 

Hi, kalle,
I did a simple performance analysis of the ath12k_dp_tx_update_txcompl() 
function on slower systems.

Firstly, i use perf tool to set dynamic tracepoints in 
ath12k_dp_tx_complete_msdu() function, and then used the command of 
"iperf -c ip address -w 4M -n 1G -i 1" to do traffic test.

During this process, use ./perf record -a -g to detect the performace of 
the system.

Finally, compare the results with and without this patch.

without this patch
./perf report output
children    self	command		symbol
7.28%	   0.08%      ksoftirqd/0 ath12k_dp_tx_complete_msdu
5.96%      0.03%      swapper     ath12k_dp_tx_complete_msdu   		

iperf output
[  1] 0.0000-62.6712 sec  1.00 GBytes   137 Mbits/sec

with this patch
children    self       command         symbol
7.42%	   0.08%      ksoftirqd/0  ath12k_dp_tx_complete_msdu
6.32%      0.03%      swapper      ath12k_dp_tx_complete_msdu

iperf output
[  1] 0.0000-62.6732 sec  1.00 GBytes   137 Mbits/sec

As can be seen from the table above, with this patch, the CPU time 
percentage will increase by 0.5%.

So, i think applying this patch will definitely have an impact on system 
performance, but the impact is not that big and i think it can be ignored:)

Best regards
Lingbo Kong

