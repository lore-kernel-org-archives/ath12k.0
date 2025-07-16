Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614B7C83F1B
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJlK7abjzOGl2+3g/H1QTqKgbES+uSpEcgOHnJI3eWA=; b=noZ5c3OhKlA+jAqnHS6FxtKsaM
	tfXr54iuJxsiOcmPB/Crp9aOxebeWvuhfObUnQ3iI/n05i2POxHPEcc1EXW7Pk9Ph7/M5IVXICWQz
	958GhjQsKtwgY5n/1Z+j8Een4QxFbff16ZnqCoe7SWTg4byDmNZWmI0JsCtG6FnOCX5Ndb2sWs1jX
	pyVUgmZuk8VR2LhnxAUhtRLhHZSIvYNwbB7wNp8B6THsccZ+oF3+Js4nghipdmi/U83MUYzopeOnn
	OJcCLhhuSRDVuSdd0f2HCwlZNI2pLqAGH/a3ZLmnBfc2VMBw2mfdeCyCtsnfhsrJ6d8WCq7G7xQYi
	cilCU4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iR-00000007jA0-0cG5;
	Wed, 16 Jul 2025 12:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihT-2xls;
	Wed, 16 Jul 2025 12:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D9E146BA4;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE886C4CEFE;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670585;
	bh=drejDiiJ9ts2qV7cCSJTnPZpG9F4HUQgt0gkKgAgc0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=brNdrIUY+X4Awm0NB//QC3qw0/1MD9yeVtBqL7ckQpaifkfz/7uzxF9praCcq4XgJ
	 mTjv6JdgL8OWttnLzYY+zOJB9uX61ClGwOz+KHvk3qNmQOzLIrdR7g70RJZNBM/dP9
	 Uv4lc6eSBs+yHraHxMT8iSEOqee32E4Vu6lJWlbhIYQkJ8W+NAeOoet15XEDPCxnJs
	 BPa2fVvDwtQtnHS/eSNTQnyTZmpV8tbRMqkkL2IuVU+SYDDzbGt4bE5M36A4sF3yJn
	 jiGOvn6U+Pbjzep44TPN5vbj6M/KivV98SjvQLXT96/O+ivQbaJsfrt2vd6ZsypRlp
	 AMdTzWHtmIs0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37B9C83F36;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 16 Jul 2025 18:26:23 +0530
Subject: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
 ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=jdVSR3U+sLC1HJXWHdq7l808ARhICkBRRxwCHagzKUg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBod6F2cwm9rNB7o0Qyccmj+bb9tc9WqURscRrjJ
 xczMJxyGDKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHehdgAKCRBVnxHm/pHO
 9aIBB/sFwHYIZv2Z+23K7BMxH7dAOJUOh+KJF+XOn59WVguQBiXHDW+Wu059LmkTh6M2pkQ7lnP
 sUi1MLRs6RqEeW3vZ7MaicYC9T2Phmepp1RI8f5rBTrnDw7XVj4LuHM83XRLu9O84b8im+yuf/u
 oasg+ew5OQdczcVsu17UOoBWwaqNvhF4rIKvdehLzqmq+0YEy85AFSki3P8EXmtgIxJWbp3jefG
 146HJzcyMjfPLMK6XXQbiqG9tpK86c/KWlIN68jGAST2Nrf+NJWP6dXdOLEle0TCo8uiftLC/KU
 ai21GtQ+035HcqquIdi/9xtFbYPHzeX9NfdEK8Vj9W+lPV62
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055625_793700_AD374658 
X-CRM114-Status: GOOD (  11.97  )
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

It is not recommended to enable/disable the ASPM states on the back of the
PCI core directly using the LNKCTL register. It will break the PCI core's
knowledge about the device ASPM states. So use the APIs exposed by the PCI
core to enable/disable ASPM states.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath.h        | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.c | 10 ++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
index 34654f710d8a1e63f65a47d4602e2035262a4d9e..ef685123b66bf4f41428fec67c1967f242a9ef27 100644
--- a/drivers/net/wireless/ath/ath.h
+++ b/drivers/net/wireless/ath/ath.h
@@ -21,6 +21,8 @@
 #include <linux/skbuff.h>
 #include <linux/if_ether.h>
 #include <linux/spinlock.h>
+#include <linux/pci.h>
+#include <linux/pci_regs.h>
 #include <net/mac80211.h>
 
 /*
@@ -336,4 +338,16 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
 	return ath_bus_type_strings[bustype];
 }
 
+static inline int ath_pci_aspm_state(u16 lnkctl)
+{
+	int state = 0;
+
+	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
+		state |= PCIE_LINK_STATE_L0S;
+	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
+		state |= PCIE_LINK_STATE_L1;
+
+	return state;
+}
+
 #endif /* ATH_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 489d546390fcdab8f615cc9184006a958d9f140a..a5e11509e3ab8faad6638ff78ce6a8a5e9c3cbbd 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -16,6 +16,8 @@
 #include "mhi.h"
 #include "debug.h"
 
+#include "../ath.h"
+
 #define ATH12K_PCI_BAR_NUM		0
 #define ATH12K_PCI_DMA_MASK		36
 
@@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
 		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
 
 	/* disable L0s and L1 */
-	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
 }
@@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 {
 	if (ab_pci->ab->hw_params->supports_aspm &&
 	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
-		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-						   PCI_EXP_LNKCTL_ASPMC,
-						   ab_pci->link_ctl &
-						   PCI_EXP_LNKCTL_ASPMC);
+		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
 }
 
 static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)

-- 
2.45.2



