Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342A3C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrtDiKQn0md62RSYfxqqKWElLHA9XM1xV+UcK+kClxY=; b=lG1+6RAP86ig/ue4lHaDK2W7e0
	P11MiY92HnzTXM6u0uF6N7SnbP+hfMlknKmQRg3CnfeZJ4obrAWUYjqGX8GNfyqUpmwhAcnJmrO1N
	kanFuwKACT6wITMZoxWa9bX+bZ9BFRmkZE+6loYIQjPaxwV3rNc4tVdxFve2jlSb0oWL2aohy8H20
	UGDCcshKWVE5x2euDD07ZwyheDYdUKYDBYVdA5JCzogYgQOZQFuTomAAZgSuKSmn7HC/h0+VdoWWO
	Zw7ooLW3FB2ZY3LbblGh3bVQ82RxUjSiQr8o3kdT+QMaAmfwWkXGQ746acPUz9l9DHxr+PVtTYqdH
	fdNklKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVuXd-0000000Bld7-3dqY
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 14:29:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVuXa-0000000Blaw-0ii1
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 14:29:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412EDMIH010188;
	Fri, 2 Feb 2024 14:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hrtDiKQn0md62RSYfxqqKWElLHA9XM1xV+UcK+kClxY=; b=fG
	SSsawoP8NVGG8bIkxZfIjKCJvDIkkmqSkbHqALdhGe7RMGl25bav4E19O45jb39O
	W8cBDaMNwnjN6zKRKgYE6c7XLkxPu5UdZSWXUehyYTkQ8C0/YzFAk9g1s7OUcvc4
	vZ1UvKYXg272ergkJICwWe2PwPXfPLofMBsjIhbxUD3h6ZVbK4YQk9a4b1ptarE/
	acctGIbA00Jy3/FtI1Y3X5Sr1KNfYmurhQ1CPEj5gE+wSLnFXt6arNACyeTNGNhI
	C2FNVdcS0DdkMSSPgXcfyVqziU4fYqLVKPlm4GapsbQRWDbzujhobeBMRBcJUtPj
	Uzr9ex2SsWtef0zzTtgA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwm1je7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 14:29:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412ET751030699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 14:29:07 GMT
Received: from [10.216.55.87] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 06:29:05 -0800
Message-ID: <59bf33da-3b5d-b685-f9a8-0593b2d3d5e5@quicinc.com>
Date: Fri, 2 Feb 2024 19:58:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 09/13] wifi: ath12k: subscribe required word mask from
 rx tlv
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-10-quic_rajkbhag@quicinc.com>
 <87eddvt5j2.fsf@kernel.org>
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <87eddvt5j2.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dZ0nuDS6JZoDcSuou8mTdbNsi6A_0BAI
X-Proofpoint-ORIG-GUID: dZ0nuDS6JZoDcSuou8mTdbNsi6A_0BAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_08,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=861
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402020106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_062914_421191_016983ED 
X-CRM114-Status: GOOD (  16.67  )
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

On 2/2/2024 5:57 PM, Kalle Valo wrote:
> Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:
> 
>> From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>>
>> Most of the RX descriptors fields are currently not used in the
>> ath12k driver. Hence add support to selectively subscribe to the
>> required quad words (64 bits) within msdu_end and mpdu_start of
>> rx_desc.
>>
>> Add compact rx_desc structures and configure the bit mask for Rx TLVs
>> (msdu_end, mpdu_start, mpdu_end) via registers. With these registers
>> SW can configure to DMA the partial TLV struct to Rx buffer.
>>
>> Each TLV type has its own register to configure the mask value.
>> The mask value configured in register will indicate if a particular
>> QWORD has to be written to rx buffer or not i.e., if Nth bit is enabled
>> in the mask Nth QWORD will be written and it will not be written if the
>> bit is disabled in mask. While 0th bit indicates whether TLV tag will be
>> written or not.
>>
>> Advantages of Qword subscription of TLVs
>> - Avoid multiple cache-line misses as the all the required fields
>> of the TLV are within 128 bytes.
>> - Memory optimization as TLVs + DATA + SHINFO can fit in 2k buffer
>> even for 64 bit kernel.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> 
> [...]
> 
>> +static void
>> +ath12k_hw_qcn9274_compact_rx_desc_set_msdu_len(struct hal_rx_desc *desc, u16 len)
>> +{
>> +	u32 info = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info10);
>> +
>> +	info = u32_replace_bits(info, len, RX_MSDU_END_INFO10_MSDU_LENGTH);
>> +	desc->u.qcn9274_compact.msdu_end.info10 = __cpu_to_le32(info);
>> +}
> 
> Don't we have le32_replace_bits()? That would simplify this function.
> 
> No need to resend because of this, but a followup patch cleaning this up
> would be nice.
> 

Thanks Kalle, for the suggestion. Would send follow-up patch for cleaning
this up.

