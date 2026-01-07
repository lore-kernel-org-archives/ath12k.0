Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF6CF6BE4
	for <ath12k@archiver.kernel.org>; Wed,  7 Jan 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q+QPlNBjT4jczmwp4hItvRTCbrlQ/Q8cDIX7csc7JP0=; b=inzhDbR05noiAZUgYqOv/JCiis
	4YOe4Q/l366hNx4ss5HI3/rp3hnfeTJeYEgnnm3aK4zhi90TOum9mpZzFdy2UAMCRt7ED2d9ubbzq
	LBhwReIQkK8nY7QxXqsInnRxSnwgSzx/JIlVaA7UJXuGHIQORd5fcb9K7aH6W5dyLv4SO0nVJKUSV
	RBpzKQSnppgncQUAcSSyDPFzPduFO3iojgbmnJcDlBiETeI1rHENSGcumJi+L4qCwRbt6yj364SJy
	bqmNmAA3Zgfo6qaTOiNJRSpLXklbSqyA5GO1S9RJ/riBHxgovFDYF/wEcbjk0ALt7nY6EHxqAxnGP
	vxl70kRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMd5-0000000ECB0-42Lz;
	Wed, 07 Jan 2026 06:02:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMd3-0000000ECAP-2oqy
	for ath12k@lists.infradead.org;
	Wed, 07 Jan 2026 06:02:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60743TZf4091247
	for <ath12k@lists.infradead.org>; Wed, 7 Jan 2026 06:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q+QPlNBjT4jczmwp4hItvR
	TCbrlQ/Q8cDIX7csc7JP0=; b=mBXTUiUw1aQqt5IAAbrcMKtUlKf2iOuaIUolPU
	IbFWmlAisWNLrVlVE058pQp+FNph2+h2G8drskjDTbjU1mfv4iCnIVCLcN39sEus
	u4oCW0AijTwUOhvn0JRxsPkjFV8HHo/lS+e9KYHYZP7UR+J3jVfmZ6ys2ScKmnuX
	GdO2tFzaD5WU1ooBQU9zbUZPvv/UVb8jpR5mMoJacM2qf4s+fmJc3yCQitp1Q9gl
	GJuSMMGeX6W/Wx3NDVVeggbxzGCPMatm6LHOn3Vigxz7kvcDLOPXBWXFMBUhD+ce
	Pf8yM2IFwyBXKDEyehUWyC0aAyNG+mh7vMaBxVOlwukhyu9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunb94c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 Jan 2026 06:02:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso26467645ad.0
        for <ath12k@lists.infradead.org>; Tue, 06 Jan 2026 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765762; x=1768370562; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+QPlNBjT4jczmwp4hItvRTCbrlQ/Q8cDIX7csc7JP0=;
        b=YID7bZeAYFCna8FuP/g1Wg/7PjcRFvCuI9JJfAkwvMbtT1wYTRv7q4qJbcTKc9Vbev
         68s9j752tE61SEhhJvmdpbnAdl8oDmMwl8X574oxSxLFGJjuDuPwzbk4S0STWkV/MOzv
         sx9RRRoAsrTKftm0qDHdGBDZm5v/Cy2Xg+R96lqlowlCNXzA33Y/dFx6/MxTAwQ6IKAv
         o006ZVd38hd88By4gGSjEcfyLLkL8bIhi1kKZm1prHMzjBzqDWR7v5hnKECxGrKlb0qY
         23Kv9FdUcgXBV2Tx4SaWnMLYNlGPiNY2S5E5fCTCJIsQ5lOMyOjLduTKAj1j5IPD5tqU
         1Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765762; x=1768370562;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+QPlNBjT4jczmwp4hItvRTCbrlQ/Q8cDIX7csc7JP0=;
        b=OSoXOpMlxlExaCPRVPHdjFnOuDEGeq0S70ht7nuIQ5wmleKv3MlPZTgdjTyNpZ5za4
         gWHGQPdD0SfvIVlTUZaPvZbMKMLF73IKJmXj6KA4HhTSdB5JjJWIX6X7/6Aug0hMoTPT
         ig2xerBiVIQrofXOexceAKuuvV3UOmZUZ4RZNyNds75rpXkYgC1kCXM4bpViFB6BLFpP
         wMVlzffRvY+OdVwOk0if2odQJFguB6jbKDcbreIz4lXiD+UDlaKccEj/PeT1Y2FPYovF
         Da3G5JXL3JaeqlaHA5lyoEm1QgTUm9x4V1hqBQD8kHpYrroTRh652JEiAPqRVy4cmwS8
         +VRw==
X-Gm-Message-State: AOJu0YxAprtrSLSeoE9DilQzSWGmeS6msVKfhqIRXitPDh6fwQvcXP+g
	UoSB8IaNgvBi7DphVbJ5E5kOU+ZLRy+Y0aevZ3wFEnSVuuIQXYkSYus07iS41wZXCcFMXcNuaSp
	ZTTqP40GwsVEIAdUyz09aC5Y0rBghdyKq/qG0kuu2ohd2gYQBomREVQp/2uKYf2JJ
X-Gm-Gg: AY/fxX7slJu3NNC4J+jNdLKNk8EwJ9jCzrmN9X3Z2t98BAIiLwVfF0+bq0W+p5uKX0H
	YDoV23X8TtdKJejUU7s0rQZug0Fr48Zvpx/9/33izCuX7s6YMMKnjI8dBrStf3XD3c0SvRqST+X
	15oiBJfO5YkrsuVpJmVDJ6upQGbQ6u+DfImn35XAByviAyJQvt+u3oGXHeZyRJuELUExHfMVt6F
	8AAVzMripE6fr2ep62EnTG+wNhShr7G0Njuq75U3GakCFqFFvKeAbUPDNWflSDRlSQb7cFt9eDc
	td7IxB6GHj8GjWaXgkhzTspOLX8ZkQhNj2Oo2+t5LIdBFIpgZjJE5NKuhDZAh7qDZ9VnaZCLzkL
	a8mAnf0MgPW67ptqdzRs/ugl8AwNOsw0uDVu5NJTQGOW19Qna7WcJ6y2dMBh0s4/R3tzr40SJVz
	5ZmSEd+FSrHmr4OguYL/YD9B5hHfJxZIcnpxLS/Po/2Q==
