Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56375C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ESKrEUkhLu7CErPMgIXM3ZLVGmFgdOckH4D1niDAwSw=; b=y3ylj6Z2/cfOMf
	QuNnXASCsfw5HgmZLoWmLMGRe4kdh/dDi7XpvzB9UKUjEFkUckWxrKNICN3XcDjKtwCkKayFZhJYV
	j5ihXnKy8tnI17zCagTv1f+ZNjKOOk3jj6cMH69ZbiQWBj7JiNe+r84aD+/lxZoLR19tUiUc0V+/g
	VFnhdBX/HK6zM+AsUJCrBbD9q9GJufbTWgAZlgTlQpcY8u+9Mo4L/NvT/MU4yOdSshpuvO2wmkcdZ
	I055Y0/LDcbZFVCR7yCr3N/d6UzHNb98tlQR4PoXbNVVO+hVtw36aN5da9KkQdjpeoHY+2UHBNf5a
	uMfnKcPuVskcQpWQHALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeo7-00ATvl-Pu
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeo4-00ATuo-6x
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:17 +0000
Received: by mail-ed1-x529.google.com with SMTP id w3so3142517edc.2
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbsVILwGxVzGSFQAMmcvTjtP3iS0H0Jk8jlmA3fje44=;
        b=C+L6/jTqnSeYo/b6IiQCVonl4htdmnONEbBMxu61VCOz8uqTjoupU69shAxIRXuXS3
         48MfOCaFgOkReQUUJHND45qkDEyyUJRYY3i14h5SKoTw7DCyl21omBRAcz/NLvMjTSZQ
         Q444pLCb9ABZwNIRvbkZqzy14Kqpb0ArIvP0oGBxw13Cow5hVcr2yuS2V74yqdV4subm
         c5IGLQaC6ShCnhVWBQKtwogG15r4+QnHQV03JMbDNKEtzEaCznIx1zOak22M7GuFaY0+
         1Mkb56QEikJMI8hGrECIBEw92w0wV5Tf636WKZnSk4mC4EpHHz0O1mDVW483h4/Uooq8
         e9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbsVILwGxVzGSFQAMmcvTjtP3iS0H0Jk8jlmA3fje44=;
        b=CQHGz/corN/inE1FqV6bbQHz+HoNCqZRz3pujiiVy6uiRVj5n3I+GIhO2J4+7Xq/g5
         JweybnVvpnN6ttQHgnC0J1BlfiR1tK9wGo0XH46We8vAPobNj9Cbzwg0T+/TJYm7XJ25
         GmKBPL31EWA1mUO+bSL9OFsvAh3dGG6wFewVowBBVzxiNG5EA4fY4lwjpqiJbbmCLAt2
         ycBjYEvO4Uk4FUZ8gywvbjIR2SjN1zQlFI08ntTMaV69z7YfCsugUF/5mfrkrMlF2Z2l
         5htlc9WPZvlWCZUefUiHSg69TebOxhUBK2nNsGfhXEyvXLjhezAi2zIwfqGw7CDkUdxw
         DuXA==
X-Gm-Message-State: AO0yUKWpCjyLGBAn9HN3hgw90RRb4bapDC20tnNjaPLFjuTX7ypouPSa
	/wSHwXXjUq1CFMEPgdpJ3oCB3gedD+SBOg==
X-Google-Smtp-Source: AK7set/NOpoSw8hvSJwZWpiZvhxLi2XsMnxIK+Gsy/wyCdTsKPgfM748J/cz6ZUI6KGt3j6vQkDXOw==
X-Received: by 2002:a17:906:2806:b0:8af:3c9f:6e5d with SMTP id r6-20020a170906280600b008af3c9f6e5dmr6150008ejc.12.1676556013788;
        Thu, 16 Feb 2023 06:00:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906688b00b008b13a8ec56asm845772ejr.110.2023.02.16.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:13 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: missing clean up
