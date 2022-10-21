Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E80C433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLySIK50gZR87m9LtLN0kVqWvl8YkbCYqSnLvWwojn8=; b=kq8xIv9jO9nEw8
	5gvv4Kg9N60hPgaB5zTzeMKJbdEYdnuOSZs1amUAJMxH2lEgyTOtzEGL1EhLEBy6V4V/O9KI+rDNY
	u1tW7mK6QiUJjwtN5HNoVOsa1K5I7caSFiDeG5wmd+LkwzkGQjG+tEFMxYUQKSCb3okmeLyehtm2x
	r8GE0yWxiS2PGBdfefV1dcRb5aUR3nCHU+YN27e3oQA1i5C8BEO6ee2EDD85cwz2feyiEiIIoa4fx
	AhGHZoU930h9RXEYT0zgghSjuCOatxJQb38Tu3rcDd3SIDr4UiGfvKhPMUwH9IblX7Wv3DM4a42mm
	SfuJzWqM1jVbPfZZgMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq3E-007KtL-TW
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:18:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq3B-007Krs-RF
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:18:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 120F361D9C;
	Fri, 21 Oct 2022 11:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2C6C433D7;
	Fri, 21 Oct 2022 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666351132;
	bh=3ChRpt1xyFjKJVHC5jnaDEZiz50ObF+BIKimx31ihV8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rMsfyNxURen6SpN37CZF454omBkEDH8/h2gG67o55Ej1+E/BHmkE7nMV1qciQIaBz
	 f9fdISqF+CrQCBXu5zH8Tbru/wUyD9Rzjmg0tRoI52jy9fl4HkJ4Ti0bO3J7cCWCFQ
	 xL6C+tPp9gXHg6mbof5nh6hrZkrGOEocL6vMpd2DFudAYnnEz23M+S3okBjoXzW+y7
	 6jj9rmoLAPH0DpgxzkNXK0mGh9KMxlIlN6e+J44rjY6IU9gUv44F4fSg9Omo0RiA44
	 9BHvGlq7QCqvSWXc9rHvwdjr+MkCy1l6YWJ21dWCrcxgbFguLxA0FEqMqB7sM3qdco
	 L1z3yw9B2/Upw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 10/50] wifi: ath12k: add debug.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-11-kvalo@kernel.org>
	<8b456221-07aa-2620-784f-ae44ed2aa431@quicinc.com>
Date: Fri, 21 Oct 2022 14:18:49 +0300
In-Reply-To: <8b456221-07aa-2620-784f-ae44ed2aa431@quicinc.com> (Jeff
	Johnson's message of "Mon, 15 Aug 2022 13:11:21 -0700")
Message-ID: <87ilkdjug6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_041853_936922_313C0DE2 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> +enum ath12k_debug_mask {
>> +	ATH12K_DBG_AHB		= 0x00000001,
>> +	ATH12K_DBG_WMI		= 0x00000002,
>> +	ATH12K_DBG_HTC		= 0x00000004,
>> +	ATH12K_DBG_DP_HTT	= 0x00000008,
>> +	ATH12K_DBG_MAC		= 0x00000010,
>> +	ATH12K_DBG_BOOT		= 0x00000020,
>> +	ATH12K_DBG_QMI		= 0x00000040,
>> +	ATH12K_DBG_DATA		= 0x00000080,
>> +	ATH12K_DBG_MGMT		= 0x00000100,
>> +	ATH12K_DBG_REG		= 0x00000200,
>> +	ATH12K_DBG_TESTMODE	= 0x00000400,
>> +	ATH12K_DBG_HAL		= 0x00000800,
>> +	ATH12K_DBG_PCI		= 0x00001000,
>> +	ATH12K_DBG_DP_TX	= 0x00001000,
>
> duplicate assignments above

Praneesh fixed this:

c8bd8aa45f6a ath12k: fix ATH12K_DBG_DP_TX value in ath12k_debug_mask

> would using BIT() help here?
> or does having the hex masks make it easier for folks generating the
> masks

Back in the early ath10k days these enums were actually usign BIT() but
someone suggested to switch using hex numbers directly, just because
it's faster to calculate the debug mask. And I have to agree with that,
it's a lot easier when these are in hex.

>> +#ifdef CONFIG_ATH12K_DEBUG
>> +__printf(3, 4) void __ath12k_dbg(struct ath12k_base *ab,
>> +				 enum ath12k_debug_mask mask,
>> +				 const char *fmt, ...);
>> +void ath12k_dbg_dump(struct ath12k_base *ab,
>> +		     enum ath12k_debug_mask mask,
>> +		     const char *msg, const char *prefix,
>> +		     const void *buf, size_t len);
>> +#else /* CONFIG_ATH12K_DEBUG */
>> +static inline int __ath12k_dbg(struct ath12k_base *ab,
>
> should be a void function with an empty body to match the signature of
> the real function

Praneesh fixed in:

c568d8bc26de ath12k: convert payload[0] to payload[], use ab variable and fix __ath12k_dbg() signature

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
