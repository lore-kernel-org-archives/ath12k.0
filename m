Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C220FC25B7C
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIAqX/A7cyBOqcNtjCtgW6nW/To9B5cWPZdLS8273K0=; b=NBQvof3crQ/tDrYfODoDxUQUBv
	+lQJz5A4vVhb8OVx9yT13JiYdix1bZcYEhK4Q4kh6TlMKvy/45DzCCYvwZnFvGFBPDSvaf/xFJSWN
	gHspaGV2509V27dmFoAHOlFDqlM3RK/+6dH/0DYpW8r9Kgq0RBdN0XKPyDoU/vwgw4RgWfYG2TSOT
	Fz18XIw3H06bpWCNxuLJsmOmFDYxLFtfcZAkxC4iocaPIOWqByZSRr5ED1rHKHARe92IIlp/1K05l
	3LisOKYTYnrr0iswnkEjAbvYnxnWhE/2tCC3Hut2huwuc7v70alK1Gpf/QIv5ONCDymvg1W6z5K7/
	Z33HTMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC281-00000001kWV-3tFZ
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:04:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27E-00000001jpl-1b69
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso6488175e9.2
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923047; x=1717527847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIAqX/A7cyBOqcNtjCtgW6nW/To9B5cWPZdLS8273K0=;
        b=Jv/XFrPCpbM8I0ITY7tmgyhPR71eeRGJNWl2038lOz0jM2R4VAtdtmpXv0mEQT8Ffo
         w6yqAcWOdgvSXWQsAcItN/BsHaIeLS2fYRjyVQiIGb8T4zMeZ1FZNz4J/ZH0j+KJJjmL
         fWItsExtc3puvTyYEDgnJ66emk37mAI64ZoQNx3cKqWRCCO2ugxB6xGR/atfd4CI4n0M
         XSCWYdUPlMk10UoI1iZKSys5+NyE1O+annLrvRNZ6RpvEtt2RQmhOyEGTy/AUqWF7zfo
         XzPLpg4Wth+1PQYYwtliojO1zYWTMDPr/BitBqKzgXXLOzyakKMvhIWeXsJeEYX7ri+h
         2BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923047; x=1717527847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIAqX/A7cyBOqcNtjCtgW6nW/To9B5cWPZdLS8273K0=;
        b=JMyyDBn04fky5VP7DWyfGOxarNNUtAS/h/+RSgwm2TkwzZCOmX26Ig1CZEgytFlXJX
         Xm0YxK6XtPs2xbwr0txGY62mqV9d8oDOg+V0zqR945c3H6i/WDtIVv25sr+gsO6gFiNj
         TpixbhahhItAeXC4eIjLuR1sWCvp+RRdtqqjy6xgtPtOVo9W5l9I1QxxwX2grQizygxR
         +pPI2zfVAWUanPMnQnIFzdBEu33PY8ag7pSBrNCDZk4xd3GeduvpxDDk+B9FfZ/M7D4Q
         rK9XX47dhtJES8B8y0GICj9cET7jkEuavN83sKYwXsT0Wxu8t6YM7QMt/MYPwmEplv9E
         zq9g==
X-Forwarded-Encrypted: i=1; AJvYcCVH73QGKYBKyhXQMk2SxI7xq/CVJU5XZla/rkWgliPb++MW5OdZxDdx/sivnNaclV6ioEDS7NPW6muj8BNa3O8oKKlihPMXJ1vLfQ==
X-Gm-Message-State: AOJu0YygKFuLnSKzg3oBx2tlkCOykhPhRQFZ3MYqiJgoJi+Oe/SnSeNo
	odFWwzpcC+lXrYZ6EJIq52xBYvRegn6OiOw6OGYPD9DytmmMOY4jS4VJLdVSDsc=
X-Google-Smtp-Source: AGHT+IHz0lkGSUV61P5eSq7TShjaoltPA0/QAdOG/j0o1z0ZCy0AcWo0waox12rHLA8DHj/vEX/Bzw==
X-Received: by 2002:a05:600c:46c4:b0:41a:e995:b924 with SMTP id 5b1f17b1804b1-42108a0b91dmr82051805e9.33.1716923046905;
        Tue, 28 May 2024 12:04:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:22 +0200
