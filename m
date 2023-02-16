Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D0C61DA4
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zfO/ND2bUrxR8dEEVI5clfalFnfctinGR7aQaNxSB/E=; b=RVRN0/lnLrKqgD
	uneVRMyky6uMIwXCANwoJpf9eG2YhpFP764c3tdCexe7n9kIVFUd0tnsps6du54dzKRdRc039ifRg
	m5d8XJaa78rNJq2R5VwKxgkle2585Hu7rrFYLb+lNEaLG+5CdpMGrXCZcsnOqZtgdjI7xdP0TqVsr
	y6OH5krsG94IA3yu+8jA2hVloUahnO47jJrHEkpPRYcwSu0a8YtJ60VLkxqmkre7cKNH+N8Qvp4gl
	WGdj6S95O7dzeF+JtWku0ljzel2t5AVHArpTBeoahOS9+xlYCDA1xiv++1Q0+S/2I1Db+sD1JRotW
	dykbXmSEGtpIa19PwiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScqL-00A2oJ-AE
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 11:54:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScqJ-00A2n8-G4
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 11:54:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id he33so4455983ejc.11
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 03:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PczXwy0avDvWz6NUONVUr5KW1y2cZ+Bp9dXgDlZ3hA4=;
        b=HTV7tatYtkoQw57JySF07AQ0OoAVJmeBPWnMaj5nMZ/UpfQxqEwrcQBchL3NNR4XnL
         cFuKbjQUoBfE3vQ3ywSDtuVZJ+T3XleZopflnfGy44kt7qFoL+k5/JW/uKHL5AImetHa
         ydP3QR/jP+RlOcBtEorRgcBWKcUJj48rO5h5MF3sgQZ8YwWYJJ3qxVIfZ6hXL67CtaHR
         C+DjW6tBPG5zM7TyDGF6axpJaFY6IlVTl4qyYwbQsBuN2gaI9z7YSuDorFt+Rf+kFweo
         yDlIMlL1HvaObw98tsWidIWqktSbM+uZVKTu+hxYzPeXV9rjkez8pz1pPPhfCNP1hGlv
         JVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PczXwy0avDvWz6NUONVUr5KW1y2cZ+Bp9dXgDlZ3hA4=;
        b=Ml3zm552zSJS7AEUngINwixDOHYPVaxCBS6mVhsHT/FtPAOZDff5HT8QAyFhsX8Kkn
         mibSdirOre1L0B40dPu8IC/PZiqB4SUpgAc/vBIugnoNbyvKF5yfqgD21ybbIw8gkaSs
         me1o++JyJ7orGreYIgqe9ETd+LalgGAECnrEbYoeBaUDOdq5Ipgusa7y5lQovjjmoYIp
         P5CgmPg5nnH8fD8ousIDZnODFqByOTI+/gccg6aNdZYO+lElel9fHE1sT3GIZyKO3jDB
         MVrRsPIz0mXBcW9uDIxwo/Xt4BHvVkGwNTYpMPLCCS0aOgyjliQIwRpm+I29pRebQpfF
         mJzQ==
X-Gm-Message-State: AO0yUKWkBrYWUWGRgWCstcYASgSidEtHmbGFSrd6z3KXH/X7na/Kk6Gu
	Ib5diNPohKKnxj64QNcpK04=
X-Google-Smtp-Source: AK7set8fan8/45cZkf90VaIrdvRpA0JobOj6M3ph1eDjWg1U5ATQ7SxVW5gE2b8+4zCJmPWPhf4Y+w==
X-Received: by 2002:a17:907:2054:b0:878:46ed:6a29 with SMTP id pg20-20020a170907205400b0087846ed6a29mr6370516ejb.3.1676548465644;
        Thu, 16 Feb 2023 03:54:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gw11-20020a170906f14b00b008b0456889ffsm707251ejb.151.2023.02.16.03.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:54:25 -0800 (PST)
Date: Thu, 16 Feb 2023 14:54:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <Y+4ZbFTNtTqX7j4q@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_035427_578423_6ECC6140 
X-CRM114-Status: UNSURE (   5.48  )
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

	drivers/net/wireless/ath/ath12k/mac.c:4737 ath12k_mac_get_vdev_stats_id()
	warn: always true condition '(vdev_stats_id <= 255) => (0-255 <= 255)'

drivers/net/wireless/ath/ath12k/mac.c
    4728 static u8
    4729 ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
    4730 {
    4731         struct ath12k_base *ab = arvif->ar->ab;
    4732         u8 vdev_stats_id = 0;
    4733 
    4734         do {
    4735                 if (ab->free_vdev_stats_id_map & (1LL << vdev_stats_id))

Shifting by more than 63 is undefined.

    4736                         vdev_stats_id++;
--> 4737                         if (vdev_stats_id <= ATH12K_INVAL_VDEV_STATS_ID) {

This if statement seems reversed.  It likely should be:

	if (vdev_stats_id > ATH12K_INVAL_VDEV_STATS_ID) {


But here as well ATH12K_INVAL_VDEV_STATS_ID is 255 and that's obviously
higher than 63.

    4738                                 vdev_stats_id = ATH12K_INVAL_VDEV_STATS_ID;
    4739                                 break;
    4740                         }
    4741                 } else {
    4742                         ab->free_vdev_stats_id_map |= (1LL << vdev_stats_id);
    4743                         break;
    4744                 }
    4745         } while (vdev_stats_id);
    4746 
    4747         arvif->vdev_stats_id = vdev_stats_id;
    4748         return vdev_stats_id;
    4749 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
