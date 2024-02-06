Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E073FC48286
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wnFNW+1fnJZocpdQg87jZETpkuwT6mfERde5db7Cog=; b=1hG8PDBxWMDe7FldW6PE2ELN3O
	tZMyUVwPEjF8HJmuYt+n6Yl8gAbHtwZIBhcmwNmXMx6y0RHeor2H3gMA+eK2BLlghf/DaY7PtSJnT
	+DHlydjsI0DX3IcxMk5+5/qHchgOHReF+x1Gq5gh935b1Lzn0csU1EZaYlutX8oxUQKP/R+fQWbwP
	kJurB0R+n7lOB55ChYtJtThHPTEsFP9Hogm1eK5f6MfASR5afsv21gzjyFJGmpnbUrzEX81Cw+tuB
	A1tPRkEoh2hLuVtcBUA8E8xpxd/XWY3kp19RkJW9yDSg/aZYhwJpFp67ym9fyU7eU5CGFlFG+hVHR
	CH4mfL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXI8A-00000006pBc-2W2v
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 09:52:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXI87-00000006pAN-3gWq
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02E5261290;
	Tue,  6 Feb 2024 09:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD226C433C7;
	Tue,  6 Feb 2024 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707213158;
	bh=b+p8zjmnr16Jk65ZJAFJ5YGzcFg8oIMlI1ka67QX4lQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HC2hARrFbha5PfULz3DckvOgV1s976iyk+o09fYqstunU4RVGN87vbZW3DvT9idRU
	 xclfkxGqIX4z1ZYK+s1y6HaQ72D2R5EE1Gb/uNPyJfCfDkK6+oaU+Y5EHWbMyOYelF
	 3Vq6uI/+5RMhScGShIWSHuXX/A7LyGCQHkokZx6H3shtAXJDu5I6jtzpqpnXGbbsST
	 jQN73REl1bArgr9qVPf+sAdYIM8K2x+kHCEFl3upX3wtEhK4bIwm4irsh6GldC4B28
	 pBMyVFGD8hqxstW/at8idJ8YXl2jmuIQ0w68w60VreKEBu3p++ECbvtdeJ+BjZ2KiN
	 54tIGtuH0bvGw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kang Yang <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-5-quic_kangyang@quicinc.com>
	<87bk8usx6d.fsf@kernel.org>
	<efda8b8e-0257-4779-b0c9-0903164b58c1@quicinc.com>
Date: Tue, 06 Feb 2024 11:52:35 +0200
In-Reply-To: <efda8b8e-0257-4779-b0c9-0903164b58c1@quicinc.com> (Jeff
	Johnson's message of "Mon, 5 Feb 2024 08:35:07 -0800")
Message-ID: <8734u5syvw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_015239_979412_6C8E6B24 
X-CRM114-Status: GOOD (  17.14  )
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

> On 2/5/2024 8:17 AM, Kalle Valo wrote:
>> Kang Yang <quic_kangyang@quicinc.com> writes:
>>> +	if (WARN_ON(skb->len < ie_offset))
>>> +		return -EINVAL;
>>> +
>>> +	ie = (u8 *)cfg80211_find_vendor_ie(oui, oui_type,
>>> +					   skb->data + ie_offset,
>>> +					   skb->len - ie_offset);
>> 
>> So cfg80211_find_vendor_ie() returns:
>> 
>> static inline const u8 *
>> cfg80211_find_vendor_ie(unsigned int oui, int oui_type,
>> 			const u8 *ies, unsigned int len)
>> 
>> You are casting away the const here. I see that other drivers do the
>> same as the assumption is that the pointer points to the same buffer,
>> but I still don't really like casting away const. Thoughts?
>
> I'm not a fan of typecasting either.
>
> However, the problem here is that from the perspective of
> cfg80211_find_vendor_ie() the buffer is const (not modified in any way
> by the function), but from the perspective of every caller the buffer is
> part of a message that is in RAM.
>
> So you have to decide if you want to change the prototype to remove the
> const from cfg80211_find_vendor_ie() or if you want to keep the current
> semantic to cast away the const.
>
> This is one of the rare cases where I think the typecast is ok.

Makes sense, thanks for the comment.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

