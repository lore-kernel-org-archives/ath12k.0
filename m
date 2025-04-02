Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5898CC3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiamvhbO0EKnjUhV+h0zrpUl+OaQLpvIP40TcxdU1P4=; b=lj+rLwcJRAx+uNPb9/Y3mzTAOv
	AJ15bJDGqeaZJpN4UrDfVq9MmcXD7NVL3tDF/BF5UU9q4/1jqmfpfzOfV1j5K8SyQgcfEMnz1smRL
	YXgWBfE/4Q5y+077R/JWYPy4y8EwZBtlbbbYKcqzIlzqGAbHuWEoNR9p765Ou9i80oJZHJ5g6rVxy
	tVn78rofUsNgiksxKR0mTSr6iE1qqhUkxAqoWhbJ1JatqZH0FScra+xKJwRW195luvg+NtqKGjHqp
	guhVWbB2xDwSkzwv8U0ZAteZAce5SINvd2tjsYa0r8G7TU4ha9GWT8WN7RCNEqNkhIE7DpVMe6FfZ
	h+SrjxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyES-00000006Fur-0RoZ
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 13:34:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy7S-00000006EF5-3BOG;
	Wed, 02 Apr 2025 13:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDA705C68BF;
	Wed,  2 Apr 2025 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B91BC4CEEE;
	Wed,  2 Apr 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600421;
	bh=FrauQgZHIO5vM3GOiecxA1ME+VfylZ7v49JpojhIrho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ug3yjsSZFPHXUda32gb9aSn7a/EU+7LKWQBn/qkFX3G3DIfPdjrmeNuTPA+IcGuEH
	 6jYjyCfZYXlKwhKQ4xAgX6ZWsOsyWcq8JJ+v8kSDA/E+Li95cqzUb/B3VhgFl0+uls
	 BpXvrChUbKVceLzr3WYoPK5BO3/tuDKjDAdlj+vxdtCmrD1UxE0NSfgkLUJL5eQHMO
	 W1vbBiW5QcC8sVAYTX65I0qtAXPPpPp+2bveYvLzW6oRIvk6v54I1UgNGHe/Gm01BV
	 AnBFHotfiGdM/ePo+Y5JdpnFZS7JyCugJTpZbBdkQ+tQW2wKhHE4MYquFEScY6JZa3
	 QV0z93mboCQ8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tzy7W-000000004iM-2NZV;
	Wed, 02 Apr 2025 15:27:06 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/4] wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
Date: Wed,  2 Apr 2025 15:26:33 +0200
Message-ID: <20250402132634.18065-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
References: <20250402132634.18065-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_062702_850069_6A741E3C 
X-CRM114-Status: GOOD (  10.12  )
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

The PCI_PWRCTRL_PWRSEQ and HAVE_PWRCTRL symbols have been renamed to
reflect the pwrctrl framework name. Switch to the non-deprecated
symbols.

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 52a1bb19e3da..2d1eb22deda7 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -7,7 +7,7 @@ config ATH12K
 	select MHI_BUS
 	select QRTR
 	select QRTR_MHI
-	select PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL
+	select PCI_PWRCTRL_PWRSEQ if HAVE_PWRCTRL
 	help
 	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
 	  802.11be) family of chipsets, for example WCN7850 and
-- 
2.49.0


