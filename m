Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1BC83F17
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87+Ndx4tU3Bc/RBm9y43dq54vArNIkAlt17RzyhLMK4=; b=zeIoIM+NXj6wCO/MHIGKJMJt23
	JmbLtnKKOtt9XHxaNukd7fJ2xcR4l7qc5QDCg7BxdLx3aZuC8tQB5SENRW0iHU7DJLe4FXGq6H0Ho
	nn1Q39ccATI8fC4mZSmpJOeHIOLmuZd7APgbr+FWyqITDX/9J2Z+Q1jpcqHOy1ja9PnXzA/htLI+1
	gsUN5kApOwklZq5UMDTZFDG7MnxCYn60EEPqkvOR0vafvNQWU6NVAiJvG+u1TtWnQ1Y9gEN6ckPgd
	/ErztLmN2YAeJSzDXg3N5jlTeN6M3ukG0zQI+P02to4idVdyJW7DcxxVx+EJzXGLWsvR/l3HqKoLc
	9tSWp0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFv-000000034by-189p;
	Mon, 14 Jul 2025 18:50:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN6J-00000002yX5-0iLI
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 17:36:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a52874d593so3754034f8f.0
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514585; x=1753119385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87+Ndx4tU3Bc/RBm9y43dq54vArNIkAlt17RzyhLMK4=;
        b=gG5j6DHdEQHh7+kL1zSLVeqw7xHyvAQ2mDG/nG2iiNe99D97TH3fvrjK/wQPJjUhGY
         6OyFtfdBX7pRd4csh43VO6vI0PyP7hYAU9SUCletBtcGuzsmdSfeB38IsWolK5fWZc9m
         MqjkGzkKpIMlAaRwrq8vFtRCkC+NrvnwCR4/hOl7egJXwuwaubqlB9WDFLtjMkzXabF1
         aeYgkeuWCDpsx3m73a2q7k0jHvD53B7UcyH88OzqcauM2nsIfdS7HSwmOO5+Piwh4jWr
         OeeZ7fFB1S8RqpJuSTSLclUbQ4WRPBZX36dV5NuddJoAgbqoCip3t5eqrPUawxXP+yEn
         v/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514585; x=1753119385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87+Ndx4tU3Bc/RBm9y43dq54vArNIkAlt17RzyhLMK4=;
        b=S6sOkai1qyYQUvk4uKKI6I/9uufwYBk19DaWfh097mtL0wtberxVB1aNQkMh1r9pN5
         EiebB65j55pFr1jK73pePmAmjPaz9ipr2CfXD3/cDOIqq64Xv3sgLcWlk6CemCScGEya
         Q2YfvciJfwSbqVAqDd58eUaLKr3k74WuoDXRFoZNVe/OsAxceyJwOLAKQt4E7IdaXtTI
         Lp8pgWS8gmg0LYBWkMp6ePTcxUYOtF8myAYlWWI/Orv4VjFkyYSFmnVhk7RfYmttzTqH
         AK1zHe0rejCaJuLVBp16WhJ6uLtNZ6Ix3mi/XJ7nAfxjuBLTYGGh5Lwbn+csjkgvvjrz
         TmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8LCsWf89Dhd89bo7E74GT/vaCk0z/bPlGhpvg7FfXstxHkSvFqgxu+MQORtndQXg1mCRQBC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX3j4+fabmzne94hV7Ma3CkhnNusnELygVH2oDjEL+Kq7L8ufO
	AwXaGSf4KiK6BLdoM+GqPjoKAqlTLTc6UlgAJOuFHzwkfpIH4S0Xynd1
X-Gm-Gg: ASbGncu5rpJMZAVniYrobTFKpjh/IcT8njxGifdPUf7mpqyKKXYezgmGf0v32EKzTxJ
	dg9wMOjhXlt3UVhO3L4OoDViKBRGrpXlFw9gNcgpbfuKEzrUIWyvYxOwXRjFQghnrdJfOrQn1yK
	lkH85vBEnvDIusK2qdPJu6uoj8lpHWps4KStZSHeO6hoUb8xXCfFj3c7mxK3jEl6o45vqqeHTpL
	hQWbi28MT/v1uW4XXjw56m9qkv3HLjE++1oX3g5H70eWytLaMw4CfvvDnvp7bsJAzyA9KHjcZ5h
	aoRbilE5x8yCFnwrF+2Ziqx0NGYCeRdgzUE1UetByBpHxOKovicWQGc20UpXiV6zGrlewK3+iEO
	b3LhbzfHo7Yxt+vBuHqeMFkdAQ58WcwEAN30hvxeLxLsxDg==
X-Google-Smtp-Source: AGHT+IHwE5k8y6WgeeHHGTBoqTHW3b9d3pXfevxQkkUzEV8uufq6SNg+JFLfpZe/W1mCrWg4+Y19GA==
X-Received: by 2002:a5d:5f49:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b5f18f80c5mr11655696f8f.51.1752514584561;
        Mon, 14 Jul 2025 10:36:24 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:24 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/9] Microsoft Surface Pro 11 support
Date: Mon, 14 Jul 2025 18:35:36 +0100
Message-ID: <20250714173554.14223-1-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_103627_209375_5E2FFD2A 
X-CRM114-Status: UNSURE (   8.29  )
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

This series brings support for the X1E80100/X1P64100-based Microsoft
Surface Pro 11.

Patches 7 to 9 are included as RFC as we are unsure of how best to
achieve the required functionality, however the implementation is
functional.

Dale Whinham (6):
  dt-bindings: display: panel: samsung,atna30dw01: document ATNA30DW01
  firmware: qcom: scm: allow QSEECOM on Surface Pro 11
  platform/surface: aggregator_registry: Add Surface Pro 11
  arm64: dts: qcom: Add support for Surface Pro 11
  wifi: ath12k: Add support for disabling rfkill via devicetree
  arm64: dts: qcom: x1e80100-denali: Disable rfkill for wifi0

Jérôme de Bretagne (3):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
  drm/msm/dp: Work around bogus maximum link rate
  dt-bindings: wireless: ath12k: Add disable-rfkill property

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../display/panel/samsung,atna33xc20.yaml     |    2 +
 .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/x1e80100-microsoft-denali.dts    | 1341 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   13 +
 drivers/net/wireless/ath/ath12k/core.c        |    3 +
 .../surface/surface_aggregator_registry.c     |   18 +
 9 files changed, 1383 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali.dts

-- 
2.50.1


