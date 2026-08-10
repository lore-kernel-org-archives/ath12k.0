Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC756C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 04:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C18zYvwGVWpEleb5PKvoQNV7Ix9APthKPxgivVijLzQ=; b=YZfxZd1S+IlT6jcXYntXvUdiuv
	SWEkweIR164+5dROe3ZAr7AI3Hl4dKhpuBOyhhc7se+u5qspprTlMil91sjN18FT2m/XpTxmcsjfE
	+vkY3sg1qUevAJ6cJXP2kEpc7iNPiUiPZjQcbI2uGvtHArxKpjwXcIRZPXKfNbWV9iYHRbAVIbqRW
	pcyyIotuPzI0WYWsQgkssqp3UqHvid6wn6kasmZlzbsPKFQ0V92Znv5fnBYXQOv4M0Ia5HwylV+8h
	WpIBban7pmE+jqs0A8xLuOPd0/Xr+FAdj7n5MWJaAfVax70ZPEmKo1PLx57lcKM9+U6wrfSrVE2nL
	F6THr1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1d-0000000B0k3-1nL1;
	Mon, 10 Aug 2026 04:54:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1a-0000000B0j6-3fmH
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 04:54:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L6oYO3476183
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C18zYvwGVWpEleb5PKvoQNV7Ix9APthKPxgivVijLzQ=; b=jvkGBKnkwU+vMGHf
	5X4AdCizFroQW1msTHs21MG6dVag992Y+AnNErco5rFzTVITgdu3YXzZgUxQMiYJ
	YdiH1/xmlJSgcst+JMStBH5VBM9x/v1B1GuhIIkdnRSYA5dU7Hw9yYYy64SHeefd
	Kiss35RAYVjvH/reR4KpIwZkkEgzOQh40uHZlrds2WyPIkHHJ4aQOhl8Euepnn1P
	LEVGcpHty/WiQijVL7seDohz0wOcRJ74rYR23D3MaaApPK/Ki5cRyt+WrWPV5RyC
	IxKyuJP8MHg7YxqxyUf1BHZ+hHd1QUsqUf330HnSp2DOlbLeDWITL+wVe2qLpyp0
	jDvpXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cvb4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:54:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so37763195ad.1
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 21:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786337649; x=1786942449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C18zYvwGVWpEleb5PKvoQNV7Ix9APthKPxgivVijLzQ=;
        b=EzpJ6eclJfwWBiUrwVQ3EyqyRraogI7UdpbKhsbaOwsDuHuROXuKTaTIXp7i+YJqqL
         5IjwWsclAue9rF/RTkX+9Kq1xW1YKAiF3FoF8iOHLPqokieHE15Za0lS9Q2gCq2JWEb5
         FrkEz3Fot6XKTILinFXMIeCcEE7ETcZ312Scn4bObl2K0iKy8MrfOuMi1Uluk5ACVqXi
         CM/JPz9DbXghl9BqQCnwgOdcQFztjsJ+rPoEDzug2y50uiGJUzPHOvB797PKTsQhpxnW
         s46hbz2WNRF0F1LjLuFkYu+EATiCWBMJfdnTKWWW5Co1Q2Ga62Ucc1BUqovSkbVc8Klv
         LGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337649; x=1786942449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C18zYvwGVWpEleb5PKvoQNV7Ix9APthKPxgivVijLzQ=;
        b=QwfAe7bYtLzi9CYeFIZ1lsdLX2veN16ya45EKBCvKrjR7I6ahzfkWWx09qm2b2AxlR
         +GnLWeYLQLuW1KK1flvG0/0brfZPa2BRfLiLQDdARbZT3Q2zVQJogaUJYeMccLQs+a/x
         N4yEiROVtFRQ4A3/BVIqmEbUcCbyofWUacUHZVHVQwZWxdSfQev2fj4J2TuEri0+cOBt
         yq+sAMtPrsptBh20cQY+irsOScUzh6PbmC5fjsHNbqiVHrCgTmRPCH8uVAQjHs2obS9D
         oqoJn0YYc3Cu1s8f7UYTiBEf/ecHpqTep2sjtDO6H3LqJI/yctC5TqP2ZyOfarmf08Dn
         kA4A==
X-Forwarded-Encrypted: i=1; AHgh+RqyCUDSXL3AMNLbASMLIKTfhrLpOY7yAsis9Kk8nquMQFymy/iz+SdWI8EuEqeZ54hWfdjlWmw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIhhqj3TefDpeCHWkUMF7MLXsdOggsfQsjYnA5fq8OT4p+NlwG
	6uREZLN1+eyO2UhAsZOH0xQhUia7VPn4j2EIuTyMuUwmVDe6IB/XP/bjOtKPioMEQ00Xkrf8FcD
	LqzpIKda7n2dTmgDf/Ae90qpGbGGzoCUTZBjH0i+SPs/abhRSLHQNw4VefNqTYfFJLWoZp2Jb
