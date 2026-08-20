Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58424C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4113Go/iZ9yaiCSz08Po1Td0t48YeW8O2ljTwTRbvg=; b=DQ+nndhetvdw+C/s/eoSau/rwR
	Dm15O1efesBsGJ9HbRWSre2aV8oDzCcleDWkfWFQzyCQPYvyjxXWyqyVhizdjTdVc/XIXyQC1VjLq
	fsk6RSxQn2YuIg5K9RGaHgJUvdoC1ODT5T1MyiOQrK/vfDmxcKKkL5RwhyD8EDb792WzEZKW0w4BE
	qpEL4/a3ydMLifh6E30x55QW+aZw/zrxcn6MbbYhoS0zYJMNe9Y4alqMyYfxhHD1Crp9LVDS4nWaG
	SeXuC9RRa0soQyauzWNBEDzk55f06S8BGSmlABVoI17532NVjGbonzIXKkqpSOYi0ucV8tbrAj2+K
	7I5YeKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Og-0000000Bs74-01gM;
	Thu, 20 Aug 2026 16:13:42 +0000
Received: from out-52.mta0.migadu.com ([2001:41d0:1004:224b::34] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Od-0000000Bs64-20uE
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 16:13:41 +0000
X-Envelope-To: ath12k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GSbd9eXn+aBkKA8yfc5E9UP0zZYOKacQHj+I0EFsxQs=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787242416; v=1; x=1787847216;
 b=OEgrEnXDFwzkf/CFo5uBVQdKsXqxdTguQipmYOO1qcwou9phmYa5cSdfkMx9xC0OFulrbWxi
 f4zsvONZLbFXUMSi9vHwY7Ewglo0ZxAEoJ+P/RaRZ5Ao9d2dBRHYCBNUUEvSFYmDxFV/um/XQLq
 TxQbvuQG0Gr3puEj7ZHP/PFo3AdACaW/UGUlBo6k3taPOHlVJWdO7PNsuX0oGhT2nIGQhu3SL4J
 ZsuwRvvhDZ31kXu65lcrhn6g4xgGiM+g+0wBLb/QHW7l4N2gR1UUSGKcULD3dB8kt8RiJ5gv24C
 4+TCn/4UEXTp+8S2xG9L4PD/m0WUyosNmW0pUCyV2XE0A==
X-Envelope-To: ath12k@lists.infradead.org
Received: from fedora (187.15.154.68)
	by smtp.migadu.com with ESMTPS id 7cf7a057dfa13fa4;
	Thu, 20 Aug 2026 16:13:26 +0000
X-Mizu-Trace-ID: 7cf7a057dfa13fa4
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH wireless-next v3 2/8] wifi: mac80211: change public RX API to use link stations
Date: Thu, 20 Aug 2026 09:12:07 -0700
Message-ID: <20260820161207.125743-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net> <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_091339_886088_695D1602 
X-CRM114-Status: UNSURE (   6.76  )
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

On Wed, Aug 19, 2026 at 03:57:06PM +0200, Benjamin Berg wrote:
> -	*sta = wcid_to_sta(mstat.wcid);

This moves inside the wcid check, so it no longer happens for every frame.
mt76 uses one variable for a whole receive batch, so a frame with no wcid
keeps the previous frame's station instead of being cleared.

Frames with no wcid are normal rather than rare. On an MT7922 they were
about 98% of everything received, and 16 frames out of roughly 4000 ended
up carrying a leftover station.

No harm that I could show. None of those 16 were data frames, and that is
the only kind mac80211 reads the link station for. Clearing it when there
is no wcid still looks worth doing.

Devin

