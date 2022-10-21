Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D7C433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DukrvV8TNP9ojPbqjLy6u1cR3U+GYpcdh8AWa0gM1nc=; b=kmP2qYY+OuGU1p
	tVaOgL/N6g4VJi8hYTvjmICo1tD1Gjwwgl1eR+gSrI37eEWl5671ZX+oePWlaoVZBOUgU+4CEbEKu
	Jm5WZ18HqxZ3pAYFc7eWCb8Ci9Zfapk8BQsRsPXlBmMlYteNrI/wEaaCqDf+Zb8jRViXarM6FOkz5
	l8Pf1i2mCmFnyQithfLtwS7M5CyfaEtHp8xQpc7PAl9dRyDWENdKB0H+j7zAAd1FoelUp6H+VVHVN
	p+asx/NJsEHDFjPfLwD+AMXhIIxI1TWq4WMXM0WpqWp9n1Wtqn6HHFTdjKeTfQdYxeE0LoXP3bNT1
	N2XTm+2nByFo6ceUt2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpqy-007HqO-4v
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:06:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpqs-007HpW-Ar
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:06:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 69391CE2A5F;
	Fri, 21 Oct 2022 11:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED006C433C1;
	Fri, 21 Oct 2022 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666350366;
	bh=ebUuPGXHDB+aLlvbvnYmLslvYd81HjfRuExzEtiuybo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mtaOSrxZDRT7HeZuhzA/V8I0q9VnDOjprbTMDQw/wVmzqnxCyywcwLM82cV9nzmNh
	 AAQWHYQLYd2cZ7c7FCgO5Q+OOuXOBpNALs1Di1CSva7Z0Duu0I4Ma66tZorXhipnrJ
	 dekcfBMg+p/8tbCzpovMtQIOcMuTfQl3QFVKbBd/RbTXMM3KsHLn57uIQKBSHsjUUd
	 4KHIi9qHOlI2rpRqapGuXiBx0hYtQ1wyVcfR3IO+J1onNQgTsDzBkxwd2DBNyHNkoH
	 6VxivgXtvIZXSmhLq+PZRP3zCuCZy8ij/XSJw/UQzo07A3TP556NElCRQ4LvhPyhG5
	 O4mcUcUh2pHBg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 07/50] wifi: ath12k: add dbring.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-8-kvalo@kernel.org>
	<d9403714-d7ef-3a7c-0448-e5b2b0a60c34@quicinc.com>
Date: Fri, 21 Oct 2022 14:06:04 +0300
In-Reply-To: <d9403714-d7ef-3a7c-0448-e5b2b0a60c34@quicinc.com> (Jeff
	Johnson's message of "Mon, 15 Aug 2022 12:55:57 -0700")
Message-ID: <87v8odjv1f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_040610_566409_5732F78E 
X-CRM114-Status: GOOD (  12.91  )
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
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> +static int ath12k_dbring_fill_bufs(struct ath12k *ar,
>> +				   struct ath12k_dbring *ring,
>> +				   gfp_t gfp)
>> +{
>> +	struct ath12k_dbring_element *buff;
>> +	struct hal_srng *srng;
>> +	int num_remain, req_entries, num_free;
>> +	u32 align;
>> +	int size, ret;
>> +
>> +	srng = &ar->ab->hal.srng_list[ring->refill_srng.ring_id];
>
> there are several references to ar->ab in this function.
> suggest being consistent with ath12k_dbring_bufs_replenish() and define:
> 	struct ath12k_base *ab = ar->ab;
> and then s/ar->ab/ab/ in those accesses
>
> this suggestion applies to other functions below since there are
> multiple functions which have multiple ar->ab dereferences

Praneesh fixed this:

c568d8bc26de ath12k: convert payload[0] to payload[], use ab variable and fix __ath12k_dbg() signature


>> +int ath12k_dbring_buf_setup(struct ath12k *ar,
>> +			    struct ath12k_dbring *ring,
>> +			    struct ath12k_dbring_cap *db_cap)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct hal_srng *srng;
>> +	int ret;
>> +
>> +	srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
>> +	ring->bufs_max = ring->refill_srng.size /
>> +		ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_DIR_BUF);
>> +
>> +	ring->buf_sz = db_cap->min_buf_sz;
>> +	ring->buf_align = db_cap->min_buf_align;
>> +	ring->pdev_id = db_cap->pdev_id;
>> +	ring->hp_addr = ath12k_hal_srng_get_hp_addr(ar->ab, srng);
>> +	ring->tp_addr = ath12k_hal_srng_get_tp_addr(ar->ab, srng);
>
> s/ar->ab/ab/ in both of the above since you already have ab = ar->ab

This is still not fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
