Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A131BCCF2DA
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bqts2upWMzH+47ykKr+dSq846IXymKS3c7i4G/GQGI=; b=LqKXVIwxmQbfnj1crkY2uZst3O
	fQC1gEv8/Ez4Xqh0ejKMv2ZVKirAEPOEcYK2vOAkTBJEHryEctjjhvLMnN6/vDQdBhZlGh3Zar3Qd
	CKl0Ht9IdWpnsG3HsLdJmwTA49L/oKPAmd4FdAJiQQwjg0OJG87BgKbyiCQT3BM8x/qGmzGtIIR44
	eJYKOn6uWmnYfHtTKuBRrM7lTGr9dkKlT0TbYQ4AsMmvKqBhPZ1HFV+7TyBmDSee6lZNwwN8NmI44
	bsezpfuooyYk818mmVpK2j+lGEGEa4HuSihnONJbD/efOzxmrx9kxUgvOlxzTP1KiTiTKmQM4wxCI
	geuxtTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFC-000000075z9-07th;
	Mon, 19 Oct 2026 10:05:26 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkF8-000000075xZ-1wlO
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 10:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5B
	qts2upWMzH+47ykKr+dSq846IXymKS3c7i4G/GQGI=; b=gZNSvOd4wBE0AFVG2p
	J09ltE4SocWXHOGp3hV6rHWgTXnRXgXwDI101gY5eRV5r5S7UF6Jvl9lu7nc9uTI
	GN779ImruXVaAddvj8YRpxcx2TkG3a+QHWS8zKuVeSzL72xbY/FMyWmPOarSOBza
	UEHCawduIprnr+u+KJkiPIxOI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLyhT69VqOE_ABA--.43992S4;
	Mon, 19 Oct 2026 18:05:11 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/4] wifi: ath12k: validate extended regulatory capability count
Date: Mon, 19 Oct 2026 18:05:04 +0800
Message-Id: <20261019100506.1915181-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
References: <20261019100506.1915181-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLyhT69VqOE_ABA--.43992S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF13CF4fAFWxCw4kXrWfGrg_yoW8Gr1xpr
	4Y9Fy2yF98JFW7C3yUAF4xJa45Za1kJw4fKr43Kas3u3WkAr1av3WF9Fy5Zr4rt3ykJF12
	gF40qa4xuF98t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMT5dXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BcgWmrV61d-+wAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030522_915404_53D37024 
X-CRM114-Status: UNSURE (   8.99  )
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

Firmware reports the number of PHYs separately from the array of
extended regulatory capabilities. The TLV parser rejects excess array
entries, but accepts an array with fewer entries than the reported PHY
count. The subsequent loop uses the reported count and reads beyond the
supplied array.

Reject mismatched counts before indexing the capability array.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..66e39672dcda 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4824,6 +4824,13 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
 		return ret;
 	}
 
+	if (svc_rdy_ext->n_ext_hal_reg_caps != svc_rdy_ext->arg.num_phy) {
+		ath12k_warn(soc, "invalid number of reg caps %u, expected %u\n",
+			    svc_rdy_ext->n_ext_hal_reg_caps,
+			    svc_rdy_ext->arg.num_phy);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < svc_rdy_ext->arg.num_phy; i++) {
 		ret = ath12k_pull_reg_cap_svc_rdy_ext(wmi_handle,
 						      svc_rdy_ext->soc_hal_reg_caps,
-- 
2.34.1


