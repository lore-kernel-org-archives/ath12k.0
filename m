Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECEDCE8D5C
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0KNQo0Nuvq2XvDu9wZNyMJpi+hrEY/W50/bTGStHkQ=; b=BNDAQ73W1cb7mSQWMpu4AqvVMk
	xI/gc1Mi21YGGBqC1v+QEaodY+k7oz+Y2DW0kbcEyZr1GH+uTaphgdqJ9QpMpYbeGTZWcs7fKaqU+
	bbHdSUTe8h6kXgy1FjtC62DjxYTn5kWCa5O5O6lZYy9tpUXrfzJl5mV8eDhc9T1RLToy+90uHwkYo
	KlIthpeoQQEP+9gFRDlVvOEKI1ollSNZW/h+baAdPgjgKnEzpvfVQVH6N2VRI/qYIpzIFsotGrZuO
	vDJEUrL1jY8+SD1Tqe5x+6JZSV6u5+3n/srRZiIOXBFHh+BNIXpp6RGK5GGSTnuabUAwbCrEzuZIw
	sV3RG07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBqX-00000009gdh-1cLF
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 07:45:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBqT-00000009gaF-04jC
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 07:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FE265C5C27;
	Thu, 19 Sep 2024 07:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A000CC4CEC4;
	Thu, 19 Sep 2024 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726731896;
	bh=N/tB5kurtPU5UipR1x6mXZYuDqe3q1sB0b5AxUJp0TM=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=NNAevjV8ih7g1atCXk0IekM/cPzw6JUwk7EGJ23E0CXyCm82bA+qWIznwSdEhor2O
	 WxGPEvKRmM7EZT1ytV+iV3UDms1c8Jvy9EY3UOrsgi+rlzVMdqLZZTFbNxbOCqGa6E
	 QgruianCkw3Oy1tWDXtcYBdaF5njvo2oy84jr9v+oq3Wli+Y5EdIXFmgB0ZLsyNeG4
	 wPbGjLZoHwDOXhVHO57BAbwBfJODF+36YNa05/ZEdl7Qd1K5T5T5yiOTBW5X9muGue
	 sb2KR0ECPDI0+V76X3BA377MaRU9NAxntyjhLhuPTPMCKtp3HnA5HRz9rhCQkXQUD/
	 tK5YbUp4J3T9Q==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Christian Heusel <christian@heusel.eu>,  linux-firmware@kernel.org,
  Linux regressions mailing list <regressions@lists.linux.dev>,
  linux-kernel@vger.kernel.org,
    ath12k@lists.infradead.org
Subject: Re: [REGRESSION] Update of linux-firmware breaks wifi on Thinkpad T14
References: <44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu>
	<a6ea491c-f238-4c84-a51a-3304f6781468@leemhuis.info>
Date: Thu, 19 Sep 2024 10:44:52 +0300
In-Reply-To: <a6ea491c-f238-4c84-a51a-3304f6781468@leemhuis.info> (Linux
	regression tracking's message of "Mon, 16 Sep 2024 14:53:06 +0200")
Message-ID: <87r09g9jez.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004457_149514_5C307AF9 
X-CRM114-Status: UNSURE (   8.94  )
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

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> On 16.09.24 12:49, Christian Heusel wrote:
>> 
>> the commit 82318c96 ("ath12k: WCN7850 hw2.0: update board-2.bin") in the
>> linux firmware repository apparently breaks card recognition in Thinkpad
>> T14 laptops with the following journal entries:
>
> TWIMC, another report (that is 5 minutes older :-D ) about this can be
> found here: https://lore.kernel.org/all/87bk0nc1yb.wl-tiwai%40suse.de

And this is now tracked in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=219282

Please cc the ath12k list for all ath12k related issues, adding it now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

