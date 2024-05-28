Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADC8C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFU0fFDLXBVTpEVhQ1putOMYxJzP0S29Lv1LacuJjZ8=; b=okK6f87QqRgXvaElEHPns/QdhJ
	CgSvqC7rLCZgJ4P9FCtuqcUCb/eTZI47ceY+8CSj2wPNULB/6P7p/pREnfGbD7KkLFLIn9TtmrZv5
	SEeHgWDKe7jwr8DXAaBmQ7CSz4VgtA0fBUdDeCkd43UTH0p8g0Vp2XNCTi0YPPvwSGqc+F8Dj9AAP
	DbQMi8AB+Ky6PqIT3onL8wMoRj+SuINFheOFGAqWf0jPHqXMB6HXWGUh28c3r55jiPm14pKNM9uJ0
	ySJ/ynmCnHIl8pJlHQxPowQSxiHTEwl8m1y6veFK8ePjJ6RGLbC/qHrsF7Xfdc5spglESbrxq2JJj
	6/JMhPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27v-00000001kRa-40Uw
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:04:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27D-00000001jng-1eRu
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-421087b6f3fso10174835e9.1
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923044; x=1717527844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFU0fFDLXBVTpEVhQ1putOMYxJzP0S29Lv1LacuJjZ8=;
        b=xNklBJdNqHzwRcMlIs9MXOfebjS3V6pqaVbSkBbz5zxQADkucW0sK7/3loC5tgufZB
         /fXCy2txXdpv//rppPKJ7ict9z451N7n4mDUVt9vpx2X2KgDMAFMDrCuWMlkVmvUKiCK
         UczCj7W2OnsND4Zr7Pz8itGTtszfaRTm01w3LzDiaU6tQjsiu64NmY0eo2y2/qRjBR4y
         Mxixv9/8lh/Jkp40hSYZo5keooXn56Bcv/Jq7bMOOU7regptoqRHUhTSf5MBY96QKxmm
         ILbEDLpBAVZ6L4cZz1G3AmR4ZLEZSQrN5KhD+kX+vKuXYm4l2KrWkL63kq7fU48+70XU
         7Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923044; x=1717527844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFU0fFDLXBVTpEVhQ1putOMYxJzP0S29Lv1LacuJjZ8=;
        b=uhfwg2isK+0jC1+ErOP/WAysp20rEdfgxLHSH3Soabv0nnpFigHWhVPh4Cf9uXoONq
         FhD6Q7j2ZdH+eySXmRzOSMHuoueck3+E4FzYRoz/8IxzvMIHGJb5+HWrg21XOfrXILTe
         tHfnYRBn9M+cm+FyCa2CrcZlmFxIv/h3QBjir9CLVUKSNmON0lqqwAeTSWW7wP82nH5B
         jfRdSe0/OF6uUsZ31/8rFZtnMAvlfHeDXCNj9N4Sj4eAyWIa5BPyio8px1F1igqCADzR
         bE2vUY9JFF3pEln95AHckYwrKd4QQLUpfKAWzhmEEZIsOpk2xmtFX+CCKMjPeWBTNQMH
         c84w==
X-Forwarded-Encrypted: i=1; AJvYcCWlEbzBCFsoLd2v1GAQNta+otNvV6Rq8TCFwGRTRZmaXOoBP3rwWaBr35mQBE1R89S8A8ac4TDN/dPZTW0LkfM5T0qtdar+JwiS9w==
X-Gm-Message-State: AOJu0YygBSuf7A/cWhhdyxB3jaWm6KBKtop5/zb9tlNVkG8l2nVo4b4K
	wbjbrJJPCxVDHUt8ul/rDyqH9MEZW2Z5Bn2j4bt7ubPGdBH3TmGR2mgeP3z2BkU=
X-Google-Smtp-Source: AGHT+IG6B6kXReUvfOK7G13iUYw63mXLE+oQ5Xs7Zu/A92odTJ2Gt2f1pgs9Npx0RVH6n2yeZy3ueQ==
X-Received: by 2002:a05:600c:5719:b0:420:173f:e1e9 with SMTP id 5b1f17b1804b1-421089e97bcmr91269195e9.21.1716923044209;
        Tue, 28 May 2024 12:04:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:20 +0200
Subject: [PATCH v8 12/17] PCI: hold the rescan mutex when scanning for the
 first time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-12-d354d52b763c@linaro.org>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Amit Pundir <amit.pundir@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kuyJTCA9fdYhUGDXvoePXqDSaNb9NruStgSbf5wa/1E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqP/eY7rIuS/eQw4O3UlON8rwdGRoMGUP7rz
 yzNVdBe65WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjwAKCRARpy6gFHHX
 cvKjD/9WKJ6xrPFHjBRP7ktzwHOQmaTfICHaHJtV3PV0foF3NVt3xBjv/3MfTIoDHxKL/27sUbX
 AX0c1HDDrhyg+xUEwP3Ldeoi+bmJKHTPpBgTuLU0F9ax8+nQsFBoHyOQwaIFebtMFB0f8GE+xA0
 jsxo/VePbSMksuxs1v066MNDPpVjKPx/BS6ZmdWbZU/Fhw/PA83vcPyKHyS+gSwR+/a6naEoIDG
 /r4rQ1fIQMD+/LMFzTJYgTkk5dh96SRuGfQ0HgYSfbWr42EdZUbFyMDhgUiqQceMOBwexPlqd0J
 BOASeFIGFOYM7lyG+0RBjDGGbtg9P3D8EF5EbrI5IMHMJGEPlOdEEHydvZ3irbtN/FdyTQcps60
 W3h5F7J/GEci3w5eTef3u2+nLFBD7+v/IzE/U+e/ISniyUz+HOqEMZ2cfKGAqvzBXOFxzAONnzI
 GUn45522td18GWGJ2IQq6PWkohJhco7ANiMaK/pwgGkemTt34e2f56iqSkaw2hhTnzrI1oaIP7K
 SsLgff5wn0FMZqpU/xOqN1gUJ6dCL9fQiFa32Acmjqlhp9qs/MVZY6ri19ncKXCEPITAp6Qv/Rm
 AK96m/GOCFcx5h2BnodJx318PL5gOmyFiDLn7oaEdmqmPq2rpC9akype843qdeE5gZ0F8jt0z/I
 Tu7x3hngIac7MMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120408_390812_13763B6C 
X-CRM114-Status: GOOD (  10.55  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the introduction of PCI device power control drivers that will be
able to trigger the port rescan when probing, we need to hold the rescan
mutex during the initial pci_host_probe() too or the two could get in
each other's way.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8e696e547565..604fc96b1098 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3072,7 +3072,9 @@ int pci_host_probe(struct pci_host_bridge *bridge)
 	struct pci_bus *bus, *child;
 	int ret;
 
+	pci_lock_rescan_remove();
 	ret = pci_scan_root_bus_bridge(bridge);
+	pci_unlock_rescan_remove();
 	if (ret < 0) {
 		dev_err(bridge->dev.parent, "Scanning root bridge failed");
 		return ret;

-- 
2.43.0


