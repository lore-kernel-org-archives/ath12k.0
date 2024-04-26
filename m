Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650B9C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XCpFNcUVGUw/dx6yA5JuwpoFJAq8+N68WrOV5Dr72M=; b=YTwPQBrr5R/tDeo4pjF/fD0N+G
	HAWX91RglFXmjC/KPbP9ZLk8LQM/6muX3PJml0O6jLGg6fKLINUHZ2OWu9RSQV7LQEXccc8TYaHUt
	FH17+kPHdbmqN9KsocKZCJkbq14ozVoM2uiIFZjv+PoMQgBah4/vqZoHS1Zye7jc3ll+eQCOi/hmU
	i2Pv6Gss72kHjzyvbdYO0G//kbym6nKWuYxqzINdDKwzwy4Q/E6NZx9ZfuM4EvXJGOq5ImNWDPxgu
	f5aCNkngHKg2FZlb/KrPJYA3FL02Lxy5lralQRQQrDB1GqdiRVefUK+uxrGpMZi1VCDx+gzIiEBEV
	UNgRaUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GWW-0000000BZdi-0XFR
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 08:01:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GWT-0000000BZcw-1zOC
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 08:01:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q4p6Wj010584;
	Fri, 26 Apr 2024 08:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7XCpFNcUVGUw/dx6yA5JuwpoFJAq8+N68WrOV5Dr72M=; b=iI
	s/JPpYFGYX5YV8PNoLDQurfAcwAifvODiPBORk84hC9z4HZzqsJK65lc1L4683PF
	6iUtfsWQmGksv68cmxjKIJG2SJiuoTQPdnV0ZK3rxodCs4gLXmxvA0zfnOV7zM9H
	zWJSyQ08NTDab9NUlUfx5od9aAgDVmKm6Va4a+2WybVnOP15l4ufFw0JiinuAXIF
	UADMQr3cK1kiyP4tXLYJyXSgFPmEHUchJ+JizVfxRmixosxTbX5mBEUIR9QJRd7g
	dZCtBFl66yxfhvi7EtumxKqA1AsWoCe7L27AlEZtuyHEkC8LjAbGZb8wusENfnLe
	dj1nBSDXNrRMOcrT+0jA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqrwwtjr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 08:01:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43Q81OZ0028759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 08:01:24 GMT
Received: from [10.38.245.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 01:01:23 -0700
Message-ID: <c01db4fc-03a0-41f6-9f16-bfa3b2c08007@quicinc.com>
Date: Fri, 26 Apr 2024 16:01:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
 <20240419032122.7009-2-quic_lingbok@quicinc.com> <87r0etsp6u.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87r0etsp6u.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lqv18atgWOpvrZ3S5Y4iVwQO3wPBkc7y
X-Proofpoint-ORIG-GUID: lqv18atgWOpvrZ3S5Y4iVwQO3wPBkc7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_07,2024-04-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=990 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404260050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_010133_670590_A88D994D 
X-CRM114-Status: GOOD (  16.29  )
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



On 2024/4/25 18:37, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> writes:
> 
>> Currently, the transmit rate of "iw dev xxx station dump" command
>> always show an invalid value.
>>
>> To address this issue, ath12k parse the info of transmit complete
>> report from firmware and indicate the transmit rate to mac80211.
>>
>> This patch affects the station mode of WCN7850 and QCN9274.
>>
>> After that, "iw dev xxx station dump" show the correct transmit rate.
>> Such as:
>>
>> Station 00:03:7f:12:03:03 (on wlo1)
>>          inactive time:  872 ms
>>          rx bytes:       219111
>>          rx packets:     1133
>>          tx bytes:       53767
>>          tx packets:     462
>>          tx retries:     51
>>          tx failed:      0
>>          beacon loss:    0
>>          beacon rx:      403
>>          rx drop misc:   74
>>          signal:         -95 dBm
>>          beacon signal avg:      -18 dBm
>>          tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> 
> [...]
> 
>> +static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
>> +{
>> +	if (ar->last_ppdu_id != 0) {
>> +		if (ar->last_ppdu_id == ts->ppdu_id ||
>> +		    ar->cached_ppdu_id == ar->last_ppdu_id)
>> +			ar->cached_ppdu_id = ar->last_ppdu_id;
>> +
>> +		ath12k_dp_tx_update_txcompl(ar, ts);
>> +	}
>> +
>> +	ar->last_ppdu_id = ts->ppdu_id;
>> +}
> 
> A code comment would help a lot. Why is ar->cached_ppdu_id needed here?
> 
> And if 'ar->cached_ppdu_id == ar->last_ppdu_id' is true why do then do
> 'ar->cached_ppdu_id = ar->last_ppdu_id'? The value of ar->cached_ppdu_id
> is not changing here (unless I'm missing something).
> 
> Also I'm worried about locking. How is access to ar->last_ppdu_id and
> ar->cached_ppdu_id protected?
> 

Thanks for pointing to this.
you're right, the ar->cached_ppdu_id haven't used in here, so need to 
delete it.
i missed something in here.

So, change the ath12k_dp_tx_update(struct ath12k *ar, struct 
hal_tx_status *ts) to
static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
{
	if (ts->flags & HAL_TX_STATUS_FLAGS_FIRST_MSDU) {
		if (ar->last_ppdu_id != 0)
			ath12k_dp_tx_update_txcompl(ar, ts);
		ar->last_ppdu_id = ts->ppdu_id;
	}
}

best regards
Lingbo Kong

