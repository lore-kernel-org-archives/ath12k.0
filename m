Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5971C54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkHr+9qM0u7SYwG1echqaV1YHoXR2Qs6CYjw0JLgs64=; b=juDR2S17zvqIkZAmVmKX+v0adJ
	9f6HVfqczi1hgnaQIYAHsLHjSY8c5ce/TYZrudza81hFgJaEkBLkmCvVqr5IuhcRGIal0suUd8pwH
	9UP/RawG7nSheUvLKCY01YJfxcAlwsTFSAqrugBJ8/W3aZDhYBxYx2gbP4djhnPs/bUQIqqLTH6uL
	/XSICATNRgHYJiSc4fwzp0qXosnVonny0UAvQqeSoXD36/LiArN8wXc1jFIx3Ubko02u7jxKvECr5
	N7OtFDicuA49pT23I5r7QDqgfpPwesyxrywLouzHZNE9LR714RZjPT1+Cqf/VUzZoCkF7M038nqNV
	4UK3z9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkpol-0000000FJ7W-1WPD
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 18:28:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkpoj-0000000FJ6g-0kRa
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 18:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A7BACE1E44;
	Thu, 14 Mar 2024 18:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC41C433C7;
	Thu, 14 Mar 2024 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710440914;
	bh=NTXQxwuJ31ty4EL4cdcFnyfkJRuGxEuDEQ/8YoGL0aM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e5vkYECxZwUvcrwGnTINr2Jf5n9ogUcMPt9qTRrIX980vjEc1ZrwMPQH0aJlRar8W
	 fWnNCz6et9YZKaU390+WgC5bS/vzLsu8guBdScxbE1+EvKdSZf04/6OeJHGDZiWatb
	 dpXB1zhShbYngHJDrFFA2oiRokOqqtihVbWvrxVKzQmiTkAJwT1Q4lwM2TpRziwlio
	 N1iLFWdNW+JpF7AVOPmIZdJX4mSKK8Bu5xxbme280aY/DDqxh9Y9c4Xq2BEz17ndBa
	 s6aaCK5VbXaqQ8jgvpJm/iRvMdiBEQ/mfwCCJfwfmI2ocdrvcbX68G7CM1CHeP/sSI
	 a5QryMBoJM8IA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
  <linux-wireless@vger.kernel.org>,  Miri Korenblit
 <miriam.rachel.korenblit@intel.com>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
	<20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
	<87bk7g4x08.fsf@kernel.org>
	<09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
	<87plvwepjq.fsf@kernel.org>
	<50b2d162-00a1-4001-894b-d5560c4226b2@quicinc.com>
Date: Thu, 14 Mar 2024 20:28:31 +0200
In-Reply-To: <50b2d162-00a1-4001-894b-d5560c4226b2@quicinc.com> (Jeff
	Johnson's message of "Thu, 14 Mar 2024 09:42:08 -0700")
Message-ID: <87h6h8ekhc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_112837_449428_DA9B9F41 
X-CRM114-Status: GOOD (  11.25  )
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

> On 3/14/2024 9:39 AM, Kalle Valo wrote:
>> Johannes Berg <johannes@sipsolutions.net> writes:
>> 
>>> On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>>>>
>>>>> -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
>>>>> +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
>>>>
>>>> I think we should add the same for ath12k, right?
>>>>
>>>
>>> It's really up to you, I think. I'm hoping to even get this into stable,
>>> FWIW.
>> 
>> ath12k doesn't support MLO yet but I feel that disabling wext already
>> now would be consistent from user's point of view.
>
> Now that I understand what this is doing I completely agree. We should prevent
> the use of wext with ath12k.

And thinking more about this I think it would be good that other drivers
supporting Wi-Fi 7 hardware do the same until they also support MLO. Of
course Wi-Fi 6 and older hardware should still support wext,
unfortunately :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

