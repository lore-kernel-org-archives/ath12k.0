Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458B7C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4DddnPVge9/03hGcVhj2b0OGOQ590RpyA8OzYtklTQ=; b=ebw+CEw40x69UDADGfjfKoKuY5
	tVoqQNN7V1CYOCk/0KIFxvu3LB7bCHBvDKWsHUvu6zsmbSXpz4phd4nzlmCp4SyMWDQVXupeLkBi4
	nNoJY1LFW/hsGJ0F/3vgqp5wFRTyXg5GMM4O5fVdTHETqh71hAtfo13Kp20yt2JqyYn6bELoYDHLl
	6RDf+n1c7ADOkn5QN3unWqjifwzqpG+amdDb+3rg3A5a2vtB04P5OAalGSlRDIP4Te5TbU/193ZQz
	thBHg1uhc70DezZXJ8IaI5eesS6Kbb7Hxzsw/gcTZzjm/ra35PFk5dFHf0xGJR+9PBLUq/oiTaMll
	u1Fja+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aVW-00000004lVt-4BVZ;
	Tue, 15 Apr 2025 07:14:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aGo-00000004jNM-1CWH;
	Tue, 15 Apr 2025 06:59:47 +0000
Date: Tue, 15 Apr 2025 08:59:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744700384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4DddnPVge9/03hGcVhj2b0OGOQ590RpyA8OzYtklTQ=;
	b=vuYrOTc8QKwZILdPxE6nlighse8j5czreAU0NRRwXH1YPWLjdY3d2rgnmIBklwUTnZbJ4i
	mW3R7pbaGwblKuKhbYK+OyBN9orQD41H6M9HZkoPc4O2ZMShfJnMzwW56/2sxT762VPUye
	aoqHwtWY4NDMT4NWwcxAQZfSIloQ9K2b2iIiWhS2I1RGuC5Lz+VELCRHaU/4HJqS1JI5MQ
	yu/N9j8P9SKznAzYMKnOQeS03+PcDgn9hh7n5XkvDCVBT6vagGsuYB6cWn4m+MemWbcuQW
	AJiGvabKv5fvy2QuNIpq1ErGhlQhvivTDiAW0SW6YixSCrVD6XPUsVBEftmjyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744700384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4DddnPVge9/03hGcVhj2b0OGOQ590RpyA8OzYtklTQ=;
	b=NvPKiU/NFg6b2GvIsSSHtwZXG+jiIVYcV6xItmZvYPFCDeSuQXxyHYGrI0ugX2vU2lvaot
	V1nhHULnntqIsxDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
Message-ID: <20250415084250-8f385935-6e23-447d-8e94-3170d0d3ec9f@linutronix.de>
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
 <Z_1XiNY2ujreEo69@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_1XiNY2ujreEo69@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235946_466358_969646A5 
X-CRM114-Status: GOOD (  13.10  )
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

On Mon, Apr 14, 2025 at 11:44:24AM -0700, Brian Norris wrote:
> On Mon, Apr 14, 2025 at 10:26:01AM +0200, Thomas Weißschuh wrote:
> > Furthermore, restricted pointers ("%pK") were never meant to be used
> > through printk().
> 
> Is this really true? Documentation/admin-guide/sysctl/kernel.rst still
> has a section on kptr_restrict which talks about dmesg, CAP_SYSLOG, and
> %pK, which sounds like it's intended. But I'm not highly familiar with
> this space, so maybe I'm misreading something.

The wording about dmesg, etc was added in
commit 312b4e226951 ("vsprintf: check real user/group id for %pK").

Its commit message also notes:

    This is a only temporary solution to the issue.  The correct solution is
    to do the permission check at open() time on files, and to replace %pK
    with a function which checks the open() time permission.  %pK uses in
    printk should be removed since no sane permission check can be done, and
    instead protected by using dmesg_restrict.

Doing this is my goal. One of the later steps is to replace %pK completely.
Probably with a function similar to kallsyms_show_value().

> (I do see that commit a48849e2358e ("printk: clarify the documentation
> for plain pointer printing") updated
> Documentation/core-api/printk-formats.rst.)
> 
> In any case, even if the advice has changed, it seems (again, to an
> outsider) a bit much to say it was "never" meant to be used through
> printk().

IMO "never" is correct. Using %pK through printk() was only ever a bandaid to
get at least some of the security benefits of hashed pointers.


Thomas

