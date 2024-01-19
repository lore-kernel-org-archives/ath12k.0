Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ADC47DD8
	for <ath12k@archiver.kernel.org>; Fri, 19 Jan 2024 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy7sKkxak2qlnl50ofAvD70i4tLnW9Ing7agbnCaXUQ=; b=l981I5o1xbvZVLHZh1XIMjZttu
	eq8IC1YG3KVEN53phUyS2vzeuRPlHw2pfd9BOda69XedtF0ATrg5+UvPBnNlw6Lxq6jQYI8hMY8bB
	e5yb+X/X6tveDCX8OdZA5ibD4sQeN7uJVYPSPv8dzhmUoVismnWcNP0+97xIW6MGzQ9K6Ag5yuYVE
	+eRTe17rLLExGuCtVE/WAZ1GaYka/TWGPxaCkr1ChPD3ETVQqj12oZjmDUlZBFkKwFVovT97Tm5/s
	g09Lyrkk+1k/g2eFHrGnP+HeuR3S10Tx5JXZvgGxuKfmFVROIGSeTnivWwgDbBGMZm9x9zYyFvzX2
	EnpLdrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqHF-005v31-1y
	for ath12k@archiver.kernel.org;
	Fri, 19 Jan 2024 14:55:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqH9-005uuu-2d
	for ath12k@lists.infradead.org;
	Fri, 19 Jan 2024 14:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5F2D5B811C2;
	Fri, 19 Jan 2024 14:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0FCC433C7;
	Fri, 19 Jan 2024 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705676118;
	bh=afSjTK8TksDKKeb2U7KjT6d2zm01EtV2C8oq5Q32jJI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mqkfJqTo9r9qJov+AT3nIKvs4CZCo8hXHFDdYSPCNvyq9628hw8WunnTOhWqg5j0O
	 yVptOHGCOAORJO9gCegXB3gjrsh1GzyeeSYLwDUqWK0NdWLNMH5I/XRLxLRUAm/1/l
	 KwY+NwHadcaT1PKZZpY3QBJ7UEG51brrEq6vN0VMy6S18A1jWmgkx3fyhLYZyqEUEE
	 CorHKDTyu2CEdmUIQkFNfb541s5/siy5us/T30U3h4UcJrfFMduHsTFJbh4dTABHEX
	 cjBbedX87GbuQs+OC4s0vckXqqI/DkIFkAX7uRf0IbBxgeiGp650GBi23eILX+oe/X
	 /OCQci7hsdz9A==
From: Kalle Valo <kvalo@kernel.org>
To: GreyXor <greyxor@protonmail.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: Difference between WCN7850 and WCN7851 ?
References: <r_LAIMwF1YgGlpJWWQBKCsCqurisqY5ZzmPQ0QesUAXwqziwlbTWt8NLn0DA2fJAL9ukIX2T8kHs0pOABysXUcMDOh5RdRgBu4mAg6xCeuM=@protonmail.com>
	<874jf9frn9.fsf@kernel.org>
Date: Fri, 19 Jan 2024 16:55:15 +0200
In-Reply-To: <874jf9frn9.fsf@kernel.org> (Kalle Valo's message of "Fri, 19 Jan
	2024 14:12:58 +0200")
Message-ID: <87zfx1e5kc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_065520_019518_8EA7FA26 
X-CRM114-Status: GOOD (  13.95  )
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

> GreyXor <greyxor@protonmail.com> writes:
>
>> Hi, I'm interested in acquiring a WiFi 7 card for my laptop, and I
>> came across the Qualcomm QCNCM865, which is Qualcomm's WiFi 7 card.
>> Upon checking Wi-Cat, I noticed that it features a WCN7851 chipset.
>> However, when examining the ath12k/linux source, I couldn't find any
>> mention of the WCN7851; only the WCN7850 was referenced. What
>> implications does this have? Can I still obtain a WCN7851, or would it
>> be advisable to opt for a card with a WCN7850 chipset, given its
>> greater number of updates and references in the kernel?
>
> I don't know what changes WCN7851 has compared to WCN7850 but in general
> these changes are transparently handled by the firmware and the host
> driver just sees it as WCN7850. But I hope someone who is familiar with
> WCN7851 can confirm this.

Another thing I want to point out: usually board files are a major
problem so before buying anything I recommend checking that there's a
board file available for ath12k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

