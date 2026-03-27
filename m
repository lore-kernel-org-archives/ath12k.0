Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BCE10ED675
	for <ath12k@archiver.kernel.org>; Fri, 27 Mar 2026 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYB/GId3uWJNA6+Kc5eBkcs8F/cC3aOTkUma5LKMfM0=; b=Vxre6aRzsLbiVQnycStVUSwZ7m
	uHzYjU6N8IliGMq+ckXhmMnCYZZI2ipZB/yCOHtRvKqGBDmx4JeCMAKHUuxv/m3RPkk7sTmdCIC28
	qHzVecAcUxSqQ9I8p7fy/q3mP3+BapbFCxV/FL9xXQIPO5dHARLxqD+3TKnp1Nb31c2EV20rfApbw
	QTcFGH8B/51wbeI4X0FmYJBhD0ijkVt5YjgxnuiO9HLpdOHQU0WF1vaboY2boIPCSbE8sd6loZLCA
	2ea0slgiUSms7ZBf68JNW7grcjhW47rtf7mg9k/5MJUkZghUHbtbSswmRFBxVnunijU4c5p5VI3U7
	XoWZ8/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w671q-00000007Qc9-37II;
	Fri, 27 Mar 2026 13:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w671o-00000007Qbl-3nPY
	for ath12k@bombadil.infradead.org;
	Fri, 27 Mar 2026 13:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TYB/GId3uWJNA6+Kc5eBkcs8F/cC3aOTkUma5LKMfM0=; b=rH+9BUqOvR0iALkp+9/neFdE9u
	i+EvaNZmhizif7oyjdk+l6a9mLs64CgDKPB2DBLHeR8uZlpHoFLLj7L10H1XYG8A/owfx2SSfkmej
	8FB7niY7AN8LbVaHRBJeD6Y/Ph180aXLimCcxtf2UrSVtWfmDazH1X1uHe0QcSW1Yq5xNx87o/9bT
	74gqXTm/e+YwUadtsSv9UMFmT/rvABakKeC4cQ3djdT6QuOB4fmEY3DjNtEWikOBUiiBuNrKUYCTK
	qvtqFZbyo9dm5L4O0Zkrp7afEznJPrf5uBPib2pQm02nUC+weTtdLZ4ZOMxOqMznyTGxJgW0f4KFK
	sv6wLPmw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w671l-0000000ASzZ-41Ta
	for ath12k@lists.infradead.org;
	Fri, 27 Mar 2026 13:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 972C442E41;
	Fri, 27 Mar 2026 13:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C955AC19423;
	Fri, 27 Mar 2026 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774617304;
	bh=vk7fIMoDnUd+apGBoToCIJIWarWnxjcVLqpnFo6FYtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UUruWqT8nvTqmrbHmvWowQEwrphCmXl5VCFesVXyEQIc8LqUheUeU0ezWMz+aSYrf
	 Ax5LDG+FkEhu7NoB4X1iOxlMee6yqdNSF1YwuH1zxMvQzaiO/+ytxX+nVXqNMeNw/K
	 eEAfAlDxUR08+V+2rgglm8AH+DcwUbHiGLLUx/lja68SBHYdPt2PaPd/gemRLgHynn
	 wV2g5qqvaKqOt04D4rb//k5bgpNJv8W9iLH0MrO1CnpLxqxUGK0dZqbbAfgZYKq3ol
	 c+X9XU5WoH2OmoOXbiW8cQTAp4KjSr3ZavenCW8tSDiIJ1wewJ6BkPqJyI5uG6GPF7
	 inO99AeWqeY0w==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org,
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
	harshal.dev@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v3 15/15] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
Date: Fri, 27 Mar 2026 18:40:43 +0530
Message-ID: <20260327131043.627120-16-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260327131043.627120-1-sumit.garg@kernel.org>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_131506_245139_91603C79 
X-CRM114-Status: UNSURE (   6.66  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Add Sumit Garg as the maintainer for the Qualcomm generic Peripheral
Authentication Service (PAS) as well as the PAS TEE backend driver.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0481aca2286c..1a50ce3e204e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21806,6 +21806,15 @@ F:	Documentation/devicetree/bindings/media/*qcom*
 F:	drivers/media/platform/qcom
 F:	include/dt-bindings/media/*qcom*
 
+QUALCOMM PAS TZ SERVICE
+M:	Sumit Garg <sumit.garg@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/qcom/qcom_pas.c
+F:	drivers/firmware/qcom/qcom_pas.h
+F:	drivers/firmware/qcom/qcom_pas_tee.c
+F:	include/linux/firmware/qcom/qcom_pas.h
+
 QUALCOMM SMB CHARGER DRIVER
 M:	Casey Connolly <casey.connolly@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.51.0


