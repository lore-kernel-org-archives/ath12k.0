Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F47AC54E49
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP28ysdU6QBHMG6Tr2RJ3289wEYzT7S2ezi5JAH/8uY=; b=DT1exFBe5vOi8G0E4pLsIoYYJ+
	abSuGEBHefdXXC1SdLmAmeGjGSGuyvH0N0v8jJhj8qt4nO6EUquc95Kqq4d+AfGZK2y17BvII0fdh
	4/jrO35r1q6UPn0LIidHGZOPXBaYJM0kYXfwTRyxBBmmftJcsXCx2UJHxsnpkPUwz9OIhdANn/sPd
	lXwbysh6kReoTbW7K905DQsudSMh6afWnrxEK4+5EisTIf4ZOILN9SuJQG9nRCq0BPsGUtd9+98+/
	087m3Dah1bK3yiAQmnRz5iu//3qIMLNYT5s1DJ/uUR/MxTUnVNlmp7/thOy5JAmQiohBmAzpSZc55
	bmHPgluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSd3-00000008rjy-0D4h
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 10:18:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScM-00000008rZI-35YA;
	Fri, 23 Feb 2024 10:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7786E633B3;
	Fri, 23 Feb 2024 10:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631C4C433C7;
	Fri, 23 Feb 2024 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708683436;
	bh=TdPxL80KNvTglJ8gtJxwgHqMD9eSaZSGRQMqnWwfhHo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z+pA6LhA7OFT4UEXmhcjCb+VmhXompki2a60LWpk5d+FExepk76SIQJxqbqZ1f2k5
	 zzniMDiymrg58cBKdmo6oZW78H2IHrMRYN6pK6mpSptroYg+Q+uxpkg6cSreZ7cpHo
	 VTsqgNunMqvuDHkkQwPPDfil/qEb04xoYGLeINu4Vm/PM0EvkuTmeore+b70l8jcme
	 qgbMAu29r3q4q1ucy1KhidNd6BNJZOVSiFjxI+K7w8O2qcJc84jWrA8Z+LCqwORsDC
	 klXGLJ3maeUvYACp4WpAwupGUrSFVhTsYoJXK6yrfsNuvaP8oWtf0mY4y78kLFL0wt
	 pdsBmybFskYMg==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>
Subject: Re: ath12k & ath11k beacon miss detection
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com> <87a5nub8r8.fsf@kernel.org>
	<CZCBPXTOU5QM.2CV2WOTP0YW48@gmail.com>
Date: Fri, 23 Feb 2024 12:17:12 +0200
In-Reply-To: <CZCBPXTOU5QM.2CV2WOTP0YW48@gmail.com> (Nicolas Escande's message
	of "Fri, 23 Feb 2024 09:42:55 +0100")
Message-ID: <87sf1ja3iv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021723_007553_489B9067 
X-CRM114-Status: UNSURE (   9.14  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> On Wed Feb 21, 2024 at 8:02 AM CET, Kalle Valo wrote:
> [...]
>>
>> Just a generic comment: QCN9074 and QCN9274 chipsets are designed for AP
>> use cases and their firmware tends to be lacking on station mode
>> features.
>
> Yeah I know full station mode is not to be expected on thoses chipsets but we
> do use them as such for a short period of time on our product...
> We just need basic connectivity for a few seconds.

Yeah, I understand that. I was just trying to warn you. In my opinion
the station modes should be properly implemented and tested as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

