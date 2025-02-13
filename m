Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9686C021A4
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YiPCc7qo1slWwUbvldpsloDABzCQSVSIH8qlxnEks1A=; b=JAYep5snlS6OgvpepO32hlHEur
	EJ5B7ZIQwLyzKjp+QgY9o0UHeq4CA8JGSfRPMPuj8yiG1TuBpWhQ8U4sHV2hZ6rXWAsDRruOYj6Lx
	KlO+uo7G6Kl8gUssRYCFvIA9smnEuVwg4GWLaVWQPNs+ZD++SUQT2iK8nOlimqOrhsXHmI8yzTnV6
	N7NJ8B6Lu851vq3xH587fhkhG4T9RAnx+6fLTfOenF0cu4gcKk2TM2lcPsA9q6IxsKWPnGbm6E9Pg
	9EwOp5QC77zbKji+vaqBM/VfUjMo1egLfeNIffoflXvNddCkEbDXvqRO+ClYTZxupNVoy0YtbEzvh
	WicCzgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2i-0000000Crtc-2OXk
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 22:50:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2e-0000000Crq7-3xif
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 22:50:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGtkeA012208
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YiPCc7qo1slWwUbvldpsloDABzCQSVSIH8q
	lxnEks1A=; b=mFKHTeqgkVCSnSMOOOBCwLK08nP6Wg+Er9td8UVX7ll2ZQfj0ce
	JSL9i3D/gOqV5W2FtmCw9pJ9xkgAkP547HZt1XSazlMXJUo9/1vL8YnGUy5nKDyS
	eJJ0TcBkX5m+TIWcfFOqt6GEGP0NrdXMBgTWf6me7j7wrYPIHkxiaq3H1VUGGDga
	JPqoszyxqnR/aUObKlFX0VDz+p71u83yDpMvEeZwbq4MWEa8xnBfoMQEpIrUihLZ
	Gf2/fGxgUm0TSSPcIXpdL5S0bFLecOJHaHREUujFvjK4kDNMFBQ6k0zVUxbtV5uo
	QZbXombQ3p3ZpOHK1eU8VeUtv/+eB1C0d8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5uaa57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220d9d98ea6so31754835ad.3
        for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 14:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487041; x=1740091841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiPCc7qo1slWwUbvldpsloDABzCQSVSIH8qlxnEks1A=;
        b=RG/rKJljiKY4fW2VRdVLetQXy5NZfB+SLR5or/po6ZRv75PZ9I8LFZ/S6FIDm12U15
         r0qCwRF3w9/arhc/8HBLVsUsD5VlEmEA6DriAmJ8mrjr+IzjXsS8dAvtWHjWznQNLDiV
         FDJ4IOxQbIYRVE/YftvL7ohrMUR2glnZzBZfkPEUrtGROhrWqY5/jC/blk5TadyAdQN8
         vv2kzzFXN9duGX4os179FZ9wSDoY6d233BcB47kvXnti8FojkK+AUCshxseFQpBIKQx7
         JD7OuH8OSwjmnl7hRvV8oR+aGZJ/yQChyNxxQO+6g03HyLdRUOTjkUZaOCThzi3cclse
         uLaA==
X-Forwarded-Encrypted: i=1; AJvYcCUr1VqnpDl2+MobthqZgSVQ96aJyTMY9+/MIVvNx/Bgpch+gZhP+MfBMQkMDCDvahdId6P53XU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSo7+M6tDQFGJXUmyTfHmU3BUuT7j5UwhTfJrs71taJWSj/T1S
	Sk9pV8r0LOIfBozGn97IfU6jCWOcuSHwBfPhLNsqcCbhl+zeCcCH25EVg54CSh1QcIDuyUzGW69
	/uLMiYMNGTyESLwKEIbq3M+15a+9rnrO9eBozF6+maeRo4AafUJyoDaWFE6b5nDrre6qU
