Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFE5CCA465
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6tm0ZYS9uGd96wC3x6dvmU9GyhPLWaY7eJL8wnh+gA=; b=1DS1JxtGaqgkYrhGmjMZI8o+HK
	tDq/2OIuF6RTYjDoYanIwSb7dcyys+1QMJ7B4iV+htXaTJ9BmwpBlKMqkv/Oegzw83Of1VJrbr0M7
	08c1/eZJOY28AEK5M37OBuKH/53PftV0FD1aKxbEyeoPUeaubAnqFTpebkS5GSy2JvDW0NHRT3uN1
	w5dHxYTiOI8bocPMHmxJYqUHqAC3SuLMhL6ZkYDVGI9kqx/RDnvuC17x7a0ZOKrAMRF78qqcG/0Vk
	04vnhotsC2nF6K3EunEeeAbDZ0yu043t+3vTNjZpxdY27SE2Z5fHKi1G6hpFCGx4gfum+5uSv+KoL
	xXvpRiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSUF-00000001OBG-07lx;
	Thu, 15 Oct 2026 20:55:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSUD-00000001O9b-1kXK;
	Thu, 15 Oct 2026 20:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 830F860A57;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B21C2BCF4;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792097736;
	bh=ReHuuM+HjdzYLwEJhUbU5VO8Ceo+V/a93dpA2WxkIYk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aKFNWcvUaIbXq+pUX+qEceSb/hpvsleNUZIiSmKDP0Te5mlNc73LAE071uFuLhC/n
	 ocawNDkpOFMMmo5L9o9WcdZW3Uj8eBGeNungeC25edBEUof1M4e+//2ODvz4ItR4GW
	 O0BIinddUg+k9R2jBoh6pl/KAx9yyGKS5aRtSbuKLHfJlYH/V1bYQ96tYWAtWZHEBD
	 0iolVIPID+Wa08vWMizwfSLo/dNuYplrots9Dz6T6yLky3VpjQvbC0KvZ1HA8l+X/h
	 t2gumeN0J1xD//2N0wjHfVgJlVuOrf5sJ2EH1Kf8P6YbGUGD8MrBRc5SCTHOqoGEUt
	 s/YIdjfp4NrqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF84CCA465;
	Thu, 15 Oct 2026 20:55:36 +0000 (UTC)
From: John Macias via B4 Relay <devnull+dencity7.gmail.com@kernel.org>
Subject: [PATCH RFC ath-next 0/2] wifi: ath11k/ath12k: bound READY MAC
 address array reads
Date: Thu, 15 Oct 2026 13:55:23 -0700
Message-Id: <20261015-rdy-mac-array-bounds-v1-0-5de276b752a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALs90WoC/yWMQQrCMBBFr1Jm7UASqAG3ggdwK11Mk9FGMJWZV
 FpK726qy/f5762gLIkVTs0Kwp+kacwV7KGBMFB+MKZYGZxxR2tsixIXfFFAEqEF+3HKUTGyN8H
 71jjroapv4Xuaf9kbXC/nfaMyYOa5QPc/6NQ/OZQ9Dtv2BdKfhwGJAAAA
X-Change-ID: 20261015-rdy-mac-array-bounds-de70c7750217
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
 John Macias <dencity7@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792097735; l=1380;
 i=dencity7@gmail.com; s=20261015; h=from:subject:message-id;
 bh=ReHuuM+HjdzYLwEJhUbU5VO8Ceo+V/a93dpA2WxkIYk=;
 b=qk3rH7i82oGLnWB/24kgq4kwfhaT5xl9p5uCpzh6HOY2aLvfidVKg+nmL1kF468n9NZkjKcaJ
 61byeB9jHX9C2be+01FH/DZMPfXf3byB1D3ZQvanz3y2pBmiD+WZvhM
X-Developer-Key: i=dencity7@gmail.com; a=ed25519;
 pk=z7cMHA0B6NULvJzsST/bbOOegMB6xCo9+/ytQure7B8=
X-Endpoint-Received: by B4 Relay for dencity7@gmail.com/20261015 with
 auth_id=1198
X-Original-From: John Macias <dencity7@gmail.com>
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
Reply-To: dencity7@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

ath11k_wmi_tlv_rdy_parse() and ath12k_wmi_rdy_parse() copy one MAC
address per radio from the READY event's fixed-struct array after
checking only the count advertised in the fixed record, not the array
TLV length. A firmware READY event with a short array makes the copy
read past the end of the TLV value.

These patches check the array length first and fall back to the
driver's default per-radio addresses when it is too short.

Found while bringing up an IPQ8074 v1 device with older firmware; the
issue is not specific to that hardware. Verified with a userspace harness
around the unmodified parsers under AddressSanitizer. Compile tested
only (ath-next, W=1); not tested on hardware with a malformed event.

Jeff, following your pointers on my earlier ath12k RX-ring RFC, these
carry a full-name sign-off, an Assisted-by tag, and state the testing
explicitly. This work was developed with AI assistance.

---
John Macias (2):
      wifi: ath11k: bound READY MAC address array reads
      wifi: ath12k: bound READY MAC address array reads

 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261015-rdy-mac-array-bounds-de70c7750217

Best regards,
--  
John Macias <dencity7@gmail.com>



