Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB5BCC6B38
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pcD3DtXTyDsrYRo/20f6YNybjB6dTu0tq31YCcIYp8M=; b=KYX1aMpful+5ZT
	JGE+K4c5kcDaapU7O4p38grTYoN4nQYn8yvFCblAYAhtPrxl6n3yQbMcBcdZyzMuMQrHkAfJmbX66
	IPawu3b6HHX3XKzGLHYF57TDAQsDWsZc5WgZiw8KUWikQzen5ckQPtDAu4d2GEJQhM1/dF/SLq9Nc
	KQtGIwgNTZ6d0Qa3+UBzowYDRwBF54RhtLmoR/qnbJUsRueZc4+zDy03xC9qsONsySVXj5IZX0TEN
	m/CaVxEDSuawiH+ce2BdVofeziGjq8F85DeojwzMEYVL7go5vb/o/3mH+kxkfnnI67QtatK5DDKTM
	p1Z2udNCCx1ymCBd6SAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfu-00000003Fmi-1aAh;
	Fri, 16 Oct 2026 15:16:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfr-00000003Fln-3WLE
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 15:16:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5xeE2301972
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pcD3DtXTyDsrYRo/20f6YN
	ybjB6dTu0tq31YCcIYp8M=; b=E81LUio3tzHZnxkDbdd7OveDJNZXLP3E+s7Dis
	Smzpeb10xEGzVNJkgbwLXe2Y9saoJmVHBMqEpGWGkq3H5017/PhM54+xBr3h/4wm
	BdjNCbq1pffrHETtZMiAvn4oADsohkT81E9c37b55KZmvqkx5d/NtAw/Rt+NGGrI
	uM7UAsJe9NQGnJjb9PvgMpePU5/ESnCA+zPmJlE9VvV6EKv7Z4vQDBtr1h2cqgeE
	s6hHJD4rbP7DMeArYAcHK50gN26RRi6ZXlK5rLs8GNOp0XD/yA2PgSPQPipjgLT1
	qry4FjWwJaWnatDM5rixrFRgPwZCeofWOqLOTxAlpGF1i4rA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sevak4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e8078ac577so2000161e0c.3
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792163805; x=1792768605; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pcD3DtXTyDsrYRo/20f6YNybjB6dTu0tq31YCcIYp8M=;
        b=Z/fh2FjiumMLI36P9PzVViCjBdLpLJxfO6w+iAOfYm4YvnGC5AaMDYdc1ruCqK/0l5
         E3vUsMa/xqjpAbdSI6Ey83f9z+Lo8a6Bvdeazt1VYFFi6GdARuZ5PvX3AQs66rfurkFH
         Onmeb7G/7Y8I3fO2C4jWq82XL/zJ9bm4r30WVlUIwrN+ADHLz2LPeIL5y07mUn9Lp0lT
         GbcBKABCJFGaATgK5egdTFl+/vAVOTt3yeFhfnS9SeWPjE9uQ8IcuD5rr/7Xh9mW2k/9
         xTYVffDMaH7XT17tcASY8ow1GnbV1yiRqg3++GICtpuPfE2km5LzP8y7CKAAjLA+tUcE
         nTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163805; x=1792768605;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcD3DtXTyDsrYRo/20f6YNybjB6dTu0tq31YCcIYp8M=;
        b=GiBt0Abv5LH65a+4qZGkCu8PkeiPut+dJNjMgz/EHBtmeWgEZZEZLKMiIwinp3cq/j
         ahbXYS9v0bABQAR1dJ5chAqvyeao65CG8emCDX0yHnllA+Q+e83nTr7MWUCCORWOrNcH
         9EyKgq+WGe21d2sQXEiruJ8QVe38xvD6V/nTtgE8Bw3bXKAIb/0p/4AytOiHWnod1EuV
         qcVtM14TAbE+bJQ3/6wUyMkxhBxyyBfncTn1RH/lNsRsYKWadsHk8ds0nN7wUo8sioXn
         Difmg/B9akVMYiw/7GFeyfwqa4HBTH/DRLPXczmb2Ca1IrNs4yqpfa6uFEkcDG7BjLzX
         BgZg==
X-Forwarded-Encrypted: i=1; AKwUvBz8l+JlVeYwq4QjOCCgR5lpBFMFF3I0Ug9fcsrTS1yCWypuGc/A8UZ67udwdYQ4quiCuZXUlfA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIJqqNi+ET8YKdPioHJ6ew8EV8sJ+QgTrszO0V70PLI+fV0/1Gp
	aK9OoQTUAk5TdooXRWL+U/Id1IyUq7jZH9f+09iIS5L9F4Dse76+pjBKozIM/fTPfDwZBahTvnZ
	UAoTFxLNd5oXIIAMn+yYd1ynePZ2k1ah4KQ4bTMUNZg3B8BQvARduUJPKFD7/Nbto
