Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9CFC88E4D
	for <ath12k@archiver.kernel.org>; Sat, 12 Sep 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+THOZS0vuucX1GtvwsUqalQ26e4hn0JKpJvj3JFnU0=; b=dOda+gAmHfnHZ/FWlsjMWBbJan
	iUprX8XiXcPyU3WaBfnAuN+IUFvVG2TwjsxbvqBwvpDh3scpL0PgQM8EBg5YjFz8xZBl5boYmNT1n
	Hqde+7jgkIMfxmjBLeyCtSkVRRPXxtKJB4gcbI5zDFe2lJzps4cm7wbnvmhglYOVgFksTRWPnUDy6
	J2B7UVrB6PCHst2xXq5wkxKoLZTPAaSsGlUKsdl56LfPvKJevNrf9Hy0YR8gxMj6yNnqZwF/23sL/
	RVoRyMI0Cu7rW7YShA24jHAtIsYEUVIbaEuzqiQfhrMklKKhWKk0B7L6tbnTbgDNIH0vOo9sBCgWu
	NhHJuZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IjU-00000000gRC-3WbO;
	Sat, 12 Sep 2026 08:05:08 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IjR-00000000gOV-1Ite
	for ath12k@lists.infradead.org;
	Sat, 12 Sep 2026 08:05:08 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d8263d52;
	Sat, 12 Sep 2026 16:04:51 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 ath-current] wifi: ath12k: convert scan timeout to wiphy delayed work
Date: Sat, 12 Sep 2026 16:04:45 +0800
Message-Id: <20260912080445.14184-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dded65dd-56df-4637-b3f5-c244651435a6@oss.qualcomm.com>
References: <20260717025602.262916-1-runyu.xiao@seu.edu.cn> <49600545-3e13-452c-8940-c3e775ac3856@oss.qualcomm.com> <dded65dd-56df-4637-b3f5-c244651435a6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa094a5d59503a1kunm70f9fefd2086a4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0xNVktKTkoeTE5LGBkdTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PA0tsTU1+tX07cBxPpVlFFJKU5ONDffvsLfa+qV+ZEk3drZnFhvE7oAEnqYTaF71l5JVfsLuV/XPGgS56no8RnTPWGaFlgdGNFIxHydNc1SH0BCVPkxNgxCNLu1KE/Qn7pyzSJWQgKdGSXAvtp+kIbi+gtbd1BSKN17pyXE03+k=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=4+THOZS0vuucX1GtvwsUqalQ26e4hn0JKpJvj3JFnU0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_010505_945239_9CD013A1 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, Sep 11, 2026 at 01:36:47PM -0700, Jeff Johnson wrote:
> You never responded to my response. However, since this seems to be a
> legitimate issue I did a little more research and now see why the
> finish_queued flag is needed. A better commit text should explain that since
> the current commit text is confusing

Sorry for the delay. I was unsure how this part should be resolved, so I
held off on replying.

> There is, however, one additional issue with the scan complete path.
> wiphy_delayed_work_cancel() requires the wiphy mutex, but
> __ath12k_mac_scan_finish() is called from WMI event handlers under
> data_lock only, without the wiphy mutex. The existing code can call
> cancel_delayed_work() there directly, but that is no longer valid when
> using wiphy_delayed_work. Instead, set a finish_queued flag and queue
> vdev_clean_wk, which runs under the wiphy mutex and performs the
> cancel. Add a check in the timeout worker so that if it was already
> queued before finish_queued was set, it exits without aborting a scan
> that is already finishing.

Agreed. Your explanation clarifies why the finish_queued flag is needed.

I will keep the finish_queued logic and update the commit message accordingly
in the next revision.

Thanks for taking another look.

