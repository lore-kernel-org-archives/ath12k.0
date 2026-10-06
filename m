Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C7CA5FED
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 06:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=; b=Gro4HEAJTrKtdi/Fd4eoTA6nJg
	FlWbQ5dNZdPVTaWRXZYsmDZqXp/C2Purd89C1SI2pVxxIfFmLFQuG4QAaDkUNKnDapcELUBeJ/zNe
	QqO6o12TF1PI6bnu393fPo0hKaIsF1HXDJHOrOW9H0efk4JVr/9zdwRoHfyE9xLJwKbewHZBoN2Vc
	kbLTrpqEDbrk9TpBEO4wrw4L2xXNPZUTG4j+zBuGwIiv6K6/elmdmIvqNRPZTi7tv7YDEaWd7PPM6
	MERl2FaUdd2h5nXeCvTTJS6E+FReOLdRu8ezlKQ7J91KYrSgpu8ipwayYQ7HeeT3bVrdinEqyl4tl
	66UAW44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyeK-000000007ay-3aac;
	Tue, 06 Oct 2026 06:27:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyeH-000000007aW-43qB
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 06:27:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17534495e9.2
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268056; x=1791872856; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=c5i5mo0CZeM009UpLBEe2XtGQGpVeXPuyb7U66YLHskDWwplM174BqHP8yyiQMhEQx
         RU/pt16txbFiiLoiQhp+ZOBuI1bosbltm+OVMSVqK1sH9IhD6IcRGGQ6uOLBywq4Uu/V
         9Ks7Bbseo8HKifadsSmbYs16HMIew+EQaCX0zowbrmvCxNqLf099BRb2DuCBGJ6Uya8g
         C16D63ZN8x7Z06/GDFa2KtA0QzyG8ZsPi7nliieiI2tfkTOXVH/6dv2SiYiN6LJLQek3
         FqQeEusHGHwFcxL42u04LnzsM+Agx5xuEqyP8hBx2FvlnGww3AcktqLYUghvr4HOuC3Z
         ZVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268056; x=1791872856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NN3uyFX5MgblzC6BFihyJF+3HDagHt+ljw1Qjp2+odc=;
        b=pVrx7o0kaMLzMavQii4k6Q70wsRvph6Tq0ZPpbIZGLlsnaf4kORAJQATwn2kTSB2zw
         NfCx99Q+GRkhZMj+F7C79hzFIxiPoA/YvI0tLn6qyvGFmC4JpJAHMugw2kQRlkixgZkR
         CvCUeCFZOzSbbpOwXQiWfJ6P28kLze7qX85wqervomocNN5zyo2GTXP6e1o75DAXXMIX
         Ctn+UgNJ2crm68oCFpNt8wMVhRVfEFmOzvXktimEvXFOArId+D3t+E5qcYmsm7gvdtJQ
         dZaLNPByM12Fl20fLRQ7b+Ic1s5V5sMwJZ330bLCD8AuEVZ/kvysx6xVqFgsxL/2PcDh
         F+ow==
X-Forwarded-Encrypted: i=1; AKwUvByl0C3cOFZ5Yz87K+NoDJhu6gj/6dk+otUD979fcyyrICRbdVrEdgOvSgU/6gMsj6Ljwe3eUgM=@lists.infradead.org
X-Gm-Message-State: AFuF++kuWiXRy8yE1ZmzqsMOxrBALOO6o6CPSqWWLQAdvFP+xcSeXcRy
	fNDy+SacpNiZ4WIHsgvRKJW2b7pDzsziMjhTxju+GsiApfycYNvVSniV
X-Gm-Gg: AYBFou1sZTN2VWOgrq2qCxd8rs9Fl/MqonEjB/SyoYOABsduvH+BNL85QNn665Qccce
	tKpUR1kjLb/vdsVwe7R3LXT/on3ibS89NqNf6jbiiAF9A2aSHWENp7/ajlTRXzQKZ0U5DsS33vw
	vMyipqOCP53iqRJEbTmHET6FxwUrAhtcrei1yMFsWo5N2mFW14Q8wjKWqHd2tXKud7lLWIoTLiz
	StrW+mMqtfIiRK+2u1nBRPhMS1Uya35F3CjxTNY4YipkjChA0M0xMXVl4m2rm6uI6DZNQyL+1mO
	n19oczQQgJawv6r0tv8GFkpBB5hRwaJbXDWsZcC9dYqqq5pjdvNxcoY+n61+uVliETZJ7mw0Jcj
	6bubR669Skl38GAvEVx7AasWRG6dnXJeQrnpEVirQ/GaoZIDVXpCu1trMRihYP3my3v4r2UbgWa
	BbwPCpvygo+trb9SAYkbiL7kLdGpQoSc7o2Ezaa49cnDRSBLE62eiTbBsmAzZvjOZ4qb2HhKfaL
	ytw6PqNjDvR/GF0mQwcOw==
X-Received: by 2002:a05:600c:a116:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a1680e94e3mr115543345e9.11.1791268055657;
        Mon, 05 Oct 2026 23:27:35 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm311830615e9.2.2026.10.05.23.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:27:34 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
Date: Tue,  6 Oct 2026 08:27:28 +0200
Message-ID: <20261006062728.45007-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_232738_067248_417CA9BF 
X-CRM114-Status: GOOD (  17.73  )
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

On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
WCN7850 hardware rfkill input reads as "radio off" and the OS has no
way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
but DT platforms cannot. A DT property was proposed for this and
rejected, because it describes what the OS should do rather than the
hardware. The suggested alternative was to handle these machines in
the driver until a connector binding can describe a broken rfkill line.

Add a table of board compatibles and hardware revisions on which
hardware rfkill is known to be unusable, and skip the rfkill setup
there. Other affected machines then only need a new table entry.

Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
booted with the unmodified mainline DTB: the interface is no longer
blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
and microsoft,romulus15) are based on reports from Jérôme de Bretagne
and Dale Whinham. I have not tested them.

Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
Changes in v2:
- Use a table of board compatibles and hardware revisions, as suggested
  by Jeff, so that other affected machines only need a new entry.
- Add the Surface Laptop 7 (microsoft,romulus13/15), which Dale and
  Jérôme report as affected too. These entries are untested by me;
  a Tested-by from someone with that machine would be welcome.
- Retested on the Surface Pro 11.

v1: https://lore.kernel.org/all/20261004165132.4313-1-franzelfranzel@gmail.com/

 drivers/net/wireless/ath/ath12k/core.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c72948f3..67d4c98fb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -72,6 +72,35 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 	},
 };
 
+/*
+ * On these machines the OS cannot control the WCN7850 hardware rfkill
+ * input, which reads as "radio off", so hardware rfkill must stay
+ * disabled. Ideally this would come from the connector node of the board
+ * DT, but that binding does not exist yet.
+ */
+static const struct ath12k_core_broken_rfkill_table {
+	enum ath12k_hw_rev hw_rev;
+	const char *compatible;
+} ath12k_core_broken_rfkill_table[] = {
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ /* Sentinel */ }
+};
+
+static bool ath12k_core_rfkill_is_broken(struct ath12k_base *ab)
+{
+	const struct ath12k_core_broken_rfkill_table *entry;
+
+	for (entry = ath12k_core_broken_rfkill_table; entry->compatible; entry++) {
+		if (ab->hw_rev == entry->hw_rev &&
+		    of_machine_is_compatible(entry->compatible))
+			return true;
+	}
+
+	return false;
+}
+
 static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
@@ -83,6 +112,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (ath12k_core_rfkill_is_broken(ab))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0