X-Received: by 2002:a17:903:234c:b0:2a1:325d:821a with SMTP id d9443c01a7336-2a3ee4c2cc2mr10425695ad.60.1767765761977;
        Tue, 06 Jan 2026 22:02:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1XWXNrPSuKcZI7qNeK/ZZRAT2ATb079o65VjHGxrGtLTKcPKC7wkVMgsawt3Bw2oKBYlphw==
X-Received: by 2002:a17:903:234c:b0:2a1:325d:821a with SMTP id d9443c01a7336-2a3ee4c2cc2mr10425175ad.60.1767765760594;
        Tue, 06 Jan 2026 22:02:40 -0800 (PST)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c2bsm37999395ad.26.2026.01.06.22.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 22:02:40 -0800 (PST)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 11:32:35 +0530
Subject: [PATCH ath-next] wifi: ath12k: cancel scan only on active scan
 vdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPr2XWkC/22NzQqDMBCEX0X23EgMmv6c+h5FSrpZ60JNapIGi
 /juDZ57GfiY4ZsVIgWmCJdqhUCZI3tXoDlUgKNxTxJsC4OSSstGahHRuHu2lMW5tSccOqP1kaD
 s34EGXnbXDUwahaMlQV+akWPy4buf5Hbv//hyKxqhHmitxm5Aqa5z4nr+mBf6aapLQL9t2w9gk
 TR3swAAAA==
X-Change-ID: 20260106-scan_vdev-94d8cf5a667e
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NyBTYWx0ZWRfX9At5Ju4fKDvp
 QEjB+I7NYxyQr5h8rFOPuWb7k23DHTdfZ5tA4CWMkJbJUQ/FphOGVUcTGM7Ku/lc6YAYm+C1IL0
 /w3G+cl5dLimNzLKjJkCj3E+jUhyOOHuBjgt9EJHNm44vnK4HkQ/UtBeFhHX8qZocEH3Rv2kyIY
 HjQWM22Lt6RozB0d9pJE5Q+3gPtbkIcsLetYZEHegwzRMZyJi/XvKXmQ+kh5A7Xp3OUhk6L9oUo
 2Z0IMJ1wVsgamPHOm4tJKyoATnC09B4/ecbVfk3Z6iTg6a1iSIv3fKO00bM/AwcLTu1gD6Q/1U/
 3fqk8VpLA4u3mInnpmx5ueaPwQ69EiyCWj2F0o/4nEHm/OSykzERlX+yvA4UQ+qteIKJQD5ROUR
 eCLefpOlXkZKaS7kpoi1VNLDS9Oy1cCMrd59LcpdcOGKk9SOodGAhJLbmBB4pNQfrdWOMKYRomq
 aEFKxceQXZwZfZeg9dg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695df703 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d9pQKImnaTiox7jRA24A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: fAsYdOy2BeXchtak7tZz6sWq-RbbeEAD
X-Proofpoint-ORIG-GUID: fAsYdOy2BeXchtak7tZz6sWq-RbbeEAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_220245_835450_7BF2BB12 
X-CRM114-Status: GOOD (  15.29  )
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

Cancel the scheduled scan request only on the vdev that has an active
scan running. Currently, ahvif->links_map is used to obtain the links,
but this includes links for which no scan is scheduled. In failure cases
where the scan fails due to an invalid channel definition, other links
which are not yet brought up (vdev not created) may also be accessed,
leading to the following trace:

Unable to handle kernel paging request at virtual address 0000000000004c8c
pc : _raw_spin_lock_bh+0x1c/0x54
lr : ath12k_scan_abort+0x20/0xc8 [ath12k]

Call trace:
 _raw_spin_lock_bh+0x1c/0x54 (P)
 ath12k_mac_op_cancel_hw_scan+0xac/0xc4 [ath12k]
 ieee80211_scan_cancel+0xcc/0x12c [mac80211]
 ieee80211_do_stop+0x6c4/0x7a8 [mac80211]
 ieee80211_stop+0x60/0xd8 [mac80211]

Skip links that are not created or are not the current scan vdev. This
ensures only the scan for the matching links is aborted and avoids
aborting unrelated links during cancellation, thus aligning with how
start/cleanup manage ar->scan.arvif.

Also, remove the redundant arvif->is_started check from
ath12k_mac_op_cancel_hw_scan() that was introduced in commit 3863f014ad23
("wifi: ath12k: symmetrize scan vdev creation and deletion during HW
scan") to avoid deleting the scan interface if the scan is triggered on
the existing AP vdev as this use case is already handled in
ath12k_scan_vdev_clean_work().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2f4daee9e2f0..950ca7536612 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5606,7 +5606,8 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 
 	for_each_set_bit(link_id, &links_map, ATH12K_NUM_MAX_LINKS) {
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		if (!arvif || arvif->is_started)
+		if (!arvif || !arvif->is_created ||
+		    arvif->ar->scan.arvif != arvif)
 			continue;
 
 		ar = arvif->ar;

---
base-commit: 631ee338f04db713ba611883f28e94157ebb68e5
change-id: 20260106-scan_vdev-94d8cf5a667e


