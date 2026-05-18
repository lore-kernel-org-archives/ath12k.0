Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE7FCD4F48
	for <ath12k@archiver.kernel.org>; Mon, 18 May 2026 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVys0i6YW7m5nVQX1tYMz8tPVGIHT4So0swbXtcUKW4=; b=t3eT+sUdyoNm1RYELVY0fg4ZmD
	QeWAFC5KjnH0OusavtpbavjdHoaiITZwLPL65+jxWKn8Y3jwmWsN6PUqCNh63h7ptU2YCWcNe2DhH
	fDlwLkOOuFZ6XD9WbrHTdaxeaqX7bA7ckYmi/z3BUwNpIjwEhLA48B+OzYcz2lvyDJoSOca4BNEBY
	F/OD4i2X4apjAAX2f5W+s8W540jLWjFUaLOmy1JghAMPBLUGG2C9jl+apty6vNsfcm0sNHkaoRs0X
	n3h4nZrr++NDZX02UTr0CcCWUKOJnACYVubIuZdpyrglEEbv2ytR6OFxiBul9RUJ+1KCzuS9XSt1Q
	UVfgw2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsSu-0000000EcMN-34fJ;
	Mon, 18 May 2026 07:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsSt-0000000EcKl-1VBI
	for ath12k@bombadil.infradead.org;
	Mon, 18 May 2026 07:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pVys0i6YW7m5nVQX1tYMz8tPVGIHT4So0swbXtcUKW4=; b=eEn29GqaEsjEfCXg6ChK+6tgsN
	FAEf6dHT3qyqsM/j8HGb8VgGjFub4gkbNLkamMo6E8WO0jH9qMqz6qGgfCAKe15WmzKc1yvToHrsJ
	DDRTNUuFww7cwaJVjIh2dprmn+Leo+XLVcm7BKEb8x3RwUBre6/goK/jTwX9oJKCzwgdqDPGh0Uo+
	epmDK5k61qBuVNZcqWIK5rB0g7J7C73NkbXd8E7+CTW8z4d8E5j8wz5scQ3ETLSEH8UInt2mLBu/p
	3qGoAqzuUPuWKlaj98Ns45VkDMkj9UE1WQ5JRSroE+0ZCOcoht8tiiGRnDA1fYQ19vp2D37kih1V+
	ro7u3UVg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsSp-0000000ABap-20zT
	for ath12k@lists.infradead.org;
	Mon, 18 May 2026 07:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4370B403E8;
	Mon, 18 May 2026 07:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC8EC2BCB7;
	Mon, 18 May 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779089554;
	bh=at1C8YDY/wGOzV+ETAwWHh61G+w+aU1TRFLVXFmiWus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+Hen7sdL1FwvSNqL8zmXFGApNxTJSZS7cOGFKSFEqCtlMpQHgUxfttvOZcKbb/ib
	 NnHI/OKDzgTWCg2ZCMdTjJCuGqqKDYgml6wXygvIWrvWlxdsFMsIZnJZPX4ArUsfmr
	 T+0P1WBIJdDidt4uDyCrwTfRzt0OHchKtdOfBRXbcB5CfxOkt/EG865W+Rf/CQ+wSz
	 y9dFcMfDpN6SZ1v+U8fD9yDUXNFlH7OGQqVhp96eM5Tcg9qz7kx7ADp3DFYlZQO2zW
	 AdccsacZCpN72YNI7OSTl7LYvjvC5ENszpvVyOM3YChw36WiLhtWoAngIZ75ddw9wu
	 2EEMXWv+tG08Q==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	elder@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jjohnson@kernel.org,
	mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v6 13/16] net: ipa: Switch to generic PAS TZ APIs
Date: Mon, 18 May 2026 12:58:53 +0530
Message-ID: <20260518072856.22790-14-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518072856.22790-1-sumit.garg@kernel.org>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_083236_730546_91741782 
X-CRM114-Status: GOOD (  12.07  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/net/ipa/Kconfig    |  2 +-
 drivers/net/ipa/ipa_main.c | 13 ++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
index 01d219d3760c..a9aff1b7977d 100644
--- a/drivers/net/ipa/Kconfig
+++ b/drivers/net/ipa/Kconfig
@@ -6,7 +6,7 @@ config QCOM_IPA
 	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	select QCOM_MDT_LOADER
-	select QCOM_SCM
+	select QCOM_PAS
 	select QCOM_QMI_HELPERS
 	help
 	  Choose Y or M here to include support for the Qualcomm
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 788dd99af2a4..3cd9e44680e9 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -14,7 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
 
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
 #include "ipa.h"
@@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
-		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+	} else {
+		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
+		if (ret)
+			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+	}
 
 	memunmap(virt);
 out_release_firmware:
@@ -758,7 +761,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
 		return IPA_LOADER_INVALID;
 out_self:
 	/* We need Trust Zone to load firmware; make sure it's available */
-	if (qcom_scm_is_available())
+	if (qcom_pas_is_available())
 		return IPA_LOADER_SELF;
 
 	return IPA_LOADER_DEFER;
-- 
2.51.0


