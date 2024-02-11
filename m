Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F04C4829A
	for <ath12k@archiver.kernel.org>; Sun, 11 Feb 2024 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CLCtixCKrCF9DWrHtDqiQi9nNKYBgVJawTIFD8ZaWco=; b=BP7O9D8YKKKeNGKpLNW10HJGJW
	dZOxYW2MAeqCrOiXclygoxyToqZ6QYMWsgqI3rF9HFcwShe4g6fDl/aN1ZEBnGiybXAAOF70c7bYe
	sUGDcX0mcZd4/3VOzalz4e6clsUHPQIi4mbfoDg9HqRY2ZmGzdOQmmfxKc4FfVOjZSt9zxX8GRS9Q
	uz5uu79LP+pCT3BKfZMOkFllQUTMBW0EuU1RAihw94O8KhEeXeVI1MwFkPnsUvEeAs50TFJnljrVN
	5kuM7GTr9GRkqtqoh4VxlBjb0OdMyBCzrnuic6Yn/7W1Lsl9EOj1OHUF79c+V+EaSBeovSi4kGBq5
	Qd9aLFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFL-00000002rkr-1rcZ
	for ath12k@archiver.kernel.org;
	Sun, 11 Feb 2024 14:55:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFJ-00000002rjL-18nT
	for ath12k@lists.infradead.org;
	Sun, 11 Feb 2024 14:55:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33b66883de9so1623288f8f.0
        for <ath12k@lists.infradead.org>; Sun, 11 Feb 2024 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707663351; x=1708268151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLCtixCKrCF9DWrHtDqiQi9nNKYBgVJawTIFD8ZaWco=;
        b=cl9k361viodAvgSJMJWn0S9An1NWLhtb5XSMKUkWGG9goKG4nxgtNTlA9lvbyzWnyi
         tosf3eDwvpFJBtX8MQlR8y7PfYyb5wxwGLnvYSOLuXa0ByNuliAFZr675VD4GwcF/rv1
         ssfB0C7TQya+ugW84kF97axjkQAE0Bf87KPk5PewxQyQYFQ/5NUJXq3tRsWrQfHixJ2Q
         WU/8TAO0verWZa1xdB23HkTAZvvcR02fy6iNZkWtHlTaX/g+kJGZ2AuD7yEWkQdvxn3p
         QGZiIVHkRVksnwFaoY1UPpMpFx2dLGcjKbD57yCrQQO8BsIJDvMTsBlh1AD3xr2/nNN0
         BYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707663351; x=1708268151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLCtixCKrCF9DWrHtDqiQi9nNKYBgVJawTIFD8ZaWco=;
        b=RzDiGefM4k3vORod0yPuGIgS13ZEwm0r0SAYjs5vLyU7UBJH5uFl6zzRvbY8RP/om/
         Hwf32wWjMgT1P/k5VeDfvbYpMtdn4EAUvpj8Dmvt2ToaJaKJj3usEY6H/VVU57WZYVts
         gs4v8IFp5oV/qJvJZuP6f60ndIvCww7Z0d+go0Q5wBuZDoJBKXkqTRmT1b1DXHmFZixX
         GSgnDvN1xhgGvbMim3Wx2iy2VfUu9vZl2OSkelP1ETLpTheTwS7GzIC8Cxk2zeTLVhhN
         FgUTa4UWy3EhUuZbNXROMpLEa2muQ4zp2LwTyUQJxIF8z0xsYPp/lg5idPbpZycc48an
         dK3Q==
X-Gm-Message-State: AOJu0YwzwWdjYRxiseCaF8p3ivydKixj2xajdEzlc64ON8EbCImyMZdc
	xKA/q2pvwcr5EdM2VHanthFdE0LTmm/9uxoJHpLsD6DoZnFRgO8XuqW556T3
X-Google-Smtp-Source: AGHT+IH5eGK62dyD65QQzY0/cVLkLg+3MRXkexDMrc3/fOEitnSW6BI9Z68fT7+uzJ60flw/CEzszg==
X-Received: by 2002:a5d:6c63:0:b0:33b:3fc4:3ac9 with SMTP id r3-20020a5d6c63000000b0033b3fc43ac9mr4381386wrz.32.1707663350602;
        Sun, 11 Feb 2024 06:55:50 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id cf2-20020a5d5c82000000b0033b7263702csm3779424wrb.29.2024.02.11.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 06:55:49 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/2] CLeanup scan_flags from struct ath12k_wmi_scan_req_arg
Date: Sun, 11 Feb 2024 15:55:46 +0100
Message-ID: <20240211145548.1939610-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_065553_327991_DDB13D7A 
X-CRM114-Status: UNSURE (   6.46  )
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

As previously done for ath11k (see [1] lets fixup struct ath12k_wmi_scan_req_arg
to remove the scan_flags member. This prevent future use of out of sync
WMI_SCAN_XXX defines & their corresponding scan_f_xxx corresponding bitfields

[1] https://lore.kernel.org/all/20240209113536.266822-1-nico.escande@gmail.com/

Nicolas Escande (2):
  wifi: ath12k: do not use scan_flags from struct
  wifi: ath12k: Remove unused scan_flags from struct

 drivers/net/wireless/ath/ath12k/mac.c |  4 +-
 drivers/net/wireless/ath/ath12k/wmi.c |  2 +-
 drivers/net/wireless/ath/ath12k/wmi.h | 55 ++++++++++++---------------
 3 files changed, 28 insertions(+), 33 deletions(-)

-- 
2.43.0


