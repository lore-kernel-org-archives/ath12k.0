Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4054AC369D5
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wyusSksr69Cv3nJpMPWpnt+Cd1CfyWw0302tw0j2jXM=; b=W4LQZipRoiEhi2jeHOjSGEGJH5
	m9ij1Oi1zQr3teqyRjqCrlvmLru3rvJVsU3Urh/g/VZzEC0taLhdPEROvzhEOa/Nz7tWz0nW/knNV
	8UHwYWz6LelZquJ+DO422iWtX3jaX3GlpfBWa5v4NBLO5p2cCNANygvGAU3/DNG01T4CKEDr8CctB
	USQ8Em3OOMWwxw5b3iCpdZBzWDOutUC94KH0ppBpS/g4j5FDwu4xjjxVN2nG9n24Kblq/2G/SnJ3X
	mVz8IqG6IybQ7wGonfP+LOAAyEjXvc1FxNtc3MZuc8kcGgvvMtHwMAQCJAxgu3S7bE1YZBUeEXluY
	3ChhO6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QGy-00000006jyJ-3dBr;
	Mon, 28 Apr 2025 15:19:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QGw-00000006jxa-0bL5
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 15:19:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8s3Zr020167
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wyusSksr69Cv3nJpMPWpnt+Cd1CfyWw0302
	tw0j2jXM=; b=YFHvPG7xB0kY6NqI68d2bwmFMEoi6h1Fh5J8GOiQEPDu/AxiJ6x
	ghvBv7iUybwPORS2Xpw/wiSdjKvrxJsOqWjo1JjtglJ7Apj2kTHR/4GIv+HprYRt
	NpMCu3GIog0wnQmXNRXXGm0fJkCSH0JOVsrdR4iWK7I5w1rlYZcL78vk9AuJ9sXO
	P3/l0DLQuydmuuPjdfQ3NjfJjB/LKaNBALjGngzi89CetsZc/pZsTcoZ9nePHKgz
	7NfW2bmB0WlNdKSTkPHW0/kOfAZ9EaUpoevYPJfQMiVcfNEQltcesbJU3S66G1A7
	jhn6LESOv3DGIRD44c/CWmAkSR6zpC10frA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hrh9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 15:19:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2264e5b2b7cso44227345ad.2
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 08:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853592; x=1746458392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyusSksr69Cv3nJpMPWpnt+Cd1CfyWw0302tw0j2jXM=;
        b=RMMkZ7Z1hO6F4INrpVpIGqUX7DAAZ4OuFHOeqleNBIpnfiQNIYeerWwnzhDVHF+xgx
         gDYU5/vbx8onPwUxGYG5SZM+FsqM4Pa/ST/2sepvbIyoHI/4YdXpOW6SgepsBrrZnC33
         Z+RS9sTlU/YZjdKFCB5lr+xYaLT4sWliVO0vqbdyNhDIRWFsZ29zr9Vu38N0pe8HToQo
         9Edg2NHsKjufP+ZEWeuFepLyHhK9czJyEXZsx+9VXr8ERGt5/3PbbcvAa3umVM5ejpan
         KEFn4yPWurltipvZ85SDsrqvJc1C+vf8Tq/X3rpDZMIgcyjit1IOJvWcNJgQz7MxRVfp
         sKjA==
X-Gm-Message-State: AOJu0Yz/8FnGccdnTn4VPWVJayfa94m858Q+t0NfT28h8HKCq9L6IAAE
	2pRt0FWWsoesWELEUrT9mKesEW1rgtuPK9rRVW93ybRgcH9jTcoYc8/cfi75AAMSgjLEEhjToSQ
	7ZPQDF25rBj97BqmYvylaktbipeukpVWvJYLuY3tff6JMCHvH6/uVXWbsM0TvevCAa8x7
X-Gm-Gg: ASbGncsKnfrJB4+Lq3VwtRVGdVTO0z4GtFKYj39UwFarGDDlGmef+RShwricVZftRTC
	OSUTt8PQ4a/3s87GyHYkMxy+pkjCieyyTE/8rKxa5iYcyXYapcJI9NFMWcvH0aPLFb3VRDEI3bP
	yWOmXbbqvjFuIjqTGv9JXfpcA3icQzd84ik1toeC0J7sngaG/bYnMC9SiKTe3X9KtW8+xur0OVB
	XIf+LjEvo/QunEXH7AENBjxsmnj+mzTDWeMPL1+/fu/9y2gKAG627UoCx9H+WMvvs3hhXzbrSCp
	hh678pFI+BRCwkFQwFSbJOhb3wvuQJssq3eDkpQySH70x/oP+xbfNIt0Cp2Va0uDLS5dr549hjf
	+OTDdc0lC24CxlVBbKYHbFsLDK6WDDyVmhyRmCMPf
