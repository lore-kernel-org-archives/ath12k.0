Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C9E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=65yAw8325Dd7Qr3UqVW6ZRjevzjQOQG29DPrn640WnU=; b=3A0oRnYIDAMwuyAbupzbIjDa7q
	T1ONiEMUR7BmAjtR3vn958R/mH76SqGUXB2tfRP52ztK04oLPSGIL9nL+d351jxq7BNjrfMcOkGSM
	KSpw6AEoCmuZpHDrPzi2Npn3evZGrNXxIpHEvly6WMp+63nDR/Wm7smv0po2A5JnIcs5+Q1sje7yI
	rbYeE5Kiq119/opmjRE55+KZjgkYNQkiXZqPre/t+e2yJYJFQ/QHXw7Q2ixr5KSygcN85iz0qGi+r
	e/QMPGRF9c67vR61jQqO2pHHv7CkX79AK5PpHdRH/rx/aKZtu/pn5+9YPEafzMkm3Afs8hkU6YAK+
	VAHdbMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfia-00000008OOC-381R
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 15:30:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfiY-00000008OMs-19jz
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 15:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BA8F5C5C98
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 15:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96292C4CEDE;
	Mon,  9 Dec 2024 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758237;
	bh=I/SQkPW7UvDlEYoReU9WDUhS/0OXih8QMkx7sMylOaU=;
	h=From:To:Cc:Subject:Date:From;
	b=px+03AIpFDcyKsX6s5ZF6dwBk1rQeNTrTEdJomQFvAUnEFmz8C2+aigN65c8xFTc9
	 UXwSGqg0n/y4AK5j7Wn2iVHoGtrhuL3CEeaHlRATZzjgreEXHbZRub8E4WigWHX+jK
	 fIb8dPVjQrgjTH/qYXHI8mHY2cQAbDT6WNqRv621wo1mRzOSl37RdH07VcBCBZ9d33
	 iUlqqAIM7vELuoca2Je/HceeQqXKOwaQryKVt933O2G/6lUEy8cqxVKsJDF1HY8GuR
	 IktEAD0MSxuVZpSyhyfYQoGaLXWNKYQHMlGHxWK6iAV759Kzz0o5SEzaCCTFDDPU7b
	 csKlu5zTampbQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/8] wifi: ath12k: MLO support part 7
Date: Mon,  9 Dec 2024 17:30:26 +0200
Message-Id: <20241209153034.50558-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_073038_370665_8ABDA29D 
X-CRM114-Status: UNSURE (   7.59  )
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

The only changes from the RFC are Jeff's email address and using flag instead of bool.

This patchset applies to ath.git main branch. Please review.

Kalle

v2:

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


base-commit: 400568fb3b022247c1603fdbdd6444b3ef14ffce
-- 
2.39.5


