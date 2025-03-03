Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E072C282CD
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CS8fOkB/2o1tqv0C/vSIKz5akXsPp61Y6yRvRf4d3qg=; b=sOE//xq/N2fxf31Hh4BG6ENI8g
	DMxYpAgeoQ/KjFga3g3fiPm2jZHmNYR7vrG9uMz5vx0uKtVDniTVlCILSDNinA3jrSssJo0SkZH6z
	BIFXtAYIa+g4Irs4oBSEybvkPvKuya3esPEExxWdygY59L4N//kg+t5KWW4WJeZv0ZFs7MD3V29Qp
	zSPC5TPMG3UR5pIFXHMAzCJw9p4cQ5QsNWwRDQhKD/H1gXXoAl6Sw2TTLsx19iwUH2ncaM74bjGb3
	WvDzzx/WMEVp94u5GjLqddGUXdcq191dH1PQqgzlrPAQJPE/21TuAuWZn2IGY9dwsQVRLm2eEsli4
	geMp4hMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7HP-00000001Cfr-0gx7
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 15:00:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7HN-00000001Cec-2nn5
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 15:00:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390ec7c2cd8so2101788f8f.1
        for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014023; x=1741618823; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CS8fOkB/2o1tqv0C/vSIKz5akXsPp61Y6yRvRf4d3qg=;
        b=jmDtbSrVK0N1e80fBnV+9kDl8YY4ZS2Uye7KSvNPy8ZXA5NtKoZ6R+jeZgXiid/68h
         qE1Vk7c0WAVBLuBU/G94tY+/s49p7QNhZD4TehluNHp9VX+po2kh+gXfYqaO1rtaHRxY
         t54Fs6VWdNc8GdpnR6C3PniJ8Oga6KL3jZ7u6xhL4FDEYzrXCFJodt+w+WhlxXX8KBdK
         VhhMOdZz9zZ5X2VoWUwfcyqYzSorRkjki3c+9tSitcIKHZO2fnZrQq5rkKOhXtZx3EDo
         sAeT07ZOE/nf0SHiFLwhoa/Dkws3DFUKQMWTD14B7FvWYMTbDddaoMqX/V3RGc23gsuD
         aZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014023; x=1741618823;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CS8fOkB/2o1tqv0C/vSIKz5akXsPp61Y6yRvRf4d3qg=;
        b=MfUF5lp2hTjbrzT/rNpKwimTXLJXk1Ow88f/3AYV32gG/OirUsyQFwI/ZjMackDC4p
         iofrGfnNQI2M7ffS1rypzfDTTryaMCD9V/2Z+zABA/OT5hCVI+NfOEv8ObKlkfZANzDS
         o0PxKmf4AGth53RnOGtmeeCE8mSPhZJ2aAfKc71VCVGyCLrBu94NbCtPfxJHcpoB7n+q
         uEnPaI8Lmg2KByQ7pTrjqZIWl7AB07WewU4tWOCNAfMmupjZOvPK15UI/UPOV9QSUkcT
         6qzoNfdZFV+KlWsOFp5xmL4XUF+XxB/sYkR7A/gAITMSaVCa35LiLh8n14KLGtU/yCph
         eUmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPG8dhX+TV7np2gXp7cDQdGCvsR5Q2qZ/5s8N0Xhluu53ZVoqu6Y7k+Oe0RrqnQBMr0R+kELc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZu9xJdSOFSipKndzCx8RPYQImBlh/A/qfVbebEO8YsLpQZl1
	5enNDPtwGvtXam1IPkfwSGFQ3F43OWKBLr0RKVwqqpgSUDtYyUlDInqxgpLOvHQ=
X-Gm-Gg: ASbGnctq7CWTcQN/NRaT6XDkb3Qo8Igje4FAp3OIh4ANBVrpJCeOvpDJrmbXdy+PgfS
	0v4UinfMAdVlgNey00SNGeacX8bK6o4XGQpW9ZR5pHV9LRufmxNqfBjIF0MPI99pCDy8NMT/niV
	rxu+NESelKOYZfTggsK84GXXMfRaLJ1cPs6wPu/eECKNu7DIAw4cGrXWal912YZ1prg98nHoEnT
	JAmBkE6sBSLrzrL2O4/yC9IyVpk5NmKsv31b7gX427+ncpy7HLbOuditjTlYovi834hiu6lRrST
	+zl6XWo9QqRZ7c4ZB/K2NSTjHV9l/Sr4zJxJDqUnKbaguxKz02tlsrlDZmZ91vqnpg==