X-Received: by 2002:a17:902:d486:b0:224:1001:6787 with SMTP id d9443c01a7336-22de5ec197amr549655ad.4.1745853591648;
        Mon, 28 Apr 2025 08:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmoPwxEVydKt3L3CKGS9MhZxpEWoNM+XBG4zdC94mMzrvyReTgE956dSSWbqK5ImIcNvIPqA==
X-Received: by 2002:a17:902:d486:b0:224:1001:6787 with SMTP id d9443c01a7336-22de5ec197amr549245ad.4.1745853591256;
        Mon, 28 Apr 2025 08:19:51 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c13sm84134515ad.162.2025.04.28.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:19:50 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] Add split-phy scan support in single wiphy
Date: Mon, 28 Apr 2025 20:49:25 +0530
Message-Id: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6DocDD2ewswS37eWf77235tvGg1C8PGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNSBTYWx0ZWRfXzWp9/kNnKWq3 syQUE/YRXg73NUDCobOC2zMYOfnAd6RkG/HbbXchPFlRZhRHMsHHbzMwcq/cJ5cih//4lcI+SFV mebFFNoofrhMeWLzS+4FAylai9oPFAnBoNQzkQxv0PtIrVVmy+U4Rjurd3W4ZG3q9hUKkVmi54Y
 alL/eZgICafwYsJeCXluwCirFak13ZfRpQ4EYSK5uf8Lf7Sa/ZxS256ScNC9os5AbXKgs1rrdJI XGfn4CEWUH+kWjEGhtdkgfgtYB0/Byr+7xGdeSA4JiTrvGCpoRzwLP3g6ARFg1Cpfk1xMY97piK GZg+K1IGy3Uuomu1cXDa9jMX58kV5JunQQ9woyvJ64hnllMZ5qlMcVFg0gGE1NIhw224YtANrCe
 iLAZNXJB60V0REmkOMkqfzyJ5WzaW7bnUL8He+3kh3L6v60Rp/aPwc1f2S32EST8KrHDHa9C
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f9c98 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1ZOo-ZK77t7PqXeEs4UA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 6DocDD2ewswS37eWf77235tvGg1C8PGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_081954_195708_C97AC560 
X-CRM114-Status: GOOD (  11.47  )
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

When two split-phy devices having supported frequency range in same band
(as mentioned below) are combined into an ath12k HW group, they will be part
of same wiphy and hence the channel list (wiphy->bands[]) will be common
for all of the radios (ar).

1 - 2.4 GHz + 5 GHz Low band
2 - 5 GHz High band + 6 GHz

When a scan is triggered with frequency list containing frequencies of
both  5 GHz low and 5 GHz high, mac80211 generates a single scan request
to driver with both the frequencies. This is because mac80211 splits the
the scan request based on band.
This results in driver scheduling scan for both frequencies in same radio,
as driver always assumes that the scan request frequency list from
mac80211 only contains frequencies for one radio.
Split the scan request frequency list based on the supported frequency
ranges of radios in a band and schedule scan to corresponding radios.

Since the scan request is split in ath12k driver internally, wait for
all radios to complete their scan and report the same to mac80211.

Depends-on: https://lore.kernel.org/linux-wireless/20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/linux-wireless/20250417073954.632994-1-rameshkumar.sundaram@oss.qualcomm.com/

Rameshkumar Sundaram (2):
  wifi: ath12k: Prepare ahvif scan link for parallel scan
  wifi: ath12k: Split scan request for split band device

 drivers/net/wireless/ath/ath12k/core.h |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 197 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h  |   7 +-
 3 files changed, 160 insertions(+), 48 deletions(-)


base-commit: 21346cd925c2567d5f56cdb1421c94815ac10221
prerequisite-patch-id: 621a0dbeb6269fcaf27c808f951d9e2a2c3ac8f7
prerequisite-patch-id: a9eebd8a3cc3b1ed9ed3574ce9fee088af9c5798
-- 
2.34.1


