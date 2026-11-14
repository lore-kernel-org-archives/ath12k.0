Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DEF606A887
	for <ath12k@archiver.kernel.org>; Sat, 14 Nov 2026 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T43QzUyL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKf8twuQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NMotlcjIWZDZJmHH9FhIZJX3P4Df1ycfmlTl1VZIX44=; b=T43QzUyLenxxtO/MFVaLCnu5TL
	xggOxQNejYQztDZirA5WjzVthJ5gBMwq7aOXPmJ63VE91KyvH3UXF23OyW+RzW/ACQyc5twJinpLB
	xQpQg92OolFoB63ab55JMP1Td7TMFR+OYgBA+5C4YiDIdXdOE332Q/7kXaAgccZOmHe6v5bUP9ErV
	z9DsXvCYaFg0tJ2nbVGWIco4rBfa267Er02W41Vpw/19j7eNU1zeCdysGD5i7A8hTm+1WSi1X2jTO
	yVxCop4+NaUtveizSdWnv8d2fe1LR+dvDwGA7t13EAsE8oazONs3E/4Gk0bq44l+PBAFDhhCCU447
	PaGWsm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEzW-0000000GI0H-4Bg2;
	Sat, 14 Nov 2026 14:44:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEzV-0000000GI08-2k4S
	for ath12k@lists.infradead.org;
	Sat, 14 Nov 2026 14:44:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F036600D4;
	Sat, 14 Nov 2026 14:44:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794667468;
	b=YKrlTG1Hfvc4TTmHymkCDMptbiqJF7J+N6VzAFm25QWIyGh0OTr72jwao1gwoC8RbXSX
	 12X4cen3dN7tRrIq1LloPErbqmj3mif7iRCS6PuYT3u03niAqF6vlAEQ3MLPD2Lq9ND3+
	 6EUTSMW8qoQh7Oa11aMBRXpeP33FNvvmNds+y2bD3q6nGev/IetFOL9xO9MuhD19OH8Ic
	 bLRhn+xmb1R6VyWRD1SiJx7gX9p1EwAXNIdS0CPJNBZcdecPXfBDuKDShlrkWAyFGC5aQ
	 feBdfDczV+efLiwVGdJz9+rbGlDT34HmdTDn5yZdr739ubwntgAKmVsquNr1VZwtpYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794667468;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NMotlcjIWZDZJmHH9FhIZJX3P4Df1ycfmlTl1VZIX44=;
	b=WOnlUnlNkYZSSh1CG5WWmrJ9iEoIwun1W2QlcOz+7ZwfnjTJauoTXeI81v0mcDE+wUpT
	 iKLeUW7U2/Iogp9RLTCIT+wA4Ir9XFQM0uwghgHqgAvmZj2xVNM8I4UIhr5VxQ6cyD9bt
	 5KQak037tABh4s4KO90pwc+oMEBxXRnCZRCtUwtk4LOFMV57oSEgeexxA8yiQTi56Z0kf
	 rSxgcyJm/HPcIWfnDePZ4Sdixl74JXygnGOOGkTEMUzH/fNhyZr1N2nAptbeD8C7XlQ6/
	 dPWcnx9I/XMcfX9bzxjwRytRyzn/QLsLAErMU87V+atPCB8cAKWjLDDwBlMnc++tXvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA1AA1F000C4;
	Sat, 14 Nov 2026 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667468;
	bh=NMotlcjIWZDZJmHH9FhIZJX3P4Df1ycfmlTl1VZIX44=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LKf8twuQ7Bk5YWfWUUyl02qlgoDN4QCcf72SsjTXTO0ue3GMXB4VBdDJex9rsSkE5
	 tioryN649YpyhZajE9Gz14la9FnLEL7dTg/JPud/e8SnAqxaa1lzKOD6QtB0kBmgUm
	 Me4cMreQGO0VWUhCGJkrrHgjnW1qGp8iZv51/ON+XQZGmhpNq5NwEZ8bNmTWCJxbLK
	 Jr2cgonw64sRIOgLVk0IsWQvN9Kth5i0nWTPFAWgojfddZQ1leHWyou0LTqpOE69bO
	 ws7mhDxst/t9XTozPaeRnNkjTNHyfNfl2n2wo/q+cyTHF/sE8/ARW7OBeiwVCC2gvb
	 aB26gJSMEQJZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 082B649DC2;
	Sat, 14 Nov 2026 14:44:27 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 08:44:27 -0600
Subject: [PATCH] wifi: ath12k: don't zero the 6 GHz TX power on a vdev
 restart
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-ath12k-6ghz-tpc-vdev-restart-v1-1-5680ada87c37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMpz+GoC/yXMwQ7CIAwA0F9ZeraJZZODv2I8ACujmswFKjEu+
 3dxO77LW6FwFi5w7VbIXKXIa26gUwchuXlilLEZzNlYIhrQaSLzRDulL+oSsI5cMXNRlxXjxZM
 dYk+9t9CKJXOUz97f7ofL2z846P+EbfsBGKJri4AAAAA=
