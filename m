Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D107EC4451B
	for <ath12k@archiver.kernel.org>; Sat, 18 Jul 2026 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=; b=1NYmXlVA1a6ZMJbSmca/2+Noxh
	NQABL14EgazJf7t6w2AeNszfd7ErV1P4jJPKpxYn+MmDhM20q+VChp+S9Ht/UqKXYsfBxNcvnoRJ9
	pbRgg+/9OX/fPhI/BovE+5lmVUMsLRszEtIlIcyCxPP4PTHgiB/2Bvp6DQu4U4lNJ7ESXmTgbHoy7
	k8kehBOjuO6ga8HVMs196g+gBVgxKWhlUIp7t5wbh+OvZzCoI4fGFBokMXxkYTJe1xwoa0G5J60Rv
	FwffHJMKdO4+t2rk9oploAW4LMUqagSProtnOXVhleq+wEuUFmkaJHQodRRsUnP8ckhorGnM7GHFw
	zapJ5+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzfB-00000003qUe-3YCo;
	Sat, 18 Jul 2026 07:40:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzf8-00000003qTu-1Hwo
	for ath12k@lists.infradead.org;
	Sat, 18 Jul 2026 07:40:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ceaf8a1265so81970555ad.2
        for <ath12k@lists.infradead.org>; Sat, 18 Jul 2026 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784360441; x=1784965241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=;
        b=iYQa9DK4lI9vO0k5PBvPbiuXJ1/HPrl9RdlfN1AITqqJHDSp/EggH7/80Rsxfbv/gj
         9ErDS+rHhJvKnfpEsOUpUAP9XkwRhTbKW3ge+ehaUcIr7ZtAWm0aYXM1zgIGUX7rXb3W
         t7IM7ucbnTvOdYbL9iRwrG9lOkP/AqzwZH8GqbZxkgSyG1b7VrWWLG5P7enMWcgjhFYn
         XZgUe+4D2I6DNJbuINDAqZ9KBi/xX+iadqUoH+AebMaCYRueJEyQYsaDc0XYgqdc37we
         cnBx2BhSVEfVLuHKT0aY8x2rKLCOl7NGLxlBsuAj93/yxJ/YWtWRy6Djm+pc3JLwEzqb
         NLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784360441; x=1784965241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=;
        b=K9TUIHyf/8waY9kd+E6WRJvUnd+ZR2hVJbs33wY2+quSLERTH/ZrDmYNV8WdmTc7qK
         eVAPoBirHwJHRxHAOdhlp6TT/rB4ODF8sHPP524ZmOwB/9WwyonbQfBiH/n3L8iHQyaz
         8l/iJ2aggjX9Pu6bD4XqKKRDaPN+7pv06GQyEJmBUnzoMMC1JtAmoVxKrO2l1s9vfbJ7
         KbOMyBa4+/a+KqtRV5OP1MGMzyYzVCn/t9F6AWu+aAIdl/mrxzGrYuyiltpI7YMVonJM
         K8Dbwd0sxK6/ty6UzImIwZ0TOg/+qyjOhYvmR6I3IZ+iP6pHIQGiPt2XkiPs665FaH/7
         9FFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Pq4lsnZYnYdbrsKLl49pKS6Zgse8P158HoWTRGcUdTH4pSrWh10aQJXRaf01w0sg0NzzjUU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXlOvytZC0ouh49BzCfAZ4O4i3in8QIJb081k7NdlAvLiiu03z
	2swyViWndKQTz+tOLLUh822dMy2WjuyQsybOpMeB4QxKEEqxKqY8BlRM
X-Gm-Gg: AfdE7cmNboFPfbC96nQebyQ0vnjoAim1gkbkk1keVnu++FfBTe0kkOGlD+Bb3NkZ80G
	yvJTfSx37cigmqNk9MSyYN1IlAjCnpagXL8qmNGyKeFQMtpnAdZbR+jPB0uIkv2f2KkG2fiekQX
	FwsX4yFu/yuNWXnIZb7v9jh24so8TR2xBMmDSMCvK5DYbvrnhx8rrVasOXVljbqDt7adPo8WBOc
	ORh+r2y2VlQqT8j7uhMarkMdw1a+DkwlZd9eLDtyCjleYJl6Fb9lPEVja2t0TOfI/PW5S3HGapL
	lj4mdTk8NQiQ4nNXqpqxN8jXmOa2sZdjmyHfawxLqF+M2In4NPsR2uvnXe7Oq9rMAiCNZe6yjgo
	jAAAD6E34CiJVYiWiX4+Vae5g/viydeyMF6/HBSnEBfV47Q9TB+ShxAwIhzfEFAudGi8=
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr62046285ad.25.1784360441199;
        Sat, 18 Jul 2026 00:40:41 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm23399685ad.52.2026.07.18.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:40:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3 0/2] wifi: ath11k/ath12k: release QMI handles on late init failures
Date: Sat, 18 Jul 2026 15:40:24 +0800
Message-ID: <20260718074026.3085688-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_004042_350890_199EC778 
X-CRM114-Status: UNSURE (   6.78  )
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

This series fixes QMI handle leaks in the late initialization failure
paths of ath11k and ath12k.

Both drivers initialize the QMI handle before allocating the QMI event
workqueue and registering the service lookup. If either of these later
steps fails, the initialized QMI handle is not released.

Patch 1 fixes the leak in ath11k.

Patch 2 fixes the leak in ath12k and sets ab->qmi.ab only after QMI
service initialization completes successfully.

v3:
  - Split the ath11k and ath12k changes into separate patches, as
    requested by Jeff Johnson.

v2:
  - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
    as suggested by Baochen Qiang.
  - Fix the same late initialization QMI handle leak in ath11k, as
    suggested by Vasanthakumar Thiagarajan.
  - Drop the Reviewed-by tag due to the code changes.

Guangshuo Li (2):
  wifi: ath11k: release QMI handle on late init failures
  wifi: ath12k: release QMI handle on late init failures

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.43.0


