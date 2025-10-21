Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5150CCCD1A5
	for <ath12k@archiver.kernel.org>; Tue, 21 Oct 2025 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r7ZO70HMHOWnnxq6ajsx8ZJ9zshp147NM8Ile3iuuIQ=; b=FhKIZt4YYwx7QCQhAoc2C+4pjP
	d2s9W9FR9JvR8jnhCxRzkaoFoCvlsnJ54OFpcYfwgZfmP8ApQZsMP+Dx29VFfqalJNpvn0sAPKnOK
	+dAvV1UnFAAplpLWzWg8R4pbcaNO/pL2Z6VjbA5cfMxi3XOAJX2D//W67bvXLQjcwslF9hRnj8DZN
	7hbk1iXziKRjXAolkc3VYram7uPi4u/2FRtAnWZc1b51Wwshua1tsiHKkDmop3I19rneDTTAmS0eZ
	HhM2e2zs609agLDMGO+ObRA8QoV2N0yAQ75wpgwIyn/yjq8kPWXFjmPV6rH+n6TjdgE69ocpvlrbW
	e3syRVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBARs-0000000Gkml-0Itk;
	Tue, 21 Oct 2025 11:22:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBARp-0000000Gkm4-148A
	for ath12k@lists.infradead.org;
	Tue, 21 Oct 2025 11:22:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QrmD012723
	for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 11:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r7ZO70HMHOWnnxq6ajsx8ZJ9zshp147NM8I
	le3iuuIQ=; b=YtZQ/DOxnVcJ6JQKMqEoMkAl/NrClushLvHEXff6g1zyI9L8zfW
	wvyFywAiXyerZ5XGwaTdzpbQJQKPUvC+7PvuJ2auQtwDQTJJKfKEpjo1APzimJgj
	x7EQZwz4QlMnUFhE28J89a0htRK22avmXnFLQpdkgMau6vA9wFNgwFy2ZkBZuCFe
	dBGp22Bfs0Kk3GyIECMtcIUB8ZUN9jDFT0ZTttgpNPy7F+gyhq7B8PU1wRrEXdI6
	nrsoaEPs9QkET9HXf6z2Der8FkkCKNttzpiP3XXon+CwBxI24PVowZRsx/acf+WO
	6P8PYiQG5gf8C1EdNRuFlIjHI7C61UNiU/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgetqtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 11:22:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272ed8c106eso33279865ad.2
        for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 04:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761045753; x=1761650553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ZO70HMHOWnnxq6ajsx8ZJ9zshp147NM8Ile3iuuIQ=;
        b=qIDPVDOosAQUy6THL2xQy2NV6FHrHfB7l0O5woBu9jTY0GArB7AHOftRYQw8AjbAlA
         mYnM0035RXmbNsbxCRQ6Jppc7QxdqXEpyZ8StNcRyac2rt1ewvpe+B1/EUB+i40PW6Ku
         QIvFgN5am8oVX323ebMfH8DOd9u+Pxhvbps+G6sQhuyuFsKkZ4o6xGA/gtEXFsS1YwG5
         ++pg4g2RoEvUhZsGufS4n3HhILcZMjmY6nag/jCs+vMlHHBoSHwTA66M+hfj85vIVE+F
         oET4gxDzUqCpmkcQAsF8vzvF4aUSgg74rVTEa4tDelqCnMe6CHKKhixH/gA19V1OWkAZ
         l/ag==
X-Gm-Message-State: AOJu0YwAqkAN3CFGq8E8FJt4gRouz3DldmgBE4sGtXrEPvnILXpM+vQ0
	AFe6XjkhTojrGIqioM7/+h8/4dF44Sas9R18TJ7XDATAKbz2fi61DZmMrVKn0dk9l4J4kqwBwhj
	A1XsiJ5cJornDFhDSp6Z3WRNJGM05wuLrfsza1zirpZNdAAK+hLEOP7Iv4klFCoRVSpatq2hk
