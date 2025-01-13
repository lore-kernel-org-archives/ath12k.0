Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E5C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB9Yag0S92fnwFyhY9apzQbP5Nbl8pTmCWw4QvepSAc=; b=ldJdfbwOCjjS0rSAIe1gj2Xvtz
	onQ3142XLdSMog+EiDEjBSN4KeZBvRxLSGuSj77JMK2BPnjw0iDR0bjZbOP5TCiyQ4DQD4lmtu2KW
	6md2oCVi8805HxhKIMbCS09ZmhMJshSd4kKJTnsxvq3jqLlxKJjud/W7y/uEC+3SXEzpfpgFUTFjI
	7AbAAAthdtm17Aio2g8okn1rFTyEJm29oMWaCptV5rE9wh9jEsJu7IE65G58eAXxj2MLcHN8zeSfL
	lR9r1V2B5yGEYrLvE6Ir14mBNARISONQpy4G9szQ4GpSXszML4MXnF9ZbktZZ3POjEiyjcmabRq7j
	g7CuaYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPGp-00000006DZH-3rF0
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 18:34:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPGn-00000006DXu-0Ovn
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 18:34:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBlTex006348
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 18:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB9Yag0S92fnwFyhY9apzQbP5Nbl8pTmCWw4QvepSAc=; b=k2d0/PN9SUm+ECam
	Oz8wGxFnQkSCJXGREVcvlKg8OzcpaMsdrYuzyJvqB3/lcQdO54XL/dbmeijiTQyn
	8O0WZrkuJEyhoewnIY1QkowU9zTLOXFLvyXefFgGICM24ySf47N2L3lDkn5Jf2AS
	PCk/17LREeNeztJMDhOAQ/VvoN1bDDa+YMr6+RRthwVIpG8BCIl3YhXmrPG7vCk7
	WXqfjlV34chOJvsvaP/EJsRipaCbNtOZs7UhMEG1Fvx9BgBafnGxXsCB0vSwBHyt
	c11+6mv+s+X/tbQzSAJdsvPDBQLrW3ZnMgsAtxZczh1kbrk8KEqnue9lRaaO3BDc
	IRh5pg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452939669-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 18:34:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-218ad674181so99407905ad.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 10:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736793274; x=1737398074;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GB9Yag0S92fnwFyhY9apzQbP5Nbl8pTmCWw4QvepSAc=;
        b=ljR1OcMAxoX9ZO9wrN1b38PlVOtlF1BOJpJWq+u+iKqFx9ofNTkEOTdd2VfKABKegC
         mBsGoInE9Izrb3egvNPQmJQ3LdjtAMWabv7ywUTFFaOqjgS95UOPfpvPruyAf1iJE1d0
         iVrL8WlBTuE1kUcUddx/++a3k6g8e/tFQSMGhMBYoILgfaMCW7xuhGrkfQLknwxah+wd
         bA5bhbqzpjjqjxo5Q6x9rsrjXpo2/Op1VpgSIjIoFW5MNCw52hmcGu1kPw3SgUwDEGVx
         EXwUJzOgWo9Gvts5GEitYRg5E5tC/10MEc5K4e2EBeilysdwR8PKydQTEMqko5iNjb+I
         CkjA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgMb24q3sr/kpPALHMcfKzcljFwhfGQ18vAPC1lXUOcSLlOo2GpbQz0+lcr5hC8aBWk/lFEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVOs6gIQ93/XYsg9WYLoYMJ3WWzqcLV4UMkWu32sfxVAmjOZBM
	QfrchO0v3rtevaN04CgVQ0LkMA/a5YdzqqWwXmhddrhRGyhPQolu9tNZc+vlteVZlZsRg1vnrxO
	PnPRRIjGQIy0iozJAPj7x5wNBDEcgMA3Ld1389MN3JlnWGkKOBAyE9tvri0/K
X-Gm-Gg: ASbGncsxl3JziFivUbxnT1LiMtNweOzLantCZUoDaNQhEgCauiyLmbFp19Mvl/YNtLz
	ZlMZsz4BmBLH2GQvA9j3Kz2HYlBsqUr4LGapii0jRYuZuGWS0b1esoM3QtJWRg+zj+hZzaIZula
	1q0wqCBigpBBvzdBrXUXtCRdV/J25elr44vllpsQbYME4TaJCBE6E4qTwf4xaSe9REWC5vxxnCT
	5l1tWwZ2XGzVSXSBD88+OUbqv/gzVfFsi6RwJIgr/Dv/28ml+/YeBaeUvMuSacUtNEQwVEwHF+E
	pMHm0xmpF4UqS0fScNoNFliLO6kViXPftjsBHr91i3WI9Xa8Mg==
X-Received: by 2002:a05:6a20:c896:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1e8b13d1ed6mr23260278637.7.1736793274567;
        Mon, 13 Jan 2025 10:34:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVmLbJjKIXrU5OizlvLle+AriLedokFWRNIHyrvXHi3TC80JLv+9f9ICoPLpMe2ANKiddz4g==
X-Received: by 2002:a05:6a20:c896:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1e8b13d1ed6mr23260251637.7.1736793274232;
        Mon, 13 Jan 2025 10:34:34 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40681b3dsm6185368b3a.153.2025.01.13.10.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 10:34:33 -0800 (PST)
Message-ID: <afd212a9-093f-4b03-ad84-0436bd99358f@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 10:34:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] wifi: ath12k: Add API to print s8 arrays in HTT
 stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
 <20250113071144.3397293-5-quic_rdevanat@quicinc.com>
 <1e1b5159-3f4f-4876-9e31-11a1f5b3584c@quicinc.com>
 <7d31615e-d5b3-40db-8de1-554918c18212@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d31615e-d5b3-40db-8de1-554918c18212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: quca0WOX00WmF4QVmxv86G_PraxNNfRE
X-Proofpoint-ORIG-GUID: quca0WOX00WmF4QVmxv86G_PraxNNfRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103437_266986_BA45895D 
X-CRM114-Status: GOOD (  17.65  )
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

On 1/13/2025 12:37 AM, Roopni Devanathan wrote:
> 
> 
> On 1/13/2025 1:50 PM, Aditya Kumar Singh wrote:
>> On 1/13/25 12:41, Roopni Devanathan wrote:
>>> Currently, print_array_to_buf() is used to print arrays to HTT
>>> stats buffer. This function supports printing only arrays with
>>> 32-bit unsigned integers. Add print_array_to_buf_s8(), which
>>> implements print_array_to_buf()'s functionality to all the
>>> arrays with 8-bit signed integers.
>>>
>>> Sample output:
>>> rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
>>> rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
>>> rx_ul_mumimo_target_rssi: user_2  =  0:-128, 1:-128, 2:-128, 3:-128
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>>
>>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
>>> ---
>>>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>>> index 77c51269669f..92935134735a 100644
>>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>>> @@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
>>>                       footer);
>>>   }
>>>   +static u32
>>> +print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
>>> +              const s8 *array, u32 array_len, const char *footer)
>>
>>
>> Who is the user of this new function? I don't see it called from
>> anywhere. At least have 1 caller to it in this patch?
>>
>> Or else this patch fails to compile with W=1
>>
>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:52:1: error: 'print_array_to_buf_s8' defined but not used [-Werror=unused-function]
>> 52 | print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
>> | ^~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
> 
> This new function is called in patch "[PATCH v3 5/6] wifi: ath12k: Support Uplink MUMIMO Trigger Stats".
> If we are facing this warning, we'd have to merge this patch with patch 5/6.
> Jeff, Aditya, can you please confirm if doing that is okay?
> 

yes, please squash those patches


