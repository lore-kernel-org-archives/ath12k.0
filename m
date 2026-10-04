Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F52CA5FE6
	for <ath12k@archiver.kernel.org>; Sun,  4 Oct 2026 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5kZgL2+cYaxBr/D7kAopy+ikvsQSWrTTQUGKjBNRtaQ=; b=mOhSRNwZ3CNF09+QP4V+GZh07c
	hK1fzJAvpJNQdzHgiVPMfD6ouV8adKYJf50GBkk1AE5+ytwnfcdvO2GW+wPf0Rlqyo46gMk8BX7Xy
	BKcRUH2vcrRAKoIVcstpoCcJEOWBkbQOggRaN+uP8kdgS9UNiCoaZTxL/E4i9WaINK0enuUMRRy98
	Aoom7q1Z4OwMTpQS/auwFMzGyOz7RuUEUclRxWGDEeZtvWBavJcce3jsee7Va3xll9kScSV7ftXrT
	kAiO/R5R6mPOKilh/lvsuNincWPyU1H+NOC6Dne1xGMtCJE+RePpyoIfJG8kYaB+uvCakXoT1+vLZ
	KQKoONqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPRD-0000000F37B-1PZv;
	Sun, 04 Oct 2026 16:51:47 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPR6-0000000F34k-0r5J
	for ath12k@lists.infradead.org;
	Sun, 04 Oct 2026 16:51:42 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so543295f8f.2
        for <ath12k@lists.infradead.org>; Sun, 04 Oct 2026 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132698; x=1791737498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kZgL2+cYaxBr/D7kAopy+ikvsQSWrTTQUGKjBNRtaQ=;
        b=AFI7YITl9CAn3+QEzwhqGRppT4E8W1nv1MyVyCjvx6PJMCqpg6esaCNHqEAaoi4vUf
         Y2jdKAptMEWrb5EC+H+H5k/+75ZGtGEdegdQ7VsZ47SaXiwDwnoAt1unTy1nuy/agq3l
         30abvLl/A+78/I5B6PCM73VNnpAgWmLbHg7F8vxO/iuWJ6vC5XEwhfwg4GlEXhaajLuY
         OjN7JYd+vwPNHrJXjLKofx743EsI49RnWjlQIT3c+/gPqOIkxiJeCEKVrHX6i5WdboW1
         iSzSRwOorIc2m6xOlf6Ds3G1t8xX43PCH5IBnj4ZLs1NuXIn2HVE7hAre06D9T6rDsUB
         SIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132698; x=1791737498;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kZgL2+cYaxBr/D7kAopy+ikvsQSWrTTQUGKjBNRtaQ=;
        b=hoBye1lejznNRuSp0eIN8+dUj65foOOx5/kGUMjwSia8x0wUvsk78EENU6+HJVjSEV
         gWJzQ27mWkwmA5no+GuO08mj7GU+PIinpQqhIve6YjnW5NaI/71z/eFRbfmx2T0uaXey
         6qJOwcNxXtTzQmhmC32Jdbol9PKv1fLUN+w7rEb/h9J9Xh1Buo+qYuK4HjjdY16CVPMx
         IVU2PJWSgpISRIFDkIkGmm1nCqYTcyHbg5DGW0Z/19aVCIAdJv1shxg3QILnmch2P0nT
         j5dIBRYwSWuBczDCQqfIz6cPce2DKTXMC8xs30TJSDE41V2GkpdspuMnCH8JlMuKnuxw
         rXIw==
X-Forwarded-Encrypted: i=1; AKwUvByVNouvzwRVmjpODHJP0YrJjzbmdc3c+g42+BRHRZEFLuEmGp+y6GoYZWhIgJ+IRbIQPt4Wmyg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIJOEAR2PZB+WyZzMmvPnDtNgsoAZENZqgBq6neI1EfQ3j9N/m4
	6MHDZfvmoaf0TR/FglY8miWr0B6eBkkw4U6VuegHmgd32t9f3CtVo2kh
X-Gm-Gg: AYBFou10pQKU5WUa/SoPTk5s3Qf4va3dlRhYTjQ6Z8iaf6VXwoet5pJJ5fBB6xhyjRx
	0Wnd49fn4H15BT78OJ//5c5TzIwZTcSPZiLKqzLThxKGtCj+atfHFyUfgD9NYWYheyAIwb8+eT3
	xjaaVUiBpG7xLyM9hDwcrapy4InCL9rxbOWReqWWMpbg7bSEfNYTuvmQYBKQjQ2ZcQjDE1PU/X9
	gkPdkXHK+YPVHlSWW8ltuTll9C+be9Fsaud9DjMjjzJ56wBlymjdYwNKPciAi/uNbPOWlF5Q3o2
	6fh+rXmNfgxj2wnNuhlmiAhMHdoryUIjBNXuw9K5QvhVi9Hxi95/k5lTKTAfRebIrxt/1QkNF1T
	PYCwskd8lDyW1qzrs67y+9eq/v7OKytq1USKd+WNvJHw5XFSLKnND6l7dAegVS0mbsV0Rv8A9WS
	dur+11D0Nh5dT4UtWsGcQYekBh46vQDvn76A2cYtcpyW1xgJaGTje+arbqoPbTLYvroF2p4e4b4
	9vSdbQjc/ZF
X-Received: by 2002:a5d:5d13:0:b0:487:8b9:526a with SMTP id ffacd0b85a97d-48b12763357mr18047204f8f.36.1791132698112;
        Sun, 04 Oct 2026 09:51:38 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b383065a4sm18144545f8f.44.2026.10.04.09.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:51:37 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface Pro 11
Date: Sun,  4 Oct 2026 18:51:32 +0200
Message-ID: <20261004165132.4313-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_095141_729857_822BE03C 
X-CRM114-Status: GOOD (  15.32  )
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

On the Microsoft Surface Pro 11 (X1E80100, "microsoft,denali"), the
WCN7850 hardware rfkill input reads as "radio off" and the OS has no
way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
but DT platforms cannot. A DT property was proposed for this and
rejected, because it describes what the OS should do rather than the
hardware. The suggested alternative was to handle this machine in the
driver, keyed on the board compatible and the device ID, until a
connector binding can describe a broken rfkill line. Do that.

Tested on a Surface Pro 11 with next-20260929, booted with the
unmodified mainline DTB: the interface is no longer blocked and
connects.

Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
This replaces my RFC series "Allow DT boards to disable WCN7850 hardware
rfkill", which duplicated the disable-rfkill DT property already proposed
and rejected in the Surface Pro 11 series:

https://lore.kernel.org/all/20261003091509.4822-1-franzelfranzel@gmail.com/
https://lore.kernel.org/all/20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com/

The code is Manivannan's suggestion from that thread. Jérôme reported
there that the Surface Laptop 7 (microsoft,romulus13/15) has the same
problem. I left it out because I cannot test it.

 drivers/net/wireless/ath/ath12k/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..dc41a2a7d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -83,6 +83,16 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	/*
+	 * TODO: On the Microsoft Surface Pro 11, the OS cannot control the
+	 * WCN7850 hardware rfkill input, which reads as "radio off". Keep
+	 * hardware rfkill disabled there. Ideally this would come from the
+	 * connector node of the board DT, but that binding does not exist
+	 * yet, so handle it in the driver for now.
+	 */
+	if (of_machine_is_compatible("microsoft,denali") && ab->id.device == 0x1107)
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0


