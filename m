Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF7ECD98DA
	for <ath12k@archiver.kernel.org>; Tue, 16 Jun 2026 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tr5DEdIRkbYwn8L1Ccvfl5JRCBDqiEewip7ejeOVPKA=; b=Cxe4Mts/CRLhYhujT9DFrV+q4s
	/bHau1GI/QPpkyFd0AQbyJu58uo/CHGyoWCPTNR17S/tTxrQFXgG1F3GPXZiZAzC6M42qJBaB+jAn
	v46pzaZKc+fdj3+DGi1TqfdYAw6eJm+dx9UgWFpf+9zhhqsORVyg7Q7KkzVIzbrcyzht3ITZAaqM8
	27UXcX65TXIpNZJSLBYIM7mx/wPrqwvheWqsZLits/qqHXMef+QcrT6TrTMx7j2Or2H/YtLDv/3L/
	TDVVcMcqiuhB+Njwd/78eHt51Ivg0TVaT7I5Zv0SxgcBKQnxGH74dqXeY3bdixlRAupQfODlagoo9
	MTCm+F0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNDY-0000000FJZl-2XKE;
	Tue, 16 Jun 2026 06:24:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNDW-0000000FJZM-11pR
	for ath12k@lists.infradead.org;
	Tue, 16 Jun 2026 06:24:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G66hqw2893888
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 06:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Tr5DEdIRkbYwn8L1Ccvfl5JRCBDqiEewip7
	ejeOVPKA=; b=cvCxV5HhDMSPIFJcn6hrHvV8fvsRSXSK85bDL7WH5fujTqwjB6/
	h7fGW8zuQXOgXttYpiOwmN/Ab7XWaphyuCBqhFmYYB39ulqx0sI2JH8SVP8MWQt5
	9VbszJAx+1eNhTHJ6DhahpNVEz/gPZIiVrkJxERKQD2RuWKpyQtUVdq7Q3bUHVa8
	0Z1FS+788v7mgEsi2ksJfsTosp5wt4Lpr58DC44nhoHtx9Wv/1PLFIJKjqQUP12s
	+qYBJwixdHcneZrXWEMgFW9XnU24BoYtqhAmrQIZ++r5qUbcrn/VAUnXF3NtGk9t
	ft04b/2IcvHuh6V8Kqz5uWUPmi2hjZW8JrQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhmqmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 06:24:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8628dc1802so4495945a12.2
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591048; x=1782195848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr5DEdIRkbYwn8L1Ccvfl5JRCBDqiEewip7ejeOVPKA=;
        b=ED2CYsxBNLZHL2ZDlFMkJc9IFyqeY3V7f78Gx/I+F8XprOOU4KzkJeuRqwQGERgXD3
         RL0Lmy5SIlbCJMnkpszSjI8IOIWsgjl5zGi/KhkdmNXBmMc9hVdPoUIU/6qei6tXjJ+z
         GncfzrfqjyPVfmMSgto7Lzd6cuO3ggHjSfLz48eXGIUM6ba8s/qJgYFC2USvJ6FWFa0R
         pMqvD7wre43hDfFR7eJ/AB70KaiyOx2njV2cOFMKze8IplNjIu+RCJA6bc4dZXlTD23O
         k2igntpsd67HYYaSMRpBxuGInkLFriSBRJGVSwpPQITeppjS7HohlMK4UjBAxB7OWSEH
         QpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591048; x=1782195848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr5DEdIRkbYwn8L1Ccvfl5JRCBDqiEewip7ejeOVPKA=;
        b=DOpxshiv44wMlhqNMPV7qpUKzT1ENgtSw1NMkfcb9WEUknjKx2D8LuPDr16hozn6rG
         8VdfHAKKGGWZdYpSY00D7qvWqc3E3mjrCZyiDMRkvLzcwTeUbx+zvre3S9+C2QSgH0VG
         Uz4w9c5sDG/JxMDFKPrMlhg8C4d4LX/1ymln2uDHjk2w/uIDOV4pcLrv6ghciWLUHA/C
         +QTEQ4852q0ePCLFBmVor6kz99JFfgt7HoWz5iRo8UmNKCy3iytGgrjtbPgCwx4FyNjW
         aMMaXUf+GNilZDCMpZaCx4p0ratY81njRr6o8I8V3jnRxTNRqM3MCrsviiIn5BtaZcUI
         vJ2g==
