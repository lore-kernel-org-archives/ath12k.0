Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6748FCA5FCE
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQIzOrD80cBVNE5h0CQa8C1wdzcpWOcigbQ+mlRDcY0=; b=Hw0HQIZbK5p/JIbKojL+LtnVWn
	AErRxevwHhKl+dP4gDslbpxXI3YSZvQYHSOAtMx7QVMghIxOSUS0ZqscbWzHPw59wA0sTx5tdLE59
	uzYZ6AM3DfPoauQjRZeeImtxGgTg1DCJJphaAMvADM4rOgrlT6GD1GdiDmxnFttIbplM+xaGKTFzv
	eNinf5Q+SuUa2U4U3NDt96js3EVzJZi9Sw8zZaaohfWY16Wbce9vCeiiyzFhJrd52AsSA/xnCt8wZ
	PhYSnLS0nl1U0k27UkhI7d/1wNuFO6+5abac5xRiH8VrgZ3YCGkz7+hKYWl3P/Crqm/usUdQrnz2o
	nv1UsfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLN-0000000GEmC-0TUB;
	Mon, 05 Oct 2026 10:54:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLK-0000000GElP-0nN3
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 10:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791197689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQIzOrD80cBVNE5h0CQa8C1wdzcpWOcigbQ+mlRDcY0=;
	b=aKHhD371T7SZSyZv72jc+beIvl1jVLD2iJ2PgHmcIRV597UHKZEgWsVGvPLVWUIZhrLFAB
	HSFa/Y2/XAJGkoUpiXdqC+iudi5Y0ceP4EEkqGmo/zFwNE7aGE2WBYw+fnVI6zY/tShOx0
	Mchsn6RXD5RNQprzvH2T0LcnlH5nwCM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-TFv9j6g5Mwa9XZ7D9O6MFQ-1; Mon,
 05 Oct 2026 06:54:47 -0400
X-MC-Unique: TFv9j6g5Mwa9XZ7D9O6MFQ-1
X-Mimecast-MFC-AGG-ID: TFv9j6g5Mwa9XZ7D9O6MFQ_1791197685
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B373C18007E7;
	Mon,  5 Oct 2026 10:54:44 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4CFD71800446;
	Mon,  5 Oct 2026 10:54:41 +0000 (UTC)
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
Subject: [PATCH v15 0/2] PCI: Add device-specific reset for Qualcomm devices
Date: Mon,  5 Oct 2026 12:54:34 +0200
Message-ID: <20261005105436.83962-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 7PHfdiCX2MQxWwc50Tzn0ZUK0dQsX4Br6cogRq9mNeA_1791197685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_035450_320915_C75A8A08 
X-CRM114-Status: UNSURE (   7.01  )
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
broken bus reset.

Standard reset methods were already disabled for these devices by commit
6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi,
SDX62/SDX65 modems") because they were not working (quirk_no_bus_reset).

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
error recovery), providing proper device reset for VFIO scenarios, allowing
to enforce isolation between successive passthrough users.

Testing shows stable operation over 100+ VM crash/reset cycles. Device-
specific reset is position #1 in the reset hierarchy, so these devices
will use hardware reset as their primary reset method.

Jose Ignacio Tornos Martinez (2):
  PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
  PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN

 drivers/pci/quirks.c | 116 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

---
v15: Address Bjorn Helgaas feedback:
  - Explain the relationship with 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
    WCN6855/WCN7850 WiFi, SDX62/SDX65 modems") and previous status.
  - No code changes from v14, only commit message clarifications (Mani's
    Reviewed-by and Alex's Acked-by retained)
v14: https://lore.kernel.org/all/20260917071651.14174-1-jtornosm@redhat.com/

--
2.54.0


