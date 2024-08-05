Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B1AC3DA7F
	for <ath12k@archiver.kernel.org>; Mon,  5 Aug 2024 03:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVTVNA0wbABh8whnmy3WGU6XEczeZEV1tFn7fMbdJWY=; b=bx59GQnis3NscXSx1ZV5ag4aQq
	LzZd/JKdJ9tYvAFuKtz4Avgd64I43xbyngGLex2ufA6C/UvWBS4RZoGHRN8TORJBkWKTsHxMRQSQD
	+NhHpz074W6CcrK/Vu1jqPcKoajCz6tLtAlKBCgIFM/XorievUyPUrwj2ycRJZfpKcIokr8V+yzKB
	rNkmGTAr/V7tGq9fvQT4u+ENUz4JBAAT0VSOiwPKB4J0LbSKyB/TAIMTY+M/Dyc7Yx7xlaQ7IQRMG
	rxwPNBiFQhPB+7Tmyxoc4AJb+yWkslU8I7WNX1UA3WbT7HDhtUkxVXb4ngNwFhGnO7pv33r+HVjIJ
	ZXHTWOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoHP-0000000EUGP-2okB
	for ath12k@archiver.kernel.org;
	Mon, 05 Aug 2024 03:21:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoHJ-0000000EUFb-3kfX
	for ath12k@lists.infradead.org;
	Mon, 05 Aug 2024 03:20:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752WIZb007423;
	Mon, 5 Aug 2024 03:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVTVNA0wbABh8whnmy3WGU6XEczeZEV1tFn7fMbdJWY=; b=pwPmlPBP6S6xLWHX
	xvzEDo2nMcr9aNjhqGJFdMLYss2Jd6kyyIbOWdG6t/kNbg/sGBfCKGZGpLISFY9j
	oC6+Pbdly7VwQAlXstfOYiokshEumK6fdKDuujLT0JBaJL25daerwM+h6Mqayskw
	y+WlyYdm1SPBaqrcVltJwFv2JlTdzpTVG3xT3Aydrs+LY/pns5iCjq5lD4Febcvz
	dngTgiMSzsEvafP1PwNbaoycFPsSo37M5s2gey8hXNV59a3CfOzEkzLNQ14zExEU
	JGTsuJlYwo2EkLGocazMJ+FF7C2EejrMenQ56HosD1mH6U74pahwhStJ85YkU02Y
	LloP2A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdqk2m90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 03:20:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4753Krmx002670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 03:20:53 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 Aug 2024
 20:20:48 -0700
Message-ID: <02a126c3-fb98-4f84-b4e0-86a2dc5b7b33@quicinc.com>
Date: Mon, 5 Aug 2024 11:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path
 for WCN7850
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <kernel@quicinc.com>, <netdev@vger.kernel.org>
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
 <87ed788enl.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ed788enl.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UaDdTO4RzGeGeImt6nYVcydA7f1maQh0
X-Proofpoint-GUID: UaDdTO4RzGeGeImt6nYVcydA7f1maQh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_202057_977366_B9B50398 
X-CRM114-Status: GOOD (  23.21  )
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



On 8/1/2024 11:07 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> In transmit path, it is likely that the iova is not aligned to PCIe TLP
>> max payload size, which is 128 for WCN7850. Normally in such cases hardware
>> is expected to split the packet into several parts in a manner such that
>> they, other than the first one, have aligned iova. However due to hardware
>> limitations, WCN7850 does not behave like that properly with some specific
>> unaligned iova in transmit path. This easily results in target hang in a
>> KPI transmit test: packet send/receive failure, WMI command send timeout
>> etc. Also fatal error seen in PCIe level:
>>
>> 	...
>> 	Capabilities: ...
>> 		...
>> 		DevSta: ... FatalErr+ ...
>> 		...
>> 	...
>>
>> Work around this by manually moving/reallocating payload buffer such that
>> we can map it to a 128 bytes aligned iova. The moving requires sufficient
>> head room or tail room in skb: for the former we can do ourselves a favor
>> by asking some extra bytes when registering with mac80211, while for the
>> latter we can do nothing.
>>
>> Moving/reallocating buffer consumes additional CPU cycles, but the good news
>> is that an aligned iova increases PCIe efficiency. In my tests on some X86
>> platforms the KPI results are almost consistent.
>>
>> Since this is seen only with WCN7850, add a new hardware parameter to
>> differentiate from others.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
>> @@ -162,6 +162,60 @@ static int ath12k_dp_prepare_htt_metadata(struct sk_buff *skb)
>>  	return 0;
>>  }
>>  
>> +static void ath12k_dp_tx_move_payload(struct sk_buff *skb,
>> +				      unsigned long delta,
>> +				      bool head)
>> +{
>> +	unsigned long len = skb->len;
>> +
>> +	if (head) {
>> +		skb_push(skb, delta);
>> +		memmove(skb->data, skb->data + delta, len);
>> +		skb_trim(skb, len);
>> +	} else {
>> +		skb_put(skb, delta);
>> +		memmove(skb->data + delta, skb->data, len);
>> +		skb_pull(skb, delta);
>> +	}
>> +}
> 
> I'm nitpicking, but usually booleans like the head variable here don't
> help with readability. Having two separate functions would be easier to
> read, but this is fine as it's so small.
> 
>> @@ -279,6 +334,23 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
>>  		goto fail_remove_tx_buf;
>>  	}
>>  
>> +	if (iova_mask &&
>> +	    (unsigned long)skb->data & iova_mask) {
>> +		ret = ath12k_dp_tx_align_payload(ab, &skb);
>> +		if (ret) {
>> +			dev_warn_once(ab->dev, "failed to align TX buffer %d\n", ret);
> 
> Why dev_warn_once()? I changed it to ath12k_warn() in the pending
> branch.
> 
>> --- a/drivers/net/wireless/ath/ath12k/hw.h
>> +++ b/drivers/net/wireless/ath/ath12k/hw.h
>> @@ -96,6 +96,8 @@
>>  #define ATH12K_M3_FILE			"m3.bin"
>>  #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
>>  
>> +#define PCIE_MAX_PAYLOAD_SIZE		128
> 
> PCIE prefix implies that this is in PCI subsystem. I renamed it to
> ATH12K_PCIE_MAX_PAYLOAD_SIZE.
> 
> Please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=b603c1e0d94fb1eb0576ef48ebe37c8c1ce86328
looks good to me, thanks.

> 

