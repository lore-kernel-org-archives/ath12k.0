Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE06606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Ixmm4Vj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JUsIqzei
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s1qjuKYUc83awRoMLtt3OYHBYrmVYF5F4XNJVMk1IZ8=; b=0Ixmm4VjJ+jOA1rJEG74kHildQ
	bmYFg+1Fc4I6tr4M2ox4fQYK4c9Lim40UOJcRWBHF2xNcxhy0s0HxTB7NBKjFUA0f6gdovoRi4kB9
	Ofs8xsOAHM6en+WVxLiVBLgIV/0z4yhZa43Razm92IYoKNVDCsvbP1h281UCN7x6HRUN85wlEHShI
	hi/TUHdOG4pVrx2X6Fa5TpwyGchZjmVwq0UA3dpypAiHJFjcuEu+W3aAqKSWac4zH8ptS7gHL9FkS
	2xXsjoWK1RYMLpWVyRuD4kthMYvBDHhEz34OIDfEg+Hg+4xr/BIKoK/UUi2CZnB8VgIAcclmdxpxz
	jN24sXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrhL-00000001WCJ-0Kt5;
	Mon, 16 Nov 2026 08:04:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrhH-00000001WBJ-2K99
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 08:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794816253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1qjuKYUc83awRoMLtt3OYHBYrmVYF5F4XNJVMk1IZ8=;
	b=JUsIqzeiZb2eigPa3rBgoA6xiM8crN3SgQnTCkSB2DtHcpsFKfz5X9uvCAzKJNLUS/RvQ7
	aHlw2UXHZUpqREdnGTo3z4ja54q3hpDswS/TviK03FzXZGLcKI2erSxSVP8rKw7TgQ6pZU
	YXiBuqqem98vv3OhkhLbz056HsHw2Ck=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-4egDlCWUOdG0WMuYkWiqUQ-1; Mon,
 16 Nov 2026 03:04:11 -0500
X-MC-Unique: 4egDlCWUOdG0WMuYkWiqUQ-1
X-Mimecast-MFC-AGG-ID: 4egDlCWUOdG0WMuYkWiqUQ_1794816250
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CE5918004F6;
	Mon, 16 Nov 2026 08:04:10 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5B9618004FF;
	Mon, 16 Nov 2026 08:04:08 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] wifi: ath12k: fix crash on unbind when board data is not found
Date: Mon, 16 Nov 2026 09:04:04 +0100
Message-ID: <20261116080404.93529-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: woMagHsIigMwsRbayEH_Owk-VKKGtXp-QEyo8fOgOi0_1794816250
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_000415_665903_6A21A65A 
X-CRM114-Status: GOOD (  15.44  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When QCN9274 boots without the required board data in board-2.bin
(e.g. board ID not supported in the default linux-firmware package),
the QMI firmware initialization fails during board data loading:

  ath12k_wifi7_pci 0000:07:00.0: failed to fetch board data for
    bus=pci,qmi-chip-id=0,qmi-board-id=4102 from
    ath12k/QCN9274/hw2.0/board-2.bin

Without this fix, unbinding the device crashes with a page fault in
mhi_queue and duplicate sysfs entries, and the only recovery is a
reboot:

  sysfs: cannot create duplicate filename '/bus/mhi/devices/mhi0_IPCR'
  Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
  Call Trace:
   sysfs_warn_dup.cold+0x17/0x23
   sysfs_do_create_link_sd+0xe3/0xf0
   bus_add_device+0x9a/0x200
   device_add+0x3d4/0x750
   mhi_create_devices+0x15f/0x270 [mhi]
   mhi_pm_mission_mode_transition.isra.0+0x20f/0x2b0 [mhi]
   mhi_pm_st_worker+0x26a/0x2d0 [mhi]

Fix by:
- Setting ATH12K_FLAG_QMI_FAIL when firmware_ready() fails in the
  FW_READY event handler.
- Using ATH12K_MHI_FORCE_POWER_OFF when QMI_FAIL is set, to skip
  the MHI_STATE_RESET that triggers QCN9274 firmware auto-restart.
- Replacing ath12k_pci_power_down() in the QMI_FAIL cleanup path
  with a direct ath12k_mhi_stop() (guarded by MHI_POWER_ON state)
  followed by ath12k_pci_sw_reset() for clean firmware state on
  re-bind.

With this fix, the user can install the correct board-2.bin from the
manufacturer, unbind and bind the device, and it initializes
successfully without rebooting.

Tested on QCN9274 hw2.0 with unsupported board ID (0x1006) in
default board-2.bin.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 2 ++
 drivers/net/wireless/ath/ath12k/pci.c | 4 +++-
 drivers/net/wireless/ath/ath12k/qmi.c | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..4290a4540351 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -507,6 +507,8 @@ void ath12k_mhi_stop(struct ath12k_pci *ab_pci, bool is_suspend)
 	 */
 	if (is_suspend)
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF_KEEP_DEV);
+	else if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab_pci->ab->dev_flags))
+		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_FORCE_POWER_OFF);
 	else
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF);
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index dbd960f88d38..bbd1f868295d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1741,7 +1741,9 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
 
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
-		ath12k_pci_power_down(ab, false);
+		if (test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state))
+			ath12k_mhi_stop(ab_pci, false);
+		ath12k_pci_sw_reset(ab_pci->ab, false);
 		goto qmi_fail;
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..5fc4ce4bae6f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4095,6 +4095,9 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			if (!ret)
 				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 					&ab->dev_flags);
+			else
+				set_bit(ATH12K_FLAG_QMI_FAIL,
+					&ab->dev_flags);
 
 			break;
 		case ATH12K_QMI_EVENT_HOST_CAP:
-- 
2.56.0


