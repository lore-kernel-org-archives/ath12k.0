Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7609DE7D0BB
	for <ath12k@archiver.kernel.org>; Fri, 22 Sep 2023 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKkDhd3BgK4ZTh8BJ0WOBvv7PE2lJWspsG8juec2RRA=; b=fWyh59GBn6mhDA
	k1nj49OlHFBdDiDYiktCz8l5zLJQBXnF6iwJXFHZLO7Wss4O4lZIMr6MzN3ol2I4GAI1IwBGLK5oy
	XdSieyFkMYE2CLxVDmJGrBREDNalsDTsR/J/6isU0IuE5DKnPl5gkEcpOM/JRSp3C7N1AMqylxL4+
	N8j1oWVdfKl/3d+pwf4h3AAimLfR4GIPkKoaEvzyb5ypc1fxxKXhAQo9wxnX92+RrEjnVXRoMpy3O
	/Auclk8p4U3nKrg9L5aZY9/KaMDhPbLNAhXd6VvpHmW6faY/ELWWMCM3uuz/Xv3LJR78wNWcuG35i
	RT3/HEj8MhITh34lqpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVdU-007cs4-01
	for ath12k@archiver.kernel.org;
	Fri, 22 Sep 2023 02:11:16 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVdQ-007cqL-1M
	for ath12k@lists.infradead.org;
	Fri, 22 Sep 2023 02:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PPN73
	JPVs2zU8lbSZDzOTC1b0iLHfDA0FrJj6Yl6Zvo=; b=YKuBCfSvHcBWgRiV+Yq7U
	wIBWsEFGwH8qf+Idknyvs+Oi9Idy9Bob8zg41/7F6XLk/NeXBqTLVe1mgIjoZVg4
	0mHiTCdP74oyNEuQSfiHXhW1HldSn9fZKLAl8N95xNuGRQhwqaekivt4lbW3amYy
	qE6uOZg8c6khcvvcj1OJhg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wBnMzSe9wxl6Vb_Cg--.10083S4;
	Fri, 22 Sep 2023 10:10:46 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] ath12k: mhi: fix potential memory leak in ath12k_mhi_register()
Date: Fri, 22 Sep 2023 10:10:36 +0800
Message-Id: <20230922021036.3604157-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CM-TRANSID: _____wBnMzSe9wxl6Vb_Cg--.10083S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4UtF1Uuw1DKr47XFWUurg_yoW8XFy5pF
	4fWr47AryYyF4rWr4rtF1kJ3sxWa93JrWkCrZrG3WrCrn3Zr9xt3s8Aa4fXryakrWxGFWU
	uF4Utw4xX3Z8ArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziGNtfUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFRzyC2B9oNj+MQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_191112_830329_6B354450 
X-CRM114-Status: GOOD (  10.05  )
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

mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
ab_pci->mhi_ctrl = NULL.

We can fix it by calling mhi_free_controller() when the failure happens
and set ab_pci->mhi_ctrl = NULL in all of the places where we call
mhi_free_controller().

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 42f1140baa4f..f83d3e09ae36 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -370,8 +370,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	ret = ath12k_mhi_get_msi(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to get msi for mhi\n");
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	mhi_ctrl->iova_start = 0;
@@ -388,11 +387,15 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
 	if (ret) {
 		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	return 0;
+
+free_controller:
+	mhi_free_controller(mhi_ctrl);
+	ab_pci->mhi_ctrl = NULL;
+	return ret;
 }
 
 void ath12k_mhi_unregister(struct ath12k_pci *ab_pci)
-- 
2.37.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
