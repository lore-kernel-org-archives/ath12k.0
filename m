Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A672C61CE7
	for <ath12k@archiver.kernel.org>; Mon,  9 Jun 2025 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PujGtJUOTRvTJg+tZCvIl+rtYKGXQDql7ImjiwUEAME=; b=WoYz7C67otz89ACsA14OBd47K4
	ExJ4y8q0wSPcKAWDXdpmjmNMlat1IALU4kwB+JkMPC3j2+gVILL3acRWK2t2f7AVqNeO3YO3ZSsMh
	bFtLzSF4BcsjIt35n47sejM6cuOMMUIX6xca6Bxieh4nNMXPOlJWL2hGBpJ+tVKWNgpJOfAuexq7E
	G/EhUhgznnojnIC1/OAtt0YUSc3zCdxbELOnsaEKOi4lfKdRAxTtQ+pz9dMN3wc07okd+Jxm7iEQa
	y6CyxL05iZ5Hnid23tn+xZolnutdxk+qNg7ugu6s9kD4lB8UOEXL5pkgMbxzhUnvh0DlNh8ZR+DHd
	95xPwqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQFl-00000003BFH-1As1;
	Mon, 09 Jun 2025 00:20:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ6K-00000003AmN-3zsw
	for ath12k@lists.infradead.org;
	Mon, 09 Jun 2025 00:10:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MXCsS001132
	for <ath12k@lists.infradead.org>; Mon, 9 Jun 2025 00:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PujGtJUOTRvTJg+tZCvIl+
	rtYKGXQDql7ImjiwUEAME=; b=W43EUjPNodOBvgk3TNfCIhSXRGz5iiW1+WWU+W
	jSfxBq1bD5y2o/UWBhWAg5QzX8sfnfNqsfCzAdvl6rFzQk7Ir6wGLbzVK82cv0Jh
	CmC+YklBRqnklWpYIqbQiY+oKBbERql0tBhanAWDJsBr1HguL46jRGDHSG71r/0A
	ZvxDgS2+rKcJBpqB8P39Ylpy6ncZvjJgWdH2vVVGnga4tou24SCbL+j5kE562SpH
	oxZst6tQWU7nQHLJlZeGqGQGb6NKfOcdkIDM1LlPtybLS3MFFeS6lYRqaDdl/vaT
	+wn0RzxR+hQHJax6ai4O1y+DcIMl94D032fAmifH2xT5HqsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9mav0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 00:10:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234b133b428so25629275ad.3
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 17:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749427854; x=1750032654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PujGtJUOTRvTJg+tZCvIl+rtYKGXQDql7ImjiwUEAME=;
        b=CT85qJIcwKSZ6OQ+UUsusZGTrV+OgHvGPWxl00kdNvFIbG9+ZAWGeLXHhQVCO4V6N0
         /09HnCbQq4rjCpg9R1kOs9VG6uc5CMwuLADanLoBaSDFgPrv/UL+SisY1zWUDtmWaM7h
         3fJelESaR0TLhQxrXUjLDs1asoPeGRgMfUwdAbep+uu9L9VczMogVZRxJPv0ZdtlMcha
         CoOGZJJbPUboiKidWUS5g4hRmOPbCFFqu+EakSGJpNfw6xGvLSRh6zCleAzf0U/BrEpu
         P2BcGgwIwrGTPqD3bFkIHqHRHCZCEYDyBwxFZQ85skVmsnsKN2lbEuy1fOmAIZcRc65P
         ogfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ACjTLiKNxgLNjeG2+HvUEmKSmVDfXsahi+6vbguqVZB9nhNyk1CZWgjDHJQoVVH6qFgfyAw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYCzn+cMdnX4OT2GhQ6PAatT+J3/kZDrXfR2yW/fc4ccoxCGSs
	ne2gu+mNFY2D3cZdN9Y5tl1KU0ZeSuE4IEJKpH28XAXR48+2YybMglY9Eszl3g1T/5AWDvx9z+t
	j5//3wI1aE5tejYfbNvAVL+XH3ggTdlP0agshT8rUN7yE8M88bsGoyKC2V/p2LXNo
X-Gm-Gg: ASbGncs6GZM6gUU81qQBl4pFSlcz8t+lWVAPpwp+LHz6c6N1gmUexKRIRpE2Uyob549
	dkuHOo8EJ23D/cJoEAxYxZM/eCp6cnW17eLDTNMcsYcPk6z1wsoxW6a4foQe0BPH5wmpQOf8llt
	OEgk44QagJy/9BxIm+sYu9TL3O9GEq4JtpMLbXdaVprK0wIxXhhi+aW9gMpNKpGfw4/pV6FVR8R
	7eo/KZbcZ2Kx0z9UCCPcsJ7EGSUmAvUnqVmD2mxm29kBuqKqwrbkshXVVK0jFjP6dM9wtI7pAb4
	61aN3tSOmD0s3Aoho5ukjgeM71NAWZ6tJ5ccPzl2xrQpxteIRUyZrtVMBFmV3A5wIcIkkRb6Npz
	ZA9c04Kc4OQt70n89PQNf/ZAoOEBiXPrGEOtvaP5ubt8f+kTnK0c=
