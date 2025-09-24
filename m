Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113B9CAC5B3
	for <ath12k@archiver.kernel.org>; Wed, 24 Sep 2025 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/tLFpuoba5oWkFVeSAHO88zHOd3TvdB4izNWyYVs1w=; b=otwRlLRMmrfMlrW0apxScw6lZ/
	8O20aqcvFifRZR/Y/wBr8Vr/LHc0KJ9JFxonI9rETY5mgwl4FTpPfzJEi2DVJ+e3d/pHBT03VtxM+
	82ymkAhKdMY8RDJCiQTtfv3GeOq/mRmX5jnloZjq6DwWtJAoEg0XDUpSTsnpanLZI4p1vqvUhFulA
	4wpPGT1p7wNI2jOU3MDgotXQK0IdTP4Qg4kDZCXF+U93Zk4MJAnq7mpt0tXpWgO5U7836auZpyJAl
	L0fRQcp8hCvAIFNY+GV55XMn9EfbAJZyad0FCkGTZRqiX/9Ce6XNwJickxKqtkqspUeq++Zu1j1b1
	DU9n9tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P73-000000001mk-3EDh;
	Wed, 24 Sep 2025 13:00:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P71-000000001jU-1UX2
	for ath12k@lists.infradead.org;
	Wed, 24 Sep 2025 13:00:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iPHX018382
	for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 13:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9/tLFpuoba5oWkFVeSAHO88zHOd3TvdB4iz
	NWyYVs1w=; b=lQ0wGTC7XoWjvbVfV+A7TzkkwtbZ4QRET5bYHNIRiVktl2crB01
	9mXuYKvvkcW99/HNm5X6Vf4wD0MbjgXI7RUJ2z3Vzb0gj0ubOgs2EXdEfpBysEcl
	i9vbMoafvEB9K6SqSnyMbF/tLs1jNg89bdHcS8mefAwcbNtd+5Ztyb/6a4cwKvh4
	6/NVu97YqFAEXF0rcpLmxVe1MIrSzSS1tS84QBQ//mazjkctY0+l4ydbInz+bZtg
	VTKJt8gusoYW/npZcgBXYGZaaYvylsRVLxfBmjkk230lyMDYqemjYEscai7Nz4Ma
	kI9avrmjt4ZgYiKG3KRCYQQWMWfYat+F2uQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk89yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 13:00:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4c72281674so4565352a12.3
        for <ath12k@lists.infradead.org>; Wed, 24 Sep 2025 06:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718844; x=1759323644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/tLFpuoba5oWkFVeSAHO88zHOd3TvdB4izNWyYVs1w=;
        b=Nf9BH5fpJEk56+92EDy4awUZKobeRqQiKALMUQRyvZ09yy3xaLF7oF+wTo1IUpEMzq
         N46bpsVn0Gyu0cXECHkPlZhB4VCJxpdsbn2XUM+pNx17nGvTwuPSvNn1wCrF0g/U44nS
         ITe5tsvlG2iQlv5gaozN4+KJU5wOHHsyBb/reCIFVsdTUK7xN8Z2yMf9NCPS4HgZq3n2
         gI8Pr3ObF4DFY89R0cbYZU6bhakI4bTZLyfTxosn2QewPSwBy2r/OdRuytp4f2l57nwQ
         vZvS+GZiIEVj6rOOKUNeBx5HA/x2ke3wwvBpPo9Diko1G7lQXKgngzVLWUOJBMKxoLf3
         c/AQ==
X-Gm-Message-State: AOJu0Ywy/hzcUUr6XORjOhLu7KDTdwMvr/gBTv9mjwmTvaKPX6euFLHS
	26vZ5t7eT0YRLPCsgNuCSmCXUlDIPxYfGZjZgnUKqeOrhE7GbyOJH43hdTmro0FQWBwCspnykt2
	x2NDwjRCx0hJdDU1PYue6/xpTmjdOz768w46/bijvGSvscBTZYc3Y4lsXXBfXFv/jK6J/Pe5B
