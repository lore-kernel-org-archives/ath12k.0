Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC50C30653
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fS2vjnmGqXAQ9WjtL5md/9C1C8LvwK+LqefwmVBAx4=; b=zeWLBYP7ZjBPtO9CcleSM0dx51
	/1S+BJF1FZyzbE2/z9llxDJji+LbM05lpxGI503x8u2+YrMGLwr6Wbni528PfmuXYgllpnNVmi5Fh
	7WOkUuSJJZhfluKLpbIbGE3Llo04/pNpUeZq39EdCPPVTobn2jXgNFAZkj6aOo3Y3412QG2aFGEZm
	3sWga0gMpRvgHCmixqc3lx3iR9Lt52XCqOJcXelRDDbhbpWy1yuYvLa28ADNWgPqFKpn7tyQuf2hs
	W7etEIvDLqNRQn6uhxDUJyeQ0JIf4F3nJe37t8SuJ5/2wbPQ4ootWCtHjgggdVVqVtf8ID0mjTZ38
	rcvLY2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1IT-0000000AXCh-2c7q
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 14:49:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1IQ-0000000AXBh-0SmM;
	Wed, 03 Jul 2024 14:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15F89622D6;
	Wed,  3 Jul 2024 14:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36948C2BD10;
	Wed,  3 Jul 2024 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720018160;
	bh=3qGCR7+SBUm0FxhtBeKATCWdj80vH8KA2M7mFHfT9MQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=utB47ehAKXfW5KdU5w4FYs1vdyLdbV73y8Tn5/4+Vd8mX80/KFN5eJ/1mVK9iEfNP
	 VYhPkeb5+WZYd1WIpsFkGc8kv8t3qa6auaM9lGzjxOJIS6K5GQJM+XKd2hKCMMVd3Q
	 GDskOojtlIKEJT2TacfYvC29W1e8zTAjGXpBVPwqJxm4Njwt5tr9DCNZHYU1HXFkWm
	 q2LqIeSnnc1BZprus8chHKQQ2Ck/TBOZyliiee3cbIaaAJX7mmK/XDpnxW50iHp1Af
	 8VV09LByYxcXT32SdkItBtezldYNlukh/bCAxbWEQtWNWFVT3GYX2apUNXafg5iRL6
	 m5bJvnLZClchQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath10k@lists.infradead.org>,
  <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>,
  <quic_kvalo@quicinc.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: pull-request: ath-next-20240702
References: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
	<87zfqzdkgh.fsf@kernel.org> <87v81ndk13.fsf@kernel.org>
	<5b98e939-bfea-4a16-a116-5a00d3497190@quicinc.com>
Date: Wed, 03 Jul 2024 17:49:17 +0300
In-Reply-To: <5b98e939-bfea-4a16-a116-5a00d3497190@quicinc.com> (Jeff
	Johnson's message of "Wed, 3 Jul 2024 07:06:58 -0700")
Message-ID: <87jzi2edjm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_074922_233870_B7925A65 
X-CRM114-Status: GOOD (  10.58  )
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

> On 7/3/2024 12:14 AM, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>>> I see a weird warning from gpg which I have never seen before:
>>>
>>> merged tag 'ath-next-20240702'
>>> gpg: Signature made Tue 02 Jul 2024 05:55:42 PM EEST
>>> gpg:                using EDDSA key 3F9AD487CCF522D7A21F0C492C15BBA0898CCB7B
>>> gpg:                issuer "jjohnson@kernel.org"
>>> gpg: Good signature from "Jeff Johnson <quic_jjohnson@quicinc.com>" [full]
>>> gpg: WARNING: We do NOT trust this key!
>>> gpg:          The signature is probably a FORGERY.
>>>
>>> It first says that the signature is good and then claims it's a forgery,
>>> odd. Is this a problem between using different email addresses or what?
>> 
>> I did 'gpg --refresh-keys', now your key contains your kernel.org
>> address and I don't see the warning anymore.
>> 
>
> There had to be at least one issue with my first PR. Glad you sorted it out.
> Key management is still a mystery to me...

This wasn't a problem in your pull request, It was just a problem
between my chair and my display ;)

But I have to say that I hate PGP, "user friendly" is clearly not part
of their vocabulary.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