X-Gm-Gg: ASbGncvGmD+2MJ5v5/LmrNL1/C6DtRd2JEucvDCgkjEafrhn4iSFscfUEDzy6lf/X5G
	5FJqetum0ToeRsfwKN7iyhna1RNgEH327ZwpaO9mJ+EDpR3rQOQo1UwhbFt7DOH3Qi0tSc19/jP
	VfrUfbnFh0oH0J49UmUZ34AZ9i+6L6rBpoQ6IIEpTZuQrH6WydxXp5dRFbBkGSFr3OT7RrTwFlN
	veNWWeaDd1w8//BmVF8EE7gRSTE+Uaf9/A8jHtrBw3DOMswD/a1W4wwiM53jf9JhRB52/2hqBg+
	Vym4GRjDEBa0+IDKIqg3wIbZeJXRfZrvv4PdXUHk4vT0jiATHne6Jxe0R3QQ
X-Received: by 2002:a17:902:d4cb:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-220ecf756b0mr10126575ad.14.1739487041510;
        Thu, 13 Feb 2025 14:50:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv/kalfsIxEucHlCrhFEgr4i2VTH8S9l6syDYVfSvpZEcEpr/m+JPOwAIHTEeXXVI6ky8Skg==
X-Received: by 2002:a17:902:d4cb:b0:220:ecf7:4b5c with SMTP id d9443c01a7336-220ecf756b0mr10126165ad.14.1739487041081;
        Thu, 13 Feb 2025 14:50:41 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm17571665ad.243.2025.02.13.14.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:50:40 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 0/3] wifi: MBSSID support in MLO
Date: Thu, 13 Feb 2025 14:50:33 -0800
Message-Id: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yhlTZYGskFUwGOvpipOvubAEAIUuy_Qc
X-Proofpoint-ORIG-GUID: yhlTZYGskFUwGOvpipOvubAEAIUuy_Qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=482 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_145045_109556_7F773023 
X-CRM114-Status: GOOD (  12.37  )
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

During non-transmitted (nontx) profile configuration, interface
index of the transmitted (tx) profile is used to retrieve the
wireless device (wdev) associated with it. With MLO, this 'wdev'
may be part of an MLD with more than one link, hence only
interface index is not sufficient anymore to retrieve the correct
tx profile. Add a new attribute to configure link id of tx profile.

Similarly, storing 'vif' of tx profile inside 'vif' for nontx
profiles is not sufficient for MLO, instead store tx link data
inside each nontx link data structure.

Depends-on: 
https://patchwork.kernel.org/project/linux-wireless/list/?series=932457&state=%2A&archive=both
Above series cleans up ath12k driver code so that this current
series requires minimal changes in the driver after changing
mac80211 data structures. The same patches appear below in the
"prerequisite-patch-id" list.

This is a new version for
https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both

Rameshkumar Sundaram (3):
  wifi: nl80211: add link id of transmitted profile for MLO MBSSID
  wifi: mac80211: restructure tx profile retrieval for MLO MBSSID
  wifi: ath12k: use link ID for CSA finish

 drivers/net/wireless/ath/ath11k/mac.c         | 20 +++--
 drivers/net/wireless/ath/ath12k/mac.c         | 33 ++++++---
 drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
 drivers/net/wireless/virtual/mac80211_hwsim.c |  2 +-
 include/net/cfg80211.h                        |  2 +
 include/net/mac80211.h                        |  7 +-
 include/uapi/linux/nl80211.h                  |  6 ++
 net/mac80211/cfg.c                            | 64 ++++++++++------
 net/mac80211/ieee80211_i.h                    |  2 +
 net/mac80211/iface.c                          | 73 +++++++++++++------
 net/wireless/nl80211.c                        | 14 ++++
 11 files changed, 159 insertions(+), 66 deletions(-)


base-commit: c61da149b9c2e439abe27845a71dae5ce5f5985c
prerequisite-patch-id: f0bc71c13dd8ade295b0b02a265a83fba85b8e95
prerequisite-patch-id: ec61eaf1e5f291f9baa173de729257a2dd4f9ac4
prerequisite-patch-id: e864d8cb444ecb525204ab91e0ccab55116dfa33
prerequisite-patch-id: 7397bc61b307254df3cdf6e64d4d6b4063df8b4d
prerequisite-patch-id: 996b954de755f1690325c2b59b5073d945733347
-- 
2.34.1


