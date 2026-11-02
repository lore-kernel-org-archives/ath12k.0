Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCF606D81D
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+sBTfub;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOdP/qKQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=; b=y+sBTfubUpizzzrYtng8bdxkMs
	M7bv5S90ZqUs7bu7JWG4MYBjVz8o3SfLneKizLvwx0Ofd6AudP0OnpeoqKpy9oHU0jEx+eRxhqS5K
	iSXKuPWbFOOIXicKJ21fQmYCJAL8//W2oaI18Kuupg+bSE7b+PHIf2fhjaPYoRYbqNcH3eyqhQSXJ
	pWMSjkBfPaeDEyC/KWHycUHGBOqhS1+TnLSRrRIcfqNaAMv8E61JoZ0HQaKjy0AccBbUBWL0zs1Ck
	QTLhzh+ofRE+G1bFnthxI16WnIT5743bekG8RET2JT2tz+W9if0pdcBp0/EsrxTROZ4FYJVHq/0vh
	FedJLiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFr-00000000GPQ-3qJI;
	Mon, 02 Nov 2026 20:03:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyFp-00000000GO3-0ym2
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 20:03:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b042c0759so1785169f8f.2
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 12:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649819; x=1794254619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=;
        b=wOdP/qKQsQ+L0C35CMktn6/hqNiJe+cfucK4oKRfYDzUZcu84zQO9mMsspLSEoVTVF
         iQGTRegCNH0jTRegjkh71VGZXK34wcqHHYcwmlto9nZz3yEF8l16tSHl93v+iy+nWPyh
         IBFt4jbWRPGM+QMplRGjyK38Esa9/iW2PdEQ66eIW/wmTu1/sHQdpmO+1hxSmclKX1WT
         FrdDf+Ug5ZRSSzr+svJ5RVZ+GU32H4isEzbHiJbEY030ZZsydKWrkpLffkbb6OIxMtSi
         wpogGE62cjj5JjdqjnDHkA8P6+unNtvP/AD47yvZSY+sQZuR4pPBPA2Ty1l2q5qLQ6W5
         DyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649819; x=1794254619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDmRuiAok4BDh7Ywtb7KXFZfCX8FiUeWMjnaMHr+TlM=;
        b=Os6gbtzui2OZq4vE73ppJ84d4L8uA3swy6KlxDBmdSmbZENhYcs2a0OcU2e4GpWSS5
         X77r2CTUdZoxmChePK2TymmlaE476T7Ykos63Gc3LJ4e666P5FoWrmOrD/ePHgz6rHZ5
         ym/+GiBoUW5IlqsYNsD4A8w2fKyDKrPSxW3luWpY9z3YK7XPiyXG9c32FZ5Hrg94yrci
         VCdp2KS0kvvrYR5V75MPW2WWiUqVrvYPYw/nXcZ6kXtT3AYmuLdMFCs1NMCs1Z3h5lqf
         KSTUkJBLWUF1tskWQJJvCM+qEp3S6pJFmYg1B78P4Ne6hh2mQoIQkZPXQ8gYtpXYQsgP
         prJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMcxliM8lUQ9JSPCKeY+qgcH/vYCfse7Qfnq9h9oRXI/7WEpUKlnV1npniyyb5hVVRh0DpDNs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+HmZ1UIyZsP0HhxvFOs2+tRRWtPPMJ4pD2D8wS5OJnb+IiFdxo
	IgHJnlbbRYSgSY9/wj49tx1db9dyjzY5CNoEJ0oWiKnikmrttPjOZqgJ
