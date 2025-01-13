Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD74E7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qW4GpwgZPe9rW6dSYvEWgHOjMDpl66cbeAH0NLv3fU=; b=L2ldgPOpIO3NE9oPWRETexFdpB
	vjU0FVksYVJJedAWjIZwUhihqKU3Hb5ObRIp7Vf6uW7QHqpgEahtivrEa85rx64bBlPIbncS9ujjp
	dzE2Syy5yxVJALpVpiUvFFgeQIW537Xfut2b/bbmkMz3nqf/PLN3kI4rqfPMfb6l9PjOAduFBeLu3
	QEFmpExOJODRIqysC+66hF+/34++h46P4NnkxzPbAFw8ZPQ+riu4aDnrvOA4ow4zSI+hJeqsmYxpH
	2+9Jr/Aie+x4AwoaTZOix9duBuclF18zCF3yAn0deqAzia24/JufBWbtQsZeC4MYlKyB7Ao34PQSX
	Zi2EElpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxL-00000004QEC-3mls
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 08:37:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxA-00000004Q6k-21Th
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 08:37:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7Mffk019858;
	Mon, 13 Jan 2025 08:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qW4GpwgZPe9rW6dSYvEWgHOjMDpl66cbeAH0NLv3fU=; b=SvEtZqylyEuowm//
	v2x8oNGr5piuJONO5p7WBu65DOGK+9rGNuC3BUJUxq259rPfs1oNo9WX/1YpPumo
	c5v05+bg1t+fxwYH0m60yarXBclkOuBzXRSscYnuZJusKTamAUu+87J+xHwtkWAz
	cgiXfKboAA7WLArrsHZaJR8Au8HOlbbiBjq5yJxrt67W3DElmdTx35CHwwczdr4W
	reilyWPS+ERWbCN1MpBzFp+0pf6d69xzwpFrcBvWApjJ0cqJ1rWru7hv2ZvJCNlQ
	s7tnY85u66cxZVNPeQV22UOuw4vS97JKNhltq554Au2FAoIOXApeLN3aQXvfv0aH
	DyVZQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444xcxr5vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:37:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8bg2u007074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:37:42 GMT
Received: from [10.50.33.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:37:40 -0800
Message-ID: <7d31615e-d5b3-40db-8de1-554918c18212@quicinc.com>
Date: Mon, 13 Jan 2025 14:07:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] wifi: ath12k: Add API to print s8 arrays in HTT
 stats
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
 <20250113071144.3397293-5-quic_rdevanat@quicinc.com>
 <1e1b5159-3f4f-4876-9e31-11a1f5b3584c@quicinc.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <1e1b5159-3f4f-4876-9e31-11a1f5b3584c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vkHAEzUgCoGUiBXySNXz8eHTXEFpxv4c
X-Proofpoint-GUID: vkHAEzUgCoGUiBXySNXz8eHTXEFpxv4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=989
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003744_639017_8672E264 
X-CRM114-Status: GOOD (  15.96  )
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



On 1/13/2025 1:50 PM, Aditya Kumar Singh wrote:
> On 1/13/25 12:41, Roopni Devanathan wrote:
>> Currently, print_array_to_buf() is used to print arrays to HTT
>> stats buffer. This function supports printing only arrays with
>> 32-bit unsigned integers. Add print_array_to_buf_s8(), which
>> implements print_array_to_buf()'s functionality to all the
>> arrays with 8-bit signed integers.
>>
>> Sample output:
>> rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
>> rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
>> rx_ul_mumimo_target_rssi: user_2  =  0:-128, 1:-128, 2:-128, 3:-128
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
>> ---
>>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> index 77c51269669f..92935134735a 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> @@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
>>                       footer);
>>   }
>>   +static u32
>> +print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
>> +              const s8 *array, u32 array_len, const char *footer)
> 
> 
> Who is the user of this new function? I don't see it called from
> anywhere. At least have 1 caller to it in this patch?
> 
> Or else this patch fails to compile with W=1
> 
> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:52:1: error: 'print_array_to_buf_s8' defined but not used [-Werror=unused-function]
> 52 | print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
> | ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 

This new function is called in patch "[PATCH v3 5/6] wifi: ath12k: Support Uplink MUMIMO Trigger Stats".
If we are facing this warning, we'd have to merge this patch with patch 5/6.
Jeff, Aditya, can you please confirm if doing that is okay?

