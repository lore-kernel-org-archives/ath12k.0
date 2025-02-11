Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAD6C021A2
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlL5jzWhI6M1DWypiuTqms2s6pTVuYe03e0nspNkVqM=; b=nGuxXjithLiNKM8KClaK8Hqw8i
	wUhza/CUd+f2SMXBw7uc+xnDN8+dSXhRgVoEAE0GKKwnUf16K1PdgIfljlKY5VjWqGaLdaLUGH7VD
	hx+EjNUsYTCHkfdGN38tjseHD2ll7e+/DTS/aDt0L1+RELwaOaWCBLrg9R/isRiK7ElH2n6Rrg+zU
	pDEKQr7WXuJfg8fLc1FJ84wnV4qAVNLSKMyj70fr2dMwTGcsqN2TMBxSGW8KCFMjesnUiewN26o0C
	CVSTB0VHiAvnIkV8q/VT7BQtKgc4O1nt+wyFgjlNmlJ7Kl5ZN6wlEaMuY3A6cxJVWLXZggpJURkgN
	yLQfgCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSR-00000004LPK-3iNQ
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRA-00000004LFz-1gRI
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBB33Y000723
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlL5jzWhI6M1DWypiuTqms2s6pTVuYe03e0nspNkVqM=; b=kCMgbtBhnARTGY7O
	ZEnOMH7OasNrz2M+zmrj2Ef8UR2p9x6t2ESqUwvvtvdp/1a+iZO7m6qMJSESk9Ov
	H7uNgnZasNE+7CqljdAjkk+PtXzYylndHDzWu9oycwS8NnfFMFVAdoHQNTYU6pyn
	k5xmxbUJOFTfLlUCFyGoSDKACLl57cRl85JmNg3/pxxJCcuc2iKl0kRQ1nUk50ir
	V42GS35z00Y5QQJv8ClpyP72fui1Fi2Gzy6TG/lbp4X89f1oNUvNql+wNduQRQjK
	mhEvDXlyxdQLZAcghSwqUC2hNuG9goA2kKSDrcLwzFP0/9gIS23HrtL8KOtPGS6B
	gOEfXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk45cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f71b174a5so53271205ad.0
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288675; x=1739893475;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlL5jzWhI6M1DWypiuTqms2s6pTVuYe03e0nspNkVqM=;
        b=dQP3mAMd9k4Km1/Xgdow1ElfWQWVOWa9dTtLKfeCDLKyHT2FKs04UGpq8BOmZeSQAU
         KJe85zwuYDs5jJVpeyrREgptWuoD/mKfNUH5zV7sffzvRxl/gWNUdympIwHVJ29k6C3k
         Sfz0h88UzzRFh/mRAEqr/oscOSa2nWyg2p1tfIGe+0PE6Bod2E923D2Jg7JgEdbOzaIg
         8/Xsx1IsOyttffhvmiM+3KXIiI6W9cbngf6wipZICoeggXzdwhnYCmfMhwtJKSKTe+zc
         HkhNgFutl+BoAVepsFb/l7e7te49Yy/WyOZVMcbxIpVo2RPpV/4KvzZ6MzzvwQ8+1p70
         xnRA==
X-Forwarded-Encrypted: i=1; AJvYcCVSGuyOZ5CaD4uxsohx+IJKWo5++9zxKlFojbVslVGTcXD7s01zTZ0OuSFXUWlzL3/8y2SJ8EM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZPGnebIENxr6yfeu5+FQ6sQLt1DgWqFS90F9Z7ppopvMp6WYh
	ZRi6QLFnlcQ4rvUxcuqJctdab/J7CpL+RzQC8vzyRT65ek3fgPM2obngL/MboS/j2P8EtIz169K
	qSphiruWTmJIBLWdzlFm0GXIhnMLNDdK8BiqYovkxV8sx6UtpSH0f+GxnZVBhpsTFEMN2
X-Gm-Gg: ASbGncvO5hGQ3gnaLubcTPggHXoiDYk/BgnrizmagcGZ7hyeWF7JRSCt5dFfUP9cKK2
	it9rh/AcUrlCt4FgXUaYUceZCRttdcJsFP/5OAz7pgygwNvJ/4JjjDjKMIdxeQO64eb84ES8YH+
	HnqjHq3kBpnVJlG2UoXjnSd3pgp1oCL1WI/wVmL30O7BQcq6RKGlmtL5IR+V1v2MMHKefky0V/9
	o4NsNeV3T0ptVF2AyIDCAmDBp1edOazvSuTGW/vTUbDzeKiFCM5ZasdMEGhfI5CsMoXy3FJuPYi
	C3koxqSv2ioQVZ6ytn8p0XU/XWUqadXJWNpQL6PNoQ==
X-Received: by 2002:a17:902:e54d:b0:21f:3823:482b with SMTP id d9443c01a7336-21fb6f54a29mr65682285ad.25.1739288674842;
        Tue, 11 Feb 2025 07:44:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTHP3BuxfPO3ra/69YVt4iP5Bp7MokO6wGbhU+W5xVl2c/0maHagbygDnfGfVhI2DQD1ByWQ==
X-Received: by 2002:a17:902:e54d:b0:21f:3823:482b with SMTP id d9443c01a7336-21fb6f54a29mr65681755ad.25.1739288674397;
        Tue, 11 Feb 2025 07:44:34 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:33 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links()
 callback
Message-Id: <173928867318.1115150.2680608610563068978.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: xLR3PyxqamwF2HMR8br5s6SzuLbam5Lc
X-Proofpoint-ORIG-GUID: xLR3PyxqamwF2HMR8br5s6SzuLbam5Lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074436_447991_1AE99A88 
X-CRM114-Status: UNSURE (   9.99  )
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


On Tue, 04 Feb 2025 22:35:06 +0530, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links().
> 
> This series aims to add support to handle links in change_vif_links()
> callback.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: eliminate redundant debug mask check in ath12k_dbg()
      commit: cc5faf08aa3afc6f60d7df1a0edf041c4384fc95
[2/8] wifi: ath12k: introduce ath12k_generic_dbg()
      commit: 80f816d07ba0cf80a9b6aa90a30af2b2073c6cb7
[3/8] wifi: ath12k: remove redundant vif settings during link interface creation
      commit: ab6270c4dec3b1a506291c3b0050230b32464781
[4/8] wifi: ath12k: remove redundant logic for initializing arvif
      commit: 8acc7ec53ac43aea8f49573b5a173570f308b775
[5/8] wifi: ath12k: use arvif instead of link_conf in ath12k_mac_set_key()
      commit: 00e4dc11695d48322780812b503314682659e98b
[6/8] wifi: ath12k: relocate a few functions in mac.c
      commit: b81c39d67fbfcaccb33a1fc5494a87b29f2724ab
[7/8] wifi: ath12k: allocate new links in change_vif_links()
      commit: 315d80be304ac1d47da38c2b0c85286c9220c23a
[8/8] wifi: ath12k: handle link removal in change_vif_links()
      commit: 81e4be30544ee7e8da80e9aae7acd69d3be6d05a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