X-Gm-Gg: AYBFou2keOQMheXBecFmTPGnd+jxo/CtDGHd96HRpPPwKhAiV8B9kYHKSR/ZWzK6AuB
	wpm6OHr+t/1Zsoda9zB6+Vhn1hj2nyoefoofAfJyJA+TqYSL25dpT3RFmk4PtYfYOhJmWeMWwho
	11L8t+5qvvX2TlHQ3QoVzciKxhRj/qlYAYPlvFyDBxujwASpHI5kCILnKvRx6ItllyMjsqh0WEr
	5ba1OFG/WRmO9SIuAQ++pI1GwwbvSylMMeqph83UU9YtQYduyLEi935oE+oRYdlpYAWT5MqJSdw
	wzCh9iOQXaLeCqRarQhXdLR+X5F+XIuQ+DYJKhmxh7Zk4+uSwwledb3Qqt0pcg5lgpvxhyhII+5
	yND/mxdoSUAsyzJUApr/H0yvG40425DEWh4iR2YSXNc/WnW0ieXHOBQft8xx49fyNGnxY22Jcmb
	Cgw3emLfBFMqM1t93u9ec4GkSqf0HPpBzDEJfcz2fgYHXcbK6Qn5oJQTIj4VduoP4MD4nO31GFP
	mvWHr+UzMA6IOmtNPUkHOb+g7dtuyNcld3kZYYqIVBjc+Ncfjc1fitbHNR4flv/LTOgbVLsKyIw
	eXIbWOy3tcLBGHmiKDbMG9OAQdpdnKLbasY9u5k1oKR/XoCW8QSk/EHVRyjHHQabzss33lksdy9
	SN00lSMBamVQbaSA8nEM8jWsTaAcJdNBLgC2RdjRkZWW+GubbjlSMc19EfEy/bIsx53qYDZw8nP
	fTnow1JImd5Nw=
X-Received: by 2002:a05:6000:46c5:b0:48d:fd4d:7fbe with SMTP id ffacd0b85a97d-48e6e2bdf92mr17382937f8f.2.1793649819000;
        Mon, 02 Nov 2026 12:03:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:37 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Mon,  2 Nov 2026 21:02:33 +0100
Message-ID: <20261102200235.48973-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_120341_288741_FDBA2C17 
X-CRM114-Status: GOOD (  11.66  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With QCN9274 firmware WLAN.WBE.1.6-01243 (the newest in
ath12k-firmware) the driver logs three warnings at every boot:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

The firmware requests the AFC memory region (QMI memory type 10) and
advertises direct buffer rings for modules 2 (CV upload) and 3 (Wi-Fi
radar), all defined in Qualcomm's interface headers but not known to
the driver.

Patch 1 answers the AFC region request with size 0, so that the
firmware sees no AFC region instead of one at bus address 0. Patch 2
makes the DMA ring capability parser skip unknown module IDs instead
of aborting the event, and stores the accepted entries contiguously.

Tested on two QCN9274 hw2.0 PCI boards (AP MLD on 5 + 6 GHz, and on
5 + 2.4 GHz) with the series on top of v7.3.1: all three warnings are
gone, the firmware reaches firmware ready, all links come up and serve
clients, and there is no firmware crash, call trace or IOMMU fault.

Changes in v2:
- Patch 1: do not allocate the AFC region, because ath12k does not
  support AFC. Answer the request with size 0 instead, and log at
  debug level. New subject. (Rameshkumar Sundaram)
- Dropped v1 patch 3 ("name direct buffer ring modules 2 and 3").
  ath12k has no user for these rings, and patch 2 alone removes the
  warnings (tested on both boards). The firmware uses such a ring only
  after the host configures it, so a host that does not implement the
  feature loses nothing by skipping the entry.
- Patch 2: commit message reworded and code comment corrected; credit
  Nazar's earlier version and Jeff's suggestion from its review.
- Rebased on ath-next a3ddbb457687.

v1: https://lore.kernel.org/r/20261030220824.915760-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: report no AFC memory region to firmware
  wifi: ath12k: skip unknown direct buffer ring module IDs

 drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 3 files changed, 41 insertions(+), 15 deletions(-)


base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
-- 
2.56.0


