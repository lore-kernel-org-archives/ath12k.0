Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F63C982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VhU95cDMBIXQvMna+tKy46BOvuCr3e2931Pn9vAkduA=; b=xZbiVVjSBZgPm+SO30Za3CxpJS
	FIBY0/cIIXy+WdoKBNk/wOJYPnU93WMbPWanEZJDpayCYrGE+4XB7N2e86VvokkZStyWGtgmFvBC8
	LDtI4gmz/NFH3x7D3ARH3GGDVQ/KhQT+P2sh6USaZjMBF8qlQOxM9K36UoEUzkYvOVCm175DyIgAe
	bnla1XBEvfRBpTyI7IxIgZmnwDRLo7dI+fhEqEOE5vNLIKuGaABdGoyzOvE4EioqMS7iYhhKZPG7/
	ccZQ+FKkIkuKZ5DyqSS085HXKfQEbhKlojDuE8awiZkGfpHhqBt1ASBaqyAjpsIFd8VFw6P+Xqk9t
	F1JoRuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Mp-0000000Aka9-2U1o;
	Thu, 17 Sep 2026 07:17:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Mn-0000000AkZH-0A0z
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 07:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789629427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VhU95cDMBIXQvMna+tKy46BOvuCr3e2931Pn9vAkduA=;
	b=bniM6CQieP1q2g5PslZrtIDfWriYk86qaeS09ND81bTXpHakJYNkjGWjC2JmNpWgeRblO9
	CqKrlGkDfqPOBCh7HhFhdv68eHdj/hQH/avGS1z+6s6G++F8sMuotoviEwPE+1I0Mn5V4n
	YAIGUig+eTtsACprkiUsa+uyf6ZWWXk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-AUHHK_xEM-uUnwU6D4tLMA-1; Thu,
 17 Sep 2026 03:17:04 -0400
X-MC-Unique: AUHHK_xEM-uUnwU6D4tLMA-1
X-Mimecast-MFC-AGG-ID: AUHHK_xEM-uUnwU6D4tLMA_1789629422
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E17E184B3A8;
	Thu, 17 Sep 2026 07:17:02 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C799427;
	Thu, 17 Sep 2026 07:16:58 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jjohnson@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v14 0/2] PCI: Add device-specific reset for Qualcomm devices
Date: Thu, 17 Sep 2026 09:16:49 +0200
Message-ID: <20260917071651.14174-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: qnAAmtlBiF0rQ3I2bilr1PNK30HZJ5Fsb6pN1T2ez74_1789629422
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_001709_175820_64D63B84 
X-CRM114-Status: UNSURE (   7.85  )
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

Some Qualcomm PCIe devices (WCN6855, WCN7850 WLAN; SDX62/SDX65 modems)
lack working reset methods for VFIO passthrough scenarios. These devices
have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
broken bus reset (addressed by quirk_no_bus_reset, merged for v7.2).

VFIO attempts to reset devices on every reassignment:
- For the listed modems, without a proper reset capability, these devices
never successfully initialize even on first VM assignment.
- For the listed WLAN devices, without a working reset method, the attempt
fails. On clean VM shutdown, the guest driver properly deinitializes the
device via .shutdown/.remove callbacks, leaving it in a usable state despite
the failed reset. However, on unclean VM termination (crash, force-off), the
guest driver callbacks are not triggered, the device remains in an undefined
state (DMA active, interrupts enabled, etc.), and without a working reset it
cannot be reused.

Add device-specific reset methods using BAR-space hardware reset registers
that exist in these devices:

  Patch 1: SDX62/SDX65 modem reset via MHI SoC reset
  Patch 2: WCN6855/WCN7850 WLAN reset via SoC global reset

These are true hardware reset mechanisms (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios.

Testing shows stable operation over 100+ VM crash/reset cycles. Device-
specific reset is position #1 in the reset hierarchy, so these devices
will use hardware reset as their primary reset method.

Jose Ignacio Tornos Martinez (2):
  PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
  PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN

 drivers/pci/quirks.c | 116 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

---
v14: Address Bjorn Helgaas feedback:
  - Split WLAN and modem resets into two separate patches
  - Clarify commit message for WLAN devices: VFIO resets on every
    reassignment, clean shutdown leaves device in usable state via
    driver callbacks, but unclean termination is where the lack of reset
    is critical
  - No code changes from v13, only patch split and commit message
    clarification (Mani's Reviewed-by retained)
v13: https://lore.kernel.org/all/20260915223634.GA878346@bhelgaas/

--
2.54.0


