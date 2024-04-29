Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97877C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 09:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdzIKNvzAr2Ce3WtJ5WUlnDVSTi+37ZIZxXbIyubkXE=; b=rPWX6oE6UTAeSYjutce1hefQSo
	9aD0k2CB5MwaGHxo1HkJgQApNxakSqgGUusaQlc88gdk/Jy0JNOl+H2zzoaUD8CqIuoZjEc0sw+uM
	iTBRXsmKv7BR3ymmp4Bbl7q3odQ1e7banr2Z+zkkdpmziRq+kGWZHP7ItP59BkRjenhctp9q0cRnb
	KywQ5VOxOPbNEpClApWXxZph2ZG3keOFUtsLLcnOnOBd6lh3LYP4P5UvS8C9bbfJ7Wnt5axIg+ASy
	xXLDHMowakXfobSlt8WfRsb+mHfNRUh9MzyyjmQjqGczJbece8/mpMFje1fdP/Qt36hkIoZHjE4Yi
	5EB+1EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NKO-000000027S7-12Cw
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 09:29:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NKK-000000027Oh-2ZXn
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 09:29:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T4v6jM006218;
	Mon, 29 Apr 2024 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qdzIKNvzAr2Ce3WtJ5WUlnDVSTi+37ZIZxXbIyubkXE=; b=OW
	YQtlYF4pusHACr5YoQRLJKUXVKgE5swvtbbRQCzMQa29v/VnVdU+ohjgDntkEmOA
	cMwqZV0PuK8IFwrGXglq8HlhklRXI4RRlvD/E0qM4QmAJrzzXwU22Kr7i5GplNpw
	g8PgKQeeMv99X2k9KGiRMss5KCf2XBw+kj8lAG34Bxzw/wkKHPSLay+4cUyp/Zkq
	KHNMVxv1S/ROaI/QV9zL8lkneCms5aGjKLvEX00aVn/Xh/kzlnItfidrZFseGsXQ
	u8J0Gt+ts8cZ/4sVyq/15Cx6fDYSKZYAJ6e6MJB3Og0GGjf5bqbXfTX4lIFPhjnx
	MY6EAVAxccRwAhE2mU4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrq2k3dxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 09:29:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T9TRsw014159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 09:29:27 GMT
Received: from [10.38.244.135] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 02:29:25 -0700
Message-ID: <0a6b96a1-cc02-4251-9d96-9684b25654d9@quicinc.com>
Date: Mon, 29 Apr 2024 17:29:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
 <20240419032122.7009-2-quic_lingbok@quicinc.com>
 <f974973d-5797-39c2-fddf-c928755c76a9@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <f974973d-5797-39c2-fddf-c928755c76a9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1CraaGubrEWZUAWhbY4C2qmKQvJYCedZ
X-Proofpoint-GUID: 1CraaGubrEWZUAWhbY4C2qmKQvJYCedZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_07,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_022936_688886_453C4000 
X-CRM114-Status: GOOD (  13.19  )
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



On 2024/4/29 17:11, Karthikeyan Periyasamy wrote:
> 
> 
> On 4/19/2024 8:51 AM, Lingbo Kong wrote:
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
>>          inactive time:  872 ms
>>          rx bytes:       219111
>>          rx packets:     1133
>>          tx bytes:       53767
>>          tx packets:     462
>>          tx retries:     51
>>          tx failed:      0
>>          beacon loss:    0
>>          beacon rx:      403
>>          rx drop misc:   74
>>          signal:         -95 dBm
>>          beacon signal avg:      -18 dBm
>>          tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 
>> EHT-GI 0
>>
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
[...]
>> @@ -522,10 +645,26 @@ static void ath12k_dp_tx_status_parse(struct 
>> ath12k_base *ab,
>>       ts->ppdu_id = le32_get_bits(desc->info1,
>>                       HAL_WBM_COMPL_TX_INFO1_TQM_STATUS_NUMBER);
>> -    if (le32_to_cpu(desc->rate_stats.info0) & 
>> HAL_TX_RATE_STATS_INFO0_VALID)
>> -        ts->rate_stats = le32_to_cpu(desc->rate_stats.info0);
>> -    else
>> -        ts->rate_stats = 0;
>> +
>> +    if (le32_to_cpu(desc->info2) & HAL_WBM_COMPL_TX_INFO2_FIRST_MSDU)
>> +        ts->flags |= HAL_TX_STATUS_FLAGS_FIRST_MSDU;
>> +
>> +    ts->peer_id = le32_get_bits(desc->info3, 
>> HAL_WBM_COMPL_TX_INFO3_PEER_ID);
>> +
>> +    if (le32_to_cpu(desc->rate_stats.info0) & 
>> HAL_TX_RATE_STATS_INFO0_VALID) {
>> +        ts->pkt_type = le32_get_bits(desc->rate_stats.info0,
>> +                         HAL_TX_RATE_STATS_INFO0_PKT_TYPE);
>> +        ts->mcs = le32_get_bits(desc->rate_stats.info0,
>> +                    HAL_TX_RATE_STATS_INFO0_MCS);
>> +        ts->sgi = le32_get_bits(desc->rate_stats.info0,
>> +                    HAL_TX_RATE_STATS_INFO0_SGI);
>> +        ts->bw = le32_get_bits(desc->rate_stats.info0,
>> +                       HAL_TX_RATE_STATS_INFO0_BW);
>> +        ts->ru_tones = le32_get_bits(desc->rate_stats.info0,
>> +                         HAL_TX_RATE_STATS_INFO0_TONES_IN_RU);
>> +        ts->ofdma = le32_get_bits(desc->rate_stats.info0,
>> +                      HAL_TX_RATE_STATS_INFO0_OFDMA_TX);
>> +    }
> 
> 
> Why multiple read from dma mapped area say desc->rate_stats.info0 lead 
> to increase in CPU cycles. Instead you do one read from dma mapped area 
> desc->rate_stats.info0 and classify into your own data structure ?
> 
> And the info0 classification used within the 
> ath12k_dp_tx_update_txcompl(), so you can do the classification within 
> this API.
> 
yes, thanks for pointing of this.
i will apply it in next version:),

Best regards
Lingbo Kong



