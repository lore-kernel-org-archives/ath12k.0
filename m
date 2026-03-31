Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5334109B477
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YECTTdP1I+PzZ/SFGYlP2fyai+r7MYYacG+b94gym80=; b=1gQP7kedBWw3QYLOgJh9VvVqKC
	DoPoiXzhaPRbxFV6JCwxHAYhd76IsAA4X8jnrJEJp9zU2OjF8cKdq3TIhOIroBr2zbdZqIPBcte1n
	oOKvYeHpyRKM6NK3eM0XaC9T7yet0cizrODl3q3wH7f/5Y53ypFyNK8cCoAd3Cl6oi5N8O04bwHte
	8U/DohgGdZo+rNOl3g3bGZ5OHMazHbj0ji63aRP3mrvIyJ+UfILAlYKJGyFR1tmzZ56uUv1Qtd2JH
	ZNfUBmggaaonXEnGBj9dn45GYGoOb41f1TYnwenk0nxtlIXyftCi796WwACJo/Usu/OtLpW4Nk4H4
	u0DH+EPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1m-0000000D5N1-2BVk;
	Tue, 31 Mar 2026 14:25:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1h-0000000D5Js-3XRm
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvMne1305669
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YECTTdP1I+PzZ/SFGYlP2fyai+r7MYYacG+
	b94gym80=; b=aYdhKZyAR+ZWWlPWEkgihsndvQiK15XqjLPW6JnsCMuqmrPxglH
	UJ28wIOtAQXDYM25ty09yMPaMMwJ6grARRVwe8u+oYg9+xrn79C6Gigaecc9FF9J
	nSQJ6xYuQhu0K86WXideX3SR2xD6ujaMtBeyfzfTqusroHIAzG6Ua9fZvaiCj6qJ
	K7K0kLn2CaMEvkSODx4JYPAobrHD0foV+h69lHJ9GgN24F0fN/T3bCyr5MpkqogS
	9y11OUAUonUBn9JWpeR43UiJu2YqMrY59svDEgXuEuA+7GK1bDKu03J5TKlXLNb1
	whkqgjAjNS4DtbbsK0dh9sYn8GdaCbskApQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8h27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0f4e632caso57654495ad.3
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967104; x=1775571904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YECTTdP1I+PzZ/SFGYlP2fyai+r7MYYacG+b94gym80=;
        b=YI5/c/klNIJdXtB2t5AHIVoLVwWhIC4v4Ee30LF8z3hw9sWMJKN9uO5ExXPSoSXi7I
         RT6kbC9qSQ5lGuM6CjzgNayqK4ig4Lv5vpWHCg7h3buh7VOtJHlBJ8Qxrzp3NSV5GKG8
         gp8vIzgijhTuZf9IArvo4eHWmeLhOtjYeimNJ1aT5RTWZX7782WVmBUSS4PBEIrFMndS
         3HnaJUILkxJPq8SEIOLwuM3iuR5rEEc7X+RO827kIF8T/jqXfsrAbJLJhOH/MMrn1M6y
         efAvXcYQHQ5uCuIeYDl9VtbKiq2k2N+L7f1X0D6fMgyr0t2opkZLZSWvNxHQHd3im3HA
         FHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967104; x=1775571904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YECTTdP1I+PzZ/SFGYlP2fyai+r7MYYacG+b94gym80=;
        b=JW0EGygGtUxFKFDB5uXQebjBfsGgzW+w9k90P8RPWbtZoai9RkdLKpwaY80A8mjWvc
         nOyEr5qYPDkN9ur/ckRdBGGVh8OqFyT9VMg1IE0Y/dwOuqpOlCEvKyY+k6iChDhSNjgf
         MmBGafmgHDMAwS5x1f0LG9NL1Z97sOZIHJMCIF+Xkev/OytJNLDcz1w71wOYlDXBpqdy
         NCuDPdpuKYzXoer4wcADuqUYPWa845GX2WkWfU4HFXdaw7/JpBDKkN9bxSrbC3mzPKEP
         y7+q33qpfucSruLcTcLtoQFWF251LWmhalk0LlymkS5nQkX5pZm0tUedHPVhFxUyEBAl
         UQFg==
X-Gm-Message-State: AOJu0YzcK/ahMC3DfUxNkpGeHPJvuRM59MBoQ1kqmTBdPWYQSGEoIs03
	1LgfOCY0sG0Jre9O/3aIMedZmy63P9+C4pDCXpHYF6P+zOCBA3mWN6+N2fjx7w2OofJdH3AmX9v
	hSvoWkul+nb0iBCAbJqXrtfOD6XW0isdSVXaGwirnumv9vB7wQVfNcF6P3HnD2NwNQRqioVTB
