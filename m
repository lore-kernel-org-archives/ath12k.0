Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD65C282DE
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uj7GGUjO2Cb2hoHrzMda/fIIQwFl12ddzGuw5jrHW8M=; b=brkGFEE2Y8R39No+2SFgzlYQ/e
	dBCX4OKQttkZk/OTM+k5l8o/OZLsFvCRYQjuPUR5/vLEf9zFa7IY1ZLpRE9J7oQcf9sXEso+LNTKc
	h8iC+bT7pcj6ChOWcUwl2LthwTuyi5j4QJsKBlzwSHhoyj276mTLm4ocpwREAnea4LnxaxbArXYXx
	Kxq8i/jhjUslU1VDu4H2HefUgoSLqioog+p7QY2KZn2m4V9Tqrgt8KWT52o+HRBJnYf7wEHz0cXJj
	SnYOJNUfNsj7kl+0NUHZg5ELtDUpWSNu9WP8iMQIQLNNyhTbRyTHbBylwLmC0OKwFAvd9NVY/LLdr
	Wv/GgmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseT4-0000000AeaD-42Q7
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 09:03:06 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRV-0000000AdrZ-0yaC
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 09:01:30 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-307bc125e2eso8675311fa.3
        for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1741856487; x=1742461287; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uj7GGUjO2Cb2hoHrzMda/fIIQwFl12ddzGuw5jrHW8M=;
        b=AYRmU81n/yyGSlyHv1FAAeePKuYLmhBdjAerYZaPFmoJPIxK41UJNnUuId3SkCpzNp
         57pygyUffVlK959KOv/5lJ5wWDc4+CFrhIYMldB9yTPoQj0NN9mfOhrsjh8A9A7ii/9u
         PVd7ZgHYJc+U1rNyfvhR39PjU03wZrK+FV5YJQ2lodZ8/N3uv6oEmmCG5xaf3IYM2/Ja
         iqJIqFchMkJJsdP0uqGFxCMYVcISRMnbJDma3uwAlJN2K/vIZMUq0EfKG802K1ZknE9L
         EUAeNpY0W7EpVzUrfLRQDA0ArfTcEI+1JzxjxoWU34Rdybc1O38gLWDxD48BVVAj84Rd
         MboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856487; x=1742461287;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj7GGUjO2Cb2hoHrzMda/fIIQwFl12ddzGuw5jrHW8M=;
        b=AyM67sqRosG5FGcIcwiCN53xyGbNPm4112dU4RohLrAIidmRrmO6zGUmnELbUN4yHm
         QoKQtNpu1FS1EPwW83oKUt0WNYZWrltfTbStEa/m2/BhCImnnCkPPM3Pd7nrPRvA8wnn
         iikKFkkwsgPxUuDa+ZsGVei53NwFYBkFUF8UPMFk98EIhzQFmx/3iJPHlic7JrC0P4U3
         SfY1B1hoWVejM1B1//waqYON5aTXACi3mqpyO7BFDTkpm9vc5pbfuUkxIN1eRlh31gD3
         47PnMUcuIEZnPpAzAVnno4jKJ0IyXJYi0/sWpiXA+zJQrr4OvMg1oJ7ktwOBAXIjNGyK
         45jw==
X-Gm-Message-State: AOJu0Yw0PshkKlY5Avv9h6wultpVpyIhCWJQ5glLGve6v+3bIUwY4WY+
	LnUI4/Zs0pXJFcQMH4Um840aEOfxzVAAntDIiqvlmPiXft1qzmAJYsrWqjVFzas=
X-Gm-Gg: ASbGnctHR/S+/XP+k0oBm/lEjsGeG27TmaWl6Y/y2nFoLZzhmoNj9gLRFfTP7KXefcU
	RheYTGpSg9I1SdNEDHkln74CHbaOF5355dyyDp2RA11uSaq6TaeDbGps44+PrtkZmuD2dZpqYaF
	WtuNe7c2Q62iSxhPiNbAaA29lwSaALGKLAM/yb6zmsJIY/du7wdyliyyuL1YU3YaLJdhe9Sc4RB
	fVRUk59WFAVvgTqoeqgGExHPrD5/FFd/QfO87MI9/mqjFQbvYtoFhzW4TTXD/p5iZpMEqakuG/K
	k1Aw4VOlN/tItmzEVl+edkOqC2ZP3iuYHrGfxQHfVrDcbZnYJlv2O58yR+vELoB7
X-Google-Smtp-Source: AGHT+IE2NulrNIo+M5vahinpDWyI9BdSgzdREdo+l0AN7HhcxOd01ZBOpT3HYFht1EVpKj5T7Edrrw==
X-Received: by 2002:a05:6512:ba6:b0:549:8f21:bc0e with SMTP id 2adb3069b0e04-54990eb1987mr9398593e87.32.1741856486697;
        Thu, 13 Mar 2025 02:01:26 -0700 (PDT)
Received: from [127.0.1.1] ([78.62.132.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88591csm142134e87.187.2025.03.13.02.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 02:01:25 -0700 (PDT)
From: Mantas Pucka <mantas@8devices.com>
Date: Thu, 13 Mar 2025 11:00:56 +0200
Subject: [PATCH] wifi: ath12k: fix 5GHz operation on wideband QCN9274
 radios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-ath12-wideband-caps-v1-1-23ac4247cd8a@8devices.com>
X-B4-Tracking: v=1; b=H4sIAMee0mcC/x3MQQqAIBBA0avErBvIsUi6SrSwHGs2FhoVhHdPW
 r7F/y8kjsIJhuqFyJck2UOBqitYNhtWRnHFQA11jVYa7bkpwlsczzY4XOyRkNqZjOqNcZ6hlEd
 kL89/HaecP+zWjGtlAAAA
X-Change-ID: 20250313-ath12-wideband-caps-24b281788dfe
To: ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_020129_303634_A9556F59 
X-CRM114-Status: UNSURE (   8.45  )
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

Currently ath12k_mac_setup_ht_vht_cap() incorrectly assumes that QCN9274
radios with 6GHz band can't support 5GHz as well. This prevents the
addition of HT and VHT capabilities for the 5GHz band. Since QCN9274 is
capable of operating in multiple bands, remove the 6GHz support check and
exception for single_pdev_only (i.e. WCN7850).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfa05f0ee6c9f7356634ab55a6d9c0b4064645a9..aea3ad01b0671fd236ee70864aee4c1e65f564db 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6484,9 +6484,7 @@ static void ath12k_mac_setup_ht_vht_cap(struct ath12k *ar,
 						    rate_cap_rx_chainmask);
 	}
 
-	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
-	    (ar->ab->hw_params->single_pdev_only ||
-	     !ar->supports_6ghz)) {
+	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
 		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
 		ht_cap = cap->band[NL80211_BAND_5GHZ].ht_cap_info;
 		if (ht_cap_info)

---
base-commit: 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d
change-id: 20250313-ath12-wideband-caps-24b281788dfe

Best regards,
-- 
Mantas Pucka <mantas@8devices.com>


