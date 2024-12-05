Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BBE7716E
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zh/52I/i+UObLi5vBz07C7y9mxD5tgvprWBRsu/pEYw=; b=HAb4FsDfjVQpiNXiybt844n7Qo
	GOw/w/beABHSMKHDTPlLjF7XmxJBjPHZAn09cYLpIYmtmzOXsjoANbMti9nx+aZGIaQuZmKc6UH8C
	asDkD1vRVi+Ut033Bco0i100AYg7fsABGu+L8wfSo02fXGRMBf2tVLjqyXf8igWI90aRcq/j1y+vh
	gJeoojZcKcHXtUWKU9EKVZJY5WeEqD4OvTZalBp43zj/jn3Bxc9TrPQChpB0O/bP1rYchaLc9kY1u
	38d7GBES4EBcP3sj0PI4tKx4Po8iq5dk3AO2yZ0sbLNbTzMCwOb+jToWey6Ms0tGTVueI96YktXgS
	itbLzrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUt-0000000HJOb-0mpR
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUr-0000000HJO0-0RhL
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 248735C598D
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBABDC4CEDC;
	Thu,  5 Dec 2024 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430647;
	bh=Ib3cGulyfqEUw58OLEQF7k9wpzjY72SNjQYpqGguIOU=;
	h=From:To:Cc:Subject:Date:From;
	b=G0n1QEkeaNl625piuM1qYWEOP8Xpnc7XYN4dZ/NXa5U9L1BovuibuvNLt1kmvfBlt
	 bhKshxhCMXqHoL0ZkCofgJ6FQqjrI1zzwvL0nR5yGgs4pVR90XWEJ5j4N/GdlDx/rU
	 hQ01aEIPzniLNwqylL3SlOwgzLpOFKQgAuJKVl37ioV90tebsld6eEvELk62EyifHp
	 zAFkZatCfqr+8esUr724yyNMTZxyfDAT6DnvDNCyW53457hyXnopkmxa1nL/D/aKj+
	 Vh3YL/Igi+WiWo882kJ+23Ym6MOI11FHlZsczrE+rJflNUK3j7WABj1Z/HhFL2v86X
	 ZNtNC8BT4VU4Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/8] wifi: ath12k: MLO support part 7
Date: Thu,  5 Dec 2024 22:30:36 +0200
Message-Id: <20241205203044.589499-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123049_193019_77D37E37 
X-CRM114-Status: UNSURE (   6.72  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Implementing Multi-Link Operation (MLO) continues. Bindings document is added
to get WSI information from DT (patch 1) with the code parsing the information
(patch 2). Rest of the patches are about configuring MLO in firmware.

Device Tree bindings were last reviewed as RFC:

[RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI module with WSI

https://lore.kernel.org/ath12k/20241105180444.770951-1-quic_rajkbhag@quicinc.com/

This patchset depends on:

[PATCH 0/7] wifi: ath12k: MLO support part 6

https://patchwork.kernel.org/project/linux-wireless/cover/20241204163216.433795-1-kvalo@kernel.org/

Please review.

Bhagavathi Perumal S (1):
  wifi: ath12k: Add MLO WMI setup and teardown functions

Karthikeyan Periyasamy (5):
  wifi: ath12k: send partner device details in QMI MLO capability
  wifi: ath12k: refactor ath12k_qmi_alloc_target_mem_chunk()
  wifi: ath12k: add support to allocate MLO global memory region
  wifi: ath12k: enable MLO setup and teardown from core
  wifi: ath12k: avoid redundant code in DP Rx error process

Raj Kumar Bhagat (2):
  dt-bindings: net: wireless: Describe ath12k PCI module with WSI
  wifi: ath12k: parse multiple device information from Device Tree

 .../net/wireless/qcom,ath12k-wsi.yaml         | 205 +++++++++++++
 drivers/net/wireless/ath/ath12k/core.c        | 256 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h        |  18 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  13 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 142 +++++++++
 drivers/net/wireless/ath/ath12k/mac.h         |   3 +
 drivers/net/wireless/ath/ath12k/qmi.c         | 283 ++++++++++++++----
 drivers/net/wireless/ath/ath12k/qmi.h         |   1 +
 drivers/net/wireless/ath/ath12k/wmi.c         | 180 +++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h         |  49 +++
 10 files changed, 1073 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml


base-commit: 3b2ab397d31f926523f2781d7f0a14a387415bf4
prerequisite-patch-id: 4540940c2bec34a09b96e13f48137b6e790511d4
prerequisite-patch-id: 472a001cb2a5600bbb7586f33107b3e03779cd13
prerequisite-patch-id: e0f7adef6ad3fb9d6d87acb79750a50e3c806708
prerequisite-patch-id: a7b08b983b6c74382c97db7e7d10cc954853fe9a
prerequisite-patch-id: f623e2512bafdececc6b567935fe750c572a0089
prerequisite-patch-id: cfe1b2c58cfa15ea019cc32114c5787a39a65f9b
prerequisite-patch-id: e2829b24674547319d5e684ef7bdd800667c0807
-- 
2.39.5


