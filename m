Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D9C83000
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 04:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGzcms3g66ClBMUbAsGHzOLkXJSGY0Hq5IfiKugct0Q=; b=cPS+bpudR3kB9q
	ug+EwsgOu8p3FahPISLUDOqykqtCF+Gts6KvWTYmO6qQ87iEN5GDcdusIcVkBRutvOVzePZ2S7nmK
	VNOwJdr7hmwFdyGDbQPjMEJpM+r6vqlTHzJOMmK4leqqAdhJdXrXsxOzS+Y5P56gUMhno+SdwHUcn
	69rh63JQG6097whnRrxO5yxN6YfaqstCy5tWmwkTYZg2jNxJIg3kQhIN1QoBydgC6tKEBIDSuQkk4
	rfKqlBYACejdbPpyYmk8KxqnayO6aFlzxEQyYFOXP/xgUbYkVEt2N9SDp9yJgQW8nkZkhoV18fMjB
	B787QItif5E/454/7rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5vi-00000001BHQ-0y3k;
	Mon, 30 Jun 2025 04:15:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5vf-00000001BGi-1UPg
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 04:15:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TMkGT1002614
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qGzcms3g66ClBMUbAsGHzO
	LkXJSGY0Hq5IfiKugct0Q=; b=AaqFnwHm6yBQRurkcdNN6iPNLtySSvS+eMRbGb
	MQ4XVxHDG2f6Jb1qAhTo717ER5E1K8svP9YDRjmO5b74VP5lhRv7Q01SZ8Gwr8lC
	ZKWujMFlnf/WKJZ8z7ARj/yfVIP1V3IvstFRFVp3vQ6wfbAQlRl6ZvTGGnwKRJYt
	mLkQZl/M/Z2FLDHcKc3UL+DEsYoDIDYq4dn0B9Occ29t2fMT0XN87RZ5gZFUKOLB
	g/inyzDTpzCswWfmbR+PpaGBnbXx65/kIxurV2CTeP9pt+mjMuugzk/XAd8ghkWj
	nytkAcr8p/r4c00o4tpoKN1H/2rjFxUhNHBx2sJq5lAImWlA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k3fq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1153187a12.0
        for <ath12k@lists.infradead.org>; Sun, 29 Jun 2025 21:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256937; x=1751861737;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGzcms3g66ClBMUbAsGHzOLkXJSGY0Hq5IfiKugct0Q=;
        b=SobQs6CqoC/J5i8Wn4MHRBYScabUpAAC+XWxbu0gk9mLm7t6Nf8/Cc48z1pqK6GBpM
         RorLVe1VHxCmOZVdi5GOx3V89XRz5cR5nCqULh7Q0lKL0yLhOtdzm5TMC5NS/I7PuBxi
         KLKaHqrHWOmUecMJueUoDx5C4XZGmbpzuJCthKMOd6huXLENTQH+Fc6jIxXQSdkjphOY
         yb2mFY1ePgIm6Z6zULyMB6styj1C+l23MpL0mMk+8rh2YyAYTxzl4hf7K+b4tBmFQJEc
         wul4i0smY34Elps/fRVMbCmvLtsd7Td19Qs7yIDxPY/omxdzebupwXaV3F18IvqI66Q5
         eDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQD0HYqCa8t7fljekjoA9I0/qbnqR35GXUS/Lzp4014A0IqiE2VVzxFVhZvs6QXX201FAiy0w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd2d6ZTCxXxWPwk0NMPjL7VuZMELHSgAi5OK8ZMY51dy8TzNc2
	z7rjHmK9tLMWufLCJNYTx6mHR/rFV08uCH5GKYtvAYwFS/r3vKVQULL8r4CvILqMhCjVY+4vUNA
	zis6mdoMbSYbGlCbIdOLG966aevV8hvcMcv+H1EWH/VkyAnRhIbaijWVsQZ14BlzEjsvXUD6m
