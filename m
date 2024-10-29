Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFFD3A66D
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE0Hoip0Kl6UtSIF6RYXnXo6do0+3uvKnODb20JpF00=; b=s/6EoZ/uVs1jzGCR18LxvvIP9R
	d03BPniu8Wklk48wbCNdaQ2TEoPWWo/ausxil653nn5Gdux/OimkqTs7h/j/61IQ6wy9gPhyOAWcR
	l9VmZNn7Q3kk38MeG3gPqSRKV7ACaNYawSKdx22o7wRVeDGk5Yirnmo+3MtfZpzQ1moJ8cwz/DSyL
	BbFv3ZRcrsNNiGlpGpibtYGmXb3V+ZbXTH0tQpZ/0tDDwFzO1/rf+M+yxCfc5fiK26lnV5Gxg6WPo
	oV3FRPwIdalJVucZSLuX+/6VOPROW4jV2sDmxcx0kU1j1/7L+BQ1LUBN4rXpXFSeFnC8wN+JzLECF
	X9YkXKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ocS-0000000F2NO-3GcH
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 15:58:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oLM-0000000ExbV-3nWz
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 15:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34533A41830;
	Tue, 29 Oct 2024 15:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F312FC4CECD;
	Tue, 29 Oct 2024 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730216475;
	bh=pdPLci/43bBcZPIhgqIrydqtHIVkbRa2w7Xlr/vW8Jc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kj1agXJq4u3wR4mn25WZaEULb+HKWcNdakwp0AbFP02sYZSQA5A/vLyHC+TiDhU7C
	 BMsNQx0IwJL5KkzgYPQRD3ozhkiflT10OUEKr8rjBCTSoSlS0ioEQeI7KkSbUGhvjq
	 tGCa9Mf6pvpGze0aWIaB49AYC5ZJmYPcMD6PV/TojCNxTLYs/K1RLHeKv2Xfvu3T1r
	 ZD4LY4XD3PvESIfx7RodW0wRTWn4LDS0u/8/hJr7SGA5kFhsQ6xevDBDet6rW4ytrj
	 YnK4ss3ddcoXNJ7OOdGZ/OrHKAJqXH4dnS6cnZK8insFn7OXfRuJHNB6fAb4mK7+o/
	 bfJTNxzjGiAdQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 4/8] wifi: ath12k: introduce ath12k_hw_warn()
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-5-kvalo@kernel.org>
	<b989b83c-f911-4d67-b703-1ac3ee219559@quicinc.com>
Date: Tue, 29 Oct 2024 17:41:12 +0200
In-Reply-To: <b989b83c-f911-4d67-b703-1ac3ee219559@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:38:32 -0700")
Message-ID: <871pzyhq7b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084117_028868_A17905C2 
X-CRM114-Status: GOOD (  14.18  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/23/2024 6:30 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> In the following patch we need to use ath12k_warn() but don't easily have
>> access to struct ath12k_base (ab) but do have access to struct ath12k_hw (ah).
>> So add a new warning helper ath12_hw_warn() which takes the latter but the log
>> output is still identical but uses the struct device pointer stored to struct
>> ath12k_hw.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/core.h  | 2 ++
>>  drivers/net/wireless/ath/ath12k/debug.c | 4 ++--
>
> Qualcomm Innovation Center copyright missing 2024

Will fix.

>> --- a/drivers/net/wireless/ath/ath12k/debug.h
>> +++ b/drivers/net/wireless/ath/ath12k/debug.h
>> @@ -31,7 +31,10 @@ enum ath12k_debug_mask {
>>  
>>  __printf(2, 3) void ath12k_info(struct ath12k_base *ab, const char *fmt, ...);
>>  __printf(2, 3) void ath12k_err(struct ath12k_base *ab, const char *fmt, ...);
>> -__printf(2, 3) void ath12k_warn(struct ath12k_base *ab, const char *fmt, ...);
>> +__printf(2, 3) void __ath12k_warn(struct device *dev, const char *fmt, ...);
>> +
>> +#define ath12k_warn(ab, fmt, ...) __ath12k_warn((ab)->dev, fmt, ##__VA_ARGS__)
>> +#define ath12k_hw_warn(ah, fmt, ...) __ath12k_warn((ah)->dev, fmt, ##__VA_ARGS__)
>
> for consistency should we do this for the other log levels as well?
>
> are there places where we currently retrieve ab just for logging where we
> already have ah, and hence could avoid the extra dereference?

That's a good idea but IMHO the cleanup can wait after MLO has landed.
Right now there should not be many places where we have to use the
ath12k_hw_warn() variant.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

