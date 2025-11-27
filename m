Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11835CFD2F6
	for <ath12k@archiver.kernel.org>; Thu, 27 Nov 2025 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsY8PDgyHb3F00ijEIIECofRrZXpztHpBb0OSsSBZvM=; b=Fi7z47EKxuD08TaHBGQNkJnjQT
	2V4U5g+dvfGnBtivZUlR3kmQFEv8AWUzjfaj4/9S0T4SvH8IgUHQJaJ0qfyFRSsmcNtodqrXx6CHO
	rmcKjxVdeUmXEuEobDwOUQw373gbjb7+XsH39SclQ2r6uOoVP4GlyitPIcgM69C8XNA4f9LQQtNcQ
	IabEf4N7il91bTFm8b3uFuLpTflPAbk7w8pMp/YO3Ia8SJQImj9C4xYzkMyP0zLNCb5DwPE4If1Oq
	bMpPyeL87FRNcldlgvR8eBDgjb64RA7SrYkDhZ9Bt78XANL5Lg6XfoAckL8gvfpfcJVF23cU0cPhB
	/lqW1UAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWR1-0000000G7Om-3Mjj;
	Thu, 27 Nov 2025 07:28:59 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWQz-0000000G7OQ-2G6d
	for ath12k@lists.infradead.org;
	Thu, 27 Nov 2025 07:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=yvil2cohqnbwzcrfi6r2b6lzq4.protonmail; t=1764228532; x=1764487732;
	bh=lsY8PDgyHb3F00ijEIIECofRrZXpztHpBb0OSsSBZvM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DERltSDELxTptScI/GUnDi0SintKR26pnAQblHDzIPJKHX8tBWEbQQf3cYI8Fz39r
	 D1ShmdzSC5GPQF4Bbj3ZpewewgRBayH7JbdxTSa6FcuD23yKpRblFjd98ObimM5V7/
	 hL/jAGAu16MZAPz8kLWWAfFUbIsj8injPq2aoIdZ8IJtl8DOtgWpMrXrKGUlxzZL2b
	 QRupaYLPDlqJDDR/x64HFjyqNUkFn9kWMWzcHKXdadL8I97eIt4dqX27UGLysC2Q7L
	 IWJQM6atB3sExmO0TzIYTzJ3EFCpzzeGO83/3CYlrG0dXUUiWKmUTXE872bAErIrtf
	 z0zCFRy2rDCKA==
Date: Thu, 27 Nov 2025 07:28:49 +0000
To: ath12k@lists.infradead.org
From: Alexander Minchev <adminchev@proton.me>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: remove redundant pci_set_drvdata() call
Message-ID: <20251127072839.14167-1-adminchev@proton.me>
In-Reply-To: <20251126170213.27959-1-adminchev@proton.me>
References: <20251126170213.27959-1-adminchev@proton.me>
Feedback-ID: 99141252:user:proton
X-Pm-Message-ID: ad921ed66738655e0456f7097476e8ac5c3cfd24
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_232858_235798_CD2FD500 
X-CRM114-Status: UNSURE (   2.57  )
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

Hi,

thank you for the prompt review, I appreciate it. The issues are
addressed in this v2. Please let me know if anything else needs to be
changed.

Thanks,
Alex


