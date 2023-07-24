Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA7BC001B0
	for <ath12k@archiver.kernel.org>; Mon, 24 Jul 2023 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Hesz0AC/AJdMqHdOOswB3RbwH67hQnkAZl1AwHc4dY=; b=Oo9OHJMWL60f/e
	yT7GxvYuQ0/6o8mskLNOvFqb+0Ib+RvZ2VKLMHEiU9mI4+SmI3N9vcnuvT/pJYXuU1SQXqtEBRXVG
	SIPDUfs2ZUuT1dbI2oJfyasKk05c14tAuooof8MhMHZl+16dKvn5FbKdFiI+X/4EAy7PUSAV+sQCp
	ZwhZJgugfy1gzEhFRtiTsMy3NseblU43JVPxRkJ8nHLTU8EuzFE6oJRGWAMxjmehdw8wV/P3BBJW1
	DLKedYrYeJHE5v1wlFkGHXOtcz8uho8hMTDyI1Qf3taycrNWznvSvAulJDKDDiUIxKEPBuUmpPEli
	59H0EdG4QjzKNSg1RvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO02P-005ALD-28
	for ath12k@archiver.kernel.org;
	Mon, 24 Jul 2023 18:12:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO02N-005AKL-1F
	for ath12k@lists.infradead.org;
	Mon, 24 Jul 2023 18:12:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OBC9I1013704;
	Mon, 24 Jul 2023 18:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EKnswQdHDy/KVeHfCsewsEQNTYldae0s7gQsCXqe6Gk=;
 b=kPfox8bQQm621FOiJwElpFR+KfkjihtjnF+7mtlWFIkwLDfDF5hF0YVe+foJWYtDTr+b
 u67L2kHiic++lTVO4U5W8+5qIetx6YC7ma1vULEGDuVRW6/fdpGKBXOZA74ahl16I71n
 fWdzshlMMUk4h3vTosM6tYVPaz75YgacqXqN+uVr1YNPdnbFCOcHuEFH9jDGyFzL4//P
 KT7jFKXZQvxWkaaAzUUiuXZEs5ES7sMeihNOKarnmI30Ffho9DML04wQTDwzlb1uaPjN
 vZ99wrgCqvYzUjkeDYZgLkbgJaJ5KYXmrSynagdPjjuFMAQmZ1Zmllke4WDVRVtwVekG Rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1pfh9623-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:11:55 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36OIBsJF015821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:11:54 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 11:11:53 -0700
Message-ID: <67961f9b-1062-88e3-d634-35f015dfbead@quicinc.com>
Date: Mon, 24 Jul 2023 11:11:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 04/11] wifi: ath12k: propagate EHT capabilities to
 userspace
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Pradeep
 Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-5-quic_alokad@quicinc.com> <87pm5xaqp8.fsf@kernel.org>
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87pm5xaqp8.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a0AihpJ3akgZB0ID4edEOwkpWkD5cFNN
X-Proofpoint-GUID: a0AihpJ3akgZB0ID4edEOwkpWkD5cFNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_14,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=974 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_111203_428450_5BF74940 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 6/15/2023 4:51 AM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
> 
>> Propagate EHT capabilities to the userspace using a new member
>> 'eht_cap' in structure ieee80211_sband_iftype_data.
>>
>> MCS-NSS capabilities are copied depending on the supported bandwidths
>> for the given band.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu<quic_pradeepc@quicinc.com>
> 
> [...]
> 
>> +static void ath12k_mac_copy_eht_ppet_ru(u32 ppet, u8 ppe_thres[], int ru)
>> +{
>> +	int i;
>> +	u32 val = 0;
>> +	u8 ppet_size_ru = IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE * 2;
>> +	u8 bit = IEEE80211_EHT_PPE_THRES_INFO_HEADER_SIZE;
>> +
>> +	u32p_replace_bits(&val, ppet >> (ru * ppet_size_ru),
>> +			  GENMASK(ppet_size_ru - 1, 0));
>> +
>> +	val = ((val >> IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE) & GENMASK(2, 0)) |
>> +	      ((val & GENMASK(2, 0)) << IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE);
> 
> This shifting of val looks weird. I didn't check the spec, what does it
> do? Is there any cleaner way to do this? And should have a define for
> GENMASK(2, 0)?
> 

I have a follow-up ready, based on top of the fixes you already made in 
the master pending branch, which cleans this up.

Also noticed that need to use hweight16 instead of hweight8 for 
IEEE80211_EHT_PPE_THRES_RU_INDEX_BITMASK_MASK. The new version fixes it 
in this patch as well as in patch #6.

Should I send the next version?

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
