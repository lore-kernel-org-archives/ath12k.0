Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5523CCFD376
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 01:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo4q7JKeuUk4aiyRFRdMebz2WrMLhSzb/XBqsXZtV5s=; b=yOLaJYrPklRu8SCX4MpeGEjCng
	Sw8t+wyqIWPA6NGf65nHZlqRj/Q3nEUbxOn9dhq+YzQg+wGXr9SxXTiBHhpnxi0gljzi0B2hcizH0
	GVaH0y5eXbbzbht6H/ibfpQ3SG+6ayn8A3JK3UzChtBdZzTeOu79KJKnkgoQg2qYuGSbL49HhTCJV
	6oALv1PFG3ZBKJah5Ka3+3pHJS3lFslO9H6CkTJK77VmwOlyA7OKY1YhNz0yP00iT2bgxUXFkZucu
	h5UsIxGn5lBaqQimy6Vbqk4tLQRyIrytzydsJ1Wy5TZqaFCtdzTVwG/GCHzHOsy3Joge/D+7JFiuV
	unmqlZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsWL-00000002jus-2pvy;
	Mon, 01 Dec 2025 01:16:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsWH-00000002jtU-1Qy4
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 01:16:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso24435305e9.3
        for <ath12k@lists.infradead.org>; Sun, 30 Nov 2025 17:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551760; x=1765156560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mo4q7JKeuUk4aiyRFRdMebz2WrMLhSzb/XBqsXZtV5s=;
        b=dplyiPeDcTjDxOkO2PB+ctO/s0LjwrH4mcr+9wlsIh9hXp4KEoJm5FzN4xWq82ereC
         +8bMO2a/38GYGeLpc4e7aGs70uQX4qwS4qTnv/uwlWL23eAzCP4zdwWfLW9bJdHen/7q
         ARCnYIeR/nP8PuXesBqyWsylIgOA/wdfSoHQsuCgTgFheafhmWInfNQhMTrRAO3yK2C4
         qGYVmT59qJyYNg5W+Ppn4nvo/SsU+IsxcIK6+AV7LvfQx4PjvFvnFmymLsxMrFjjtL1F
         TwiNziE2GmgONpQXNH1fILi+ZDuy/bB8u1lZ8slxuJ1TfDmFPogRFhK1wBKTIzRAgvQd
         hhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551760; x=1765156560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mo4q7JKeuUk4aiyRFRdMebz2WrMLhSzb/XBqsXZtV5s=;
        b=nYwviydla0hKsCu2WnXgvFCH+Daz8olvJw/xF5UqPRjL1eL+xqDWuKdQFDfIH9bj2s
         ehWrj+sDPdyboLSvrIsUmCnlBrrT02j0Qd3rU2VW2xdvkm1IaPEGnKK5Sft4thHk01la
         O5FDFaKOoyVKYyZFU4Q2UYkdE73tV3V5wcWFtHuxKFgBIZe1fcSMgJJVkFeFjgngBLb1
         FnnOmXL2SdjQSQkRsETewbZLt2sOao3TPFe/NvnOXWduXyiCwyFB0nJ8i26AdHw0KOS3
         CWg2ULibWEX4vnWglOMRQfG1SuTZjqljus6dkblMdjWRqQjkiHEt/h9FDJV2jVsZ6Cy5
         8AsA==
X-Forwarded-Encrypted: i=1; AJvYcCXWBC20tzQfU8psNSG0lkVjM/VBmpyVLanE2/WmQDHjuQWCKiKJf0YB7+Yth8OOGxTGJMbKKzg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEtdE6J98encMd360nnQudLl+MbJbYrCdBFtwK2tNDbaGWBMrL
	AmDQSloH8gFbzv1CdkwuT3vj2JyHTdKVZeEyQPOmzmN/fomcYRkMtgas
X-Gm-Gg: ASbGncv+RLmu41ethxNSE7MoL32Hsq7Py0bgOIjmVhVk4dVlWYxjPQQiY/sz39iVnqO
	clFqISIS1CExEqUHyzn3oVN+XQKt7/5Ex7Wt0dD4zXD4Po5CX3GvGDz1WgPnubmKCQjWOtVUgGm
	P14BoxH7OnE9TPKsQO3WwK77vXKMupjhITdSkn0XuVt8jCdA9mpC9U+PDvVLBl8S1reNf4A1dGs
	wU9IWxIKyylsOL5fLz1mV+KQ4E+b4Y4vrUz5oJt6qjJ6HJDJurrqN1c5pd0GEwSzv3zYXx0+QZA
	zjAAnAKJ+b2xQ1NkGrK26RWvTGWXIxw7QIU+lhCwI9zSuWl1d90PynGcn/AijYz9qtVOrYbH7Gn
	vOuATkaXstiEcD9pitTs1R05Pb57/xIafME5JlSh9BDnzn+PbfT+zEByNkSmy9b/Ig5WGGOYx2p
	+u2yPcjzWDRQm+XNJ2mh/TWmjInNdVPWshrY3N4cY2GJhfpnPU7O0VzA==
X-Google-Smtp-Source: AGHT+IH5rUuYD4eqKwAK50niTL5lsEFRsaD9OQ4iOSbw+TFAzVIVsM+nWiZuPk0ZntcRHhpGuzcYRQ==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-477c01eb9bdmr404432425e9.31.1764551759501;
        Sun, 30 Nov 2025 17:15:59 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:59 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] wifi: ath12k: Add support for disabling rfkill via devicetree
Date: Mon,  1 Dec 2025 01:14:48 +0000
Message-ID: <20251201011457.17422-8-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_171602_204154_0224766F 
X-CRM114-Status: GOOD (  13.01  )
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

Some devices (e.g. Microsoft Surface Pro 11) indicate that the rfkill
feature should be disabled by means of an ACPI bitflag.

If ACPI is not being used (i.e. booting using a devicetree) then this
property will not be read and therefore rfkill may be enabled and
the ath12k will be hard-blocked with no way to disable it.

Add a devicetree property that allows us to disable the rfkill feature.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 5d494c5cdc0d..954028495ea6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -78,6 +78,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (ath12k_acpi_get_disable_rfkill(ab))
 		return 0;
 
+	if (of_property_read_bool(ab->dev->of_node, "disable-rfkill"))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 
-- 
2.52.0


