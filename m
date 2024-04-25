Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2DC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 06:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exQqQwxq8GkPVwvWbdiHxuFTO2STTztbSYgfFenx+N4=; b=QDM38vIif5PoB7nv1yRi+M4O20
	z4vMAn2t7bXUR8lyt7JvF0/riz2bCJ4RvjiNtKGP4iqtKF2+gB0QMqB6C7ugONJHwj1Xb07LXjgYb
	pVNkJ3XeefZQWHFz5MQewXwtp3krVi4KalL8EG1Sc9Ni6idJMdKuuRcgfAn+Rrj7M1p2bf1LYicOh
	xX60Acf0i1+N5sRwDGMlaYH5f908rgWMsRd/IapY41Z6DGIR64+APo6xqp9xtDGB3Mc2/7xhBIBcR
	6IMb46+P2SOwz5dXEbswuhj872tcFYrMz6ivLeILlgDCsUBFvdqmP/Hx7qUWGxJIzwO2SI/bYTgZZ
	tbvub38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzsZG-00000007832-03Ps
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 06:26:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzsZC-0000000782R-1Dzf
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 06:26:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P2iqgd001267;
	Thu, 25 Apr 2024 06:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=exQqQwxq8GkPVwvWbdiHxuFTO2STTztbSYgfFenx+N4=; b=SC
	KeMfyptMSsoMrHy6t6o9tNDmUB8qH1dlTtUVxXYVFtqLiVx0t4pjc2P4hY8VZB9X
	odFH3cNbBm82uaCp/vT2NY4LlOSXiOk8O9MwCFedlgKUVZ/w3l8XDAE+YsI032zj
	1xrAYrb89II5RlSVAqmAVwwQO/j718UA/kpWp+U+VvwjuClzefQ/9acpkKyVNGV2
	TSYiXBF5HfikyTRAapP2Q9ZgEKeJfRfLdxByu2yhiX1qAVd7gJdo6trxY0i7KOmb
	Rd3IHBL3FIO9uxwGCha0VeKOSGk4NvV3upSm+MWm2xI0BVY3UC68eM7gpZnBdBKW
	JLgdFMnjzFY+RamYrN3Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenhrfrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 06:26:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P6Qh44020710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 06:26:43 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 23:26:42 -0700
Message-ID: <871c57f1-bc8f-1526-b63f-43892452413c@quicinc.com>
Date: Thu, 25 Apr 2024 11:56:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Refactor the hardware recovery
 procedure
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
 <20240424065646.1666166-2-quic_periyasa@quicinc.com>
 <7813db11-2445-4af3-910f-f3232af873aa@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <7813db11-2445-4af3-910f-f3232af873aa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 02k7xnv3JKNXbW7XUzu2FZQ8q6NqQe11
X-Proofpoint-GUID: 02k7xnv3JKNXbW7XUzu2FZQ8q6NqQe11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_04,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=624 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_232646_555853_852CB1C6 
X-CRM114-Status: GOOD (  11.23  )
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



On 4/25/2024 1:50 AM, Jeff Johnson wrote:
> On 4/23/2024 11:56 PM, Karthikeyan Periyasamy wrote:
>> Currently, in multi-wiphy models, the recovery handler access mac80211
>> HW from the radio/link structure. This will be incorrect for single wiphy
>> model, as they will hold multiple link/radio structures. To fix this,
>> access mac80211 HW based on the number of hardware in the SoC/chip. This
>> approach makes the recovery handler compatible with both multi wiphy and
>> single wiphy models.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> [...]
>> @@ -1006,35 +1005,34 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>>   		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>   
>>   	for (i = 0; i < ab->num_hw; i++) {
>> -		if (!ab->ah[i])
>> +		ah = ab->ah[i];
>> +		if (!ah)
>>   			continue;
>>   
>> -		ah = ab->ah[i];
>>   		ieee80211_stop_queues(ah->hw);
>> -	}
>>   
>> -	for (i = 0; i < ab->num_radios; i++) {
>> -		pdev = &ab->pdevs[i];
>> -		ar = pdev->ar;
>> -		if (!ar || ar->state == ATH12K_STATE_OFF)
>> -			continue;
>> +		for (j = 0; j < ah->num_radio; j++) {
>> +			ar = &ah->radio[j];
>> +			if (!ar || ar->state == ATH12K_STATE_OFF)
> 
> remove !ar test, result of & operation can't be NULL
> 

sure, will address this comment in the next version of the patch.


>> +				continue;
> 

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