X-Gm-Gg: ASbGncuIwVLKYd8imenmnDaOI5+Rbm3N3o7Uia+E2v/GeYEa+n8zdmRUNF76M4s/KBz
	YdrXKx2TzFbBwglcPD6l4goMyAqogKWna30wGUvrb8imNl38vUvXo+j5DFHQJn+lyG12Y0+7CyG
	pw/buHkE4RxhHpK0lhnP9QPI4BDT1WWu6e1/2XA3O6nraW/gmOKQ7qoGgoK2CKo+yG/tqyd8HDg
	IReljjj5Bq4XwwxmyHSe9+Aj9UHuja1yw7NH+C56jQj2WjbuxG1nzIic+IM266m9JV4Qkjy2WrN
	msaFLdavo9RrJs5PLVQ8ntRbtksUenORziZeFaw19jVRR03Jgt2EnsAVa13shEVUJoMyu+OTI/A
	1xywvwUOcXkZybykGJsYhBuwVoQVJMaTYpx+TJEbjIODpQCvX1ltdtNpcQ6Wrum8=
X-Received: by 2002:a17:902:e5d0:b0:267:f7bc:673c with SMTP id d9443c01a7336-27cc678573amr68444695ad.44.1758718843482;
        Wed, 24 Sep 2025 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnTsbdkxIvOZjvhLS6YHKQ3WGSbY0tHoisdinofH9nxgMiG0eYasrFh1hQhdFKaEXjW8Phew==
X-Received: by 2002:a17:902:e5d0:b0:267:f7bc:673c with SMTP id d9443c01a7336-27cc678573amr68444005ad.44.1758718842320;
        Wed, 24 Sep 2025 06:00:42 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26989844036sm182323915ad.31.2025.09.24.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:00:41 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aloka Dixit <aloka.dixit@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH wireless-next] wifi: mac80211: reset FILS discovery and unsol probe resp intervals
Date: Wed, 24 Sep 2025 18:30:14 +0530
Message-Id: <20250924130014.2575533-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BeAIjcy0EJlQeWly6KIPJn-4Ep2H_jra
X-Proofpoint-ORIG-GUID: BeAIjcy0EJlQeWly6KIPJn-4Ep2H_jra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX/KI20m2nAWXQ
 QRVT19P1ddUtMIou8Pu4oQbWZLPP4PND4GpTv2WEBIwNlwFGvJ9DX6d7+94eDGqEubE3d4cxadd
 CFHWUTrfbpVkB9sfMJvGI+2s/jnTl00bHUABWR54vP2vFIkhvQPJjjZupGl19c4tDhGfe1B8UBr
 bpOuLoeIdnRCVngt7YnZaaWo5+ybIzgrUDioia8reKkVHQ4gOExJJpr+Mewv4/jwxt8j96QHacN
 GIRsWuhwhKMeD4fJBu1tZyvHSR7MER34SVqn5KUNE5iKqHwMH9VunN/h2N0VV8Q1PdozyvswpQ/
 3UcW0T/2XMNSAFpsXSdl6FKXVKREdEIkdnJds6GhRpzYhxFGJErJd2z3fYmx8uyMjxKdtEUX8Jd
 5moozmXq
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d3eb7d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GIoCXPmBiaAohYgo0agA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_060047_513093_288BBC80 
X-CRM114-Status: GOOD (  12.40  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

When ieee80211_stop_ap() deletes the FILS discovery and unsolicited
broadcast probe response templates, the associated interval values
are not reset. This can lead to drivers subsequently operating with
the non-zero values, leading to unexpected behavior.

Trigger repeated retrieval attempts of the FILS discovery template in
ath12k, resulting in excessive log messages such as:

mac vdev 0 failed to retrieve FILS discovery template
mac vdev 4 failed to retrieve FILS discovery template

Fix this by resetting the intervals in ieee80211_stop_ap() to ensure
proper cleanup of FILS discovery and unsolicited broadcast probe
response templates.

Fixes: 295b02c4be74 ("mac80211: Add FILS discovery support")
Fixes: 632189a0180f ("mac80211: Unsolicited broadcast probe response support")
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/cfg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index d9aca1c3c097..c52b0456039d 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1876,6 +1876,9 @@ static int ieee80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 	link_conf->nontransmitted = false;
 	link_conf->ema_ap = false;
 	link_conf->bssid_indicator = 0;
+	link_conf->fils_discovery.min_interval = 0;
+	link_conf->fils_discovery.max_interval = 0;
+	link_conf->unsol_bcast_probe_resp_interval = 0;
 
 	__sta_info_flush(sdata, true, link_id, NULL);
 
-- 
2.34.1


