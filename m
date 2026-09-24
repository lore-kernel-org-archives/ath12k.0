Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBBCC9830E
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLM/cJ2VYwTDoMAQGqaupkr95A99pRG3YltmItgb86E=; b=leKGx3ru0dAKQiqqmg+Mi2v+Mv
	89WHsvIGUHcScS+iB0pObX3+Bf6QzcjUbFGA/LCVoYu+fCbUx/wL/G10Ys+XRPL7vaGM0rA973mKv
	dLnzSHnKKMQCob2r09MTrT04NQn06eNUO1VNhxfbg1kIke8sszMz2H7MjdqJWcN6WKJDT2ys62Y1X
	3j77YM5UzLURF4AJBDS55FSquVY0IhcC3Y7IZHWdll6+oQjR+Ji3tQWqznQ/8KnetBTNKh6m1zja+
	Y82tP8aMrIebodvPk2NSRpz+5+exMP7S72Ei5diWdLLmYcjeGZ5K0dMkoUPTJa8bu2kF6B+od0TaU
	5d2gZD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kXv-0000000BHK0-38M2;
	Thu, 24 Sep 2026 14:35:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kXt-0000000BHJY-48zh
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 14:35:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OEW7gm2322323
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 14:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLM/cJ2VYwTDoMAQGqaupkr95A99pRG3YltmItgb86E=; b=a8Q/BM3p3xQ6DK+5
	aJKbldloDDKyBW4VnPWd4bQQsuzZyIhqTCa1zVVIzCN+R1kDZNp07ZzKrhd2zfE4
	GmaPPGVXMrAKPxZybeGwaj/uWTzHejSHPuPBvwVMqneB4i0Zhem1k1q4Xxmz32Mi
	23Y4dbMTRBK4qRwOr6lXO7hF1C4cjtUCGYA2D5E5Fn0jbbbmLRKI6XLF/0X6Piuq
	AD9VcK8m+4XxTDZFm67IKLPIJHyEIhdWnsCbrT8ldM0Um0NNe9rrHnNO8o6if43G
	NvB23V0s778wcY/a5O9FVi2V210f/u2JOboIRIj50ESPnG3SYIAMR4y4utvg5KOH
	D9mpAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8r0gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 14:35:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so33995475ad.3
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790260532; x=1790865332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLM/cJ2VYwTDoMAQGqaupkr95A99pRG3YltmItgb86E=;
        b=Hz4kziJWYQlEfmJ+zpE3R1szYt5ioaMnBD0VjUBroc7hAIxhJwvz4yGSSGh9fgoCCI
         qkvpuuBOohUYMwEWDW0oPlJJp5rA+9CPvHVmegrCxNVlogE9E7859Vyik8m0zXshdOdF
         UMt6dK5YhAokFbXTONACLrTJzZXSo1P8CUU73wydrxK4H2Bu9yV5cn9iq0BQUZMu8ULO
         RVBWzuAKKbvK5djeAtzpuEe7nB3OXVB/zosTka82c0UEEuTpnKhcmKSDxyoM0uZ2oaOy
         3W658WAcRqAU8no5FHMFEJHrtw1T/TdO7t/xtTJrvCcnOO6tyi3aj37FErdCMjv4CEBC
         4Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260532; x=1790865332;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLM/cJ2VYwTDoMAQGqaupkr95A99pRG3YltmItgb86E=;
        b=x3F12YTZoqio1jI7bepVgskJ4MSlZA7FRvqjjmN1WkszEoVBgIHOZwpWqkzxkvBxf2
         FUEwzU7sEfxAHFT3SOBsPDyOS4fdZb9YPPjOknfnDZFmgjT2Xn9NF8jIi7Jo/JBURmpi
         PSO70oVhLqVlNYSaEz4Rs2h/3mgdXpRKraW2qdPbdwesS780i8ISXV1y3HuvN95fBKjC
         nYu3sn2kIWcL0GzbNnVt7ez7dhFBao0PmXLfrW44Qy2+Al3o4DVy2a9HOMa+w67ZfqfK
         /k53K5P3KfiP6VDQMNvDW3hNjgGPAicoE0rY9v959K2b0xNPcS1agZMLCr6oTHp9HdQM
         xryw==
X-Forwarded-Encrypted: i=1; AKwUvBxLvaQhhMlk4KaoVT+0ZHbAERMkdGg5nhA1NY4izKT1CJgc0HkZx9IDa3HkffGp8HryGiNjZhk=@lists.infradead.org
X-Gm-Message-State: AFuF++kfzs6/1qck5YYJDF0f1XGO4N6s9TXsLxbzNEPLjYLLFIXJ7/Jj
	m2uW14PpGAggnvNB5hIuTipQLZW7P1Oi2oZaY6w22nWkAfy5lytWCLzXN/eN6SYB+bnZCEAuwLn
	YcZW2ZCXQtgypkZQ9erenMsSoisino9mma6GVxyc6n3IPJZEvvNKQJX7XDYQv5LI9
