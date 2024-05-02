Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE3C4345F
	for <ath12k@archiver.kernel.org>; Thu,  2 May 2024 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUXXwiUqH6eaeBDOt6VExvK8EM3QjOA72BMxkK9umeM=; b=LOfuFa0k2qWjlP0v440JwQqYXM
	8IoObKw8f6Bzs2dmy20bI/RlxDNAxQy0NFr7X1/x/RLdayWpGF8wCFlojNjn4T0e3elTjmL2cRrtl
	AIH/3tJUxa4XPClwKCynAmxwhdptoFqvRE9tH/WLpAXxTWj1d8CzWt9aZlP3p4VEslUAhuiKb+wli
	/deEdiz7zINI+YooJ7PPyH6trxlV7ciEw25mnT/K/tUyVIWodmCAbDjTGKjOgXNY+cX6N4y3GmNpm
	G6jCRX2euRV9Vhfj2siQwrpxKPtl/XDQryZsQ7VQfm+AHL4SUKpYGjCD/eSpm+cFojmTjbQcPLTLf
	dIsyKiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Tnu-0000000CLVo-1aeT
	for ath12k@archiver.kernel.org;
	Thu, 02 May 2024 10:36:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Tnr-0000000CLUX-1Zga
	for ath12k@lists.infradead.org;
	Thu, 02 May 2024 10:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27BB8CE1320;
	Thu,  2 May 2024 10:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CCEC113CC;
	Thu,  2 May 2024 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714646195;
	bh=VAmRD8JkQq8NXu53lxFc2/nblIlrbXLg9NxlMjfq5hk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iehlM8l7ARqTjs/HKOkY72UsfktK12OQrhoCIWwqoOL0t2uzVw3LomiytuFJ4gQ3h
	 f3Bu9nXrtM0hmgZgU8dJvIWpKKYZpr2PDpuzNAp2kIYwKmYegaqg53i8MQbm88ncNh
	 7v80Skuo212JgfMIJySMIFr6dgB6m/MWDXTB7zfBdRF50Hxe0LawMw9JpE4iDBSsSs
	 f04QwqdjZYhJDHIPVcsXvNqveu7eFHsZXA8YrqJz2LcBYvjFUcxxpAdlJpNZZANk0s
	 c48j5T9MRQMl3tMTuglZ4ne/w8ZUrt6JwYgkyCxNStEUK0NdvxJGsh3+/iufBbLkuV
	 fMNBL/D/OuSIg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] wifi: ath12k: Replace "chip" with "device" in
 hal Rx return buffer manager
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
	<20240430165811.1377182-2-quic_periyasa@quicinc.com>
	<26854263-0a16-4b27-9de3-be3d159b8e40@quicinc.com>
Date: Thu, 02 May 2024 13:36:32 +0300
In-Reply-To: <26854263-0a16-4b27-9de3-be3d159b8e40@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Apr 2024 11:42:34 -0700")
Message-ID: <878r0spkjz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_033639_610611_BE489FA6 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

> On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
>> Prefer the term "device" over "chip". Therefore, modify the relavant terms
>
> Kalle, can you fix in pending (if there isn't a respin):
>
> s/relavant /relevant /

Yup, did that now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