X-Gm-Gg: ASbGnctbKsPGu2XgoRPlt+5s4oN5R39uGLajIKgtHRBsQyvDNJ0ryGXnwj4HAW5SQo5
	Y0CjauKkI7dxHRJUZLMD8f59CQAuzgqMGydLN7E4I0F1ezc6wvjjZ/Gd05hcwqBzKNdwWU9slot
	A/nq6X2wWNfPimiVdxtj/SWXqMVd2eOFKVRS1bqbkQ+DhzVBlKo9zLLUc6xYGN7z5xphlpZT28a
	zUnzKIN27DqdTdMC8h5RtDCL5zZmqXczn3D7Ju1VBB7FfcqjTGokymYPFZ+zmBpR8D6l060G0bW
	hL3QekZDhqfRGeDc7UkY3jAUJXkHIcTJbnD5p7fypnRRhQrQjyHGdwfjlKVxjW6C+QmyeXgQ5SE
	+0zJw7mwg3Ojq7yLAFsKEFjuadtL4/5elqwEHYe0HbPE/50Q0r7fLPNnyAnEl61a9XYh41GxrCI
	GxOo+zrZj4fXkaT2/axHPn
X-Received: by 2002:a17:902:ce0e:b0:266:7871:37dc with SMTP id d9443c01a7336-290ca1216abmr233600485ad.36.1761045753431;
        Tue, 21 Oct 2025 04:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHi+oQttV3TYHZaN0FeSIPPyIr+nQMgp1Zb8WomxjhTRaua0soPu8uVi14kW8IsqrQOyrQpQ==
X-Received: by 2002:a17:902:ce0e:b0:266:7871:37dc with SMTP id d9443c01a7336-290ca1216abmr233600225ad.36.1761045752964;
        Tue, 21 Oct 2025 04:22:32 -0700 (PDT)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc795sm106782015ad.30.2025.10.21.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 04:22:32 -0700 (PDT)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Assert base_lock is held before allocating REO update element
Date: Tue, 21 Oct 2025 16:52:04 +0530
Message-Id: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XVsSGGqbL2vlpIgARPaYT0FnsAoWMo4a
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f76cfb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yAyZDWbmfds-XO8zeWMA:9 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: XVsSGGqbL2vlpIgARPaYT0FnsAoWMo4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfXyAmMX8qEnhRW
 V6uJ+IyryaGqKoC5w4YWc8zMLqb0+tzRyvi0P8n4EwxkCOr0yOErwONioPshnetU2TA1p+Tbd73
 dCIPmY4YyZlkDecWk2X3a9Y6RlzjelMnEbDJjiSgOmxmMZWE8n+1HOHGhUTmVIcp637arFkm4rE
 po/htVE4isqi22Nm3iAuO3ZgX5lwg7rMae9BKjw1Ol1A2JLmLFSleiWT0+Fm6uR97z+1LxHwwK6
 5A7PtKkQiYT31YPdZtWRsItBXjF8k+OadOwpnitJFIDYd8yqhKQ3xyMnQ6LwTeZDQ+gfmryIexM
 bz+0DQ+KqclOGATVon6ZuVDpX8UoJcsHEaM69nSIc3dukCrgsMjF83Y3hWL0gruGNsY/MlEf9hE
 Sd1sMEKwIeWPIMwsyO2JFRSrM0IyVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_042237_691440_FEC05A89 
X-CRM114-Status: GOOD (  11.14  )
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

Add a lockdep assertion to verify that ab->base_lock is held prior to
allocating a REO update element in ath12k_dp_prepare_reo_update_elem().
This helps detect potential concurrency issues during development and
improves code robustness.
Compiled tested only.

Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 6c9f0839c83a..d28d8ffec0f8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1089,6 +1089,8 @@ static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
 {
 	struct dp_reo_update_rx_queue_elem *elem;
 
+	lockdep_assert_held(&dp->ab->base_lock);
+
 	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
 	if (!elem)
 		return -ENOMEM;

base-commit: 2b306fc6b1d00dfe85b3b80eb257256e2b5ba610
-- 
2.34.1


