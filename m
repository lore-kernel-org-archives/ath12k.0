Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B68FF885A
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVys0i6YW7m5nVQX1tYMz8tPVGIHT4So0swbXtcUKW4=; b=vKZC6XhA6ahQwfXePJoSv4YIiG
	dwF+pXJwmrxfViIt9KckI4lb7m46zZF3mp6aoiWblOxpqSpmNmG1OdRAX6GfjP4Cax5gFrefXd9OX
	GqZ6iT9wPWnf8ukUtbaMTaRX7wrFMnS5mdGGGSe8ZyCPdRV4T3jE3ZT6/+Xl/NqGJvAILQ0xd5HuX
	uEjPA4pKQiM6Cfuz4adtAet4NUggJ8WHejniAFXMVMCWtifJOyZKumQMcJ99zumluo5a7ILmCJE/u
	QkAfy+L+iDOrIWWU36YvuSIAq4zMBdB4+0cInPDw1xqX7rLdzZ1x14BAFo+yVrdKb5ihsWU3Ssrp4
	0Aankn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt3w-0000000DGAt-0Lcy;
	Mon, 04 May 2026 13:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt3t-0000000DG99-29Di
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 13:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 128B4417CA;
	Mon,  4 May 2026 13:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BECC2BCB9;
	Mon,  4 May 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777900212;
	bh=at1C8YDY/wGOzV+ETAwWHh61G+w+aU1TRFLVXFmiWus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBG+CLKuWTPPOErRmdZQmq22CXWb+2SJUADPp/Z00Nx9RWXBdousJm+MYagR96SFz
	 CD/HAdYTXidMJp9dLIlRctvcrquifZb2fRYansp+tpTy8j2RD7vvQgIaLRUpQT72uX
	 mJ39N9vvNtdJNPmjOFegFc42xdL+9lFn0zWd2KZXxo1DyTCzru/6VeZnQojP1pWkNX
	 8nVqSI8l3qaG47h7oSu7/a2dmpmRSEVKCk4PbjFpAgvbJbceDgwAUebaG0bIosioPF
	 22BvtvjQqRIwp1dWFCa7OFS/cysuLYyIPpdpqH5W3sS4hEcMLchQKxmwjGcn/tQryW
	 QD5ZuSpkFylGQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
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
Subject: [PATCH v5 13/16] net: ipa: Switch to generic PAS TZ APIs
Date: Mon,  4 May 2026 18:36:00 +0530
Message-ID: <20260504130603.1474043-14-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504130603.1474043-1-sumit.garg@kernel.org>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_061013_621385_4E7540F3 
X-CRM114-Status: GOOD (  12.02  )
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