X-Gm-Gg: AYBFou2d1LRwRvXxH+xp+R2VenihzGCbjSb1btwwkfLXNdvfynTLrfQu4OoofqBi/xT
	opCM1B4ZU63Bo7w+7McCXCSyHPk33etKhjRtOir8dCVYyikrzKyIUnfBrtb6tpmP76wxWJ9t48G
	9P3sjLcZ+pbiRMVzvtN5nIP+hZZYVi8Lx1pkRTACyijDoE6XVeYdsRVMu48AG4cX0i4bCjLsOCB
	jdBvxtynF4yfPuWtlmR7UdGwxX+Y2gzEq8a1V4r1Oqvu1lwKyAK/TJldh1ocrJ4vTejqmVSPqyA
	WkmZcO5r2SSIsl5kqWez7xcf7sitveLOAQOqVwcsSn4/Yd0UqJLM73cp5VaXlCWFVqYbVdKV9Mu
	VvBuowBN1hGajLw==
X-Received: by 2002:a05:6122:1815:b0:5c9:a60b:e5ce with SMTP id 71dfb90a1353d-5eaaa67b302mr181786e0c.17.1792163804422;
        Fri, 16 Oct 2026 08:16:44 -0700 (PDT)
X-Received: by 2002:a05:6122:1815:b0:5c9:a60b:e5ce with SMTP id 71dfb90a1353d-5eaaa67b302mr181704e0c.17.1792163803752;
        Fri, 16 Oct 2026 08:16:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm38702025e9.4.2026.10.16.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:16:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: rely on ieee80211_rx_list() to
 send rx packets to mac80211
Date: Fri, 16 Oct 2026 17:16:26 +0200
Message-Id: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZMxSJeZXBRa9SgtEMqUhDvb
 nH5F+/fkFiFEwzVDcqXJImhBNUV+M2FlVHm0mAaY6khQnduZHbUjO6KMqOyO47o0freTy23hmw
 HRf+VF8nf+QcFYeB8wvg8LyFJr3lzAAAA
X-Change-ID: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: cGjdETci9oDYQQ2AQ-aCL_4XG1ai0WAI
X-Proofpoint-GUID: cGjdETci9oDYQQ2AQ-aCL_4XG1ai0WAI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX4s4j4z40GTtp
 Nmv5cLm8W8GEqdK9QO4PAHUu/yttfCdmvuEaJKlrd2LX470xA26ASDhN5PsnbDRrNROTcPKyeXJ
 SxDcghle8XZuAUwVzGcAepqiVyeT8VQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX1zZ908iMiggn
 /qC3a0b+8RTnEIhWTYc/6kHVkMGmG27EFZ2E6M36WCCLWPVjVZONyyAzFzpCxa4q+bbKYAiFpWA
 Jp5MgsKKvCqXbgwmszZdNUQ/zuiZf8Qp8SFmt5LnwsdU/zKN+Ui337UYjag6q10xOKtP79XJy0a
 0oBlyXS+87ltJkUzFOdDgjw4W4J8C1y/lsfmEBBhC29EB/RAKT2nNvSB9f923OKSr6JmEuYYbWC
 it1dui528e2TFciE0U1x6s0bb6RHEOM9eqR8jm+Ifxjn9ySHJO45BBD5/O3yr+rn79zYYB29XiY
 sla6eHlCi3Z9DfRQzBbO+S0ZZohb35bXVIkLQ6U8jYK80oEA14ONusK3wVpDMX4lIDoMXAjxoa4
 EuEKB4ml14cGptpLAJXkJskunjP77AGT7alSCmSgc/+Yf8t9zZK/2Ie16ueVitwv7o8UkI+Ba9P
 GAsHoJP2ojxWjyjJkiQ==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad23fdd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3acpehKfv55mO9VuUBgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_081647_999209_38028C66 
X-CRM114-Status: UNSURE (   8.00  )
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

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() at the end of the NAPI poll.

---
Lorenzo Bianconi (3):
      wifi: ath12k: validate RX frame length before undecapsulation
      wifi: ath12k: rely on pskb_trim() to trim the received skb
      wifi: ath12k: use ieee80211_rx_list() to deliver packets to mac80211

 drivers/net/wireless/ath/ath12k/dp_rx.c       |  96 ++++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  10 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 281 +++++++++++++-------------
 3 files changed, 215 insertions(+), 172 deletions(-)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261011-ath12k-rx-avoid-realloc-6c8cb3e32165

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


