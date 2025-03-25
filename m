Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C510DC36002
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 02:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chnyEueQ4oIPh03pgza3AFF1HXpmdGeDL+AtZfY7vvc=; b=vC5deRj/8IlPJ/DL+5bIo5Q/uc
	BgrbQ1cBYp/S8m6FUMwYDpmAfE3bwoEVhZ3tN/sHR6CQyI/xgTc7WrPh3Tt31QoDUbDcQnSbR2GOR
	LDQUPz5URcbRYIpR8S1squexqcrVg4gqFKzsVB5revMdFDTIZhf1qddAVZdEAdtC+vrVIX4O18B1Z
	JdOkCLPkzO0vESvTYFmv7npHu71nblQuVdnj4xvNE97Z18TLuSQNbZbQQ9G2bofsm0LHlaYMRFmoH
	isg0isEmW/Cpn6tjIQASwYApS3DmSiBJWd3j/Gzdiw20TovTWRhPpr0B0YKiKr+xOzdv+Z+MD3c7k
	ifMHyTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twu4N-00000004gvJ-1sYh
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 02:31:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twu4J-00000004gux-2y2s
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 02:31:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIQRYj015754
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 02:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chnyEueQ4oIPh03pgza3AFF1HXpmdGeDL+AtZfY7vvc=; b=cQPgF+7QaZ04sn0x
	TxUvYop3A7ArwpkhhNb/86fCHN5TALzdS0TAGE4C89sPmAmQFP9gZWtN0K2E8mz6
	j+oj9EHzQ08Fh0tEu37ds5tBETbQWmlHvQ6AO4JsldpcSlMQdsSGuXVG+QNsDf0o
	DkMvA5pirYgWSh6kNXQB0+upz2wvONW7TyBNO5Ssc71tSheL16xwsUOi2DboMxFL
	7fkHuSUIH+ClwUlSHOtdkgb+mNt6saZZFltQAAMw+wIZLxxbELwIXtJkzeJo/VAK
	V7Xe93dhdKyneCILl5Na4nD6Y+8ajBqIPmqfvmvYldEbaVXwoFtrqAhLVVoWH/0T
	dvtHTA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9we6ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 02:31:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P2V4M7025146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 02:31:04 GMT
Received: from [10.253.36.115] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 19:31:03 -0700
Message-ID: <933857b4-1697-4893-89df-91002a5282d6@quicinc.com>
Date: Tue, 25 Mar 2025 10:31:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: report station mode per-chain signal
 strength
To: <ath12k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250210054050.656075-1-quic_lingbok@quicinc.com>
 <4c1681f7-c4fe-4101-8023-a50b4b59a17d@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <4c1681f7-c4fe-4101-8023-a50b4b59a17d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NhrP4Xi8bavQtJA-kQ_abZXdXJfHWuz7
X-Proofpoint-ORIG-GUID: NhrP4Xi8bavQtJA-kQ_abZXdXJfHWuz7
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e21569 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=tT_vqbzdRpSqAcq5AD0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_01,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_193107_879064_573E1CFC 
X-CRM114-Status: GOOD (  15.70  )
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



On 2025/2/26 19:34, Lingbo Kong wrote:
> 
> 
> On 2025/2/10 13:40, Lingbo Kong wrote:
>> Currently, command “iw wlan0 station dump” does not show per-chain signal
>> strength.
>>
>> This is because ath12k does not handle the num_per_chain_rssi and
>> rssi_avg_beacon reported by firmware to ath12k.
>>
>> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
>> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
>> handle num_per_chain_rssi and rssi_avg_beacon in the
>> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain 
>> signal
>> strength to the chain_signal of struct station_info.
>>
>> After that, "iw dev xxx station dump" shows the correct per-chain signal
>> strength.
>> Such as:
>>
>> Station AA:BB:CC:DD:EE:FF (on wlan0)
>>          inactive time:  212 ms
>>          rx bytes:       10398
>>          rx packets:     64
>>          tx bytes:       4362
>>          tx packets:     33
>>          tx retries:     49
>>          tx failed:      0
>>          beacon loss:    0
>>          beacon rx:      14
>>          rx drop misc:   16
>>          signal:         -45 [-51, -46] dBm
>>          beacon signal avg:      -44 dBm
>>
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> ---
>> v2:
>> 1.add break to avoid warning
>>
>>   drivers/net/wireless/ath/ath12k/core.h |  5 ++
>>   drivers/net/wireless/ath/ath12k/mac.c  | 39 ++++++++++--
>>   drivers/net/wireless/ath/ath12k/mac.h  |  2 +
>>   drivers/net/wireless/ath/ath12k/wmi.c  | 82 ++++++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/wmi.h  | 18 +++++-
>>   5 files changed, 139 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h 
>> b/drivers/net/wireless/ath/ath12k/core.h
>> index 57e71ccbbb67..967e3cad3bca 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -508,6 +508,7 @@ struct ath12k_link_sta {
>>       u32 bw_prev;
> 
> 
> hi jeff,
> do you have any updates on this patch?🙂
> 
> /lingbo
> 

hi, jeff,

do you have any updates on this patch?🙂
should i send a new version based on the current upstream code?

/lingbo

