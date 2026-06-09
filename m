Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B3CCD8C9D
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 02:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwrSuIMmbqrknpXMqXOsdq382dCBhvSP7g6NvTXH1oo=; b=ThuPUtkR8EpgIQvRiGT/piavDv
	3mNQcTwyrYlcxcerX8AY9ryK5TAeKiyiJnfS8AmM4USOoo3Wcoh7QCj+0vUEt5MwlAEF3PWzYbkIY
	b/Jb6J1zOX2r6GEQg4NdiojQr+SUvp9m3ammT94ulFFB+ARcHS0JEBRyKmDBAjymddWCWeaN8BYVH
	zHk+pdCZdP+fuTjolOHTV0N8O1HJlnXRc+3Y8mVsAyTfm3euu+4J3bLpfs6ngExOenklZY3uLvIdS
	a2LTQKs252qS4Z1yEnLoJTDdOrRdguuEl0MiFbCY/r369tGxVL4/QAal+5jYFzS1RAkAjgIO8szjP
	ZCbKPVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlvt-00000004cR9-2otB;
	Tue, 09 Jun 2026 02:11:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlvr-00000004cQl-167e
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 02:11:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590rxWd659523
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 02:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uwrSuIMmbqrknpXMqXOsdq
	382dCBhvSP7g6NvTXH1oo=; b=AcU+wiyUyXb0b3m6IplOcPwV5jrmbrV+eas+mb
	lwQ7NMX/GcKiTvgvD8WZR60GQCXQLJr6k7qMHN0LLT+vXvjL1PzOoL5Urtj5zff7
	AMQxXuCeajW4kWo3ABRQr1cKEwJdttdW1jGsgs7OSDoIk03L+ZXV3Zdec2jSQNsd
	Bx7II4C5ofuioJDCU8XU2JXDLRFlB7wrwYcq2okijDNZZ6Pb7JeeqOvEYF5288eE
	A6R8WiJqpdjbypt5lsEoAp4HHN5Bnqu46TUGvIbgNuQ4c2pZjh0CwvJoc3ZA1nwW
	uQfhNXhs9P2GdwpwZ4b64wgdmlE3UX8b85HpWyQ1DdcdDxHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m3fud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 02:11:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so68858765ad.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 19:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780971067; x=1781575867; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwrSuIMmbqrknpXMqXOsdq382dCBhvSP7g6NvTXH1oo=;
        b=OLPAs1wCXuTeQXxpG1ZMF5hjCO275q95393eXyQnejAoUNAcBDogNPejzZDF7NQkH/
         9amlyoeFgguYOGQoilCi+C+9pEy/I6JGfVTjfecb7YWKm2bStUnH/5Qr2KtlkBfTfpQA
         +8MMwvqNFGYYsZSQDnpEBJSEV18zr6O1j4SOEx+uyeGYLKbViSP71MybSAcvh2tHcpkm
         N7F1Mw3tyKwA0TjYkVyleIi/iMABb1xIyBIUrvl4vHkJwletUZGGjk8A67syFS2WGTdr
         C8ua/T/QqHxboVxmCJo1lcKDpfZDn8yzsp0ufF3K7QREx3+/L7Aj52wgsExmO83Q3Prj
         SoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780971067; x=1781575867;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwrSuIMmbqrknpXMqXOsdq382dCBhvSP7g6NvTXH1oo=;
        b=YFQsIcJhI74N2RfMCycs8lqh4fDzCSO4E8sMhwOsA4HvlpXzhCxwbGIAfE4P9J3Lan
         d08qIo8oIfXy52E4o2O1m8+ash+0wI6lHaitdYIiMLpcEL27cgqAb8YL+xIWQxduM2uU
         XXo+eV/DFHxygeBFCTkupNmoX8pW7rL7i2UpZ6wowYnOU6rvI7naMgzjB2reOJyK3AAR
         jSykf9+9XkO4re7BxrEO2RVnPxzthAsQSCU9KG7/tNf/Fav/yz7lZiXnSZrquRKn3ynR
         EnlIewLBs0T6CxSNDvqivgF0OWuV3CAuwD2VTWjBHssl7DRNr/hrvQDDzhatpNSjGrCm
         y4tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FXQ4zr7iluLH60YpVZPv376Y1lFM2CDoPpsqlBsf/1xexxa1/5L/0qQ2PGIRK6W6bQA5W7HY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVvomZePKOnQcE6an6gF/0zNWmk/5YeGPy5b9DIoYtwuj9F1Eu
	TEk/GNxbb4/k7UN2nNT7f9YMebbEsCMb8nfgBOAXG3yqbQjWMyY1CBfd9ApsiJ1paeYJ+QrgPeJ
	BZUGfixXXVx6vEq1ciDcnDNXDkTvpMxaMk8MwE902dj1ydOJPhsRSC6ny0ur2TgUYq6wkGcBW
X-Gm-Gg: Acq92OGfQDAw8q9VrPDXumHlA+vwnZVRmK/ixritIMr/0KVO50fMTwXidBOqs/GwI6s
	ReO5tBsCnh0dZPFIN078PT69vU1KvIbGU5IiiYZFQrJdnpZe281OnJ92gnDwLtVpG1d9X08RSPg
	G0sAwXaH6MJUUb2EMwBqNxTlKcyxciEgLgJNrz7jQDzFBuFOkOyMMoKeAV4FrA1fAhw/m3M9lxb
	aps7dn6+vDC9tjzSgypl9NY/ZMuaxHlqTwi0gYChCnaQpd6yF1EKjQfdGl5m1KEgKNBr0yuhP6+
	RmKS7pxTIOlCt2vv/7Q3xB5WONLe6Yrjeaolm22ZrifsIhkHclIcAz73pAe64pDPIqkpjn4i4T7
	Ex2C6LXi2IZaXbxCL1ZWAjxNYDFwkkxQhy7MaNnKpWXPKSVJicDs0C6OgBU4EI1dhLntePQDkPh
	6IwtJNlDnaIw==
