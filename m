Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAD4C2BD09
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g0M7uCC8HH5M7Fcsqqa9uC+yg+WtTc7/qpiTjH/hJ4=; b=VVWb6P370PK/vaf1vd7Lm17CVV
	o/5epLJQSCZ6fkG1AFt4MszB+oGJ76GyTqQ8tilV6Ha5jrwI+GA5ApVWWoSmsr05JafFfHA6s49MO
	1MRPfAUqYmDbqURfutkDK7PAhRODKGvGcSN/OxsQ8pBPOjwR7AK6QY22/qxjWf6Ql5eqCnWZNcb6F
	Y6VGN1eptPmQA1hZQVAnAz5wStKGfM8XCBThJiFPwfbOpcLG95N6zJJ0++xM0l0wSvakuT3IIim0g
	zrWSCAOebnAwZAgtNtFt9pcLLxrRMkXWih+hERJAT8P2wQD+K/DJDHQhEuwcKuUL1/2Zaxpbd9QjA
	Lvkyf39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2x5-0000000AsDw-1Rcf
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 16:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2x2-0000000AsDZ-11Su
	for ath12k@lists.infradead.org;
	Wed, 03 Jul 2024 16:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F0966236F;
	Wed,  3 Jul 2024 16:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD742C2BD10;
	Wed,  3 Jul 2024 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024522;
	bh=gphMZVvRgHchK7XILZC34t8RVBHPKE3MmWl7TbtczWU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NyrOl+SaLysJQK9ocAK2sHMEXpdb1EPb3PMZFktRTcM8JZqNM9VuC078GHJvzWxZY
	 jvLqIQhKCNcM2cc7z7fPnHoD9nxryt2XPZRf/qygF5r0QYvWuh64oeIOKwIlmmZW6k
	 K1QgPhsUmkhpvTzFRkgE4Pnd2TQndbXodFIo4y0Qq/mHmTeWXA/JQsFaIVnONhdUEP
	 laMaTjAIEAzfNt8KMvlGzLUgY6GeK/9RX2kIxfIOKw7YEGMEOtEdav7iZYTTaXsShh
	 dAwQlB9AEwpocCwuh3x8TuVQqTjW98As+5ZaYTNG8eEZMXtv2vV81hH7FYgWZptmo4
	 3TXxMaphMsuTw==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v8 6/8] wifi: ath12k: Introduce device group abstraction
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-7-quic_hprem@quicinc.com>
	<87le3iqkbe.fsf@kernel.org>
	<e0ed9e43-a795-3e47-dcd1-15b43fa96ef0@quicinc.com>
Date: Wed, 03 Jul 2024 19:35:20 +0300
In-Reply-To: <e0ed9e43-a795-3e47-dcd1-15b43fa96ef0@quicinc.com> (Harshitha
	Prem's message of "Fri, 7 Jun 2024 18:59:09 +0530")
Message-ID: <87a5iye8mv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_093524_368138_22E9656F 
X-CRM114-Status: UNSURE (   9.50  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

>> Like I have said before, for adding any new locks there needs to be
>> a
>> proper analysis for the locking and good justifications why new locks
>> are needed. I don't see any of that above.
>>
> Sure, Kalle. Will add the details for new locks. As grouping has to be
> done in synchronous manner lock was introduced.

The problem with Qualcomm code is that new locks seem to be always added
without any analysis. But if these new locks are being continuously
added the code will become so hard to maintain and convoluted.

I can understand adding ath12k_ag_list_lock (it's just badly named)
because there is not really any other way to do it. But this mutex_lock
looks so suspicious, has anyone analysed that?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

