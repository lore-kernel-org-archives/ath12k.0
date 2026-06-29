Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9EDC43327
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kdnraEcqhLa2+TgqxQBmlPFqUeeVxn9EJRV+IdmVZhQ=; b=hXHdcCtu5UvyRY
	qat7ruvxS/Qoq7EOX9DFRMZ52pj/TOMohsCpmQkWSZ78+HcSg7+/ORKP4c62uqKUljEAVtfBzNBmp
	hdvK+VKPzD6na/95hNEOmWJy2SyAksCQUbVIX+qQA/WKys/V39eoRq5g/XrR1+dpOO9WxaeV2bf32
	zLY1kBn+K1bK5/cy1ZxU7zbwJz9Ab2mnVlUqH8wJ0Snr1qLzGEC+EtS+7doTPUGsP3PayRpslGx8x
	NkGHB/YGat1mJaDWhIE9ieXgd0FZdnSmD8/VRR48UhkhRHL0NYWVO3thH9xIz+J7guj/UpV+v75sc
	Um4aF56EW6S4B7JO9kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zs-0000000DpRV-1Mbr;
	Mon, 29 Jun 2026 07:01:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zp-0000000DpQp-15f5
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:01:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rMfx2143065
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kdnraEcqhLa2+TgqxQBmlP
	FqUeeVxn9EJRV+IdmVZhQ=; b=RjSdaxMlVfEhs2QPAqED7dy6a22Id4K4/uE3RF
	qFtmrt0GtfuSwBdfVhHo/bGnGfIjOKdc+c5dxVGj8yHSRMYBPDG/UFlMG9JS3MjR
	BgHdZmFHGyHm45fVou8vZojVW3s/3Tz7VJIhSwGaBjyqNLLZ6pBZxzUuO7lN4KHg
	lZP3nbCHA8ALN9AJsEB9b58q8mnQ+7sgUvd+h6oFbwJq692+pIyNRxg+ZTfXpRBS
	Ma+JomBzHO6KAaTpGxFODOgg73QBUeX9QT449Y5RG5BuwWAkxWUWr6NAmWvyuJfU
	Z8BweGK3LkLhvvgjgluq+PR1fKHxfqlXoqWb+ASpRztHp7tg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u758jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2187022a91.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716491; x=1783321291; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdnraEcqhLa2+TgqxQBmlPFqUeeVxn9EJRV+IdmVZhQ=;
        b=Q83nB3I2OtJMx7IMwCNyjG+HqfQwjbMtdo1bEM7zXAY803NVA8fphtWdV5GkGt4g2N
         OnO2stvFpA6zoAKY4SF1l0Yu7EbmKovrFP9KRgSmOd+m5VQ4Hznl3bzO14O5+BGNDKe9
         USZCXVzA/w0MyL0vrSApFv7QrsLE4unDL1SuP09DmZB9pK3UuWUnjlmekChq8ELGIcAd
         vuWtNwxUDOKxByQcH+7NirxfoxwreMtU/fmBtORhBYP/zb11KtQOvGMMW3SCfoUB+zkw
         OXjpEorMnatKeDplC4eA0lTBcYfw6DvIi2onwJ5cpUE3UJzK08XKrszkOa7GzoxkED53
         W1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716491; x=1783321291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdnraEcqhLa2+TgqxQBmlPFqUeeVxn9EJRV+IdmVZhQ=;
        b=VygWuSeGST4EP9UrkRHhQD9koJzSSek/Btkg3yIZm19xDnAjOCV+0B6nDzbVU+GfCf
         k7m2mwqWbz3OnCNLT6VS4xl8shrOT/5ddzZhyUEI2nveiDJEY8LoOHt41+D5ymvRsX8Y
         GYrk4yjLCWX17iVtnXaXtNTEOHu6m+lxvNzY9OOr4z3qRq7RJr0d6I55qZG+628xoJJL
         RJ/f7WHjEYHcsNbCWhif0a0PrvRm0+3hIBESIxSjcX5Sc/kgUOH3PF2jF1qNhJU8ZslZ
         ioW20pn1l2/0A6tCXLTS/2/UVTCONyKEMW60y6leP8woTfmRbIV5kGitpsTWz52k0+Ry
         kCew==
X-Forwarded-Encrypted: i=1; AHgh+Rri+Cq5q8vznAQW+pcFCkhCA5wkzbbhFttWM22J+E/7NcB4OLMcJbqQI06uoRQ2xWha+p3Aebc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3CGJYX1lIuVYqprwO521d0NQQ6hzeYRNCadsPOr20ZxzbQ6ve
	zqCCM54ZNznZCDfESE2JXjhCCoZfC3bVumAztMXrxJuui2lSWZdAfbXhjyLj/3k3KGW/fZT4nXH
	Zebl41NXJl0+X/VWNVpOdSHhGYe9cpeANBk9gwAPAOaycZtxRpsX5+L/q62lzbS2LopwDvNlnzw
	k=
