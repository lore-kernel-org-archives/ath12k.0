Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE73C36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX/EOzdWAusHdfhP7CSb/7MaMVKXXFRKLNjMaH5ZfI4=; b=nq0IRLfQZam4qFlI1t3rk9g1Mn
	fb/thEkiv7XwO2cE7kKR0PedIX5Jvi1mFLdYEWQIWzfXf4I3v7M2YeZKovIenwIdxdZ9juvaULnZs
	5gxjg5jgF4Zks+wpwvnE+gIlA0aSfqHBpOmUiDBOr25yh9bOVXDVX0cGayDe6D3pN8y/D2IKRLD0W
	mYJLTbMhdfKb70sFXVrZeoCGsO/MrLNvplXGIjFj94zja2FmC6E//khKsfAmZWHwLpSYqUKouQztB
	AvjviRHrygYUhEpKf1NWtdSGikA52bluAYSWTke9zQS3fbLxqCzXdNclRqJvxHpPdBfYwvxzObjJq
	XixumxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37zO-0000000Cjvi-3q30
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 06:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37K6-0000000Ccgw-1iOJ
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 05:53:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGndrV030663;
	Fri, 11 Apr 2025 05:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX/EOzdWAusHdfhP7CSb/7MaMVKXXFRKLNjMaH5ZfI4=; b=dSGCcJ6cUTVYsg8w
	TZcYJ3tRfgHvnS/or0AOTEzAXjIMiHUczA7PlEjmAC6ClxZiRq2NG5FHvsSRS7dq
	Z8jdoP/sSBBoio0uL/YdzN2yHhdMySYEc2QOSO1Ltm2zB962MxYSHw6D/GUkbrcF
	sjqU/xXWIf+15AC99cBmAyK4VzhdO6xb+xkrhtrab5htfuiyDDjdKBfrjeawAqJQ
	njq+MCY23gW8EOLB2MY85Cbbg+LVwyDDMNH0bPzJRX8mJ5bH2rovtlmsEZ52IOGS
	NpHNSXok8miR2HXTzJAxZAUYAX/A3ZzIjc9rkKcpCA7PTJwuGe+hNROUw1SnVZiA
	h4o0cQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfts3v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:53:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B5r38V022086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:53:03 GMT
Received: from [10.50.62.95] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 22:53:02 -0700
Message-ID: <1b3c2ff7-89c3-41fa-9cae-20cf854a7b91@quicinc.com>
Date: Fri, 11 Apr 2025 11:22:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: using msdu end descriptor to
 check for rx multicast packets
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250408130132.2919329-1-quic_sarishar@quicinc.com>
 <20250408130132.2919329-2-quic_sarishar@quicinc.com>
 <cb37ecfe-c737-de97-0729-af2c87062058@quicinc.com>
Content-Language: en-US
From: Sarika Sharma <quic_sarishar@quicinc.com>
In-Reply-To: <cb37ecfe-c737-de97-0729-af2c87062058@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8ae40 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jwzHO7tdmTva_yWHhpUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Fh9PFaTAWj8i3Setqxk2BEYS5AbpuruJ
X-Proofpoint-ORIG-GUID: Fh9PFaTAWj8i3Setqxk2BEYS5AbpuruJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=882
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_225306_472098_D9007954 
X-CRM114-Status: GOOD (  13.97  )
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

On 4/9/2025 12:16 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 4/8/2025 6:31 PM, Sarika Sharma wrote:
>> Currently, the RX multicast broadcast packet check is performed using
>> bit 15 from the info6 field of the MPDU start descriptor. This check
>> can also be done using bit 9 from the info5 field of the MSDU end
>> descriptor. However, in some scenarios multicast bit is not set when
>> fetched from MPDU start descriptor.
>> Therefore, checking the RX multicast broadcast packet from the MSDU
>> end descriptor is more reliable as it is per MSDU.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/hal.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/ 
>> wireless/ath/ath12k/hal.c
>> index d00869a33fea..d961392bb981 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>> @@ -449,8 +449,8 @@ static u8 
>> *ath12k_hw_qcn9274_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
>>   static bool ath12k_hw_qcn9274_rx_desc_is_da_mcbc(struct hal_rx_desc 
>> *desc)
>>   {
>> -    return __le32_to_cpu(desc->u.qcn9274.mpdu_start.info6) &
>> -           RX_MPDU_START_INFO6_MCAST_BCAST;
>> +    return __le16_to_cpu(desc->u.qcn9274.msdu_end.info5) &
>> +           RX_MSDU_END_INFO5_DA_IS_MCBC;
>>   }
>>   static void ath12k_hw_qcn9274_rx_desc_get_dot11_hdr(struct 
>> hal_rx_desc *desc,
>> @@ -902,8 +902,8 @@ static u8 
>> *ath12k_hw_qcn9274_compact_rx_desc_mpdu_start_addr2(struct hal_rx_desc
>>   static bool ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc(struct 
>> hal_rx_desc *desc)
>>   {
>> -    return __le32_to_cpu(desc->u.qcn9274_compact.mpdu_start.info6) &
>> -           RX_MPDU_START_INFO6_MCAST_BCAST;
>> +    return __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info5) &
>> +           RX_MSDU_END_INFO5_DA_IS_MCBC;
> 
> hal.c:905:16: warning: cast to restricted __le32
> hal.c:905:16: warning: cast from restricted __le16
> 
> Pls address the above warning.

Sure, let me correct it and send new version.

> 
> Vasanth



