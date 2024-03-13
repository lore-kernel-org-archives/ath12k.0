Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A392DC54791
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDFy/DERmqi1Jb2rQOYRdIoz3wrBTbxJjE/j67jSBKI=; b=NrzKRu3GPalaFT23RkjUtUhuT4
	H/kEn5GdXQvMwYNXLIxQhghK5jPEQeB/ThMyyH+eqdChoht66tgrASeVvhlBfQisJV+PmANIGg/Li
	RDogl2LqFsEZWA2GqcIktv5pQuKkiB8EO4bDEel5bzH4qObXEbLEFxTymV6QXIUBBOuJIH+h56uE5
	0wNT4I7vppqpMcIGRuGyNAKJLQ99sON8MjooHDDEr0qr9Q/fTjXCAvlE70CGpMya84lvwLefJujO4
	f6THQDjZzQsUoxCa25LDi2iMWXqXMTAerxgDglWgQCCFEHigWKclbx5V7QuEqDXb0YNmtHxO4OgXM
	hIyew+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOBE-0000000A8Z3-1SYg
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 12:58:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOBA-0000000A8YB-0FEL
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 12:57:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DBpufQ031383;
	Wed, 13 Mar 2024 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WDFy/DERmqi1Jb2rQOYRdIoz3wrBTbxJjE/j67jSBKI=; b=Jk
	9LdkGIMpIxXi/zapREb8nk5YS324LxE/EYt7y0Z7cd8MAYHvPx+Q65ShwZ1y9cxq
	snbpkg8ukh7JkhkQm9PMHWGjXicQKbhw6ZsNQl3fvq92GUfERk442JARgpGm0PsF
	SZnkIl16f/N7DtPpNrTjL8GQursfQAMM1w07ekB9UylL/0nvXVdeNnch6bW5txni
	t7TAAxuaOE9JufCJt+Ix/eDCWwX7TB4uNwwoRMP2X4dkx1XNaAXizJ9wP1wOOGlh
	uPJNq1iygMaXy8PYnSaFIbhQHuln5xyaq3viouhoPdSUNLjJZa+6diTrNzdFVitY
	taNc4cDGROeeCp8YgBtg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu62w8uj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 12:57:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DCvqep029281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 12:57:52 GMT
Received: from [10.50.3.124] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 05:57:49 -0700
Message-ID: <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
Date: Wed, 13 Mar 2024 18:27:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-2-quic_ramess@quicinc.com>
 <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jZT_D5PLqpTMDZyKpPbdhOBWT-CXLGXC
X-Proofpoint-ORIG-GUID: jZT_D5PLqpTMDZyKpPbdhOBWT-CXLGXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_055756_269533_7B429CE9 
X-CRM114-Status: GOOD (  20.04  )
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



On 3/13/2024 3:23 AM, Jeff Johnson wrote:
> On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
>> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>
>> Currently MAC HW un/register helper function support the single radio.
>> To enable single/multi link operation in the future, the following helper
>> functions need to be refactored to accommodate multiple radios under a
>> single MAC HW un/register:
>>
>> 	* ath12k_ah_to_ar()
>> 	* ath12k_mac_hw_allocate()
>> 	* ath12k_mac_hw_register()
>> 	* ath12k_mac_hw_unregister()
>>
>> This refactoring will make it easier to scale these functionalities and
>> support Multi link operation.
>>
>>                           Current Multi wiphy Model
>>
>>   +---------------+          +---------------+            +---------------+
>>   |  Mac80211 hw  |          | Mac80211 hw   |            | Mac80211 hw   |
>>   |  private data |          | private data  |            | private data  |
>>   |               |          |               |            |               |
>>   |ath12k_hw (ah) |          |ath12k_hw (ah) |            |ath12k_hw (ah) |
>>   |               |          |               |            |               |
>>   | +-----------+ |          | +-----------+ |            | +-----------+ |
>>   | | ar (2GHz) | |          | | ar (5GHz) | |            | | ar (6GHz) | |
>>   | +-----------+ |          | +-----------+ |            | +-----------+ |
>>   |               |          |               |            |               |
>>   +---------------+          +---------------+            +---------------+
>>
>>                             Single wiphy Model
>>
>>                              +--------------+
>>                              | Mac80211 hw  |
>>                              | private data |
>>                              |              |
>>                              |ath12k hw (ah)|
>>                              | +----------+ |
>>                              | |ar (2GHz) | |
>>                              | +----------+ |
>>                              | |ar (5GHz) | |
>>                              | +----------+ |
>>                              | |ar (6GHz) | |
>>                              | +----------+ |
>>                              +--------------+
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h |  12 +-
>>   drivers/net/wireless/ath/ath12k/mac.c  | 184 ++++++++++++++++---------
>>   drivers/net/wireless/ath/ath12k/reg.c  |   2 +-
>>   3 files changed, 127 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index 97e5a0ccd233..ff831faa4945 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -951,13 +951,21 @@ static inline struct ath12k_hw *ath12k_hw_to_ah(struct ieee80211_hw  *hw)
>>   	return hw->priv;
>>   }
>>   
>> -static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah)
>> +static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 hw_link_id)
>>   {
>> -	return ah->radio;
>> +	if (WARN(hw_link_id >= ah->num_radio,
>> +		 "bad hw link id %d, so switch to default link\n", hw_link_id))
>> +		hw_link_id = 0;
>> +
>> +	return &ah->radio[hw_link_id];
>>   }
>>   
>>   static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
>>   {
>>   	return ar->ah->hw;
>>   }
>> +
>> +#define for_each_ar(index, ah, ar) \
>> +	for ((index) = 0; ((index) < (ah)->num_radio && \
>> +	     ((ar) = &(ah)->radio[(index)])); (index)++)
> 
> 
> this seems like logically the wrong order of operands
> this is an operation on the ah object so IMO that should be first
> the actual iterators i and ar should follow that
> 
Sure Jeff, will rearrange the operands as suggested.
> and guess we have to figure out how to suppress the ath12k-check issues with
> this macro
ath12k-check complains about the reuse of ah and index arguments which 
may get evaluated multiple times if its an arithmetic expression, But 
areas where we use the macro in our code aren't doing so.
Do you have any suggestions here ? or shall we go back and use this 
for-loop inline.
> 
> that's my only comments on this patch.
> 
> /jeff