X-Gm-Gg: ASbGncuttpF03C6vnlrNK/eqHjGc7L1HdwXP8ReiS0X8gGwh16E3U0mnlVpF9ZsQHPs
	Kqev+t7CCAPPieN8PaDBRCUpjxfhgQGEtN6P5R+hZa34NGYcjM+MWMC6KGuYOZNQZsrH/d9dzM0
	ktvTFRd4+iBud6LtAvqeqwlOC+LHJdH3R4DFVdRUnheVnstZD951Kd3fG5uwJaSRxsbqESkZ10R
	s5KBz+8WKM2XmojKvXO0rjAUtUnuXga2DbIuP4o8EXVpt05PaXzMEq2virWjIuV5AyZqAgQnozn
	vuKBZP/U9gMFeMVl+H92UF1qI25xi1/JFz7vy6KKMbqOo1G8jlyT0UDa5mvbC086p8I4LSZfmN2
	RRdZwISDfBB75jMynhbgr62XL8fSc0HQjxj7Fj0NYP+WkCNg=
X-Received: by 2002:a17:902:d2cf:b0:235:be0:db6b with SMTP id d9443c01a7336-23ac46072cdmr186350275ad.45.1751256936645;
        Sun, 29 Jun 2025 21:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqeRKfxDY/iKMYr5DMAalZ4UACgTDBd3pi1SPietxc+zp47vSCTe+s2PWEi7FrhvcHcloqnQ==
X-Received: by 2002:a17:902:d2cf:b0:235:be0:db6b with SMTP id d9443c01a7336-23ac46072cdmr186349995ad.45.1751256936247;
        Sun, 29 Jun 2025 21:15:36 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm69366955ad.59.2025.06.29.21.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:15:35 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: add support for Tx Power
 insertion
Date: Mon, 30 Jun 2025 09:45:14 +0530
Message-Id: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIPYmgC/yWOSw7CMAxEr1J5jaU0ERVwFcSiog7xJgmOW4Kq3
 p2ULmee5rNCIWEqcOtWEFq4cIpN9KcOnmGML0KemgZr7NkMzmCZc06i6JOgVszpQ4IcW422KDo
 3eN9fJhqvFlpJFvJc/wN3GDVgpKrwOIjQe26LeuDdDFw0yXe/s23bD5rnrcWeAAAA
X-Change-ID: 20250630-support-for-tx-power-insertion-336ff18dea92
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68620f69 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=j-PG032osGwMdhHMkLkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzMiBTYWx0ZWRfX8eTbgST3DwIK
 1bqwTINELhNVP4wBRNEliL5YLbQtEGG6PSPJZZTWbHFVxdOKNIaDE1/im+h7GyMaZp2f9poIIEB
 9h7K12LrNMRZV11nocVE8sGKg/apTPr1TyVekBtszEq4mXgd7hrWPwcVhDPz+1EUso08lgBMQGd
 LOAn9T1ki76er7jDqaQH+QtfooiJM+kXA6JitCgSYpuC0sxRMM3Xr24XRtvh9/25NCHrlR+i4mn
 4k0bfVNioGnlLG111NH1xQI2oSup74f7qMww9+mXptP6PLA6aFvlr7AV5bnlx0Dx+pWUylO7a1B
 bTwliYqbh8uinxJDyaro+juj70WCGXzwE4eAW/8f652GJQ5IdQDlSZqKSNxhCdC6fzhjohX5CEI
 JtaWpvvJVe0mb1FOl4wLwjikpLjw1hvs7qPAhvJM4Mg6DIMzBZkABPDX4VAIpCrMzaPqLY+b
X-Proofpoint-ORIG-GUID: o4BZ3rZuZWGxA35U0DGoito3lHIx2mUJ
X-Proofpoint-GUID: o4BZ3rZuZWGxA35U0DGoito3lHIx2mUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=979 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_211539_408177_28B118DE 
X-CRM114-Status: GOOD (  10.79  )
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

For certain action frames like the TPC Report IE in the spectrum management
TPC Report action frame, and in the Radio Measurement Link Measurement
Report action frame there is a requirement to fill in the current
and max Tx power of the device in the packet.

Add support to populate these fields in the relevant packets. Advertise
this capability from the driver using the feature flag
NL80211_FEATURE_TX_POWER_INSERTION.

In software-encrypted cases such as PMF, skip insertion since the packets
are already encrypted and cannot be modified.

---
Aditya Kumar Singh (2):
      wifi: ath12k: add support for Tx Power insertion in RRM action frame
      wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support

 drivers/net/wireless/ath/ath12k/mac.c | 184 ++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)
---
base-commit: 391a83d0c8ebb1e476cba73bf4c010af73993111
change-id: 20250630-support-for-tx-power-insertion-336ff18dea92


