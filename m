Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB07FED3DB
	for <ath12k@archiver.kernel.org>; Fri, 24 Apr 2026 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=; b=kDM4rlMbrb5HA54PlKXqBheoy6
	dG0CYhBr4gioXOdJp2nZ3qImyqkq0vQW95yRGZ3LpcGZ45qQGeiFbm7mETNBPwYyfw6ENKt9fQU1U
	RxYUjntj2xCcAdTrm3wPC2x/TmrSNqm2Q3KkRec00ykIj4HDg/5IWPbxqmHoHY9mXQf0jbtND8m8N
	00i5QxHrKwU/R/oWaYjTyZ3MxQdHbD3AzIsdHuZH0hx19YSlup9lewHG3c/z6UXTcS6a0SXaCEvI2
	Qe8w76lhBXj89bv8NirMPuC0yJpkfQEenhJk6IMVttt+z5Igb+t/4jAgkEb/EepYtIDsVa/irQWIN
	APpRaW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpM-0000000DLMK-1wBe;
	Fri, 24 Apr 2026 14:48:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHpJ-0000000DLLV-3005
	for ath12k@lists.infradead.org;
	Fri, 24 Apr 2026 14:48:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso79484635e9.1
        for <ath12k@lists.infradead.org>; Fri, 24 Apr 2026 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777042095; x=1777646895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=;
        b=QWo0NDvkeRXTapRd7UVaTdmw7JVh72iZ3wKjyia3hp8MATV7jfD+9P9fVlkplIWYTS
         ZWLNG4bVpW9sN5VInxyVkhPzQ/OzfVjq+ZFRN8s7BrSXBSvSnGPbQ5qpBtjVYLxVH4i8
         /8oM5shIz4fY+OXFwehwrmvflbOpb64yKWy1PM5XCPwxMTYe4nXv/rTrqmcp2oHxqnxH
         Vd1Iljo3yXPIkqueF0snrPcbGuPQsxG2LwsWI7eg48R6VGDuliwt7U4/gqtiJcJfMmLM
         Kd4s7rxe3nOgyYuPIEEGSPFEzfhZEju89+Bv097wkcoI+CI9c6+kXZqlsEMnSiQbYKMA
         i5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042095; x=1777646895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=;
        b=bnXzxPIByKyGkIRjkCwZ79P5BSXS/WAbR7rnWKqGT7g3j7DblyoVvCiY+8s6mwJ2sH
         8Us9/lcRh5fphe4f2OzjLmp5pmlsFMNl10VIF994dVQfv1UwhnrSQzbVI4ASBMyEunrI
         pIGwwy+9DJHqn89U/YoI6K5V8wDtn19soSii6PU08Z/1fwYWJ79INZfsBQ6QgRHuRN20
         Zi/Mq0apLvY/bw2wt+hpzBk5Kl5VHvnLg8tuZ6PmimjEkd/enTwjiLEmqeDhJlRXb9LJ
         3ta311qapA/rfhBgzBSTThRTvM4uhjteZbl/19p0IS6jx4vwCBwCcjnntERtDLZILQaD
         LGZA==
X-Gm-Message-State: AOJu0YzxetV7mkO7Dd+5nU+YT0tF0Jv5HWI8zznUGFWs8Y7C2KT4e1vJ
	cg014YhcQD1sP0kYB+hbRYcRXxYbLHVg6lVWr8d5hESks6d5eUKTM83CgAJYsQ==
X-Gm-Gg: AeBDies4kIX0rXS9SFdSFjp9WzMo9yQ6Q9JNXCBVxI82Z+egm9WnvSqeo7QdkADAnjS
	vO/TG+Zjczlsa7IosLvWaDoG8c/qwleSB56OBJRXxCbh7ul0YKD9+Z9KbC/por8xTsVuKP5MWrp
	wQOm3MqotaZ1c1eirh1UY8uRzqLPzyORBjuidL4k3lNktd7gQqp2GPGYOuYN/bZznfX6y8OZse0
	JBpsK41JxNHCciH7N2SE97eAwm0XHrP9hw/giunWOmrYVKCtKcfs3PULLy0yk/Vqq2P2nu83B/u
	NcbTPdp32pjoPcP7/JopmZ+Cqx2PjdTQjrWeOujY/QN9z/Jel9+4wNHsjccHcEWK6NsBkcqZwOn
	qNG5S+UGRxlSOwwcM5NFgYgVGHXFPpkggdj7PLbsWF6p6EWRwKH+Cu7ofHby4lN1uUlGXiQ0Ta+
	Dr7Uvew9tImev6lXexcq1vNHi2aG0m4JdjZXqEJehKr00cG3nV+lg/XCFUTxSsQFQdM5Q=
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr258627745e9.8.1777042094451;
        Fri, 24 Apr 2026 07:48:14 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm157605825e9.26.2026.04.24.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 07:48:14 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath 0/2] fix leaks in some WMI error path
Date: Fri, 24 Apr 2026 16:48:11 +0200
Message-ID: <20260424144813.1708214-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_074817_777874_D818659C 
X-CRM114-Status: UNSURE (   6.85  )
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

So this is similar work to what has been posted here [0] for ath12k.

When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
explicitly checking the return value we fail to free the allocated skb.

This has been split into 2 patches per Jeff's guidance to hopefully
ease the backporting process.

[0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/

Nicolas Escande (2):
  wifi: ath11k: fix leak in error path of some WOW related WMI commands
  wifi: ath11k: fix error path leaks in some WMI calls

 drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
 1 file changed, 112 insertions(+), 19 deletions(-)

-- 
2.53.0