X-Received: by 2002:a17:902:e5cd:b0:234:88f5:c0d1 with SMTP id d9443c01a7336-23601cf0994mr165667335ad.10.1749427854466;
        Sun, 08 Jun 2025 17:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfGiMcSJAmUzHBNfelT4glbwStsN1RFlfBEFxxoC7/qkH6374at+pe0KoIG0Ds3wmiauzR9g==
X-Received: by 2002:a17:902:e5cd:b0:234:88f5:c0d1 with SMTP id d9443c01a7336-23601cf0994mr165667115ad.10.1749427854104;
        Sun, 08 Jun 2025 17:10:54 -0700 (PDT)
Received: from hu-rkaliapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm43731235ad.165.2025.06.08.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 17:10:53 -0700 (PDT)
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
To: johannes@sipsolutions.net, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>
Subject: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for mesh
Date: Mon,  9 Jun 2025 05:40:45 +0530
Message-Id: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=6846268f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jaDM4XRiC6Djmw5d5WUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tsUQK9ks2-5oJrqHXbBxJNeerM9Mm8ZD
X-Proofpoint-ORIG-GUID: tsUQK9ks2-5oJrqHXbBxJNeerM9Mm8ZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAwMCBTYWx0ZWRfX0QirmV3je4wU
 eq6VHt8YzuSv5uj1jcn7bZtZRbVZaCV3QLw9Hi45IMkEARpKFFNDZbZemiwZZQ6sNNQUkrb2w7u
 P8N1x1e7atqPlo3PP6DSrp9eTTjRvKQeuaYj/5IMeoFcCH8jHoRHgnyWmYYpUDXFzb4Sreuv5WM
 MDd/oSAY1EUMh5X90rydDj2JGlJK5Tfo8qkQS+B3/ksfTbBJc6IvanwayO0Kj+rY8bH462Jtol5
 VA+SvdcLUdK/NN1feqyA/Lv6iwdVq3hOO554F5TBIW28v2Xo7FsSfVM1Gf7Rouv5QhbCKMEj2xP
 FKkJArKuhlQIH5AkhtXQaO6NWC+Qn91FYivrHuwE5Xmsf93aeFJEQFVoHlBGMjZoFN9bfPbwxk9
 aYy4gF9aAcZJz+eM+jyWJspjKYu/+35a8xZAlLzzq/io+oYZG1mluiIw6hMgJBphNmFQNhtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_171057_123248_3CAD7571 
X-CRM114-Status: GOOD (  11.55  )
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

From: Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>

Preamble puncturing(“Punctured 242-tone RU") refers to the transmission
of a PPDU in which no signal is present in at least one of the 20 MHz
subchannels within the PPDU bandwidth. Puncturing might be the result of
the unavailability of 20 MHz subchannel(s) within the PPDU bandwidth,
such as a busy channel indicated by the CCA or the setting of the disable
subchannel bitmap field (16 bit field) in the EHT Operations element.

EHT disable sub channel bitmap is a 16 bit field where
each bit corresponds to a 20 MHz channel in the given bandwidth.
Bit 0 corresponding to the channel with lowest frequency.
Bit set to 1 indicates that the channel is punctured, otherwise active.

Userspace can send the EHT disable sub channel bitmap via attribute
NL80211_ATTR_PUNCT_BITMAP in frequency  param as a part of join mesh
(NL80211_CMD_JOIN_MESH) command. The received puncturing bitmap is
validated and copied to chandef's punctured bitmap of mesh interface data.

Build the mesh beacon’s EHT Operation element including
disable_subchannel_bitmap based on chandef's punctured bitmap.

Validate and update peer mesh station's puncturing bitmap
in local structures while adding new mesh station
(parsed from peer mesh station's EHT Operation element)

Add changes to allow mesh peering with peer's that advertise
different puncturing pattern than self.

Rameshkumar Sundaram (3):
  wifi: cfg80211: add mesh peer with puncturing bitmap
  wifi: mac80211: Add preamble puncturing support for mesh
  wifi: ath12k: Send Puncturing pattern of mesh peer during assoc

 drivers/net/wireless/ath/ath12k/mac.c |  3 +++
 include/net/cfg80211.h                |  4 +++
 include/net/mac80211.h                |  5 +++-
 net/mac80211/cfg.c                    | 19 +++++++++++++-
 net/mac80211/mesh.c                   |  9 +++++++
 net/mac80211/mesh_plink.c             | 38 +++++++++++++++++++++++++++
 net/mac80211/util.c                   | 15 +++++++++--
 net/wireless/nl80211.c                | 11 ++++++++
 8 files changed, 100 insertions(+), 4 deletions(-)


base-commit: ea15e046263b19e91ffd827645ae5dfa44ebd044
-- 
2.34.1


