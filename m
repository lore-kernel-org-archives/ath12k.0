Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D23F513E9
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 03:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACNcy8M6MNF3eJ5ymytzBBTy5+vI8OGJjmPlI1G45Y8=; b=EjWQuuM5CVClV7laLYUPjhovAQ
	L8khwBmXRgefAOFm6eqEasqvuNvORto6vSjQ3UknNcyYiSxoBnEySmaqSZhAJyTXjZEGNXveEu4GO
	zkXOMZI82aYJa0E/lL78F2loCSnvZFZaEUBOdeCL07Y2gj8tBqVgJllo4Lz/lR6sleTjEWN2p9Khp
	ThX4cRXrLw8+BHPKn0ghoHHWhZKiMRJkGgcIh1DVBMLsgVaLnvWRpwI4EEpw5zE8hhkFXsDZGbJAJ
	/hQ5/bq+cLwOrQ5QQx0/pxcw8NHHpa7xVs462c/H0cZYFVtU5yNZq3fgweMQjKOW/4gMaUHfFbKaW
	lXvJcWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLmN-00000002x3T-03yM;
	Fri, 06 Mar 2026 03:23:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLmK-00000002x37-19cw
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 03:23:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmYHD1802716
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 03:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ACNcy8M6MNF3eJ5ymytzBBTy5+vI8OGJjmP
	lI1G45Y8=; b=kKJhL3YjYvbJCW0XymaAub0VHZt0iHb4C1zU2smVVyZpBZnsYc6
	4Pc0UDtrJu89LmDeyUs2SglINAtolpk/IfK1Hkcx3MrvVOfqG0Na9r13U+g0ZOC1
	eorlZYlK9bbrEN9g+AC9BTJPD1XY3Z7hCRfDGl3WFq5pN55NA0Nrcfxhb14S84LP
	++kToiW0vrFKuUndlk0NBt3TCvtI7+pIuWPifpCr9/mkBg2Q4dyKykBHevvUnnhx
	OZNmkwsLU4jvpHo7Q9Pu81Tfj7cbirHr69Vx2i/la5QvtaSFtaGxDNjZl9NZiHni
	Ui3csxZ6Kx7tITKx7KcBhCr/cnv0ME3i3ag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srjp8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 03:23:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso77617b3a.1
        for <ath12k@lists.infradead.org>; Thu, 05 Mar 2026 19:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772767381; x=1773372181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACNcy8M6MNF3eJ5ymytzBBTy5+vI8OGJjmPlI1G45Y8=;
        b=JpzN4RZWZscV/tToG/8fEHeyO4osKvEfnj/SVB+JwO40ke8iw/eYNjcGv87+HgON1y
         rqmQWoteS78pfqiBF+QQJmKhAOHkd3kFG92K1O5wBnwc+0odcl0wedDCiq5Br47PtJHj
         G5kJglJW+Vv3OiG+yIBLu09s1Hel/+wAQoNtPj53J8O1IIQiIivawcPo56ou5nf58lxX
         NIWwMYsZRODXlI90W87JVlQMkJOXpyVhAxEVPxmvpQ38kdfhkadxxmPeL1IOW/dLJ7fX
         nB/xdOQfTzEPs6aRNR1VXloGo1Bptfe09CS6EirQm6XelKy4OLcXWHXk8cObSog/12bL
         STCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767381; x=1773372181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACNcy8M6MNF3eJ5ymytzBBTy5+vI8OGJjmPlI1G45Y8=;
        b=qXD+dbK3HTOZ6scoXbEVjOLolyd2eCojioo7pPJV4l8wisWkjGv5u25UZrXemqFzOo
         519HBEJa9pFG+0vn7S4E1Y1J6ZpV7+f/ZGuY5/a/fOSzYki+kKAaF96A4Qmlp+YSkQKi
         eH9vtfKX24hLxVEoTfxdZP50/Otnn4Bb2/6190AOF+PTWRCrnbU5kXgmfYIXOvHYvCLS
         fuLCW6EayWhZhQc9TICMuv3y3x2obe0Q2QdF5VieFBKiMYEpx7IwKLRGFL6vr7JR/MhF
         rSWBs2bzS3OyhkiItRXU3fmQAaswd86Q666DQDxTVKU+BrkXJ4+b0HyWE/zgVH4G5Dk0
         +ndA==
X-Gm-Message-State: AOJu0YxYLIAPfhbkpM1WQ8s+AGcae4vmD5f2Q9LJ72UHEo/Iqd8xj4n2
	shR7bRwdEfpaQXbKHtg4vJiO5a8fwVlhbTQvvN+TcXMQqkwk445EfGkXm0WXraMb+WDCRitsHLK
	0qRDH8DhO/2WrcxNufyxOb2y1jIGPTnPo88m8ruVuFJcaCdqMwVpc3BtUoRMGRuUK27gBa1lt
