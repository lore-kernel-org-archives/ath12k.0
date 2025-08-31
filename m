Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D6CA0FF2
	for <ath12k@archiver.kernel.org>; Sun, 31 Aug 2025 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H4gIhAWZck363Q1cao6oQQds21Jh5aVOhpBFAuVJwcQ=; b=P+zjIhaPgGMhF3KkoqCwa+pb7L
	eBDklZpgZdrWgAHM0wPd5hEIC1pNpt8U3c1ftEM2zig/e0Ses0FDM8wds2kbLMvRc8GkK4O1Q/6Us
	MD2E5y+naC3b4LwY9ejFE8jKMdOq3mECgRlrgPtksqkgBNTkwEDmjKGP+2pViamztsE420rqCM3Tq
	fgpnhvpneyYSOXJm+GzbdpAv04d4qzKxqiOlmmiFeR9/WM93y+sZrY2868fMvwa8+Fbnn0HdzogNt
	UqPdGYPEMrbtM0mERz5G+no8RHKPhP2NDmvHJf666oatCRVQR74gYo+BnMAw0fogF3lVQ9W4Ok4F+
	Azf3XUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usk6U-0000000AMZX-1dFH;
	Sun, 31 Aug 2025 15:36:26 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usk6R-0000000AMYV-41Y3
	for ath12k@lists.infradead.org;
	Sun, 31 Aug 2025 15:36:25 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C77F6240027
	for <ath12k@lists.infradead.org>; Sun, 31 Aug 2025 17:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1756654578; bh=H4gIhAWZck363Q1cao6oQQds21Jh5aVOhpBFAuVJwcQ=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=UO8JacCZQBfumvZHIaX0lAnBcAXQ9xrCs9ZFTAogDvJI9+CiFalJExPlgSIHECpyz
	 bbaXViAz58eK+fOFoIJpJrEiCOU2FJjf2XHkSkgCbGO1fP1+efRWz/CiKmfk/IhVME
	 QkI9i3iWCcACERsT6TtTbviFEqIyWPNJBsBeXXGzvPHPi18uxc+O/y1LySC0JsQdY8
	 cCz6GLL7vb8Pb69Eyce6OGbKnIkT2cb3OCHPJHrEAXDAFOYc063yFea+rD/fy+4mYg
	 w7Tu51bIsEEYmcxRnA8i319kpYU2m2xtg9MUMKtAJkEnPWfECiDz4KPlbvlhjU0Wfl
	 wU4hGL1XK7YjA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cFGLp19lkz6v17
	for <ath12k@lists.infradead.org>; Sun, 31 Aug 2025 17:36:17 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 31 Aug 2025 15:36:18 +0000
From: a-development@posteo.de
To: ath12k@lists.infradead.org
Subject: =?UTF-8?Q?=5Blinux-mainline-=36=2E=31=37rc=33-=31-x=38=36=5F=36?=
 =?UTF-8?Q?=34=5D=20RIP=20at=20qmi=5Fhandle=5Frelease=20with=20ath=31=32k?=
 =?UTF-8?Q?=20on=20a=20MSI=20x=38=37=30e=20Carbon=20WiFi=20-=20mainline=20?=
 =?UTF-8?Q?kernel=2E?=
Message-ID: <fabc97122016d1a66a53ddedd965d134@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_083624_142268_30AC01CB 
X-CRM114-Status: UNSURE (   2.86  )
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

Had the joy to build a new machine.
I had to switch to mainline kernel to boot at all.
Blacklisting with kernel 6.16 allows me to boot, or using latest 
mainline kernel.

Hardware is NEW.

Log: https://0x0.st/KH4D.txt
Alternative: 
https://paste.gg/p/anonymous/52779beef5144f2fbe74be2673951f50

What should I do?