X-Gm-Gg: AYBFou303459kzQRTmADsaSHlVyrbO+8sw+Fvr0ajpAEXpivQyhYfiS4TY+vVwca8qk
	SdB8Xlr0IafsOwxYkiW5ZKzN9j+cI3fGbwoIlxzL0RLzZwD/9igJVP+nAV0kNrNV4HquHLMGXdB
	3F2/XPKysNvY4x3QBnsZ821JC6u+Zdh/qL3ATtY9eyULvq/LN01bN5aIpCZJAJW1FMoFaQNPApW
	K9Re9a+Mx97wtqfjcbSSmAyriGDZnZpVE8as2EHFrzJrf3YOW8nrXU0j8DzFE73RT5gc/IINdHT
	/LXboWzXxWFAZ8GL2X45Q8PfAyr1pV63smWohe34jtVDSdt3VvRLLBoiKtahUtQYnn1MEhF2vXN
	Pf3Kze+D7zg4OT4ZFgOMmNadb1uXbDV7eY39m2HMboKL2lK+4r1zMIU/gZg==
X-Received: by 2002:a17:903:24e:b0:2dd:c100:a5e6 with SMTP id d9443c01a7336-2df7dd8cd88mr22612845ad.58.1790260531392;
        Thu, 24 Sep 2026 07:35:31 -0700 (PDT)
X-Received: by 2002:a17:903:24e:b0:2dd:c100:a5e6 with SMTP id d9443c01a7336-2df7dd8cd88mr22612535ad.58.1790260530774;
        Thu, 24 Sep 2026 07:35:30 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm28253165ad.9.2026.09.24.07.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 07:35:30 -0700 (PDT)
Message-ID: <6de23f77-4090-4093-94d7-0f5482e4b495@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 07:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer
 lifecycle issues
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
 <c55d15c7-cbdd-4301-95c1-650db2a8bc05@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c55d15c7-cbdd-4301-95c1-650db2a8bc05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MCBTYWx0ZWRfX0aG4JVSALOIl
 pRS1VaOp3rfqcca+P4MnBJJq9Z6TzLCzZghwLaXZBIT8upFGjTwJ5+T5sB44bP2GY5bgJ5vTcRt
 WzvaOo+JFtA5Df/HZt/q0dow2c2BIPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MCBTYWx0ZWRfX+iHAhlMPDAPF
 RLx262YOqmxzwtzJRcc3LNNt2cYbiP9DrAaLhQjZoJ8JgHrzSauhxuYrgtV03rvMYDzAYgpMt2f
 ZGBrnfD1MqGZE+Su8xcFmqxq8qMRLCTX431DrbtdJmJ2ip/P56hkq/KqaXi9Uaw5SjYsdRoAzNR
 p5dnbray75xnTc0O5N4Yn6D7kZdaPHcdBmO4dAMTqe0QMao2Qlwd3w1Olom+pFFr+jHpA85rizQ
 v9VzxJrWntLRtZj+bXBDcynn+TvDPOKJA4KzR6X/RfKMwCwqTJua9Btm6BHcMk0ni3ZeDJ9YFvY
 Qs8N9a2s8bStjU0WJy6ApHh3xTgThOrxRPExOsnuZoVKRBsE/NZOWQPkTqzDnGqfKrBDLH8+T44
 Ghnmy7aydT4C+cp+eEcwIcVDElBz8+zHon2l+jTigdaqixdnGfvQr9EGgDHBnCZiSW2WtTC3f3w
 g3jkBq/OmCB8aXYrgOQ==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab53534 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HSTN1gPS3U9pUldlOVIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FkBcet4e6w4-PzZbHUBaRY7czEAUpXrl
X-Proofpoint-ORIG-GUID: FkBcet4e6w4-PzZbHUBaRY7czEAUpXrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_073534_141955_7C89677D 
X-CRM114-Status: GOOD (  13.58  )
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

On 9/24/2026 12:48 AM, Kang Yang wrote:
> 
> 
> On 9/16/2026 2:03 PM, Kang Yang wrote:
>> This series fixes several monitor RX buffer management bugs in the
>> monitor destination path.
>>
>> The fixes address leaked skb buffers, stale monitor descriptor state,
>> object lifetime issues, and incorrect DMA unmap handling observed in
>> various error and corner cases.
>>
>> Kang Yang (6):
>>    wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
>>    wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
>>    wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
>>    wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
>>    wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
>>    wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
>>
>>   drivers/net/wireless/ath/ath12k/dp.c          |  9 +++----
>>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 15 ++++++------
>>   drivers/net/wireless/ath/ath12k/dp_mon.h      |  2 +-
>>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 24 +++++++++----------
>>   4 files changed, 24 insertions(+), 26 deletions(-)
>>
>>
>> base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
> 
> 
> 
> Hi，jeff, do you have any comments? 😀

If you check patchwork using the Message-id of the individual patches (not the
cover letter) you'll see the status is Under Review which means it is under
active review. For example:

https://patchwork.kernel.org/project/linux-wireless/patch/20260916060325.854-2-kang.yang@oss.qualcomm.com/

Patches transition to that state when they are placed in my pending branch.

For best results when using patchwork you'll need to create an account and log
in since anonymous access has been severely restricted due to abuse by LLM
scraping robots.

/jeff