X-Gm-Gg: AR+sD13Je5lM6DCbuxphP+JGjLNaJGCUtIzHOdD6dBsMkruMQMQvAgUplsVcg5azpiw
	mRDJAwXvymRASmpFMe+axKLvd0H+/84gZoG0UFUF1qGbKxFwHyAhjuHBPHYu/KtgwjSLY/BY003
	XjcB1qHXPJYUn8HiByhNi0KGH23aO0KhRuocCrRrfEVSdU9RVRrzfSNLBK/vvBU48Wd4bFjwJ6E
	LlOijajs4LijzoCb3yDLNvEAw2gVkv+1kXvL/lQg5zCY28kl/uVu9jZcZQ3I1zvXJALhOKbS5Qz
	wh4LOsGl8+c8PSxtVp+sk+XSPFFSrts9dWtVNBJqtDCOxD/BwwLj6wVkDz+OncWMkh61zCPpfIs
	ufMzM5ZTeVVQMbZ4vv0SWGSFWYWPjXMxC6ymbK4GiPUIjTbylW4O8Lmgc/UpJU9ggBzcTIFq+az
	FtXhlOYHYnbcV25Ejq+g==
X-Received: by 2002:a17:903:8cc:b0:2ca:f417:396b with SMTP id d9443c01a7336-2d2b2d8ecb7mr194927635ad.3.1786337648999;
        Sun, 09 Aug 2026 21:54:08 -0700 (PDT)
X-Received: by 2002:a17:903:8cc:b0:2ca:f417:396b with SMTP id d9443c01a7336-2d2b2d8ecb7mr194927295ad.3.1786337648523;
        Sun, 09 Aug 2026 21:54:08 -0700 (PDT)
Received: from [10.79.124.186] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm28814835ad.3.2026.08.09.21.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 21:54:08 -0700 (PDT)
Message-ID: <b9b4aaed-55d5-4230-8b6c-edc41f8ccfea@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:24:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/8] wifi: ath12k: fix out-of-bounds access on
 TX stats arrays
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-2-pardeep.kaur@oss.qualcomm.com>
 <34ab0833-45fc-4e21-bbf3-bc5a167d9bde@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <34ab0833-45fc-4e21-bbf3-bc5a167d9bde@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oBhbnmlMRVeWVG4KdLBfgfqgr8P-_HyE
X-Proofpoint-ORIG-GUID: oBhbnmlMRVeWVG4KdLBfgfqgr8P-_HyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX9m1MqTBLel1k
 JQn4AqejxA57i390qydwckBmpddKnClsQRH+s84umDPA4XlQtIXQLjkgusnbGNZbYdgIRAmv94j
 vh4lSemwIN1HbWlO7YU4plJBjMcC1J9q3DewaHU46MkluYmAhsiER96MRgdZx//IpJ++cZfJc4q
 9cKCFCjFRWVHfWmvpdoHrUtZjy9GnNUYVRbHgwau4cOJoYHHGsivGgG7aqCmxVhrpT6nYDY+SDX
 idMZHr7TzgfM3hrUcph4JhXqY+w05ZqCqJR3HvjnnibIW/LIJAB/F8wkA/p2NkI0fGaMmOnREYC
 e8KO7YbcJGBpSwO9I7iByGIZPanwgjMvb9NgccsUehptm0lTZpsHGoFqtZbBd2Iiz619rb+oIiW
 pqHhfh5/KLPnQyOvyAVTQE4bCAqGWzDPTp0r1GOrpu7l4z9k/5IVtAPhm/8lKnVMkzIN5FpNLTj
 s5jspavOEVvKiiC2W0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX1qevLVXgVTXR
 EIyqB30VDxxKA0y3fJhp6N9DgA+l8BWqWFM70xtbBmF2J+JpIzNMAqgK5HJ9FfiLAI+pZgdD5rj
 VSTVgdZflvUHA6cjBcE+ZLUrGKKvqWQ=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a795971 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ozm0H6XBQHCMpJSGI6QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215411_004030_4471E2C6 
X-CRM114-Status: GOOD (  15.80  )
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


On 07-08-2026 07:37, Jeff Johnson wrote:
> On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
>> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>>
>> The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
>> are indexed directly by values read from hardware without bounds checks.
>> Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
>> MAX_TQM_RELEASE_REASON respectively would write past the end of the
>> arrays causing memory corruption.
>>
>> Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
>> each counter, consistent with the existing pattern used elsewhere in
>> the ath12k codebase.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
>> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> index 587d58eeccfa..632230e77802 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> @@ -582,7 +582,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
>>   
>>   	wbm_status = le32_get_bits(status_desc->info0,
>>   				   HTT_TX_WBM_COMP_INFO0_STATUS);
>> -	dp->device_stats.fw_tx_status[wbm_status]++;
>> +	if (likely(wbm_status < MAX_FW_TX_STATUS))
>> +		dp->device_stats.fw_tx_status[wbm_status]++;
>> +	else
>> +		WARN_ON_ONCE(1);
> My review agent tells me this will now double warn since the default: case of
> the switch (wbm_status) that follows will also ath12k_warn()
>
> So for wbm_status warn in one place or the other, but not both
Thanks for the review will handle this
>
>>   
>>   	switch (wbm_status) {
>>   	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
>> @@ -984,11 +987,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
>>   		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
>>   		buf_rel_source = le32_get_bits(tx_status->info0,
>>   					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
>> -		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
>> +		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
>> +			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
>> +		else
>> +			WARN_ON_ONCE(1);
>>   
>>   		rel_status = le32_get_bits(tx_status->info0,
>>   					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
>> -		dp->device_stats.tqm_rel_reason[rel_status]++;
>> +		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
>> +			dp->device_stats.tqm_rel_reason[rel_status]++;
>> +		else
>> +			WARN_ON_ONCE(1);
>>   
>>   		/* Release descriptor as soon as extracting necessary info
>>   		 * to reduce contention
>> base-commit: 691e5e43b2aa
>> --
>> 2.34.1

