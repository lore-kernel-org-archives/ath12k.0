Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F752C44512
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJUsMAYjmWAnU9O7bNhJ//OMZ13Hh1LDu2wdf2fpjto=; b=IUSJsz2s2qCFiAOSIfiOQCOBij
	Qls/swueCmIaEdpI1k4Sg41PyP9VVtS1ISGSUOgobzB5YQFD6lvmLMPA5qjNu5zq2O3sAqKUkL9s3
	+lpA1VsmKYmslAQ+TRl8ZJ+9jmYbBJfxt05ryLpHtjhPfC/skHOfbPLYx8jrZKm0uhH8guFYIw+Ol
	hjmmf6ATTz1puSF5YUDyvqFdMImVE9ueOouGJypTkb7LLQOKya0pJBRB4Js/QiGLKHbYoLyjOJWsg
	8vRQ7ABHg5hQa9+TkA0svH9Ty5S/8aWuuom49Rvz87coFo3XXPx+NFwHstkFKzApPPfx4OPpz5UmR
	ONSuFuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6p5-0000000BQ1e-1QzK;
	Fri, 26 Jun 2026 13:42:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6p3-0000000BQ0c-2jLI
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 13:42:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F8A412C2;
	Fri, 26 Jun 2026 13:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE331F00A3D;
	Fri, 26 Jun 2026 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782481341;
	bh=XJUsMAYjmWAnU9O7bNhJ//OMZ13Hh1LDu2wdf2fpjto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mquDSpOP4TG3h9syVbjc0phTij1tuiiPAgBU80powv0FLrpBIgWzva7ZL7PN2UNEJ
	 tqBTK2bKPvDzruG06ALOUKtHcYbKkqWUFj9DkadZ0Po4yYSoqWUtXDz08A7K04ef/+
	 uOu5xB7u+SQnh6MLMZ6CkK5v+UGicaSXMWG0gKyp+TLta6mMABV5i/qJ/L8RfyT+sE
	 w71NGn7eiTWg6N6cIMXiyvP52Fz8GdBgX+XDj2x7gS1eMow5w+M64F4anKs/QN4y8c
	 B98ugQqjAgLQmRy3HipPfslJgqdVmnR3DQwxcCEuebUvpfAAos3JaH9L5kKDf7cQDf
	 b/qAn43Qp5KWQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
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
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v8 14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
Date: Fri, 26 Jun 2026 19:04:34 +0530
Message-ID: <20260626133440.692849-15-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626133440.692849-1-sumit.garg@kernel.org>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 15011f5752a9..7847b2a98f90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22315,6 +22315,15 @@ F:	Documentation/devicetree/bindings/media/*qcom*
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
2.53.0