X-Gm-Gg: AfdE7cn1okGz27aHW702OwRRvF8bWPMe0zzbRmfpbKLYPfOEU4xNLms8Mv4gnbxHuYI
	3WBaIIIuooA6lv4erFsT9iTmmLJKkoLy7F1sujCYWe05zHaCsrmPbxLxoyUSWCqKkzViQDhPLS5
	bYV7l7wuApu7DOB84IN/1E+8FKJmCtDS4LEeEtiwW+74VAxv1x5CVrmM5+t/OmpDNUA/x/bH/Ee
	hdIJQJ2GjNw2MMAjj2iEJKDbA2Z+2+8XvWhgVEy56mOuRzjvtfvkleYEAd2mKe/UlIPTZ3u5auL
	iT8wA3bJcAhjdJywZp+2mA/i/8plmxrDupdc0N8bO2y+LpoEHM2M6RvdgHa1fD0mic04IK/kel7
	wX1VGkX6cc6+b5siepzaBB/9WAN7xYLuGHm/B1ewceFwDuCkYX1J11egBf/RIms4u
X-Received: by 2002:a17:90b:3f10:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-37fdb062e8amr4667869a91.21.1782716491121;
        Mon, 29 Jun 2026 00:01:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3f10:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-37fdb062e8amr4667841a91.21.1782716490657;
        Mon, 29 Jun 2026 00:01:30 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e2048ffdbsm5276706a91.17.2026.06.29.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:01:30 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: fix peer delete race in MLO
 scenario
Date: Mon, 29 Jun 2026 15:01:16 +0800
Message-Id: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0YQmoC/43Rz0rEMBAG8FdZcjZLMvlbT76HeEiTiS122zWpZ
 WXpu5vWS0FbvQSGIb9v4LuTjKnFTB5Pd5JwanM79GWAhxPxjetfkbahzAQYaKYZUDc2HN7opRv
 oFTHRgB2OSJPzSI2MwUVrGeOGFOGaMLa3VX8m5SPt8TaSl7Jp2jwO6XONnfi6/1fCxCmjkoMNW
 EFtLTwNOZ/fP1znh8vlXJ4l95vi5m/K1cLLKJUKsf5JLZdOsL1OHpNQyIha+FrYynPYIcWG5Oy
 YFIW0xnFWhyArDDuk3JL8mJQLqSSGCpTzoHdItSXVMamWWkIpXkT0lY87pN6S+pjUhTTMMs9tN
 Mb9Vs88z1/qUnPzwQIAAA==
X-Change-ID: 20260602-ath12k-mlo-peer-delete-race-74fdaf880017
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfXx5LYiK1/hpMP
 InwO78X/+nxVKSJ+MQujm/Y6FjROiDrxulNn2xUZTPVmoaWtHJLm4P6FYvrrL6XPggWCVK6aA83
 cXLOKB4EKoUGnhHosqnbBJrEsMahOVU=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a42184c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KYRmtTUs1ONzUHfUJuUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ipUuSnUd2n53W0u2VnYmSZHGLvAW4KfU
X-Proofpoint-ORIG-GUID: ipUuSnUd2n53W0u2VnYmSZHGLvAW4KfU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfXwcuKiyLZQ/uX
 Sz0sX7/5kCXHHX9SlgL8tGcXKcz+w4smFcze7SQqSOr1EwpuHUYp8s/InSTGmUOJQVC9p+33KVr
 0GpeyNjUHo34Y9Zna4Z+crL8kANEtkUg08+pQgJKkiKFwwW7SA1EGyjcKuivHd41iMeI373kpcx
 Pz8ZEU6DSR4ZIgzk3MbQBsGivHmJzVML/HwgdJoFZOL59t6IknelkM/t4hqe0c45f5AI+lvRAkw
 QBUwS7TDgB7de1Jy2uC4IAML6Nywwy5lzCd2wTttZzC+RvRqyGq3ZB363HwtjZDXTq6r7KZfXUb
 XNcUiiM+pP7wxE3VOVrTRHdJoSqNTcIeXGmVyKjOrHcM9QJ4O7CtVsji8vTh+LwbQENLoBoa1dJ
 6W9u12+Uyv1Jwtz5mPNGmqoj5K+WdHUm9x29nsnY/d8f9YG1hfWQQmjv8bxQI1yRBSyQEEcJYLb
 hR+3hrNwQ2qqv2jkfPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000133_445227_874D8184 
X-CRM114-Status: UNSURE (   9.48  )
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

Patch 1 fixes a pre-existing UAF in ath12k_mac_vdev_create()'s
err_peer_del rollback path.

Patch 2 fixes "Timeout in receiving peer delete response" on MLO
disconnect, caused by a per-radio shared completion that gets
clobbered between back-to-back WMI peer_delete sends.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Changes in v2:
- rebased on ToT
- patch 2/2: make ath12k_peer_delete_wait_register()
             and ath12k_peer_delete_wait_unregister() static to peer.c
- Link to v1: https://lore.kernel.org/r/20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com

---
Baochen Qiang (2):
      wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
      wifi: ath12k: fix MLO peer delete race

 drivers/net/wireless/ath/ath12k/core.c |   2 +-
 drivers/net/wireless/ath/ath12k/core.h |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c  |  20 +----
 drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/peer.h |  14 +++-
 drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
 6 files changed, 133 insertions(+), 54 deletions(-)
---
base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
change-id: 20260602-ath12k-mlo-peer-delete-race-74fdaf880017

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


