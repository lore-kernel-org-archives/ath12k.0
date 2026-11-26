Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6823606A683
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HUmd+oX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LovfT7uQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUj+L9eQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=; b=3HUmd+oXqxKVcUIUGciRg9D+YM
	BDOipKowOfCdL1boKY33hK6B5HeD9QFOxdKw+80ueJdHhpksSwvteisnQQGVPk0/F5Wzd2OzHMgP1
	b5s3AAOA+rDK3OA/+9mYitNOW4d4RUGruizqvV7tM7zYqXsmEuGixCIgivlIZ/iFolHOgHSaVvbf3
	G3UjHD6MzoQA+UMf8CA9o+oLD8GSlJaNqHKjAGd0JoNnr7omcfE7Ap1BnqpNpgoK67jrAKsmgBMMB
	enbjZPlbi1HfCLt+6Ij/WVeY4+1+WPeOxpOo0Ry50lWdfh2F6f3GQhXKcr5KVBYldHypR5S85dyP0
	n5KlSCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtf-0000000Br1a-1Z3U;
	Thu, 26 Nov 2026 02:07:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOta-0000000Br0b-2dAH
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtPN648271
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCY
	iSbLV6r4=; b=LovfT7uQsKT8VXLQAB0TvvzbY4t+NUadE6hcBMpPoukagIZ/z+V
	Fd6/aahUmozlYab/03LVqO1+4s6pSDFpOFxcu/9R1ycLiI5/ejPUxjqaBbt1fxW5
	7uwz92aqbCQecoakXhI6qvaOdtPsHgcEBRHfutd+Yzr+nepmLhtu2mnOmNHn91fB
	fmNmQ77uLKcp5S/PlCtj+e9mLex0dckMMBSDNQ95pdyZBsHN8hplCOqer9Cym4VE
	s89R55EFWBM3aZvymatPleqQET4Ovnxve5dkYx8lsuJKrfvEp04+/Sq6WN8Vj1EC
	/dq2dg+li+XlZIBG5XfdhPs4Hh0AjBnuhXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61aht9m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so7662306a91.3
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658853; x=1796263653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=DUj+L9eQmD/LmVYRFLZVKlzALwdOsmLZgY3MWAxdVIc6IA+/P32BbmrbsEGbIGqeyL
         lFSEJSsM4OQw2FLbx+CttXJE2uW6V8TN1mcEtOZXVn7sdNv5RVm7ssHFAOw8XDWgyODb
         XpL9bI2qvERBCk3WcEwzuOqQiR7MJhZdFSBPzXjy5TBCRLxmD7aX3D86n1l6iqIS03+E
         LzTqEtH48TPcbppjMi/vHdrC5AtqY150jeHwiQTIsScBpLbq//OGJrWtY1W6P1eVQYVQ
         Siw3Aci58pmJOhn/DL81cRKpN9aK/u9OHK9GeMTy7ONG69DaLzYmlC1GYsm36tLF/ZeW
         qWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658853; x=1796263653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=nPTJHYkDU+5ezla5puyNuOx35EuRhP72EQbyUrJ/iAwElTmo+pEzzn7vzBH379pQyW
         +Pa/dOpiTnTxcsYAbBkv0pMmZRQeYlCvgmhgDAuDJyXIa/mDIBt9xJmNjP5B953f8uD2
         kA+iTfFbv+Zt/PoSp7r0TLUmjrw9W2sx9zY5hV8zYhxoDRG3eySzJHcBHi9vBzJPlP+5
         zp7avbAsyEiK7eH6T5IcZiqik1G/Y30N8SXDpQCAbvobCHKkZRIr9fUPxJxvkeGW8jVV
         a5cpN2uk/EcPPhczUShBjXp/KWwm4QSDWg+E9FPM7k89bIWghlQNDcpdQgyum1e8mHwQ
         Tilg==
X-Gm-Message-State: APuU4Z9WZYFqmsnOrFCQmRmcDAR6wRISH9vXUhuG8KQy+2lm6FqqODgv
	GrDX1H6SUcMjRzeo+uBMb7wTLn9iyTc+qaVHyEDXuxs2D8i2dxwDo2ZIjO/Br5XrEVH4SFS0Gjg
	kNDi1h5fJ4ic7dAgeV97xhutW8/6UT3LNcg44V1wbcgKsoQhQFFelRl/ra3D76QFC
