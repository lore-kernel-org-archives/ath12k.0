Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5018AC43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DzEMcOPWAAc3ya4BWHLrviknUVsExWDTeL6YrPN8Pco=; b=lIwRj3Z0DMaU+ll1Qf47P4LNA+
	rCI3ieKJosQblFHjANxslqBztlO/QV2ooICHXrgwXHI6qbOFY0g9UJhUQXpqD1SBRxgYku+kG1Afy
	Z2FXbkokkEgEZ40JiBPLDbs0X9ffrgeCImAn3lUgtWu5GNdN3SUH2Cy4zTFYZU3xxXd2tiIHrmZgz
	kGwGqWjbRjMy/bvGEfWuy3LdOABkwnywmI7mT4P0TsT3x/ASDfwviKUFueP0oPXe1HzcXZ8yHx1Ru
	Z4dap9thFGbw1iFiKIChKKPVH0E3Bifo0a3kDVRDyb/70/l9DzlZK3M8vACf3GNSxCpS3MwOCAGzG
	DWyxBSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesk2-00000001PhT-0AuM;
	Wed, 01 Jul 2026 11:04:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesjy-00000001PgQ-3yfK
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 11:04:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so4664885e9.3
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782903865; x=1783508665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DzEMcOPWAAc3ya4BWHLrviknUVsExWDTeL6YrPN8Pco=;
        b=fdL01D//+kkmug4z/xUFMVuBiNNI4VP4a9UCk8CNRHk02h86nhl09IW4e6o5ikSwaE
         fnkR2PL2lZVfW0Zso4//4TO2HUa0/js0nVfAV8Fj33oFBxKAnt23po5DMpdE6SeBLljN
         kcSMC49XfrbAd8Ik8+wifhbXGgV/y3hJtHqw8SZY0ZRtrzNB3KDKl5Sb6v1tE+b484Kj
         JQEW+iudkvAsjKEU6RMghFk/0g9/xaq26sMAREmC3+ES0jzgrHtYX0qQ6HYJ2dDLo061
         GvybwOgUtwTQDEqNdjGo+J0PFPeknc3HiCngUmVCpad416abCZ3ICFPlIIIXOaJLhWFJ
         Q3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903865; x=1783508665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzEMcOPWAAc3ya4BWHLrviknUVsExWDTeL6YrPN8Pco=;
        b=M/+Jp3zw5JkwN+9yx8HSp4IfPEbitwLH/j+VuH5J94jInNmLoDjDpidxzhaQWvcGJd
         LqcWYkS9rs+PS4qygoKNQ4l+8YfGYlnXhMaoLlkhb9R+ej7vQbzbuSduOG4yEpDI7SH5
         YttbzYEVBFGxdRirfXXnc11z0WiAYIwy9Gm/azn2nzXtlfkAZRqVCGPPsrlArs6WFhwo
         ymgT8DzpZoR6wUQnlbX70C7LKeIC0Oi1B7k6sXWY/u3vMekgRYrZ0ypJ7Vs0NcUu5R5i
         AKPMcvKPVsTG4fFrxBQLJUcOT4XM3/3a8oc1czX6M1UmSsH7vW6k6Iy/47Mhi/xpRBtQ
         Lq3A==
X-Forwarded-Encrypted: i=1; AFNElJ9W3uePT49qrvMXJ627tqDjOk8qcBzdzxga4F0dYLTW03G3fc7ReGSiVYjWqjH1qX8XkIgzEto=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz85vLwJ0UxUZi/tqM/j61e4DLswxi0/fQxRCP63g8aY5/UbsTK
	Hm/otDD5iz9eu2gdXGpjTtmIRQS2mjKkOaAgQz6q6l/gQMG7dogewrUz
X-Gm-Gg: AfdE7clc8psp/K3V1BzwVxwWsU2xBnUOfApXTfm/g6/AIg0r00hDGKThOIIR5V8buez
	Nq/J6+cjnHST4vSkINwu8e0jpa6LeHfxw63LdTOOqwiSCp9+qzvfg2nBWd0Lx7Zj+TkUaND2T/y
	SzC+DgW4ff3YVesycl1jQsI7NyVuLyfrsHz+v948C309/lEsb/taPicsy4wILkTftb1tmuiq6Z/
	tn7e8T/aDHQ7x7yMAMnotgVZSadbFuv2Y1JZzHCh5ZyXLI+m8DzFcwM08AOTHSAlW/hSCSI5V1k
	afJch3RN3k2pTJVBNhtz/44T+xTonHjAAZzi51O0GZ/STNHL3W1vF+r6hOxcU8NXE6QDOekxx+5
	uhUWatKbzJkWgZPJyp64qSiBWyP7E8YjK1uJgOsnxFrxWEP+6kqG/imc4L9uyqTzZvQXTazp3Yh
	6wp8HorWDo32ALkCHXyLL6iSSra1qS3KA+ZMNncp82LPdhsNbMj8x4FdZSQiMfOynI5+oeT4WbW
	y0x
X-Received: by 2002:a05:600c:64c5:b0:493:c3e0:99ab with SMTP id 5b1f17b1804b1-493c3e099bbmr437705e9.25.1782903864587;
        Wed, 01 Jul 2026 04:04:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4659sm17142835f8f.12.2026.07.01.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:04:24 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: andersson@kernel.org
Cc: sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org,
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
	sumit.garg@oss.qualcomm.com,
	harshal.dev@oss.qualcomm.com,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] firmware: qcom: scm: add missing IRQ_DOMAIN select to QCOM_SCM
Date: Wed,  1 Jul 2026 12:03:38 +0100
Message-ID: <20260701110344.1999068-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_040427_021421_9AAF591B 
X-CRM114-Status: UNSURE (   9.47  )
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

'drivers/firmware/qcom/qcom_scm.c' calls 'irq_create_fwspec_mapping'
so it will fail to compile if IRQ_DOMAIN is disabled:

drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
  drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
of function ‘irq_create_fwspec_mapping’; did you mean
‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
   2512 |         return irq_create_fwspec_mapping(&fwspec);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~
        |                irq_create_of_mapping

A patch-set in review proposes making QCOM_SCM visible in the kconfig
frontend, so let's ensure that it's safe for users to enable:
https://lore.kernel.org/lkml/akS_6izxrhgK-I22@sumit-xelite/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/firmware/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index b477d54b495a..9d137fa2aa23 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,6 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_SCM
+	select IRQ_DOMAIN
 	select QCOM_TZMEM
 	tristate
 
-- 
2.54.0