Message-ID: <Y+426q6cfkEdb5Bv@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060016_279377_17532ADB 
X-CRM114-Status: UNSURE (   5.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

	drivers/net/wireless/ath/ath12k/pci.c:1198 ath12k_pci_probe()
	warn: missing unwind goto?

drivers/net/wireless/ath/ath12k/pci.c
    1151 static int ath12k_pci_probe(struct pci_dev *pdev,
    1152                             const struct pci_device_id *pci_dev)
    1153 {
    1154         struct ath12k_base *ab;
    1155         struct ath12k_pci *ab_pci;
    1156         u32 soc_hw_version_major, soc_hw_version_minor;
    1157         int ret;
    1158 
    1159         ab = ath12k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH12K_BUS_PCI);
    1160         if (!ab) {
    1161                 dev_err(&pdev->dev, "failed to allocate ath12k base\n");
    1162                 return -ENOMEM;
    1163         }
    1164 
    1165         ab->dev = &pdev->dev;
    1166         pci_set_drvdata(pdev, ab);
    1167         ab_pci = ath12k_pci_priv(ab);
    1168         ab_pci->dev_id = pci_dev->device;
    1169         ab_pci->ab = ab;
    1170         ab_pci->pdev = pdev;
    1171         ab->hif.ops = &ath12k_pci_hif_ops;
    1172         pci_set_drvdata(pdev, ab);
    1173         spin_lock_init(&ab_pci->window_lock);
    1174 
    1175         ret = ath12k_pci_claim(ab_pci, pdev);
    1176         if (ret) {
    1177                 ath12k_err(ab, "failed to claim device: %d\n", ret);
    1178                 goto err_free_core;
    1179         }
    1180 
    1181         switch (pci_dev->device) {
    1182         case QCN9274_DEVICE_ID:
    1183                 ab_pci->msi_config = &ath12k_msi_config[0];
    1184                 ab->static_window_map = true;
    1185                 ath12k_pci_read_hw_version(ab, &soc_hw_version_major,
    1186                                            &soc_hw_version_minor);
    1187                 switch (soc_hw_version_major) {
    1188                 case ATH12K_PCI_SOC_HW_VERSION_2:
    1189                         ab->hw_rev = ATH12K_HW_QCN9274_HW20;
    1190                         break;
    1191                 case ATH12K_PCI_SOC_HW_VERSION_1:
    1192                         ab->hw_rev = ATH12K_HW_QCN9274_HW10;
    1193                         break;
    1194                 default:
    1195                         dev_err(&pdev->dev,
    1196                                 "Unknown hardware version found for QCN9274: 0x%x\n",
    1197                                 soc_hw_version_major);
--> 1198                         return -EOPNOTSUPP;

ret = -EOPNOTSUPP;
goto err_pci_free_region

    1199                 }
    1200                 break;
    1201         case WCN7850_DEVICE_ID:
    1202                 ab_pci->msi_config = &ath12k_msi_config[0];
    1203                 ab->static_window_map = false;
    1204                 ab->hw_rev = ATH12K_HW_WCN7850_HW20;
    1205                 break;
    1206 
    1207         default:
    1208                 dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
    1209                         pci_dev->device);
    1210                 ret = -EOPNOTSUPP;
    1211                 goto err_pci_free_region;
    1212         }
    1213 
    1214         ret = ath12k_pci_msi_alloc(ab_pci);
    1215         if (ret) {
    1216                 ath12k_err(ab, "failed to alloc msi: %d\n", ret);
    1217                 goto err_pci_free_region;
    1218         }
    1219 
    1220         ret = ath12k_core_pre_init(ab);
    1221         if (ret)
    1222                 goto err_pci_msi_free;
    1223 
    1224         ret = ath12k_mhi_register(ab_pci);
    1225         if (ret) {
    1226                 ath12k_err(ab, "failed to register mhi: %d\n", ret);
    1227                 goto err_pci_msi_free;
    1228         }
    1229 
    1230         ret = ath12k_hal_srng_init(ab);
    1231         if (ret)
    1232                 goto err_mhi_unregister;
    1233 
    1234         ret = ath12k_ce_alloc_pipes(ab);
    1235         if (ret) {
    1236                 ath12k_err(ab, "failed to allocate ce pipes: %d\n", ret);
    1237                 goto err_hal_srng_deinit;
    1238         }
    1239 
    1240         ath12k_pci_init_qmi_ce_config(ab);
    1241 
    1242         ret = ath12k_pci_config_irq(ab);
    1243         if (ret) {
    1244                 ath12k_err(ab, "failed to config irq: %d\n", ret);
    1245                 goto err_ce_free;
    1246         }
    1247 
    1248         ret = ath12k_core_init(ab);
    1249         if (ret) {
    1250                 ath12k_err(ab, "failed to init core: %d\n", ret);
    1251                 goto err_free_irq;
    1252         }
    1253         return 0;
    1254 
    1255 err_free_irq:
    1256         ath12k_pci_free_irq(ab);
    1257 
    1258 err_ce_free:
    1259         ath12k_ce_free_pipes(ab);
    1260 
    1261 err_hal_srng_deinit:
    1262         ath12k_hal_srng_deinit(ab);
    1263 
    1264 err_mhi_unregister:
    1265         ath12k_mhi_unregister(ab_pci);
    1266 
    1267 err_pci_msi_free:
    1268         ath12k_pci_msi_free(ab_pci);
    1269 
    1270 err_pci_free_region:
    1271         ath12k_pci_free_region(ab_pci);
    1272 
    1273 err_free_core:
    1274         ath12k_core_free(ab);
    1275 
    1276         return ret;
    1277 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
