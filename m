Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E72CD6E60
	for <ath12k@archiver.kernel.org>; Tue,  2 Jun 2026 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7lhxXhmw63vVneHWPJnRnLBBsQzjvsFQ841tAfawJk=; b=Hb2PwdO+U4fbUCyq8LAlbWY9xN
	xcFJfhRaF9R+bEp9EFwWijmbtScPWBJgnV0i+7hnio9ABYvXAbo1JaMV0+IEk9r1p/P3Zlwy+iUPD
	YMjUGFpyAbS9I6fGRL1IxBF5WOlh6UrToFFGZBWS7WNN/Tq4Uk723rjq8WKiVpLsYWVOh0l3YqVng
	viT7AjEeitLhnkzW0nyDkZKYSgPxqElKEUAwgSov1cVrUBgOMMmq/0BTjsURGt3yH1mNuTP1YgsXW
	DE2Uel7YysjHFls6c4YWpLOL91YTAcLn+Zv57iD8qn7uUgiQkjTUDSwMQWm1Fw5OlFn0rYBFJzjHd
	B9YMdZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURY9-0000000DOEe-23Ic;
	Tue, 02 Jun 2026 16:01:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURY5-0000000DOBh-37KE
	for ath12k@lists.infradead.org;
	Tue, 02 Jun 2026 16:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780416060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7lhxXhmw63vVneHWPJnRnLBBsQzjvsFQ841tAfawJk=;
	b=M8W20eiDO6qpvJuZbQ8nfyi0ivizpAW9hPnwnTonzrpsQa+uJ9bXjnNOnrCIJASN2rGMKB
	1xrGjShYEa+B6iFoWFFbhNg4h+zQOUeT9SD1JcbxIyXlu5sXVu/JvlvMwZxuJoj1XvgSbR
	KKmxGqqFXx3S0k6OXTSBUUncmwGx72Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-4xXEZffvO5aYmkMZnahdfQ-1; Tue,
 02 Jun 2026 12:00:57 -0400
X-MC-Unique: 4xXEZffvO5aYmkMZnahdfQ-1
X-Mimecast-MFC-AGG-ID: 4xXEZffvO5aYmkMZnahdfQ_1780416055
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E93F1955F1A;
	Tue,  2 Jun 2026 16:00:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.109])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53BBA1953947;
	Tue,  2 Jun 2026 16:00:51 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org
Cc: jjohnson@kernel.org,
	mani@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v6 3/3] PCI: Disable broken bus reset on Qualcomm devices
Date: Tue,  2 Jun 2026 18:00:24 +0200
Message-ID: <20260602160024.1171949-4-jtornosm@redhat.com>
In-Reply-To: <20260602160024.1171949-1-jtornosm@redhat.com>
References: <20260602160024.1171949-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: GgW0du7fGTwb7vu7k1hqlHiu1_kX8JZ0PRL1mzwU9Bc_1780416055
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_090101_847117_1BF67AEE 
X-CRM114-Status: UNSURE (   7.95  )
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

Some Qualcomm PCIe devices (ath11k WiFi, ath12k WiFi, SDX62/SDX65 modems)
do not properly support Secondary Bus Reset (SBR).

Testing confirms this is device-specific, not deployment-specific:
MediaTek MT7925e successfully uses bus reset through the same passive
M.2-to-PCIe adapters where Qualcomm devices fail, proving PERST# is
properly wired through the adapters.

This quirk acts as a safety net, preventing the broken bus reset from being
attempted if users override reset methods (device_specific or d3cold when
available) via sysfs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v6: code unchanged from v5
v5: https://lore.kernel.org/all/20260521130512.515125-4-jtornosm@redhat.com/

 drivers/pci/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 000000000000..111111111111 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3789,6 +3789,9 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0030, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0032, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003c, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0033, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0034, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003e, quirk_no_bus_reset);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1103, quirk_no_bus_reset); /* ath11k */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1107, quirk_no_bus_reset); /* ath12k */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x0308, quirk_no_bus_reset); /* SDX62/SDX65 */

 /*
  * Root port on some Cavium CN8xxx chips do not successfully complete a bus
--
2.53.0


