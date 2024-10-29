Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CDD3A679
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6TZs3INmwuR95PKMSScSuT7SeyDleYAC33/5t+V480=; b=ZvnXBovEucFsHLsSMGGRjUiMB6
	NaIqP/0+YIskItMybORGYzviOe8m8zi4AWOUOX/Eej9dohFWzeXQg+WiHoyku3pa/jhmXLYgSdSoz
	e99PqduYi7Lsy062D+cqO6Z6Xf+ag0wY932XtEFeTBI/CAgKwkBradAmzGuTdD4uAM/I12FfqCn9s
	ukKuP1TyC+pTQuGjY3BlkRiWwB0xofjZLXrD1kRDfAZb8jDRc2TGw6Zi8a7A/i2rMB6j3U8idTGPL
	ubRs0bzhPG2KESshwPO1bvg5wVJcAgDIhcT4Gj7JA91viAq6psemnPRYnzgG1STIBABxoBN4j0JxF
	VPnlpaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q93-0000000FIVN-3UXE
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:36:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ofh-0000000F2yF-0uxD
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 16:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69E13A42FA8;
	Tue, 29 Oct 2024 16:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E944CC4CECD;
	Tue, 29 Oct 2024 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730217735;
	bh=5RnZNa0gGv94StUKJ60e3iVKJyhd1vTLQVj1lPWxRdU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=D6PR3LftX6EZiwwOnRQVfHO0REuSUf8N0SxpFl0XevwoBiUhPXIrn/RHiB4LpWH2G
	 fUWbhsSXvCqSbUUYxnuIcS2mN9865NFIr+cjr0QfWGIZBiU1VE9+eK5wGbzgZYmvvI
	 +2hDXm6sVy4gT1se4iHN/cDvuiRTAfI8y88qfbtwdfA6Kljx3DvQfifiq6LdamQ9E5
	 gwEpbJCztXYN98rQgZjqSw4Q4pgjXnSyhGKxlymZmgUhdL+ovq5xWmCyVo6PbJK4Ju
	 EoifKsAPhJcYvZSKqpPPX5+b6jpb3nbDbjZCCUyQU1etgz9BmoTYybSHhltGOhsoXN
	 InkeqQClLhumA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 7/8] wifi: ath12k: add helper to find multi-link station
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-8-kvalo@kernel.org>
	<05f2ef12-5176-4742-adb7-04da614995fc@quicinc.com>
Date: Tue, 29 Oct 2024 18:02:13 +0200
In-Reply-To: <05f2ef12-5176-4742-adb7-04da614995fc@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 09:01:01 -0700")
Message-ID: <87seseganu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090217_347490_0582A840 
X-CRM114-Status: GOOD (  13.76  )
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
>
>> --- a/drivers/net/wireless/ath/ath12k/dp.h
>> +++ b/drivers/net/wireless/ath/ath12k/dp.h
>> @@ -1796,6 +1796,8 @@ static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
>>  	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
>>  }
>>  
>> +#define ATH12K_ML_PEER_ID_VALID         BIT(13)
>> +
>
> this seems to be randomly placed without any context

Yeah, it is. I'll try to find a better place for it.

>> @@ -87,6 +101,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
>>  
>>  	lockdep_assert_held(&ab->base_lock);
>>  
>> +	if (peer_id & ATH12K_ML_PEER_ID_VALID)
>
> where is code that sets the bit?

That will come later in patch 'wifi: ath12k: Add support for HTT MLO peer map and unmap event'.

> does other code elsewhere need to mask this bit off to have the "true" peer_id?

I'll investigate this.

> the commit text for this patch seems to need a lot more description

Will fix.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