X-Gm-Gg: AZFdTZfR2hHIY0LkkvvZEJDR1+dELz6htYGF2Tt8ObaAC2xNCRL6ueW13+oHCGBonzF
	N9XfsEjHfbJpasYHpIaaKXi1cXjXwTr8yP4ylPdpCN9Yh4y6ISR2vGAAbMnn8QmI9Fmh++n2g7h
	oHbALKCT3yvktGpTPvgh24iLqGy6xnt+cvXmB2RWTQCAJcZPwoTsG/PA7A7IGuC04W4w9dB7Scv
	ofr0wQaGCmX5zBjtyXJsSXjAg9+8pewRIFkaLff+vrmeBNV/EsHDiyrm9Tg/OO3UUXzHMNcaYsB
	9rz8K/XWAgQE22iNBNApBjAGddA6oo9J1uny/pWeTtWHLA3Ge7BWhhSzYVxWgpl+3s1/2XvpvyS
	Bk2HNOo1R+NsVw7mFrbmqzB3YPlP79USWtH2vy0ZlVroqBbiMrMRJri3fG3zXO/ZYR/6ErYIQZy
	qw1DiyHiwzF1Di0/LAWD/k/OHufT7VK+oPjDCZ
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245896a91.49.1795658852757;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245863a91.49.1795658852068;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:31 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/6] wifi: ath12k: fix MLO capability advertisement and peer association
Date: Thu, 26 Nov 2026 10:07:21 +0800
Message-Id: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R2xhs1EUq0e2qqRSJPuOjedvGpK0TrYW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX2F7Xw9LBBn/N
 VVjtG5uwG+hPTVw0TKVxrS3cUvCEmPa8vijAtBy1BriIqV24kHUHEitTTOIfrfPaRXXGuYUbRG3
 sat3Mgz4BbvqMDiXGS4ZC1Yht7IX0d8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX9qKKAWJkLvlE
 WjqFtdvnZHd9ndTEsQLJZn24CxF0tdrAnAG1mq/dNVXG9EQJqwl4zigfhgCc3NqTgz2Dzzyi2Dq
 rNcHIEbyFhfol3C9JBi4Met8rN2p9QgNi1ihksj3UXbHFWpb9p3oAQI4DwG5D250zaJTtQn4Rn3
 OOXviOyQJEYTqmLlkQswCNlcCY7xHWiQMZAc1CmL8yiBdjVRZT9kHWrK8UYUIwCTdufeYI0vrFY
 YRB/FHsNIxKHZm9QSp2CfP4phWvs0h1HtjwLc6YCGciC6gSaKswnQ1oyj87AuKZ6QicHGJeY5Qe
 bq361Xi260MDh8J+sacuR/lnye/R5sMVsyl+o2AJJCN2Axcoo2/+1B3w1saXy+mZ0+dKXMKdPUU
 1hjpj57Wr5YDIzBUhmteQUMjmZyAm9zVQ+hYyzeBshwUu947ibNgxR2yH+cgXJegruCogtVszip
 iHxp9si+Qet27i6xUfg==
X-Proofpoint-ORIG-GUID: R2xhs1EUq0e2qqRSJPuOjedvGpK0TrYW
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b079465 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jwRwtn7Mt9YKnGwaeNoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180734_675159_9F58421C 
X-CRM114-Status: GOOD (  12.87  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series fixes ath12k MLO simultaneous-link capability advertisement
and populates the maximum and recommended simultaneous-link counts in
station-mode WMI peer association.

Firmware reports the maximum simultaneous-link count as raw N, while
the MLD Capabilities and Operations field advertises N-1. Normalize the
value during WMI service-ready capability parsing, then convert the
advertised value back to raw N when preparing peer association. For
infrastructure-focused chipsets, derive the advertised maximum from
the available radios rather than the firmware field.

The series also replaces the shared global iftype capability table with
per-wiphy storage, avoiding capability overwrites between hardware
instances. Initialize STA/AP entries from the normalized firmware
capabilities for MLO-capable hardware groups.

Use the AP recommendation already tracked in sta->ext_mld_capa_ops.
No mac80211 changes are needed. Recommendations are raw counts; values
0 (no recommendation), 1 (reserved), or above the local maximum fall
back to that maximum. In AP mode, leave the new peer-association fields
zero because the current station API does not expose the non-AP peer's
maximum simultaneous-link capability.

The series adds per-radio ath12k debugfs controls for the advertised
maximum simultaneous-link count and EMLSR support on MLO-capable hardware
groups. The mlo_max_simultaneous_links and eml_capa_present entries are
accessible under /sys/kernel/debug/ieee80211/phy0/ath12k/ through the
existing ath12k symlink. Writes from any radio update the shared per-wiphy
STA/AP capability entries. These allow validation of host-side capability
advertisement without firmware changes.

Series summary
Patch 1 normalizes firmware-reported maximum simultaneous links to N-1.
Patch 2 selects firmware-count conversion or radio-count derivation
according to hardware policy.
Patch 3 initializes STA/AP MLO iftype capabilities in per-wiphy storage.
Patch 4 fills station-mode WMI peer-association link counts using the
advertised local maximum and the existing AP recommendation.
Patch 5 adds debugfs control for the advertised simultaneous-link count.
Patch 6 adds debugfs control for advertised EMLSR support.

Thanks for the review.

Hangtian Zhu

Hangtian Zhu (6):
  wifi: ath12k: encode MLD max simultaneous links as N-1
  wifi: ath12k: derive MLD max simultaneous links by hw policy
  wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
  wifi: ath12k: fill MLO simultaneous-link fields in peer assoc WMI
  wifi: ath12k: add debugfs control for MLO simultaneous links
  wifi: ath12k: add debugfs control for EMLSR support advertisement

 drivers/net/wireless/ath/ath12k/core.h     |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c  | 168 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.h       |   1 +
 drivers/net/wireless/ath/ath12k/mac.c      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |   7 +
 drivers/net/wireless/ath/ath12k/wmi.c      |  74 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h      |   9 ++
 7 files changed, 312 insertions(+), 8 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.25.1


