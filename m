Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBE3C27C55
	for <ath12k@archiver.kernel.org>; Sun,  9 Jun 2024 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTBnfNAMzPilmvvmlgPYYwB68k9NpnOll5uJ8HMDJMo=; b=LR+1Zud52e98YdgfOpHtTTHKSr
	ilp+jYScyWzfxUc2LogIUDHbFrUUflZDejWI1IWn14+LIJAl0ZUMWpZogrqLFKP/YDLMiBUo44s++
	hClOj5tY+w5TrW5W+O92IBLRWcKPVYnZ4CmLBHs7E+L0OX8071oGE/Hw46busNTacd9++0PVoScQr
	xSS7nxkG8EoaO901wczBMggZGD5Xtd79OhhSOmzsWXQxL8sloEQ/EV1IaRky9Q5wR58jpOwS5q+/I
	TWLk2SlvSiEDlG4isWfJdIOG6zxw9ns+rr/L2aDriePw+EiJbLDae6ktkAwwbxMfWX1ngN/FalDCN
	gJH95WNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG6Z8-00000001K4P-2xTd
	for ath12k@archiver.kernel.org;
	Sun, 09 Jun 2024 00:37:46 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG6Yx-00000001K3W-1yGJ
	for ath12k@lists.infradead.org;
	Sun, 09 Jun 2024 00:37:44 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so38634401fa.0
        for <ath12k@lists.infradead.org>; Sat, 08 Jun 2024 17:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717893453; x=1718498253; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yTBnfNAMzPilmvvmlgPYYwB68k9NpnOll5uJ8HMDJMo=;
        b=mvxR86G+a/81t9OmVyN/P+pWJNeX0LUkDN9YSktaGMUThSc2eKnsIDQQLTVcqj/PrQ
         z0HSPaPvsYC+S03BpZ0flsq3YetB4RICb6JkiQ0y2F9FP7G+Cs3FVx5UkmWU6CbjH6Om
         LZm7+7XD4M+X1UcgJAcD7hG0Bg4cMyXFRiaa1rQP1um23mll3uXZZMp/zhm5AMU0F+ly
         C8gPPuPuxrTPYbU50CmySwzPQT2CNgL5JJSV8fwdBPOVk7FsPRDz3VXcd1H09+GyrknU
         1vWqnbZBhpVCeRxRhIzXyiDi7mRu0zoTYKxj7LEJqPaWTlF33vA3kG/axWi7PNvcAFc0
         md1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717893453; x=1718498253;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTBnfNAMzPilmvvmlgPYYwB68k9NpnOll5uJ8HMDJMo=;
        b=aA5ZN2O0qnpI2sl67BWJ/TMQOmCrTdjDpGCDhfaSQbRbx3ySXAiwft7KKPcZwxrnDn
         1I5UUWQMAgl3G57EC8FqxAkwLKvDcYElGTAdqkN2HEqlOHGhUMKQcA5FXr6sm8LnjyOY
         NTfUh/fCNURzBL9Eul8FhhY+20Fx3HBGI81Fzuwbv0CEBlEB9OlrafrRvx3ftasfS/r4
         KomnSB2A8tcfiNn7kU1n7/EOdBOXFmNgZol23gApPkhPnObQOkQq+jkN07cA7j4Pkaeu
         UD/Iyd4459wcWvYLGEPfdmpkvFLy4kX9U+BWEn3/rBlnk0EJ759j++/ojip7uP8ATLnl
         jRxQ==
X-Gm-Message-State: AOJu0Yyg+cWnFJT1wnXwtO51PznyAYerj1RMKaAlCncvQYZqvHeNiw+H
	NvXibf3AzfPzHnE4y4EueQVyNT/ihSX4ZaU6S/fBz+4thzHpgKIjtq6jqFZxi+szHvUlLjTPvU3
	dRsOVwSDSlOxncVk2TJvkcQD16OPEYZFJyqU=
X-Google-Smtp-Source: AGHT+IGYFb0DRjDptdaSyMSfPhPO9fDpGknJyGqxl1YxEclATIEbMlkiUVvoXzv3wzZ36SJqMbCqzPQzr/6BcrMzAmE=
X-Received: by 2002:a2e:740a:0:b0:2ea:ea79:4fa6 with SMTP id
 38308e7fff4ca-2eaea7951ecmr30377271fa.36.1717893452545; Sat, 08 Jun 2024
 17:37:32 -0700 (PDT)
MIME-Version: 1.0
From: Zachary Smith <dr.z.smith@gmail.com>
Date: Sat, 8 Jun 2024 17:37:21 -0700
Message-ID: <CAM=znoFPcXrn5GhDmDmo50Syic3-hXpWvD+vkv8KX5o_ZTo8kQ@mail.gmail.com>
Subject: fail to connect to AP mode in 6.10 on WCN785x (NCM865)
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_173743_131643_82DD763F 
X-CRM114-Status: UNSURE (   7.43  )
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

$ uname -a
Linux athtest 6.10.0-rc1-wt-ath+ #1 SMP PREEMPT_DYNAMIC Fri Jun  7
14:03:56 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux

[84599.322219] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[84599.896011] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
board_id 0xff soc_id 0x40170200
[84599.896023] ath12k_pci 0000:01:00.0: fw_version 0x100301e1
fw_build_timestamp 2023-12-06 04:05 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3


$ git log --oneline | head -n 5
6f446d0a1af0 Merge branch 'pending' into master-pending
cf899366dcc9 wifi: ath11k: use 'time_left' variable with wait_event_timeout()
9e0e90f4ca68 wifi: ath11k: Add firmware coredump collection support
c0889b096794 wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()
b14f951b2de7 wifi: ath12k: fix ACPI warning when resume

note this is 2.4ghz
$ cat hostapd.conf
beacon_int=100
ssid=testap5
interface=wlp1s0
driver=nl80211
channel=6
ctrl_interface=/tmp/hostapd_ctrl
ctrl_interface_group=0
ignore_broadcast_ssid=0
ap_isolate=0
hw_mode=g
ieee80211w=0
logger_stdout_level=0


$ sudo /usr/sbin/hostapd hostapd.conf
wlp1s0: interface state UNINITIALIZED->ENABLED
wlp1s0: AP-ENABLED

<is waiting for connection, then after client connects:>

wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: authentication OK (open system)
wlp1s0: STA 0e:db:91:6f:7f:d7 MLME:
MLME-AUTHENTICATE.indication(0e:db:91:6f:7f:d7, OPEN_SYSTEM)
wlp1s0: STA 0e:db:91:6f:7f:d7 MLME: MLME-DELETEKEYS.request(0e:db:91:6f:7f:d7)
wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: authenticated
wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: association OK (aid 1)
wlp1s0: STA 0e:db:91:6f:7f:d7 IEEE 802.11: Could not set STA to kernel driver

Bisecting I found the problem in this commit:
3d887557477 wifi: ath12k: refactor SMPS configuration

This fixes it:
$ git diff --staged
diff --git a/drivers/net/wireless/ath/ath12k/mac.c
b/drivers/net/wireless/ath/ath12k/mac.c
index eb97de7bee84..638cf74d5359 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2757,6 +2757,8 @@ static int ath12k_setup_peer_smps(struct ath12k
*ar, struct ath12k_vif *arvif,
        int smps, ret = 0;

        ret = ath12k_get_smps_from_capa(ht_cap, he_6ghz_capa, &smps);
+       if (ret == -EOPNOTSUPP)
+               return 0;
        if (ret < 0)
                return ret;

Thanks!