X-Received: by 2002:a05:6a20:244c:b0:3b2:924c:567d with SMTP id adf61e73a8af0-3b4cd0a5175mr20765087637.46.1780971067245;
        Mon, 08 Jun 2026 19:11:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:244c:b0:3b2:924c:567d with SMTP id adf61e73a8af0-3b4cd0a5175mr20765048637.46.1780971066678;
        Mon, 08 Jun 2026 19:11:06 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b374fsm16507525a12.25.2026.06.08.19.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:11:06 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 10:10:47 +0800
Subject: [PATCH ath-current] wifi: ath12k: fix EAPOL TX failure caused by
 stale tcl_metadata bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-ath12k-fix-eapol-tcl-metadata-v1-1-d47e6f90d4ee@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACZ2J2oC/42NSw6DMBBDr4Jm3UEk5VdWvUfFYgiTEhUITQJqh
 bh7I07QjSXLz/YOnp1hD02yg+PNeGPnaMQlATXQ/GQ0ffQgM1lmhayRwiDkC7X5INNiRwxqxIk
 D9RQIO+p0dSuqrJRXiBuL40ie+w+IVVSrczwHaGM4GB+s+57fmziRP282gQIrVlrnORdl3d+t9
 +l7pVHZaUqjQHscxw8c6O073gAAAA==
X-Change-ID: 20260528-ath12k-fix-eapol-tcl-metadata-babf79570623
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxOCBTYWx0ZWRfX8IRDW+4hTyQX
 jYujzdii/C2mYNleWgT0UbJHSoqXxCaUte4FOBTUKdwRZGNmfa2BXtiCbKbo2B9o1G4kd+sNVSX
 jsJazgiyzCi+7ETsrKFxHB1EuMOzSfnAFCW84ypDA66RICIf6kVW6j2g/ENNrgAeEBXDyZi3foo
 puucWYHtAes2ih4zPekLmHaVOeoQDyTu54Kj0VC3AggnuouqQVVuqeOmz3u/VY69n8UWAC8KJDu
 kq7mqva1c6f6N8GribRJ+5FVdmd6sYuJpQsLNyutkFj0wCZv7f8feYFnA7aWSvG7zHLaFrU6yj0
 jU3iqolISMb4GHCCCkmXSptxUOydg+QAZbDkPgeTrYURx4vbVMj4j9HZ8q0ko23lK44wN5zqJUs
 0LxsY2FSrj03uYfKXA6OEhT/TO15eBGaV290+JgBBwUQNQjBLUE2wKToCh5toF5QIVNHV+Yzw8p
 hB01SLIpNqoIPbEgWcw==
X-Proofpoint-ORIG-GUID: ffLn_uakNasgBniiUFOaLURGIigcNgrU
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27763b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cCjBz35ZmROaddx3XiUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ffLn_uakNasgBniiUFOaLURGIigcNgrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_191111_362223_735A8E22 
X-CRM114-Status: GOOD (  14.99  )
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

On WCN7850, after the following sequence:

  1. load ath12k and connect to a non-MLO AP
  2. disconnect and connect to an MLO AP
  3. disconnect and reconnect to the non-MLO AP

the third connection always fails with a 4-Way handshake timeout. The
supplicant transmits message 2 of 4 four times in response to AP
retries of message 1, but the AP never sees any of them.

ath12k_dp_vdev_tx_attach() composes dp_link_vif->tcl_metadata using |=,
but dp_link_vif is embedded in struct ath12k_dp_vif and its slots are
reused across vif/peer teardown and setup. Since tcl_metadata is never
cleared on detach, vdev_id bits from a previous attach remain set when
the same link slot is reused with a different vdev_id. In this specific
issue, the same link slot is used for vdev_id 0, then vdev_id 1, then
vdev_id 0 again, the OR yields tcl_metadata == 0x9, which encodes
vdev_id 1 in the HTT_TCL_META_DATA_VDEV_ID field even though
ti.vdev_id is 0. Firmware then routes the EAPOL frame to the wrong
vdev and the AP never receives message 2.

Use plain assignment instead of |= so the field is fully recomputed
from the current arvif on every attach.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: af66c7640cf9 ("wifi: ath12k: Refactor ath12k_vif structure")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 90802ed1aa59..af5f11fc1d84 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -943,11 +943,11 @@ void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 	dp_link_vif = ath12k_dp_vif_to_dp_link_vif(&ahvif->dp_vif, link_id);
 
-	dp_link_vif->tcl_metadata |= u32_encode_bits(1, HTT_TCL_META_DATA_TYPE) |
-				     u32_encode_bits(arvif->vdev_id,
-						     HTT_TCL_META_DATA_VDEV_ID) |
-				     u32_encode_bits(ar->pdev->pdev_id,
-						     HTT_TCL_META_DATA_PDEV_ID);
+	dp_link_vif->tcl_metadata = u32_encode_bits(1, HTT_TCL_META_DATA_TYPE) |
+				    u32_encode_bits(arvif->vdev_id,
+						    HTT_TCL_META_DATA_VDEV_ID) |
+				    u32_encode_bits(ar->pdev->pdev_id,
+						    HTT_TCL_META_DATA_PDEV_ID);
 
 	/* set HTT extension valid bit to 0 by default */
 	dp_link_vif->tcl_metadata &= ~HTT_TCL_META_DATA_VALID_HTT;

---
base-commit: 2e9422a6a2d8bf4036287c2fd3b034392af64048
change-id: 20260528-ath12k-fix-eapol-tcl-metadata-babf79570623

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


