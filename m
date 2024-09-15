Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36296C3ABA0
	for <ath12k@archiver.kernel.org>; Sun, 15 Sep 2024 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXbFh6rSgDqCJzka+iRy0GLq/IqBuDLK5D3teuokjWE=; b=eONhjtOg+f3E1EeRMTH3Uir9en
	1OAqEkR0rgb3Hk58s+R2aVJS2TeoqIOguwtH3qKlxtK3CeQJAEcOVawHtyyoEItJAg1eqP4TY0yp3
	6+ESzgH/MwW8LG7GFX2IOrRrNS6JLbGLmP8AvqNoiytEEH4JDrm4B9SDoZOuxaT7memPl5kzD6S8d
	wpNzQpqP+S0ThfUWtIxq+vLDpEwcYLfd6nzRYrS30nBuonmgTiv9z5hKNG+Q3zP6BjAJQ+k2c875c
	M8ESl465E7/F4t+MpnGE+C1gXKSn1zK0FK/GKM+XDidZzkL1+a3po4jzfFQRXjprheu9yRwqnPHc+
	jVyTbzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spua4-00000002Xbx-3XFh
	for ath12k@archiver.kernel.org;
	Sun, 15 Sep 2024 19:06:44 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuXJ-00000002X45-3zMo
	for ath12k@lists.infradead.org;
	Sun, 15 Sep 2024 19:03:55 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D9A52240103
	for <ath12k@lists.infradead.org>; Sun, 15 Sep 2024 21:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1726427027; bh=fLsTanmuryT8EPZ1A54sqXQnGQonhQBMIvWujJ1EQoM=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=LCJC70xTmQR8lcIlUs0Uw+SoI7jLsdQoHG59KLEULPy+5W3xJZE8RJUQM+6uRRZ28
	 KC6eF6tBhyUBnewB39cUp0Xh9puK49fct02CWCOrpwnga3ZivRf9Eg4OzEq0zzESi/
	 1YqWIfCA3sYuL3jkZW78H+FQ9BTL7CVPMkXwowojdJPkf00E68IqcC5vfpJ3RrnI3G
	 jiSLNe0vZovKX/hlD/FthND9DKIrg8EQzC6B623YmM6DYxC7tyOg7T1Fo6ZtapuaT7
	 w5uZeejjVJ4AiMMVoD5JcBh2yAEkflJqYRpYTAuKByxr8h+KGP2HDTpawYsCB7UkIJ
	 YOEzcnb2+qNYA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4X6HWl3CqSz9rxK
	for <ath12k@lists.infradead.org>; Sun, 15 Sep 2024 21:03:46 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 15 Sep 2024 19:03:46 +0000
From: sebastian.arnhold@posteo.de
To: ath12k@lists.infradead.org
Subject: QCN9274 Wallys DR9274-5G&6G failed to fetch board data
Message-ID: <7519810f2dc252d430157ee4409f6654@posteo.de>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120354_175131_A4052CE1 
X-CRM114-Status: UNSURE (   5.05  )
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

Hello,

I am suffering from a nasty bug that prevents me from using my QCN9274 
Wifi card. The ath12k driver fails to load with error message: "failed 
to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255 from 
ath12k/QCN9274/hw2.0/board-2.bin"

I have reported it on Bugzilla and was told that "[my] device does not 
have board-id (0xff)" and that I should "encode [my] bdf to board-2.bin 
or use directly as board.bin".

Sadly, I have no idea on how to do this. Since I can't use my Wifi card 
without solving this problem, I asked them for help, but was instead 
referred here.

Can anyone help me solve this?

The complete conversation including a datasheet for the wifi card can be 
found in the aforementioned bug report, comment no. 7: 
https://bugzilla.kernel.org/show_bug.cgi?id=217971#c7

Thanks,
Sebastian

