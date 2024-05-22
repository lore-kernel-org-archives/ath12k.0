Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AABC25B77
	for <ath12k@archiver.kernel.org>; Wed, 22 May 2024 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzUzrX/LNPuxUvUqwfWKebP0lXXR0PgGNnddI0sfHbg=; b=YVEge00c5fllwawq1kOcKT3Inu
	ND4+G9HmyC8Syd/IQ8dco1WCi4ReOBIXxcsvkjI9PYrPr+6bJq6Wi0CaJG2IwkKEZVzJCaBie1bnf
	plgqjfrx3JFq5fzWal7dfUZ+GPiI8oJK4lobi6dLTlGiPp62HonY8StsgyH5WPYbbtTZs0zo8A/xA
	6j28yEcVaUeOeqwABr/0n1ppIGHxggxE6kdNSJu3BzJjTHrpRXf59Dgq4I7ybe8HKOV3JlKmZ3QB9
	18lI8wQKxaqieKxTG7AWxvEIlD+29SyVvjdt8VZ4oZfLoxyWQvJHrnM3tRckHDWk8cAx0ILmr2Si1
	Ag69TQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gCK-00000002Bzi-0vzC
	for ath12k@archiver.kernel.org;
	Wed, 22 May 2024 07:15:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gCH-00000002Byy-0FfS
	for ath12k@lists.infradead.org;
	Wed, 22 May 2024 07:15:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M05QvM008814;
	Wed, 22 May 2024 07:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vzUzrX/LNPuxUvUqwfWKebP0lXXR0PgGNnddI0sfHbg=; b=cN
	d+wkT3PL9BvLxWxtqCz8NUlesNShOw5vDy+BO1LWf8LwBAOxf/0lRjrg9sh4lmA4
	yw0ZeP4uF25GLSOXdS0IOmdghpDJPgGOaUA+GwzFeYc21ZVtkYCek+T3+WOpQIXv
	j59J3/FZ7qZKD7srK3mXR91O3LDRf7WYYuYLgXBuUjFztEw8kaYc87N21OhwhIrh
	idlDFDYnOhIpGBZQ8C6cVwKC873wQT8QsFc3u5T0uGcgFhRb0tPDhqxDS1ur8Tlg
	qCugNVY1qJT8Kaw+ZiA3M4ZR3GGOcPJJxPDQC1WJNH+HtU25Fo69dWKCg0LS3nuo
	EONffCS0LDARDW5jgu9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gg3sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 07:15:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M7FVM8020667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 07:15:31 GMT
Received: from [10.50.28.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 00:15:29 -0700
Message-ID: <e8e4a015-3610-4f12-9ed8-e8281af8bf4f@quicinc.com>
Date: Wed, 22 May 2024 12:45:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: fix firmware crash during reo reinject
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-4-quic_ppranees@quicinc.com>
 <D1F6ZU89YWPF.X1SZ9JNQNPFC@gmail.com>
Content-Language: en-US
From: Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <D1F6ZU89YWPF.X1SZ9JNQNPFC@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CfNI3NDXlAGEW_vqdKqjD-trzLHQQtaY
X-Proofpoint-ORIG-GUID: CfNI3NDXlAGEW_vqdKqjD-trzLHQQtaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_03,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_001537_262009_BBE72505 
X-CRM114-Status: GOOD (  15.02  )
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



On 5/21/2024 2:20 PM, Nicolas Escande wrote:
> On Mon May 20, 2024 at 9:00 AM CEST, P Praneesh wrote:
>> When handling fragmented packets, the ath12k driver reassembles each
>> fragment into a normal packet and then reinjects it into the HW ring.
>> However, a firmware crash occurs during this reinjection process.
>> The issue arises because the driver populates peer metadata in
>> reo_ent_ring->queue_addr_lo, while the firmware expects the physical
>> address obtained from the corresponding peer’s queue descriptor. Fix it
>> by filling peer's queue descriptor's physical address in queue_addr_lo.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/dp_rx.c | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> index 2bfcc19d15ea..2adb6c7d4a42 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> @@ -2967,7 +2967,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
>>   	struct hal_srng *srng;
>>   	dma_addr_t link_paddr, buf_paddr;
>>   	u32 desc_bank, msdu_info, msdu_ext_info, mpdu_info;
>> -	u32 cookie, hal_rx_desc_sz, dest_ring_info0;
>> +	u32 cookie, hal_rx_desc_sz, dest_ring_info0, queue_addr_hi;
>>   	int ret;
>>   	struct ath12k_rx_desc_info *desc_info;
>>   	enum hal_rx_buf_return_buf_manager idle_link_rbm = dp->idle_link_rbm;
>> @@ -3060,13 +3060,11 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
>>   	reo_ent_ring->rx_mpdu_info.peer_meta_data =
>>   		reo_dest_ring->rx_mpdu_info.peer_meta_data;
>>   
>> -	/* Firmware expects physical address to be filled in queue_addr_lo in
>> -	 * the MLO scenario and in case of non MLO peer meta data needs to be
>> -	 * filled.
>> -	 * TODO: Need to handle for MLO scenario.
>> -	 */
>> -	reo_ent_ring->queue_addr_lo = reo_dest_ring->rx_mpdu_info.peer_meta_data;
>> -	reo_ent_ring->info0 = le32_encode_bits(dst_ind,
>> +	reo_ent_ring->queue_addr_lo = cpu_to_le32(lower_32_bits(rx_tid->paddr));
>> +	queue_addr_hi = upper_32_bits(rx_tid->paddr);
> Shouldn't there be a cpu_to_le32 somewhere here ? It just seems asymetrical
> between the two values extracted from rx_tid->paddr
le32_encode_bits of queue_addr_hi does that conversion, so there is no 
need to explicitly convert cpu_to_le32 while fetching rx_tid->paddr's 
upper 32 bits.
>> +	reo_ent_ring->info0 = le32_encode_bits(queue_addr_hi,
>> +					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
>> +			      le32_encode_bits(dst_ind,
>>   					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
>>   
>>   	reo_ent_ring->info1 = le32_encode_bits(rx_tid->cur_sn,
> 

