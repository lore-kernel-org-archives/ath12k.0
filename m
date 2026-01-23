Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976AD74EED
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/p4HVsJQTZCKI9+64i+NDhOYzKitv/nH/N7R54exfU=; b=Doquyc7pn5eK2aITZFK2+u8Q6t
	qYq4DCvrJ7hGJ2YuES3TI9g/u26204UZJl5jiP3/+i9bQbkwzgGr7KL0eUTXpiR/MyBElJGgD1kjS
	8hQHFpIKHR1X/+cFOqrA7gh2GqyIOjllewmjH7vAh+6aiPCmMqvu4w6MCA9wSI0oWfo+u/k5e9tH+
	BwRH3jwCgGiJbOLDVhrGDQcBUp09Zpqwv27sG7A941M55jFTezG4rxp6DgTd084ebiEkSLz3OWIcZ
	RCUhjeUc2Is4j8eN1XEOmmsK/qGN11MPmcvFM0Ahtc9+7T6zIQVzPLPNuFvrEt6jLeTScyj8BRvIs
	L5H5tUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXu-000000097ua-1hlB;
	Fri, 23 Jan 2026 15:58:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXr-000000097to-3N0h
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34c868b197eso2236422a91.2
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183878; x=1769788678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/p4HVsJQTZCKI9+64i+NDhOYzKitv/nH/N7R54exfU=;
        b=ZpBetYoKIG7+cruGizq4mvvjRkbMmfxzV+HnHtSxm6olbs+TIkPwuJRsgnzJ17wK5p
         p0tsQ8rHEnE++HkyVx43fp0KmqNg6vcGyFY3nf2uq+t61+MhxusRX05gzxYw785hCYPl
         oaAjOLppcvlqrGZ/Gj6+viBqVTsUbpW55qgIHmMJpGvW8EvimGFBSd0czMG3QapShcub
         bk0Zx5C6SpqmVXEVfiCzJOmFqNrv5P9oLUtykzY6enLLwzCqMryAJSF5rfdpf4V0mjVz
         3zG2qZ6IN7SxM+SvETkJiQkQDUBjf1txoYmn/LC+yvbFAeez61e7DxUA45YuWQSGWia1
         qmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183878; x=1769788678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/p4HVsJQTZCKI9+64i+NDhOYzKitv/nH/N7R54exfU=;
        b=upV7LM94AQjKUARyECh+4A04Fp02drpos9PAWxjY3YjapGS1Ki7lQoimd+w5W552yl
         aETE995h2/t48HlbCcPuLEssrw/Js27hl0CFS+iIGcPlxz9+Q1GhsZWGXmvuqu51jmkq
         eIb5yamDco8qdUlwSY/13eTJYE9UEoi6pTBMtuz5oBaudZSy7vKjmK+aA9Y5Ffe0XGv6
         194BwDHwbovpwp6V8HJopkHoX9LjX5LVffbdn8MUhnpDV8gMpVYstyD7oiAy12UEHfwz
         zMeaO4R0m2MA1mF/hzlpt1yDF3ZxLLePy7AR1dN9jhKS7lvhk/aob0+/dEn8HAEMnYze
         nQ8g==
X-Gm-Message-State: AOJu0YzL7hfcYvIBedOWE61OiLninNOdWMeHQHwdRUIf826m+5eGwDYh
	NWL92CuEK5eCeBq+E3Ab/T2J5wpZmmRV87Fd8mwKWhhqQtpFoA/CdVu691WJIK07
X-Gm-Gg: AZuq6aKG+xzbtlwhTygWyEWXWT/MPIPIwSS3VL5URqh/IviEMVIRqYyeoKo6GLNEfSE
	dNVACoKIU4/DlfaX4qhQiY/C/bCvkAOEVxCXi8/lmYYznitvLVEPhuuhAmcj2J6C8xvS9BhcMfs
	RC48WVvq26YNhI3E8NFXiYE+u+zM02NIvffbMNU1gktM2WQXaY56UbSBrP6TiwQU3jOtHkFx2//
	MQJ+XY9WHVoXVAwB6wEj+j9SnE0+5rzFE1Bp0uIm0Cl16VXpnk6Tk6sN7ppUMZ2iJAylakZKl1H
	6hMs2CPw5QknV7OBYuXrUhRbZEgd4miL1WuHjiF0w3GbYh7qtvUdD+Wf12gXJHcPjsZtmqy5ndN
	EvC8XbcjMjOZs6ReVCrQolWJxKRSv75pan2y0cAs5sRzFCrM0Ti+ZjlB3sFy7dmh8Qicu7WXBaR
	vZbrvSrQJ7UFXIkVz0iVypIP5Ji0ouPsqZM8rE
X-Received: by 2002:a17:90b:564d:b0:353:c:643b with SMTP id 98e67ed59e1d1-35368c430a2mr2903556a91.27.1769183877951;
        Fri, 23 Jan 2026 07:57:57 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:57:57 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH 0/5] wifi: ath12k: Fix 5 GHz Wi-Fi regression on WCN7850
Date: Fri, 23 Jan 2026 21:27:45 +0530
Message-ID: <20260123155750.6007-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075759_862537_F2574567 
X-CRM114-Status: UNSURE (   7.15  )
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

This series fixes a critical 5 GHz Wi-Fi regression affecting WCN7850 
(Snapdragon X Elite laptops) in kernel 6.17+. On affected systems, 
only 2.4 GHz networks are detected while 5 GHz networks are completely 
invisible.

The root cause is broken frequency range filtering logic introduced 
between kernel 6.16 and 6.17 that filters out all channels when 
frequency range values are reset to zero during regulatory updates.

Patch 4/5 is the primary fix that removes the broken filtering logic.
The other patches address related firmware stats handling issues and
regulatory domain initialization problems discovered during debugging.

Tested extensively on WCN7850 hw2.0 with firmware WLAN.HMT.1.1.c5-00302
on Lenovo Yoga Slim 7x (Snapdragon X Elite). Both 2.4 GHz and 5 GHz
networks now work correctly.

Saikiran (5):
  wifi: ath12k: Fix firmware stats leak on get_txpower error paths
  wifi: ath12k: Initialize regulatory frequency ranges to avoid
    filtering all channels
  wifi: ath12k: Add fallback regulatory domain for WCN7850 without
    SMBIOS
  wifi: ath12k: Remove broken frequency range filtering
  wifi: ath12k: Fix invalid frequency error in freq_to_idx

 drivers/net/wireless/ath/ath12k/core.c | 31 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.c  |  2 ++
 drivers/net/wireless/ath/ath12k/reg.c  | 13 ---------
 drivers/net/wireless/ath/ath12k/wmi.c  |  6 +---
 4 files changed, 33 insertions(+), 19 deletions(-)

-- 
2.51.0

