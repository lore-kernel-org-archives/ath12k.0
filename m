Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D35CA5FE3
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L+D0wcMiZw7JqhFEXAX/EBPaHQLIVoMlrQj5WJPMGog=; b=f2DoBGJ7E+ufmM7Aio1+WIS0Qw
	ZwReIZ2iG2Y2pP0q3ljaI93eyrjZQTq2o8MUCUTKeHN9upsnnIUbs5VOkZvezwvYGxizA+uNhOi9L
	hOv0Gc9QlmGWTKKRcR6z5GiDC4ay6dYCXnBvlAJnml4nNhV+8QKEN05E5Qu3Osofz0mu5diBypyNx
	6FEh7PDLpnJheQisrHWfW+jbfDSKi5Yi3CCXxJ2Px2lZATR+RBJic8Q6Y8IaeMEmXm+WYWD5mu4Bj
	wZGHcRw9uUMOJOJXoEDLmIjfwUbHFTeLmWdVsCMama5BY7NzBvoKxZqMacCCFMt9Q+wdAiC4Krg5H
	NTYEk7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvpy-0000000DF7Q-0W1D;
	Sat, 03 Oct 2026 09:15:22 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvpv-0000000DF6N-1NmT
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:15:20 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so2964155e9.3
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018917; x=1791623717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+D0wcMiZw7JqhFEXAX/EBPaHQLIVoMlrQj5WJPMGog=;
        b=ERLR1jiFIVukXS6fn/EaOL29ecx3djGArKw/FHTClbaXbra4TJ511ubeiTQkol1yv/
         P/78MGlq0NZ3FHbD99Zdnn4E6/yP0n+Zya3zeui4jmdftMGf19Z2RhMm1UJgV3F93OlZ
         WC7lyKYVibJZp1UZir4S63erT1QSNNCaLoYuopP8fIxdB08DFtrqYp+Iwpu7O8X6Xvq8
         4kChf1m08yv2njbvJ372N0nskHm6MAah6YjnkpURXoO2vj+QL6hLcNMhC4u1YtauIYjl
         3NMnPU1HKFXwEH0erVU2Z5ZahoGJKhrW1tbahoG9Lvmj4ApKlqCPNwZF6hYuXwIgikig
         PHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018917; x=1791623717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+D0wcMiZw7JqhFEXAX/EBPaHQLIVoMlrQj5WJPMGog=;
        b=evXWFjgW3xY6yINHfvduyPLqQJqlX5Lovrexfk03YTxTrtX6MOCGa/mfqHmRqxOeVb
         QM/NQtsNeBdotky/5Vcu7j5YWOOPRALP13t82OmtnMN1WvCoujsc9EHtTSepjuO6Emho
         9X+oK26+fD4WKY5zgODK8jl7yVelEubYmHjiTnY+Q4XJWZBIbRBKm+/AoW5q/7kGufDZ
         Cti64Puj4lZZuomsG23mlA5jWOzuGyR5WMb6Rbok1XsU1qe8v3OmNaK9r46tjB3l6Xkn
         7gBainNmuUqquWn1E0llIIKmBOuCh7nsJUJgZqu5QIzkp+znVVHNbGCjsAaQOZla09dC
         EAoQ==
X-Forwarded-Encrypted: i=1; AKwUvByflfAeHtkuMy+icp7wl5hQuga32iGhxM2oL93JoW9kHmpW/qPba6mzEHi831s57h5JsSKXTp8=@lists.infradead.org
X-Gm-Message-State: AFuF++nC1Fa78b9wF/BbKcx7T2Cdy3VNLp20orYiAhrrPvVVgwvCzsTh
	OCbcZbvvFGnWpHvaFrdO1vASZTpeQWVKfE0bpN19+AUMeniuP/uSmac6
X-Gm-Gg: AYBFou16NEO3UJruDyntYqkoBy6t+eOw5v2VP47xGXxeQrVaNWcGi7++OCrqefxqCIF
	PMFzyS8QpMenTwgQ1UXQlfHHCmFdFMH9Sh4x7dACkOUX3zyoYBiNyx8OZUNNt/LupZUJvXXEqTt
	eOxP068yqtEuf+ILSB2u7I0NwzssLZnjjha5ztOijP+jF/x4VLRvzaOUDpepCNrF+HEFKdD89MO
	sQ28PipxppdN7F/jSSg1gU0QBkSyQ33xi/0vjPw4Qi7Es0dJj27p5YnLkgn7roJSoW6U0QUDbX4
	YJk0TAQK0TPjtA4yCcuaDFXjMkML2rNmyLuCp6CQPDw/jfJUSO7hO5kT4VJu08aVOvaIHk4/iE5
	a7Ks9iwBeOgiueQNF2mGw4jIdd6cCWIayfmGiMGc/n5nT3z9Mpzmd3DFIVYwOJJI4Y6vQ6HrIO7
	79c9LJe1cYLk4StfJugnat0mAgmeo8PMWddDmDhEwdPz8WH7zh9rR9d4MIbZgdv+9dsjJCpsBa6
	DeO+igZpgHNVf1pd2hz5g==
X-Received: by 2002:a05:600c:8710:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a02759555dmr75369925e9.34.1791018916839;
        Sat, 03 Oct 2026 02:15:16 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:16 -0700 (PDT)
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
Subject: [PATCH RFC 0/3] Allow DT boards to disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:06 +0200
Message-ID: <20261003091509.4822-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021519_389991_D0218A0D 
X-CRM114-Status: GOOD (  10.88  )
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

On the Microsoft Surface Pro 11 (X1E80100, board "denali"), the WCN7850
hardware rfkill input reads as "radio off". ath12k turns on hardware
rfkill handling, so Wi-Fi stays hard-blocked:

  iwd: Error bringing interface 4 up: Operation not possible due to RF-kill

ACPI platforms can already turn this off (ath12k_acpi_get_disable_rfkill()),
but DT-based boards have no way to. This series adds a boolean
"disable-rfkill" property to the ath12k binding, makes ath12k honour
it, and sets it on the Surface Pro 11. Out-of-tree Surface Pro 11
kernels already ship an equivalent change.

This is an RFC mainly because of the property itself. Is a generic
"disable-rfkill" acceptable, or would you prefer a vendor-prefixed
name, or a different way to describe a board whose rfkill line is not
usable?

Testing: next-20260929 on a Surface Pro 11, with the ath12k change and
the property added to the installed DTB with fdtput. The interface
comes up and connects (5 GHz, 160 MHz). The DTS change builds, and the
built DTB carries the property. dt_binding_check / dtbs_check were not
run, because dtschema is not installed here.

On this machine the endpoint is only enumerated with "power: sequencing:
qcom-wcn: power off WLAN at probe", sent separately as a fix for
b921aa3f8dec.

This series was prepared with the help of an AI coding assistant
(Claude): finding the cause, writing the code and the changelogs. I
reviewed it and tested it on the hardware.

Franz (3):
  dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
  wifi: ath12k: honour disable-rfkill from the device tree
  arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill

 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml      | 7 +++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c                     | 3 +++
 3 files changed, 12 insertions(+)


base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095
-- 
2.56.0


