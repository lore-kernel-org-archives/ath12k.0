Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A1E668B4
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E55rnlhAOrIku3mUKlbLlFq0iWxyrYu1PmFIURoShU=; b=lDUomkbH1WeJJbOnt/1FCEKpYV
	Zs1DN7rsvQgi5+KHGuB8Iko/ycyk3wdYs/jeSyF/palaxBLy14M5l6ffqAemwdtLugUAJ+wEpfR9I
	fyt9GI+6+pMkdwU/zGcKFIWiNwQ3iUSHdZze1FThHsoeONmdxEdNhh1QzZ1T7gHpMnt3VXCfZ5oiD
	Udk5+fTRWRKri6d8/GZYSm6G9/YAy+x1BeSoRUm0IxJqBhk4Pvzti52nm/VA7JA90MaibtTtWo2+u
	38ZaaLPe2cj954bfObeDrKBlGl/G0JbRtjDcQ/fq7zcEb6i+xvGwXuTIVfKm2DWOysg7Yp90ITkW0
	WGlDPRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWys8-0000000BgpN-1Olk;
	Sat, 20 Dec 2025 15:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWys7-0000000BgoY-09Q9
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 15:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1E5860008;
	Sat, 20 Dec 2025 15:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EBA2C4CEF5;
	Sat, 20 Dec 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766244473;
	bh=rlWIfYfoikdm2g+ig1MLpFeBTAhiwN72iY5iv6kr7aY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uNbDL+YUOpwZbh/FCCCknUHSWYIuQReb6ZOLtyGFH4ut9MxHQiyOhKhBCppAfYEak
	 ABU+O8l9NbsXAN75iQUd7Shs176rCZXS7PycjYl/tdMTEvqkD6QGqoPgrklsbhWNkc
	 zBi7IOE1ohEkLZZrLcp1jrWMCiL2+lvBxK0uC391WIkXfoKy+Wc32Z98mYCF/LjLHY
	 LAys3APXcktMmWKXxgMBzSqhrL1iVOvawOg2GOSXkOhYUQp6vvtGxV9qLcTDzC9AUK
	 KKXGryPvK79nfJTDxvpTvb7aowFwIN+Q0POt9WaeI/e+hw6rAdhohDrsk+B5WeQhrq
	 ce4jBROXVu6JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53DE668B8;
	Sat, 20 Dec 2025 15:27:53 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Sat, 20 Dec 2025 16:26:30 +0100
Subject: [PATCH v6 2/4] firmware: qcom: scm: allow QSEECOM on Surface Pro
 11
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251220-surface-sp11-for-next-v6-2-81f7451edb77@gmail.com>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
In-Reply-To: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766244472; l=997;
 i=jerome.debretagne@gmail.com; s=20251217; h=from:subject:message-id;
 bh=CNbXWtuQ7AggDKzwaLKJE5TiiiPe100NQahuSnOowsU=;
 b=AMXf5Qstm/inbiie5fAjms4i/YPZ1dwa62O04DdEOOljs/5PwBg0LnkdF3OKEPitm2j8o+zDv
 YF3cwb7BMqvAN9c7QQzVqn2CApJWL10BxMVYCRZGcHwBLnQuWfL6y+e
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=DcPD9n3oDMsPkt+12tU96swmGb5H86cxt+yiEVcUEGk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20251217
 with auth_id=580
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
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
Reply-To: jerome.debretagne@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Dale Whinham <daleyo@gmail.com>

Enables access to EFI variables on this machine.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e06a12814614cea20719c90a371b69..3dabb04094f91811a430e84998d3c6c759b5c747 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2007,6 +2007,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },
+	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.47.3