X-Change-ID: 20261114-ath12k-6ghz-tpc-vdev-restart-f5b164f313b6
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794667466; l=4577;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=kke/DsAVwEMxb+LRgu7ak2aDlof084RcMGz+021hfbM=;
 b=J3GnQJVnp1P9yrNbKglpLQVBDaYwW8zTORBFGlB3CXSXLIG1jiY49ebcIGqsQ/7SZ6vLz7Hd8
 RkFMBNmGmN3AN2rjGEUZ4Qf1O/4YbCaZNUByhNG+XytHqSQFnRrme6p
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath12k_mac_fill_reg_tpc_info() takes a non-zero
reg_tpc_info.num_pwr_levels to mean that a TPE element was parsed, and
then limits every power level by reg_tpc_info.tpe[]. But it also stores
the number of levels it filled in that same field.

An AP vdev never parses a TPE element. Its first vdev start finds the
field zero and fills the levels from the regulatory rules; every later
start or restart of the vdev, such as a channel switch, finds the count
of the last fill there, takes the "TPE received" branch with the level
count of the old width, and limits every level by tpe[], which is all
zeroes. WMI_VDEV_SET_TPC_POWER_CMDID then carries a limit of 0 dBm, and
the AP transmits at that until the interface is removed and added
again. A station whose AP sent no TPE element for its power type goes
the same way on its next vdev start.

On a 6 GHz AP, after a channel switch from channel 149 to 165 at
80 MHz, or one that only changes the width (80 to 320 MHz, or back),
iw reports "txpower 0.00 dBm", tpc_stats shows "power limit-0" where it
showed 48 before the switch, and a station next to the AP hears it
15 dB lower.

Keep whether a TPE element was parsed in a flag of its own, set by
ath12k_mac_parse_tx_pwr_env(), and test that instead. With the change
the power is the same before and after seven channel switches, three of
them width changes.

The change and this message were written with Claude, an AI coding
assistant.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: aeda163bb0c7 ("wifi: ath12k: fill parameters for vdev set TPC power WMI command")
Fixes: a44958c83e52 ("wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev")
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Found on an Arista C-460 (IPQ9574 with three QCN9274 hw2.0) running
OpenWrt: its 6 GHz AP went to 0 dBm after every channel switch, and
stayed there until the interface was taken down and brought up again.
The cause was found by reading the code.

Tested on that board with Linux 6.18 and ath12k from backports 7.2,
carrying the same change: without it four of four channel switches
left "txpower 0.00 dBm"; with it seven of seven kept the power. The
code in ath-next is the same there. On ath-next the patch is
compile-tested only.
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 drivers/net/wireless/ath/ath12k/mac.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae8..ff835a1a1e32e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12125,7 +12125,7 @@ void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
 	start_freq = ath12k_mac_get_6ghz_start_frequency(&ctx->def);
 	pwr_reduction = bss_conf->pwr_reduction;
 
-	if (arvif->reg_tpc_info.num_pwr_levels) {
+	if (reg_tpc_info->tpe_present) {
 		is_tpe_present = true;
 		num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
 	} else {
@@ -12314,6 +12314,7 @@ static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
 		ath12k_warn(ab,
 			    "no transmit power envelope match client power type %d\n",
 			    client_type);
+		tpc_info->tpe_present = false;
 		return;
 	}
 
@@ -12353,6 +12354,8 @@ static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
 				   i, tpc_info->tpe[i]);
 		}
 	}
+
+	tpc_info->tpe_present = tpc_info->num_pwr_levels > 0;
 }
 
 int
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 61c2ec8865a39..1da758837c7b1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -119,6 +119,7 @@ struct ath12k_chan_power_info {
 /**
  * struct ath12k_reg_tpc_power_info - regulatory TPC power info
  * @is_psd_power: is PSD power or not
+ * @tpe_present: @num_pwr_levels and @tpe are from a parsed TPE element
  * @eirp_power: Maximum EIRP power (dBm), valid only if power is PSD
  * @ap_power_type: type of power (SP/LPI/VLP)
  * @num_pwr_levels: number of power levels
@@ -129,6 +130,7 @@ struct ath12k_chan_power_info {
  */
 struct ath12k_reg_tpc_power_info {
 	bool is_psd_power;
+	bool tpe_present;
 	u8 eirp_power;
 	enum wmi_reg_6g_ap_type ap_power_type;
 	u8 num_pwr_levels;

---
base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
change-id: 20261114-ath12k-6ghz-tpc-vdev-restart-f5b164f313b6

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



