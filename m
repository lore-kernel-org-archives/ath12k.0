Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEEDC98318
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfQ+eUGvS5YGA/VscR/3oNIajPr36RjH9P3BCUg6xzQ=; b=oQSwV+WEcP/FwIzFyBh+XC1ymM
	OnqvcBhc8cKnDVqFPFlM2dsiZN+iTzwRIaZXqymqybtoZ/nY0+UC+7eQgiQVPrkZQlrRTRvcnGycl
	bYa6tkDiUT77jsnkBMtkJ7TvLdXveQIu3vemrpt3H9hN/6q0ID0hFHaYAPPfcuIO/3tDkwmhxveei
	YPU0P6IarmuluyJAVoffpDChQUseHj0+eVDMTBha5burfBpuZR6xKXg1TnL2M1WhEEY78/+ahPbc2
	9JniuGJwtfOFfC1dl54B3awiQwyFcwoAkx9YMATBGdhdLfID7xA0Tp0fEYvMr8ldQZC7SqdVxQef+
	V5a/Cg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHg-0000000FMJ5-1tzO;
	Sat, 26 Sep 2026 12:13:40 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHa-0000000FMG9-05L6;
	Sat, 26 Sep 2026 12:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Pf
	Q+eUGvS5YGA/VscR/3oNIajPr36RjH9P3BCUg6xzQ=; b=gouEGYUUXLSogCO3Vq
	y8PvQsp8mE/Sw0PYpK9dBT5mgoQcsgupVmByKOxj2VevlCRQl1K/ghhwE94427oB
	XpulkpK0WtSRuG8U1YVr1fgMaUwBQZYudLHCe/45dCjKniXTQt4ociVOn1NyPR1B
	9sEEeJ+nX90Lz1Px6p3VL7yXc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338nKtrdqfXOcAw--.9011S2;
	Sat, 26 Sep 2026 20:12:59 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andres Salomon <dilinger@queued.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Fox <pgf@laptop.org>,
	Dan Carpenter <error27@gmail.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	platform-driver-x86@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/3] debugfs: Reserve space for string terminators
Date: Sat, 26 Sep 2026 20:12:47 +0800
Message-Id: <20260926121250.3258285-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD338nKtrdqfXOcAw--.9011S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWrtw1kCF1fKw15Gw1fCrg_yoWfurg_Z3
	s5Krn7Jwn7Xws3Za42yFnFyrWSkFWaqF18Xwn8trySqry3JFyrAFs8WwnrGw4xWFs5Ar9r
	Gr9FqrWfZry3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKF4EDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wtoomq3tssfmAAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_051334_381715_4241BB37 
X-CRM114-Status: UNSURE (   7.03  )
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

The same boundary mistake appears in three debugfs write handlers. Each
handler has a zero-initialized buffer and allows a user write to fill the
entire buffer. That overwrites the only NUL terminator before the input
is parsed with sscanf(), strsep(), or strcasecmp(), which can then read
beyond the end of the buffer.

The write paths are independent, so the fixes are split by file and can
be applied separately. Each patch reserves one byte for the terminating
NUL while preserving the normal input size for that handler.

Jiale Yao (3):
  platform/olpc: Reserve space for a string terminator
  wifi: ath12k: Reserve space for a string terminator
  dmaengine: xilinx: dpdma: Reserve space for a string terminator

 drivers/dma/xilinx/xilinx_dpdma.c                   | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
 drivers/platform/olpc/olpc-ec.c                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


