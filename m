Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0335CA5FDD
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=; b=2EoebeLYrCAy+NMBNcj76BRfAw
	rcSCagAJ6232q4GyNOlRuuHDFduxZAe5WIECPrequ3scTPUJxLUVylgPFUR4SvF3Kdni4Rqw7J6Ke
	q6cfCRzELw9MEH5h92xqgXO+SLpnOXEBe07dikPNbmZ2JS7lzdgDnh/jdM61q0tfdiNhPq52nFKhC
	h3Tp4/koHFjWh2DeNDCPy4yaATsnaFADUMpJgU1yk3U8G5hOPJBum6ozvsVjb/2CPzgB/kPnJqQcs
	GwW/pIMP00VNuQlImbBtTJNJKR07SB/FMniYkrudkSL5+lF7NOKqMnoSJcbnCJjguGPWIgrXyYvxW
	/QlmjVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvqT-0000000DFJS-1cOY;
	Sat, 03 Oct 2026 09:15:53 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvqJ-0000000DFEO-1MtB
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:15:50 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so104980f8f.2
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018941; x=1791623741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=mGHbFRRBuduM+6NwV/m7HKTCV1F3Xjfwpo6R+OxEdkXun2WFcIMMuFnzI3Q2i9TQTi
         rBaZKzih4Ft8WHdPMihbP9lzYsk3HpWPzphThAZHU3V2dbxOOFbmSzgyAbXppWZQYgBV
         z2QSfKO0YEc96pWL8U/If/VOv8+g7uAAmDg4IBe13xnasR5lHkkadhswqeZJP7JGAHBZ
         t9Bxi9w7PwTtRDSFbHI0mMN9R/QPSeeuhqHjkaBKvLCaezeiy1PaU38kczbP9xvD/EQv
         AEWXmBLVTXqbRgOMHmPgwr6+baHDL1ohvss2g0qTqsgPoNvokN1pcc0REOlxE6yx7Jtm
         Ttbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018941; x=1791623741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=vKlFgznZOFBzmUbS3i+f8ZrDs0EXjzeX6I/QQDWQE8G+kzVa13tHUwZ718+1aRVhC6
         bDrfPu0z+M32YSm3aUruyDQu90i/krNNrD6trieGZAeZ9C41X1TPRe8XRtDC/C0Ry5j7
         k41JJGAg5SoxjcOxao/LShuGQ9aNWN9SJHp1G8ILR4415jLS7rP8e5op+3efQC7FDyoM
         Tzvtd5wDXp6kMZC8wJmFMmdIChx7sPsZ/b6d7In90uTwkRIdoOl8E4ODtYw9n8s0qxRE
         eszknD/AbXfc5g9puJm4ti0zbC0xprJ5/KVHsEkBdHO5cwSovoQKOx3KhFrefbXPufIg
         0HXg==
X-Forwarded-Encrypted: i=1; AKwUvBw3KgT2JCGNE2UOOqawXa/T5fMIi+CLNnJnphBdPfrgdzKSdbw37I/FiDYrdgqTMBWxQo9QYcA=@lists.infradead.org
X-Gm-Message-State: AFq9FYLWQgjcTEArlBYBorMpHxTxGfrj+gTl4hN/QqySifwWYidPGnkt
	XWeSS1RcQYABlALk5VIKtCOKECrWprYBxT6HIn4L5aN94eBz6BmxujXm
X-Gm-Gg: AYBFou2PRN8AdhVDv3rr0dEuwByJghrLud1H9ai3bhWlMW8LmYdsWvPS5m874w8jfGM
	ktQhefSP7OcgVZtuqzkUTyQf6nBEmN61+saq1y25VhYpFAtmC3XMDavj/s4/rjNI6yom/oNn/pT
	Ilm6rwfpqsUQE7QddnWyj57czvkB06wvNIzpnr4944j9sWYF6zPBtEN9EvGQzMYXc90hdPQx1Ux
	9QTAUT8AbhsTScpmv+jPyo0JSGGwnoZhxXCcakE/QFYURE4JVf/T8UBD5CdfL5/IoT9kYs6R81n
	inHunDhMJfouMmrTy4yS01kc4GIxe8T1VF3kX9ZSWeq7eBedN4zfWjujWGE/Zh0PSOCbRRUjjae
	3zu1rUGSIDPKhVypEEV7WhwwZdlXNv5HNOMngB/UibdfH16lnOpacGh32d0g8/CdzM5JMJNPMOh
	YCNqtuCurtC4E8M8r7tgpjQwRrGwQO/YPjLWcy1VvtOr2KdjRIOZVGDODrODUN/ohAWlMES8tZW
	GkbBweQ0GU=
X-Received: by 2002:a05:6000:2c0a:b0:48b:7179:59da with SMTP id ffacd0b85a97d-48b71795ad8mr8328190f8f.1.1791018941391;
        Sat, 03 Oct 2026 02:15:41 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:40 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:09 +0200
Message-ID: <20261003091509.4822-4-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021543_391432_73A4698F 
X-CRM114-Status: UNSURE (   8.08  )
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

The WCN7850 hardware rfkill input reads as "radio off" on the Surface
Pro 11, which keeps Wi-Fi hard-blocked. Mark it as unusable.

Tested by adding the property to the installed DTB with fdtput, on
next-20260929 with the matching ath12k change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index a71c29762..36592b8ed 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1009,6 +1009,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.56.0