X-Gm-Gg: ATEYQzx10Sv+SJ2Wi4QGH2FcpATphNkGddDpcWXJc7z4Bcsch0VSpEIAowctReVGa+H
	r7FT53nLC+C2+ufwR44mSm8IZsNUEPpKQJ6TEb4Lu6LXnK9fcF33vkxx1e71gq/8I7iay77FwcO
	Qh6s/mvYayJ3If+r5lOtx4GOiYb42UOZ+4ftr4n4xsQe+FJ5rZ8UPMXJw/r1pX4WUz0Gt1scVoV
	aQk2LB/XlkNHMhQloKRS1EJzC96wxoiVWwOf5tIr5a+xPnXQOiTGdXV6v2HwgmwxvG16I0dQxqC
	7F6k25gyn4Mqa34N23RMix73MLsis4r2rWZmQGt46XfXU/PDk3cPWrE4iXRy2nrAY5U64OVx6zU
	vQb2BHagDZkGt4mUeeDp954nAjSmTjC+VYs8LMZxez9HANgFLg1jU9LW+jXFQRWo45jXRX4AaYy
	H7M6IS5uYzICULpao82Z9kmiuXTFbeCj4tzgZskSU2CX2w
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr562956b3a.50.1772767381467;
        Thu, 05 Mar 2026 19:23:01 -0800 (PST)
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr562930b3a.50.1772767380992;
        Thu, 05 Mar 2026 19:23:00 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6d3sm160523b3a.18.2026.03.05.19.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:23:00 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Use .mbn firmware for AHB devices
Date: Fri,  6 Mar 2026 08:52:52 +0530
Message-Id: <20260306032252.2237722-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69aa4896 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=t34rvWxjL5Y87QPrXd0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lavOAG87PcpTlvDRqLYAWjzn30Ve6GrE
X-Proofpoint-ORIG-GUID: lavOAG87PcpTlvDRqLYAWjzn30Ve6GrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAzMCBTYWx0ZWRfX7Izk3ytMzpev
 raGNBftSHVlAyOE9bV0Bo2WUlLv61LUIUjkIPzJjJbuiHh/Cb8nUmWJU7iposOhQYsA9Z5GlagR
 wrR91fRRZ0xWOwYQ7HC8GTKlokEADfY7Jpj1Zmj7HFMC6ROIv+YLnOwbqb4tyJI9jhV8dxmeNlA
 fXYL08N1dqhiwnLrc1T0OCU4TLSl9R34bif29nQUMDDpPHqgIQvrJcojGJydDMITp8pGWXcHWpB
 yKgnUsfxZlI0SJNPh26bWgyUe3e6HbiridIXrXr6RVR6o1o0Y56HHNxiVJsnkPmuk45nEy0r0Io
 yEMeIeyakTmnWEW69x2EXOz1iDq+N3Tia3wjQJAPRZzM7XrWhnGmuoVtnIBu7URvguuXzYt+5Mn
 5bm0dR4oDsg34FnSfbNcjDw+JkUajZupKt+YAj/5JnRSXjxrb2zLjsIdxYgnmvYuGNKYNFcsoph
 bS7vZ20bvNuKZKZ79hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_192304_437990_6751F072 
X-CRM114-Status: GOOD (  11.51  )
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

Currently ath12k AHB devices request firmware in .mdt/.bxx split
format. AHB firmware is transitioning from the split format to a
single .mbn file.

Update ath12k to request q6_fw.mbn and iu_fw.mbn instead of q6_fw.mdt
iu_fw.mdt respectively.

Note: There is no impact to current devices since ath12k AHB support
is not yet complete and no AHB firmware files are currently present in
linux-firmware.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 8a040d03d27a..be9e31b3682d 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -21,8 +21,8 @@
 #define ATH12K_ROOTPD_READY_TIMEOUT		(5 * HZ)
 #define ATH12K_RPROC_AFTER_POWERUP		QCOM_SSR_AFTER_POWERUP
 #define ATH12K_AHB_FW_PREFIX			"q6_fw"
-#define ATH12K_AHB_FW_SUFFIX			".mdt"
-#define ATH12K_AHB_FW2				"iu_fw.mdt"
+#define ATH12K_AHB_FW_SUFFIX			".mbn"
+#define ATH12K_AHB_FW2				"iu_fw.mbn"
 #define ATH12K_AHB_UPD_SWID			0x12
 #define ATH12K_USERPD_SPAWN_TIMEOUT		(5 * HZ)
 #define ATH12K_USERPD_READY_TIMEOUT		(10 * HZ)

base-commit: 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da
-- 
2.34.1


