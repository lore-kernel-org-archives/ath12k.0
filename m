Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C9C54E4A
	for <ath12k@archiver.kernel.org>; Tue,  5 Mar 2024 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsWUIgjubwpDr/tD6hjKPCM0Cc0W1jOvi1pxG/y+o1Y=; b=bvdF4D9l3rgJThM0r/sVONhuWm
	sDHx87z43pDJoQwpE8itKnyHUYyQRvLM1SDnghDoyvNV9C02tLn2TzPkHBbD+Mwb1AMBAvlVQQxwo
	7oaq8eY7UwW1petHcNMpjtos5m4agAPKTNuNkKJ9vpgqvBzEzCu7shaomb6K6nIlvGYGIXxeP96t0
	fZNmBAvQHJqZzm3QtrWegFDXl2wdXv7JNAPdgxvNXbDxgAraiUL0owpNoqBzGwDzLBBUdO9B7ZpRn
	TR7qi6lDNX1Q907vjAuVdVqNTiOolDS26EF3m7F5US5hF4FjP8ef4s9gE5q5hSxkCUlsa2wU7cFJ+
	xu3JarJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYvs-0000000EkRe-2N8R
	for ath12k@archiver.kernel.org;
	Tue, 05 Mar 2024 17:50:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYvo-0000000EkPr-21T0;
	Tue, 05 Mar 2024 17:50:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CAFE616CC;
	Tue,  5 Mar 2024 17:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA98C43399;
	Tue,  5 Mar 2024 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709661023;
	bh=B/qqkKrr/0yu0DgsPJn/0e3g4ZQw/3kxTKmccWISBBY=;
	h=From:To:Cc:Subject:Date:From;
	b=KmWXksuhbs0nDjZkfkwRIQgavmtNgOG+ZHs54xPRRIgyMPaoSPDv0T9zs4P9m3Zqz
	 YczSZcdKVgjEfY/um5ZlN8d/YzZpJxnv4sT1yKO6TTS+3wxAfq2SxlVCdIv7/QZPsM
	 /LdB7FlDHgmZdl9vemGPKEAX2NzlUMi9sYyQrNg7oujoo/mHBBGAg5h4hH5y2suZZH
	 AyKywYGmRTkxMeT0CgE3plCqRE4V6IBJj0sxJYtPHnZ+5pdOdi1D3OsqTmQYXk5RWM
	 rD+Go07R3l9uqZp9m6yWTc+xBMaMnyrGwQarjAc8/SA/DzdeIOJ2IteqmUeIdUc0Ne
	 uCzNpByVCFpow==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, quic_jjohnson@quicinc.com
Subject: pull-request: ath-next-20240305
Date: Tue, 05 Mar 2024 19:50:20 +0200
Message-ID: <87y1awh8kj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_095024_637146_2D00EFE9 
X-CRM114-Status: UNSURE (   8.04  )
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

Hi,

Please pull, more information in the tag below.

Kalle


The following changes since commit a4634aa71fee11f5e3e13bf7d80ee1480a64ce70:

  bonding: rate-limit bonding driver inspect messages (2024-02-22 19:13:18 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next-20240305

for you to fetch changes up to 776c9c93bb0511d04e6222546499e5ea20ad51b0:

  wifi: ath12k: fix license in p2p.c and p2p.h (2024-02-28 16:09:29 +0200)

----------------------------------------------------------------
ath.git patches for v6.9

Only some minor cleanup in ath11k and ath12k. Adding Jeff as the
maintainer for ath10k, ath11k and ath12k DT bindings.

----------------------------------------------------------------
Baochen Qiang (5):
      wifi: ath11k: rearrange IRQ enable/disable in reset path
      wifi: ath11k: remove MHI LOOPBACK channels
      wifi: ath11k: do not dump SRNG statistics during resume
      wifi: ath11k: fix warning on DMA ring capabilities event
      wifi: ath11k: decrease MHI channel buffer length to 8KB

Jeff Johnson (2):
      dt-bindings: net: wireless: qcom: Update maintainers
      wifi: ath11k: constify MHI channel and controller configs

Kalle Valo (2):
      wifi: ath11k: thermal: don't try to register multiple times
      wifi: ath12k: fix license in p2p.c and p2p.h

Kang Yang (1):
      wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()

 .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  1 +
 .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
 drivers/net/wireless/ath/ath11k/core.c             |  8 ++-
 drivers/net/wireless/ath/ath11k/mhi.c              | 68 ++--------------------
 drivers/net/wireless/ath/ath11k/qmi.c              |  5 +-
 drivers/net/wireless/ath/ath11k/thermal.c          |  5 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  3 +-
 drivers/net/wireless/ath/ath12k/p2p.c              |  2 +-
 drivers/net/wireless/ath/ath12k/p2p.h              |  2 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  5 +-
 11 files changed, 29 insertions(+), 72 deletions(-)