X-Gm-Message-State: AOJu0Yy1e4yDm2lKhCGCU45X5tEvA9axMmMbbTbo8Du6fLsTOk5uyxca
	cvswqh6olJUeRFi5HEBWKbqavIeZBsE0b8Z/EBfe7aZDGmNW9td9W5ru+BKXkHHFc6Mh/S+bN7n
	aN+sG1X3dv90+I+h6o14VjZOK0InT/brVJzQmBrDvkO0OVFKa66hNYzw6FPv3u7l7lkgiecuZ
X-Gm-Gg: Acq92OGkNb1RbJNGxiakYokHINphxs+JtqjEd7SVElGmbx5arAsJBENUL1LO6YxjG8k
	G8QSfAe4INsfxvDRzWltA1OemthKkbsAkYIgSjawojE3y1B7Xl7QUEMZ8uDh1QgeuO+sEqHpnjy
	ZYk+EasbPKKwzL8qrWCDLfFsnZGTzIK/4+VtVJju10bjzzNyVb+MJ/ba76zWz8+cGGBsTcIgzXP
	z/7cbjWCX8P62ZaKKsZLiDxxSmGG6ol28/BevADJxAKqpAcIGiiHo00qNV8Y4jFsCaad8eVGQRk
	6ALkOr+xYERUn2CkF4mqdks4XmLe5RD9lPfr25fmbQxFpu9N9zr4c6ftITHeMAxgOvm33fo6PAg
	0daMOi7BcNe1bL4kJ5akPUs5S9pF9LO/1cJBANL9w2oDtmkVIbV9thGHXbQbx3rn6tadlu9NOgZ
	W3CeHi+0zVqIxOAM7fSTixb30kLJraul0apqR0pUnoC0x5
X-Received: by 2002:a05:6a20:2443:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3b7841ab01dmr19896339637.36.1781591048160;
        Mon, 15 Jun 2026 23:24:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:2443:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3b7841ab01dmr19896319637.36.1781591047718;
        Mon, 15 Jun 2026 23:24:07 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866518677dsm10591529a12.19.2026.06.15.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:24:07 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: correct monitor destination ring size
Date: Tue, 16 Jun 2026 11:53:42 +0530
Message-Id: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MSBTYWx0ZWRfXxj98Jboh6n/B
 G1oH8s5xY9/AwviuJXUpGRW3FAWWvXZSDS5qPhUdIMUr8W1eyv+zETan9PuXlHAqvioSP/zGd/2
 9l3DkPQg5687im9XSZUvVuspGTv6EYg=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a30ec09 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=b5TSSxGLzCK9vQyPxlUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: HgRGlaUAH4FrA46lTdTX1xclehvIeiRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MSBTYWx0ZWRfXx28oCIHK+txW
 2Gns1erHeYAzE0GqYZiOcMdMBeTsuB9LLBtRQIXBEtRopcLJ8Rz83zmcy9eZns+DjpvZpMPyrn6
 m4bjAvwmyvDKNIbPl12t2Y3ZrOOn7MouySkzkSY+dQ4+DUj6RyqpyS/YsJXZFfTOk/pM9Eh7/ct
 Uiwx8LWlM0pdkk5TUNS+PWGIZHS9AN6Knf0y6WqOn3IWwP4+R8Kpmbdv1DPew5WyAh2a0xsVS7l
 OY1D4wQeX4fOINjjImebI5zguuX87Qp05q8sppdBOlckGk35x8zIflJvK+x/91gLTCSHAKBVl6w
 SZt1CbGUMwi728NYhW1ny38GrzHFsDoJ6ZMwnLnSZLYCuTJ4WFaOYjmy0fwm9otquwO3IKAuuJ9
 pmQrXXissuD5Hd4yue9C2/daiUPKOmTVU8uSq9hSpaGTIp2bwJ90o8Ugb9PY2qUpVQRZ/BwDfVZ
 Go8CGl1znjAMuXBPn+A==
X-Proofpoint-ORIG-GUID: HgRGlaUAH4FrA46lTdTX1xclehvIeiRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_232410_399415_D4741606 
X-CRM114-Status: GOOD (  11.35  )
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

The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
which is a typo. The intended value is 8192, consistent with all other ring
sizes in the table being powers of two.

Correct the monitor destination ring size to 8192.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: defae535dd63 ("wifi: ath12k: Add a table of parameters entries impacting memory consumption")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v2:
  -Added fixes tag.
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..b488bd8fea9a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -49,7 +49,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 		.dp_params = {
 			.tx_comp_ring_size = 32768,
 			.rxdma_monitor_buf_ring_size = 4096,
-			.rxdma_monitor_dst_ring_size = 8092,
+			.rxdma_monitor_dst_ring_size = 8192,
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 		},

base-commit: 83f028be15fe071efbee8e27837538d6cca77e87
-- 
2.34.1


