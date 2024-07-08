Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687E1C3DA41
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MmroBpVwQZq1Rgl7ho5wQtWJf2833Q34uSFgt3YqTeA=; b=KK6aSQIfeTzVRHv0xlkPsadAfb
	SkFC8ZJtOuYSg2kXpoy1Hdop9nMkjXLWUvnIBYiJrUQXO5XDX8IU05KljaJbQCsuxMFsBRxBTEXjq
	TwMXY6L26ozMecZTP4JluXgDEyKxijjReP6Ht1o6eg2EZq2P7krHEMIWXsdqy6sR+aWSbsVO0WCeL
	t9FnEaPh3NQpMRPnWBQmyUQ1giVfNCxWEMKU2NEb9x6D1XsYbm4go96VoZ8rux0zNuu/Fo9P2Id4y
	KR0D8RB+RYbssOdP1MuiyK8o8Bt2D+g3lZN35wmpAqGmDIE9/l9UXBkSLUg+wh+3F8XILa1ORZEiy
	cBmutg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQsur-00000004gq5-0JgI
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 18:16:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQsuo-00000004gou-3Ds4
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 18:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 084DACE0ED4;
	Mon,  8 Jul 2024 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929FEC116B1;
	Mon,  8 Jul 2024 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720462600;
	bh=MmroBpVwQZq1Rgl7ho5wQtWJf2833Q34uSFgt3YqTeA=;
	h=From:To:Cc:Subject:Date:From;
	b=NbJrP460+C1Y75haVIngSPb4QcmZ+IM8XU4jR+h7mh6/qVSKH9JtbGu3l2dGVDUrB
	 4+LQBT/RKALA2KKz6/Gc1/sPvR/1JOidaI9uUqAVKjKdIoQ7qx23ck+ltQMAKMay/P
	 KTVkkfUBz3G+GJybkCO1LV7CnpYx/h8OxbdI9wruiviUYtLDmng10McuX2x4mNgvRi
	 7loOkSlbANaH+a/1kRzvHKLXe24CLxP12W2rBIihDaMLiadl0Ul6Qe8iiwRJG/ChR8
	 z/FmuHDmMllInas2ezv2UtLKlx2In2+JzfwZ4crEaiSGJcjPvQkDEcGYZZlyHRrT0f
	 Vm933omRtoxLA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Subject: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
Date: Mon, 08 Jul 2024 21:16:36 +0300
Message-ID: <87y16bbvgb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_111642_999983_9EF0AF75 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Arnd,

I installed GCC 14.1 from:

https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.1.0/

But I have a problem that a kernel compiled with that compiler fails to
boot on my x86 NUC test box. I don't see any errors, just black screen
and I assume after that the kernel either crashes or reboots and goes to
back to the GRUB menu. This loop seems to continue forever. GCC 13.2 and
older from crosstool work just fine.

Do you happen to have any ideas what could cause this or how to debug
further?

Kalle