X-Google-Smtp-Source: AGHT+IGzxcAosUY7UZOkZGBKGsfyOleMjoBQWswmFK4WzjmdOJ8Zb7pyuQRUwLOTwEQbHnLoZZ+osw==
X-Received: by 2002:a05:6000:1a8f:b0:390:ef12:2ee4 with SMTP id ffacd0b85a97d-390ef122f8emr11173836f8f.25.1741014023167;
        Mon, 03 Mar 2025 07:00:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e03asm14985727f8f.95.2025.03.03.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:00:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Mar 2025 16:00:20 +0100
Subject: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAPExWcC/x2MWwqAIBAArxL73YKPDOwq0YfYlkugoRJBdPekz
 2GYeaBQZiowdQ9kurhwig1k34EPLu6EvDYGJZQRWmis6WSPrgapDtz4Rp9dCThYssIYP0onocV
 npib/8QyRKizv+wEmJKefbQAAAA==
X-Change-ID: 20250303-topic-ath12k-fix-crash-49e9055c61a1
To: Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Aditya Kumar Singh <quic_adisi@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YYeGUb3k93KBXD4drA2C9f+vdF4GK7YW6npk41CFHg4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnxcQGiac9YMG/uxNSPYupMemIH+BO2QczD7l4HE93
 pmHw18GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8XEBgAKCRB33NvayMhJ0Z8gD/
 oCcwjPhgqu+IULIv7xd9PpGqkN/jqJgGafyQmUriQbfj7JnoGNj2DO86DHIKhjb/1vi0+6LC0imcBd
 /EtuQk9MZWgAfqYQYEOCbPVk9UtJnpG5C6osAjU6j73F90p5bF0MZkvU3asA8H6Gps5tNXqpwumVGG
 OV4cXFWX/20HZ4w/T+WZLWh5dJsJ7YFvrigU0x10VtEoz5eIGkS7rcznvKdOARlksoxr/WMQNI9CLc
 gDNltzB1STfhE5y0EnBbfhEs58cHcK1QOrx2IUits+JgXmmRiDmgtplYoMzxz78lDyrMZOpl2aFpfZ
 0TxpPa270xeoyFBppIdyJcoxw9H/T3SuvoPrZbIO2o1XUBmVhUjzapQTiNzHfgkkuc3TKDr3f9vkNq
 wzQIEhMh9+Avtsx7dH/9Ml5zPFRHYJmFe8dZo4XlgNyWvZlO+QbqRyT3yIj+Z9tGONDZX6HpuWNivJ
 +ndvDl/MFsLEcxsyqs4m3eVpyIt3yoNn2mDUNm7qRn2JGuJmqlymvihHGZB4MJ330YYmY/3cgXy/Te
 Z6U4C27bdtZRgyAZvtoKZnvs0rb4fDXK39kq8b2M4YWry/N4+aHTo8UoO/o5+e6rDQVzJfqAeA4iW3
 bDivOa6LJ3bzuntyU+fEf+bDWUWLU+1v+K+lxjQ+mTzfq6uavdLN5BB9r6tQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_070025_723163_C29A2061 
X-CRM114-Status: UNSURE (   9.77  )
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

In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
the line:
	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
was incorrectly updated to:
	ab->single_chip_mlo_supp = false;
leading to always disabling INTRA_DEVICE_MLO even if the device supports it.

The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
crashes on driver initialization with:
 ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
 ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
 ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
 ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
 ath12k_pci 0000:01:00.0: failed to start core: -110
 failed to send QMI message
 ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
 ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off

With ab->single_chip_mlo_supp set to True, firmware loads nominally.

Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Bisect log for reference:
The bisect leaded to:
git bisect start 'v6.14-rc4' 'v6.12'
git bisect good 5757b31666277e2b177b406e48878dc48d587a46
git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
git bisect good 8c2143702d0719a0357600bca0236900781ffc78
git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->dev = dev;
 	ab->hif.bus = bus;
 	ab->qmi.num_radios = U8_MAX;
-	ab->single_chip_mlo_supp = false;
+	ab->single_chip_mlo_supp = true;
 
 	/* Device index used to identify the devices in a group.
 	 *

---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


