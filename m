Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7D8C28B28
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eq/ebP2CwM8wTQ/fwb2hWC6lSTwZgA4O8KrnlqmEgmU=; b=fX8mNaNJ6ipx6QRehTG/1aa4dd
	m8aOlJhvna6V3CYiJqsV6DNOOUyJ1lWtK7iwYVIcFrr5y+YK64tcMlvpFbNWTYXp0j6X9vBgeRP0J
	O57kKNRYNv+7SaTku5API71EnrALM6vZ61okHVPqw3on2wBqKDtArqLwZYaVwhLu8bf9zAggfxWAQ
	wtPcBZ4GQo4u7pBFVNlXyslHbRoHFcXDl+P3Ob8fjUUn74PZ27defRMosy7ZzcU3sDPdTMgVXkVHB
	DQt6RdWYG9NXQhL/hoRwx10hlMy+mrJWSJrhZMzAAuFnULWuSxOJSU3/FJb52xAUN0mLBH8n9gn3a
	aFsXvaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXJ6-000000064OI-1bLk
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 13:48:36 +0000
Received: from mail.tuxedocomputers.com ([157.90.84.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXBA-0000000637b-3YWW
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 13:40:26 +0000
Received: from [192.168.178.76] (host-212-18-30-247.customer.m-online.net [212.18.30.247])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 28D912FC0190;
	Tue, 18 Mar 2025 14:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742305219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eq/ebP2CwM8wTQ/fwb2hWC6lSTwZgA4O8KrnlqmEgmU=;
	b=asv/mvU2GdoK+zoyUo++r/22A6/BQ+1ibi6sY0mldkBVFa1zwoUySI6f0ZBoGNlNvRSgl2
	yRyturHQY963jQjLs84wafwaG1JmDH/RCeJkqUnjxGD6TXYyDfG54KkQb0LA7h4TnKhI2Y
	5RiBWxoDXFLy3Ndyp2Y2R377mme9nAc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
Date: Tue, 18 Mar 2025 14:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-firmware@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Christoffer Sandberg <cs@tuxedocomputers.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
From: Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_064025_318943_3B77EC02 
X-CRM114-Status: UNSURE (   6.08  )
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

Added an additional board string with qca-swiss-army-knife:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,
qmi-chip-id=2,qmi-board-id=255

Tested with 2.4GHz, 5GHz and 6GHz (iperf3 -t30 --bidir)

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 1987068 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath12k/WCN7850/hw2.0/board-2.bin
b/ath12k/WCN7850/hw2.0/board-2.bin
index
48f18e23014c4a8d1d771c4bd1ed1ceda00a33ef..659acff5411e6f10accbf227b46088fa83ec0291
100644
GIT binary patch
delta 89
zcmV-f0H*(lqj~(Jd4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
vgcO7ogcgJsgcyVwgc^h!v>f=90qB>ptr1g~OqCpV0WpV9l^nNEl^r>}c)}mC

delta 87
zcmV-d0I2``qj`v<d4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
tgcO7ogcgJsgcyVwgc^h!v>f=90d$wKtr1g~OqCpVhc=cRw>Fj?#=AG9A7=mn

-- 
2.43.0