X-Gm-Gg: ATEYQzx01RAF+aAlPVe8zyPirF6o6Vuggauo3B4w5f8c88IXY9PNLxpmMYqZT5xcJnk
	vnHdrSSfTXbOt/AuzyYmDgiUs9LWcqEcWXLLmQjRjN3PIcdWvJXMMdy/fO8FL/p+9JKCRLNcpZm
	U1bPQDdYm4eIgEtxe1eAKTb2XLk7px9QPoU3+17ey0s/f65JkLTncyq67tmcsjINH8veH5hptk7
	XmeN59jgknlGodyEeMM9/3Q8kWScyaCDTVRDGqIjOrgAZf6uSkKozRSVPFMM2f/1YmmH7RoNGxr
	q92ulfp56gDXDDGopRa5EPll30NF2Zx7xxb97I6EuGFAaLnclK0HOz94SEmXnCok0PchcxCd1/U
	xPJ+ZLikZwHZLxhleBt4vqgwvPVIdW+lT3yyN6t+niTCmk8b6b3Gb4pljp35rwqzL66OwNMfwm3
	XFMosxQSlNweqybZQumATMezUGvAdQW7a6u0R38+cDnN0/+Q6GM7A=
X-Received: by 2002:a17:903:22c2:b0:2b2:5515:661f with SMTP id d9443c01a7336-2b255157499mr73483185ad.9.1774967104126;
        Tue, 31 Mar 2026 07:25:04 -0700 (PDT)
X-Received: by 2002:a17:903:22c2:b0:2b2:5515:661f with SMTP id d9443c01a7336-2b255157499mr73482855ad.9.1774967103618;
        Tue, 31 Mar 2026 07:25:03 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:03 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath12k: thermal throttling and cooling device support
Date: Tue, 31 Mar 2026 19:54:41 +0530
Message-Id: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzOSBTYWx0ZWRfX1rQlVcGp6iP4
 VWmtID43xvEY0PoK8ZVzhowYbO/VaZVibsblvSPZHrfEjb/TEelogT8zdJUnhlkV8sTeAI+5j/P
 hUM2sVARgkfZ7bvYe1Xy5770c9k/OTby8Oq/pFiZtyesYaIBovOFsKdQkHXLS8+Yi6I1zjasPPD
 9RZZO8Lidn3/xrIHS4IzPtUub/ndp2FDjEstUzwLG8mh2UUfahx/93CKoNWaurgkPekg0bV0Xrq
 eNnlNseEBckHbzTZebNbnFTlS9SC1sjQubY9pXsxVyZfFREoqRAm+t29PumBgD11634fX9M6f7i
 kchxqQG9AiM2EX3gZ9+RE+RQL3l4yGD6wkdLoLQy8w/aTfWwPOVPclezrKLGr8A5ZVbIWhFR/9+
 m645db196Hv7HETOAIF7zRcaXVe1FN221TuFiJZZMK4tqje9MXANzNb8LAO4CaukmkqYYMzjGGN
 A/pqmuysPHR6ycXh/XQ==
X-Proofpoint-GUID: -S9gFAdabYOR0HF2Q2njiUExtmf44O_K
X-Proofpoint-ORIG-GUID: -S9gFAdabYOR0HF2Q2njiUExtmf44O_K
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbd941 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=kPw7zogRYXnG0GdHtlcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072505_888699_E042BEEC 
X-CRM114-Status: GOOD (  10.69  )
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

Patch 1 handles the firmware stats event so we can track the current
temperature and throttle level per pdev without spamming logs.

Patch 2 enables thermal throttling at bring-up and programs default level
tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
levels as advertised, and only fills optional fields (pout reduction,
tx chain mask) when the corresponding WMI service bits are present.

Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
ensure consistent cleanup across thermal register and unregister paths.

Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.

Patch 5 exposes a thermal cooling device per radio so the kernel thermal
framework or userspace can set the TX duty-cycle off percentage; writes
are validated against the throttling state range and host state is kept in
sync with successful firmware updates.

Examples:
echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state

Maharaja Kennadyrajan (5):
  wifi: ath12k: handle thermal throttle stats WMI event
  wifi: ath12k: configure firmware thermal throttling via WMI
  wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
  wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
  wifi: ath12k: add thermal cooling device support

 drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
 drivers/net/wireless/ath/ath12k/mac.c     |   9 +
 drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 107 +++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
 6 files changed, 446 insertions(+), 57 deletions(-)


base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
-- 
2.34.1


