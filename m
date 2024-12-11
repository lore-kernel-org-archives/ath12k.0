Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBEE7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Mtim6Vumk26ogfTknsk9OYqSnDTX2UJr/fFXu3oBZk=; b=wllC5h4T3e84Xp6irHgJxF2DtP
	N6y72dhC7YM8g5w9O9jrh1+ETaShPO+lf4Q1Cj/ULYBDIbKSrP4RyGAFCF0P5oH/PUoekh0kTJAis
	YWcvTRhH1OFeU8yUETXmiZHH1Ve/q05pTROwgvtwPTi+HizqNUS2J8Q/zkk1f5NZs8pygZJVXXdzr
	bCslOVmnzRZCj05rBtPwaCPbGelD6idPxSCcA1VeuMbU1+KX9yq8gRR1ZjpmgeK+A+Ubtn6AFTw66
	jOHOv9JWtL6Rl544kOuN3K0WcFccEOa3AiRvIv7rHe/BHSaZXJTS7nhok6+rUaf1nLSQ65GLh7DYf
	piuaG1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjX-0000000FGrv-0ro0
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjU-0000000FGqt-319T
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 951735C59FD
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F9BC4CED2;
	Wed, 11 Dec 2024 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931275;
	bh=L7wzVvymBJg0eN3gAGAMtzo6S3quGzzL4FwBiMvbaVA=;
	h=From:To:Cc:Subject:Date:From;
	b=aH5Af9qxMczA7RImVZQQ3v97VuwhambD2XO/wI9quAbUk0khDM6TDhk0twy6S0B5b
	 N+usp0qBFTbnub3TCdMVCqczN/t9xkNWL64yXiau+0UdNAp2VhcbAkLE9vPkg9ceXb
	 cdTX4G5LUJSTbP3gGnYD8xdBBAoOf8CUd5ZeAXbkg21tq7JwR6XSWrx/r9tT92TxHP
	 YN80hBjOCDGOyzD7DCOGzacpXDyaQN65w67K1Z9x6oFJ4QlsSloTGLXe5xcLYFnbWI
	 unP65MqKjZ3PbKg3t02AgV613HjWgCj1+TsaJDShrfGBcTh76o/TmtMObR3I7Vgf0S
	 L0DghhQSLq35Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/8] wifi: ath12k: MLO support part 7
Date: Wed, 11 Dec 2024 17:34:24 +0200
Message-Id: <20241211153432.775335-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073436_798952_28E07049 
X-CRM114-Status: UNSURE (   8.33  )
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

Device Tree bindings were reviewed as RFC earlier:

[RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI module with WSI

https://lore.kernel.org/ath12k/20241105180444.770951-1-quic_rajkbhag@quicinc.com/

The only changes from the RFC are Jeff's email address, using flag instead of
bool and moving the WSI description to the beginning of the doc.

This patchset applies to ath.git main branch. Please review.

Kalle

v3:

* patch 1: move description of WSI to the beginning of the doc

v2: https://patchwork.kernel.org/project/linux-wireless/cover/20241209153034.50558-1-kvalo@kernel.org/

* patch 1: change qcom,wsi-controller from a boolean to a flag

v1: https://patchwork.kernel.org/project/linux-wireless/cover/20241205203044.589499-1-kvalo@kernel.org/

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

 .../net/wireless/qcom,ath12k-wsi.yaml         | 204 +++++++++++++
 drivers/net/wireless/ath/ath12k/core.c        | 256 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h        |  18 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  13 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 142 +++++++++
 drivers/net/wireless/ath/ath12k/mac.h         |   3 +
 drivers/net/wireless/ath/ath12k/qmi.c         | 283 ++++++++++++++----
 drivers/net/wireless/ath/ath12k/qmi.h         |   1 +
 drivers/net/wireless/ath/ath12k/wmi.c         | 180 +++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h         |  49 +++
 10 files changed, 1072 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml


base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
-- 
2.39.5


