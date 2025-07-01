Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBADC8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rKL/G3uJjiLZbR2M6EnvDktMc/VbIG3KMeAKMEYbFo=; b=UDsu4BFQiwKhli0ZYZ/+D5dblT
	F/esYF+3uSKs8Ja9S4nKXnBShJ5PEvkc5VMlc+WFE1YgoJAnjYeAXOamNbwzZHuECAM+0cxeaTNlf
	qxxQmRxlRxjIsOkCr6HVYJ0aA0sjSxrNAX5W7l4TSMa0HNODWgKR/U/vT7AJzWEpkOoMea1rcBEkD
	4jUTaKOScoeMo/Op4MWh15ElmnzbwixZiJ4y6mgtJ3feq95rch4QjzNMYeAIsBvRQBh94sqlwQed9
	X6cLsnuhJ1GcTefjUKixhjyLZKYAEq+SLm6gpVWgUgx55viYSgwiZs0esaFFsL0nF9QcEmlHMi+2+
	RB6CM6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjm-00000004Ufx-1R9X;
	Tue, 01 Jul 2025 08:53:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWh4-00000004T4W-3yIA
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 08:50:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613hHsL000324;
	Tue, 1 Jul 2025 08:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rKL/G3uJjiLZbR2M6EnvDktMc/VbIG3KMeAKMEYbFo=; b=jDxEWWQ7nxol4jWE
	q34Cpk9JFCvyRYwcYZVRYyfYsc4tOgi91viojPNHz7Z+paweIOkuL3j9ZZWpAkua
	aTrJFUelRfTqC7BVmMnJ5xM3+nfpiPt/1X7Tt/QX4PA7vnFunLP4J3wJyQUH2vpx
	hZx4UdYTigSxUPnm0/mWF30cFmcV5BARoadS8ccnrmJJs2iiY34nuqnPODZOUVIf
	LzFJkod2QpZbAWldn0MCMNh3TYp2bFPhbyt2XTdB1gbs0FoE3pav4Yi0FY9Za23e
	y8KFXG3pcxdXwW6y0cGOe8Dn1P1isZPwBwDQsEryED0Ei6EMpuVyJfhj3jeRYYLF
	Zrv96A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm7vpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 08:50:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5618oJtr000901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 08:50:19 GMT
Received: from [10.152.201.120] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 01:50:18 -0700
Message-ID: <b0daaafa-07a2-4372-b063-75e0cf75a4fd@quicinc.com>
Date: Tue, 1 Jul 2025 14:20:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v7 4/5] wifi: ath12k: correctly update bw for
 ofdma packets
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250630071114.3474672-1-quic_sarishar@quicinc.com>
 <20250630071114.3474672-5-quic_sarishar@quicinc.com>
 <6e64bd6c-c6eb-b9ac-4f82-e241a7323ddc@oss.qualcomm.com>
Content-Language: en-US
From: Sarika Sharma <quic_sarishar@quicinc.com>
In-Reply-To: <6e64bd6c-c6eb-b9ac-4f82-e241a7323ddc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6863a14c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=WtVtEp7Jhg6eC0_IT5IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Cwc5o-86OCbYNN3YnH5kW66CwL63cCwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX179VbKIs9l4s
 /t5Hofrqs88Ec6eKN0oiSxnp/xHOLtO4MJrBMuma5pp89gJs/2XzoghnjujNTiF2zODEl4/g67p
 OIIEgFI1b2cJDtlOdaRtB/m50bjR+QADEZMaur3puIZzmd2ai2PhYt0OWJY6ALHIcsTYFwNpZ5j
 GMU8TPhSY/Ox+vIsd4pXV0G0Ge4GwsHP1QSbWpG6tiaKaH45m2sDRXYkhruUXVe3hus+9LvXkZT
 LWIMC4ZtSU7r0qpL+lg+6tHzR14UBGUNMPOnyGjULyPpiEXxUFLjgUwbIopbC/HITMnNhXFmc40
 XOY8Oe7pvC22fYufLOLOoAnmWpoIaZ3HV7q9OSKK4izgAjHNkeXyAarUBsvPBvJWdxIbEu9IoSK
 UEz2YmeR1Kk6aA2eh2tv96FUEgnN3CbR23M5ab3wX8ub4ziYwBBwSFXq/SaM6hE0La6J1y3z
X-Proofpoint-GUID: Cwc5o-86OCbYNN3YnH5kW66CwL63cCwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=752
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015023_108690_EBC371E1 
X-CRM114-Status: GOOD (  15.85  )
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

On 7/1/2025 1:02 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 6/30/2025 12:41 PM, Sarika Sharma wrote:
>> Currently, arsta->txrate.bw is filled from 
>> ath12k_mac_bw_to_mac80211_bw(bw)
>> during ath12k_update_per_peer_tx_stats(). But in tx_completion path bw
>> is filled differently if ppdu_type is ofdma for HE/EHT rates.
>>
>> Hence, update arsta->txrate.bw correctly if packet is ofdma for HE
>> and EHT rate.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
>>   drivers/net/wireless/ath/ath12k/dp_rx.c | 15 ++++++++++++---
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/ 
>> wireless/ath/ath12k/dp.h
>> index a353333f83b6..0c1fece27264 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.h
>> +++ b/drivers/net/wireless/ath/ath12k/dp.h
>> @@ -1559,6 +1559,8 @@ enum HTT_PPDU_STATS_PPDU_TYPE {
>>   #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M        BIT(28)
>>   #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M        BIT(29)
>> +#define HTT_USR_RATE_PPDU_TYPE(_val) \
>> +        le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M)
>>   #define HTT_USR_RATE_PREAMBLE(_val) \
>>           le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M)
>>   #define HTT_USR_RATE_BW(_val) \
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/ 
>> wireless/ath/ath12k/dp_rx.c
>> index 0f5edc81fc5d..ff92ec764ae5 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> @@ -1423,12 +1423,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k 
>> *ar,
>>       struct htt_ppdu_user_stats *usr_stats = &ppdu_stats- 
>> >user_stats[user];
>>       struct htt_ppdu_stats_common *common = &ppdu_stats->common;
>>       int ret;
>> -    u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
>> +    u8 flags, mcs, nss, bw, sgi, dcm, ppdu_type, rate_idx = 0;
>>       u32 v, succ_bytes = 0;
>>       u16 tones, rate = 0, succ_pkts = 0;
>>       u32 tx_duration = 0;
>>       u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
>> -    bool is_ampdu = false;
>> +    bool is_ampdu = false, is_ofdma = false;
> 
> nit: initialization of is_ofdma is unnecessary as it is unconditionally
> populated below.
> 
>  >       if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
>  >           return;
>  > @@ -1457,6 +1457,10 @@ ath12k_update_per_peer_tx_stats(struct ath12k 
> *ar,
>  >       sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
>  >       dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
>  >
>  > +    ppdu_type = HTT_USR_RATE_PPDU_TYPE(user_rate->info1);
>  > +    is_ofdma = (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_OFDMA) ||
>  > +           (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_MIMO_OFDMA);
>  > +
> 

Sure, will remove it.

> 
> Vasanth


