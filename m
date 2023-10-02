Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51557E74902
	for <ath12k@archiver.kernel.org>; Mon,  2 Oct 2023 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hWhPahbQ/khFRksnMaw8zV1JsaGZIW1Xnl6xx4E1NCU=; b=daHbLklcbXSDdC
	By2pxubYuYyBRteicycQ4WlXIbvKIZdqxHAC1bxnZV4tZFD9WjrlLLFOQAlM2rksUAfcoB5xW5DvM
	TU5AzyHgMXAyvQRJIEw945O8gY4Jrw9aZgVOy9/uJuAj/LeRIXVjDsEN5hPZBrMA/1tt2HRsaxYBm
	UYgi3Qeca7wDAlP++Q0NrIx1pMV74YBFn8ArGxOzMidSaw8PnDz9Dr31zbhMnsM055H6x8l3jE/6f
	g6sziVBNOCVFmyYgYmP+SJ1Bh4TJiHyhT6NQM5hT1Oxajd+Rw5bXmpmL6+kTePJ9DT75dDDmvlW71
	u1JmhnyD/394AKB+0jsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnNgN-00DDWS-38
	for ath12k@archiver.kernel.org;
	Mon, 02 Oct 2023 18:30:15 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnNgI-00DDW4-2X
	for ath12k@lists.infradead.org;
	Mon, 02 Oct 2023 18:30:14 +0000
Received: from mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:6094:0:640:a0fc:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTP id 7B7B66004E;
	Mon,  2 Oct 2023 21:30:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 0Uai0s2WoOs0-1UsmPXuD;
	Mon, 02 Oct 2023 21:30:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1696271400; bh=wAy9SqB3FdhkMyineGEngwKExIGQyZJibJ7vayETQdE=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=an5ZI0OrMMBx1JD2ZiXObjSp2fIyWbE8bC6RQh6kfyW6xUo0WWBAkL/UsyeuNwBVM
	 D/bpIhobI4BvznshTvI48jz8sRaHCEE88koBPCUZZDAamQhBc7jQnzwIF48iKeBhY6
	 R1iiKnsxMhX5SKl4927nCJJnj0ZRj37d/6hBsOP0=
Authentication-Results: mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath12k: remove redundant memset() in ath12k_hal_reo_qdesc_setup()
Date: Mon,  2 Oct 2023 21:28:48 +0300
Message-ID: <20231002182856.131254-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_113011_340500_9FB9BC3D 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Since 'ath12k_dp_rx_peer_tid_setup()' is the only place where
'struct hal_rx_reo_queue' object is allocated with 'kzalloc()',
call to 'memset()' in 'ath12k_hal_reo_qdesc_setup()' may be
dropped. Compile tested only.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath12k/hal_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index ee61a6462fdc..f6afbd8196bf 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -713,8 +713,6 @@ void ath12k_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
 {
 	struct hal_rx_reo_queue_ext *ext_desc;
 
-	memset(qdesc, 0, sizeof(*qdesc));
-
 	ath12k_hal_reo_set_desc_hdr(&qdesc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0);
-- 
2.41.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
