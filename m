Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B68C31D97
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCaQlshmePyQDB6ovrNsJ5/VaZp8xkilWo/C5ufKmIY=; b=gI3KxA5Q9IPSH/HHhKNrthEnjy
	37aDoiE3km2Hu+9qi2sy9LSBXwW0u6FZbADRchiuy1p5a9wpG2+G+Zvex+QI01Z85Udv1K3VpCuOC
	LUNkQhcHVJaLTGY+gBjARDczpx5qAf8dbxl/Z7R2uZLbDXgvgekuuZrTHlMLSjEPDwIhIaIIzIqO7
	vu0j0Z0FG7tPfhAeu4klsAIvduGRyUKG3UkwD7hB4WHpF3Ija6A/JvDtEmbwRwoVE/WBv0KskSJ6q
	Lxu6xy+EyqhPxZOifUBGui0Rn7ISmTJZOre3WfrB3mpOcprjcTFndMjv5ws5QBEccv+1pL6x5Pt7Y
	gCb/Aczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuCQ-00000009J61-1GHY
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 07:14:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuCL-00000009J4p-3wTO;
	Wed, 03 Jul 2024 07:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1168CCE1D4E;
	Wed,  3 Jul 2024 07:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF794C2BD10;
	Wed,  3 Jul 2024 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719990875;
	bh=x+1Z0OH2iTgkOWjPo7qguUcayPfUY6MxGUvlYB4Er9U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ekvw+WdQ2FH0lUhpQUPwlryZvnC0zVEx3AVCDmPFolSc0F6dnzOq5U1MvgtGXpsSY
	 NFRAdF24djUA2rpP8DlBk/4H/lJWEGtQfCxuRDuDpcKZlhDT27chfOvhYy2VsJ7s6P
	 4qhTirqvwSNnyeC1liCyanoUmx7ls76ySdL7DcsElc69Hxw4UlsNndkYHGXExA6yLY
	 il5YAIPK+85e+g20b5/cPoyDAgH0McKmfcNjxQ/j6PqS/aa93rOxH1auwrjRhXtfic
	 CefBDu8i9Rl53pYHjisFxmOHqtC1Hzq2yYnQnVeeniLLOWBm3stV2Y0CRnB4jzCkht
	 304GsGKjOkWdA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath10k@lists.infradead.org>,
  <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>,
  <quic_kvalo@quicinc.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: pull-request: ath-next-20240702
References: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
	<87zfqzdkgh.fsf@kernel.org>
Date: Wed, 03 Jul 2024 10:14:32 +0300
In-Reply-To: <87zfqzdkgh.fsf@kernel.org> (Kalle Valo's message of "Wed, 03 Jul
	2024 10:05:18 +0300")
Message-ID: <87v81ndk13.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_001438_177944_796D3242 
X-CRM114-Status: GOOD (  12.61  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> The following changes since commit bb678f01804ccaa861b012b2b9426d69673d8a84:
>>
>>   Merge branch 'intel-wired-lan-driver-updates-2024-06-03'
>> (2024-06-10 19:52:50 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240702
>>
>> for you to fetch changes up to 5344fc76f8944249026884157f846f88489edfc0:
>>
>>   wifi: ath12k: Support TQM stats (2024-07-01 21:57:28 +0300)
>>
>> ----------------------------------------------------------------
>> ath.git patches for v6.11
>>
>> We have moved to a new group-managed repo, and this is the first pull
>> request from that repo, and from me. Fingers crossed...
>>
>> We have some new features in ath12k along with some cleanups in ath11k
>> and ath12k. Also notable are some device-tree changes to allow certain
>> ath11k and ath12k devices to work with a new power sequencing
>> subsystem.
>>
>> Major changes:
>>
>> ath12k
>>
>> * DebugFS support for datapath statistics
>> * WCN7850: support for WoW (Wake on WLAN)
>> * WCN7850: device-tree bindings
>>
>> ath11k
>>
>> * QCA6390: device-tree bindings
>>
>> ----------------------------------------------------------------
>
> I see a weird warning from gpg which I have never seen before:
>
> merged tag 'ath-next-20240702'
> gpg: Signature made Tue 02 Jul 2024 05:55:42 PM EEST
> gpg:                using EDDSA key 3F9AD487CCF522D7A21F0C492C15BBA0898CCB7B
> gpg:                issuer "jjohnson@kernel.org"
> gpg: Good signature from "Jeff Johnson <quic_jjohnson@quicinc.com>" [full]
> gpg: WARNING: We do NOT trust this key!
> gpg:          The signature is probably a FORGERY.
>
> It first says that the signature is good and then claims it's a forgery,
> odd. Is this a problem between using different email addresses or what?

I did 'gpg --refresh-keys', now your key contains your kernel.org
address and I don't see the warning anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

