Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CCAC982CF
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHE7fG6m4ps0PItjmbP+lpXZ0edsOfzJiq3D3ZLSO7g=; b=bCkBviCwzMszAZ0xEC8b2NRVQW
	3wp2m0xD40Y/+ygvSe8ZQJuNMkqahEQzVZIAYJheg8Y55P0Z+UBwAL3taT4ebu1mktU6QMMMAcMwE
	KCiEdcz7JcqKtjdHsxcZGrysmvEbVjgfy6q29D67ssV6G4leARgPhMBofRuE7FNxPySyM327h1cv4
	NmsqwjXdsD7dT2ufFwevff6asKksVLPHGKg4tylWcfubRfRwI81mdrFn/Bzr09huxBAAONM6Hy4Y8
	lsFZpe7HC7HNYOM6UkUIrX3ZcDZtiu15o6ifu9Zu9TOKanRmzZMkrrvAld2N05cTp4wEvcew8hWJc
	cM2SDVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ArB-0000000BFSl-04Uo;
	Thu, 17 Sep 2026 12:04:49 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ar8-0000000BFRz-2Lzb
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 12:04:48 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXgDpb16tqDiSACA--.8S2;
	Thu, 17 Sep 2026 20:04:44 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ath12k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_rajkbhag@quicinc.com,
	quic_ssreeela@quicinc.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix rproc reference leak when configuring rproc IRQs
Date: Thu, 17 Sep 2026 12:04:43 +0000
Message-Id: <20260917120443.2150370-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAXgDpb16tqDiSACA--.8S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1DWF4xJw1UArW7GFWUtwb_yoWkAwcE9F
	4rXw1xZ3yIkrWjkF15Ca12vw4IvFyDXFWxJFWqqFWfJFWxJr4v9ryrZFn8AFsrtry8Cr1f
	GFZ2qr47A3srWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSxYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48Zr
	WUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
	CY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjxU2U73DUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwUNA2qrrRmBsQAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_050446_968368_39AD0A30 
X-CRM114-Status: UNSURE (   7.95  )
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

ath12k_ahb_configure_rproc() returns the result of
ath12k_ahb_config_rproc_irq() directly, so a failure there leaves the
rproc notifier registered and the rproc reference taken by
ath12k_ahb_get_rproc() unreleased. Route this failure through the error
path that unregisters the notifier and drops the reference.

Fixes: 10a355ba6238 ("wifi: ath12k: Power up root PD")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2dcf0a52e4c1..0b69ff42dd7a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -889,7 +889,11 @@ static int ath12k_ahb_configure_rproc(struct ath12k_base *ab)
 		}
 	}
 
-	return ath12k_ahb_config_rproc_irq(ab);
+	ret = ath12k_ahb_config_rproc_irq(ab);
+	if (ret < 0)
+		goto err_unreg_notifier;
+
+	return 0;
 
 err_unreg_notifier:
 	ath12k_ahb_unregister_rproc_notifier(ab);
-- 
2.34.1