Subject: [PATCH v8 14/17] PCI/pwrctl: create platform devices for child OF
 nodes of the port node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-14-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JjTaqS3wTDZBLouvY0ZN3GdR/yNW7FaquCkQXG8PeWA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqQjRkZ9uZOgI/9NbVSvh6khAK880XtupTre
 fVqi1WIceiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqkAAKCRARpy6gFHHX
 cmNaEACVAeQ8jz+bWQVF+5dvErJuYBGMqjrtYZBxIdGU7EEGgixkfvwFd0AQFhVe8FqHHJWKs4M
 N06NxP7um7vj/xY0SfElsVbf+NXxYsM/OsZkE5qf3kbBQLhacRowt34vhWGfcUsx5+XxzhS7Rpp
 ZC/AmPx6sldLAcNvvUYEhb3WuryaMZO9/NLnNJN/zXoWSCAeQ4MkYMER3sGq/OCEL+BRb3yXK6L
 +A/foR6+Bv4ztyECvXpNXmtr9ObiJT+48LDRaVfwS45XtSUXzS5GHthSGZdDwT0A1ZtqcXIKKmY
 QSyNKVJtljr5mhnonYU/9zmEVtnqMieZAEtXNkgHGNaNeronuzQJX1sKQgB6Qndnq0YIM3asebV
 xNjkBK1Rh0jpTCyCmiZvkJjPIc5oImwGBOemuaCf52tUlJliwsQeVRHE0L1ZFz/F+XHu0wIYpPQ
 NTvkWV6EnUUhJnNGnFqu8fYCf/Fv8WNUhsV6dBrkdryH5PbhY2mXT6diVfTMtgqF20al/woinO6
 tOD/o3bSvczc/u8MisHsUmc/Ld9q5YcMsEIMHkZoj8HGHfVzuQEIaRoHV9uux0vxqEHswcwN6xG
 3nwdBlbptcXMcK3gE/GtdGmeQHOFv2XgC1fQBmKkzyGQfTERVXvRfFnKII7vGfrEBNhWiqtTKwe
 GoKcrXlo0l1BGgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120408_918595_D7A18712 
X-CRM114-Status: GOOD (  15.02  )
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

In preparation for introducing PCI device power control - a set of
library functions that will allow powering-up of PCI devices before
they're detected on the PCI bus - we need to populate the devices
defined on the device-tree.

We are reusing the platform bus as it provides us with all the
infrastructure we need to match the pwrctl drivers against the
compatibles from OF nodes.

These platform devices will be probed by the driver core and bound to
the PCI pwrctl drivers we'll introduce later.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/bus.c    | 9 +++++++++
 drivers/pci/remove.c | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 826b5016a101..3e3517567721 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/proc_fs.h>
 #include <linux/slab.h>
 
@@ -354,6 +355,14 @@ void pci_bus_add_device(struct pci_dev *dev)
 		pci_warn(dev, "device attach failed (%d)\n", retval);
 
 	pci_dev_assign_added(dev, true);
+
+	if (pci_is_bridge(dev)) {
+		retval = of_platform_populate(dev->dev.of_node, NULL, NULL,
+					      &dev->dev);
+		if (retval)
+			pci_err(dev, "failed to populate child OF nodes (%d)\n",
+				retval);
+	}
 }
 EXPORT_SYMBOL_GPL(pci_bus_add_device);
 
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index d749ea8250d6..910387e5bdbf 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/pci.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include "pci.h"
 
 static void pci_free_resources(struct pci_dev *dev)
@@ -18,7 +19,7 @@ static void pci_stop_dev(struct pci_dev *dev)
 	pci_pme_active(dev, false);
 
 	if (pci_dev_is_added(dev)) {
-
+		of_platform_depopulate(&dev->dev);
 		device_release_driver(&dev->dev);
 		pci_proc_detach_device(dev);
 		pci_remove_sysfs_dev_files(dev);

-- 
2.43.0


