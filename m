Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FED9E83855
	for <ath12k@archiver.kernel.org>; Tue, 17 Feb 2026 05:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTsWrMquSjjeWNJuIv4XC+fsCoAqRCYpEBGyy0rF+h4=; b=hk29PEjxkZdKAB6fCH+a8sDTQt
	LKeYX7HFMMgvvJrYOfzUktDX6zBJh5ZoDDVRrrHtqYX8PMQoxYk5IdBQfLStl2JUmKLmQ67Qvad3u
	H+gSeKEI9aQCtG/kKmcJeOypJPZHqjt3aG9704+M6cN1HDRG3bYrYJpdEd9BYLVgYiR9h88Pe/VC4
	nEwHFu4ghvE7KldgGkekgDoxa/pc86MmEB0HKD8hg1oagoGy1+5lEh/y9gGAingqd97XZhT0qkaz9
	0mW7kKYQuRdPVtb/lgZp14K5BDQT7qsCa6bnxjLJiPuLJmHauQwzE/KqkVZbRSXMnVZ4Pcgb4SgRk
	+bScVyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxk-00000007fEH-11MZ;
	Tue, 17 Feb 2026 05:49:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxg-00000007fDg-2eRu
	for ath12k@lists.infradead.org;
	Tue, 17 Feb 2026 05:49:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFtLVQ297034
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bTsWrMquSjjeWNJuIv4XC+fsCoAqRCYpEBG
	yy0rF+h4=; b=oqXQNzQkpeNeQiqYJXDBB788+x7j1/NWqspzZiniv6tMma2rvRh
	+E7ye1AzPQwbidVwQ0KgmLeYwqtGMzkLtffMeLr/mwemWLA/1LS9TipvA7NdxDHe
	m1dYRQnErhYVkDX5BcDDVhquOyeqy6S+p5i3/Nok7lPjnVM+LcSoXHYJz9yFHtWN
	rZvtStdwSW+TF0B5bUZjW+pTIGh85Nt6VylG7AowmPaoniaPXwxJnSRPJe42o3I9
	7i7E3GbSdOOLAE7NHgQmkpkqy2AyUbOszIOy3FlcGBysd9Zobkve4BoU4A+wqbYg
	L7MuUpIPSuIGQOMdp+QcO49o60y1LmKJalA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9sb75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8fc061ce1so215151515ad.0
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 21:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771307366; x=1771912166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTsWrMquSjjeWNJuIv4XC+fsCoAqRCYpEBGyy0rF+h4=;
        b=HmZ/Rv22mUoNMsi7mG/QwBZnjgQ4uqv4vTlZRkYrRrZMhxuEMmbZuyFpy4Z50yc2Ez
         E/ARip6pQk4Z7y9sk4KkjPyI1FaQ3TYdk8geE1UoDgIN7Tqtt4kuNwrxbe5qgDgAL5SC
         4nN/XUua+V9q0rAgows/LY7m/+B9ub+fIXAgsoEth2y8nTwUPltjpX+PSVhZSDIBHtz3
         7Zx3f2B2Y3cRko9SzCfm7ORF8+88f4ubHJ3OHYwc9laHcadxI+bpXNTWjSjgAiDDEGPG
         eBq3CVdm33C7mOStgrJOjQ8G5lPRRqjwWPX0pMYtfTrwgJJ0Fhn6PMcYQRR50YJ00UlM
         cRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771307366; x=1771912166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTsWrMquSjjeWNJuIv4XC+fsCoAqRCYpEBGyy0rF+h4=;
        b=odks6LPeeouk/TzOe3zCkJ1D2/0rxm7ts+kPEEbGA7DUUMmr6KMQOd9LTDJqLr+dMp
         bvMW/bh5HigKV1/C3Y6Hqyj9mYoDVmZhhBoOjYan9v+BAzFgeJZP/poOEKFbOmvLbTGH
         6LaNozIk/mlnCwP8n8xPI20PsMa7PC81nao3MIuFhXOMNxa6sYDtbJSJCMFpYBy6kZNk
         Zni2hHiPCWG5KMhMM7F/0Y9NDJOP7fA/UzzM7zJ4L73lINAe3quGjYm0ZYY0XtFJHiVp
         4wOkMebnK6tyrNsDs7ekl03mwXZom/ILVqqv5T6SEFjixRQ/SkCWSeedC/KaOlL1L4ZA
         XAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMI/HsojKjg2900b/jQTB1kKdtbyILtGSsebdLbzO6Xo7JIVpVk2e2lOtB4xhy1hOrVH8w4m0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBOiR5ocHSfoKpWR3YIHsclDDvi36hAl285bgdPmMQj4WNp8qU
	oEZl1sYbY/TjqV4vILGiYRJR0W2Z1+/DkE0IIFsk9ErsGJNIyrlhqaQOitH7NiH9Ft+4RqBsL6+
	tvb5F1RV43SAnLJ1SQw1T6A8tBoWQm9sAELUp2e8TZmUL0xd2GTf20jYLmaLRUojL
X-Gm-Gg: AZuq6aLpCNL/shsufaXOTw936LwD+ahrrHTUmjR4CZxVZCuC6MNszGGh+cthGXxgWpd
	rT8GiigZfN/+3nDR8V8bEyn5be4IE3IKWj8ZETkwM2hBM2tTqPFC6g7djFVqhMY7b6cGxjhTA3H
	UELkWGY3fMZbs2hbLgWtpYJmxw5taIxslVTM5F7Wr3DbN71K3r1Hq+Qjpv7QrUy1rPDwRYfSNc8
	Sbme5fTywnjvBI6UAdmVHyPkJQkqN7+ongi6MyIUp86LV9XNdAKTJ5/ZHOhvUWfOa0mXXCmt2p8
	bXBmYfp4oPqfRulnLZLhH7OQYQLoNtEBiQEtLzFgGx2H3MjCX/FBvUx9EbvB8+LEaTqmHtzPqha
	hqJGKVoIZgOS3jKcQTBMmMMath+J2cTiq3B6p3tKeYyEvIeLF7FORA+fg7VNgyMkqPA==
X-Received: by 2002:a17:902:e84d:b0:2a3:bf9d:9399 with SMTP id d9443c01a7336-2ab4d02efc0mr143807435ad.35.1771307366356;
        Mon, 16 Feb 2026 21:49:26 -0800 (PST)
X-Received: by 2002:a17:902:e84d:b0:2a3:bf9d:9399 with SMTP id d9443c01a7336-2ab4d02efc0mr143807155ad.35.1771307365898;
        Mon, 16 Feb 2026 21:49:25 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5bbcsm89808175ad.56.2026.02.16.21.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:49:25 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v4 00/02] wifi: ieee80211/mac80211: Add UHR (802.11bn) Capability and Operation parsing helpers
Date: Tue, 17 Feb 2026 11:17:29 +0530
Message-Id: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NiBTYWx0ZWRfX6XZv1OsP68s7
 XUf4e2/liRANfwf4hYGTaKNEIE3hycS0otOkDK3P2MD9UvtrXZ8MIaTA38TES9Y+sOShrF5/kyT
 W7/M8aoaVRCvvkPCpLzSVY7WYg7bTYmHFlBPLsvpyKltotBPBrPA0fje0G1FJEbKJ+dt/GEUeZZ
 oUFEjx3Eu0/Mar2ybo026/iMUctPC1sGXJZ/8w5Gx2LIvAwgt7BkXFDjaJeBb1akpPkVscTX+By
 IC1V6zwCdNvwr4ut4ygkSWf0Q5x1dJnEOMPtoSM2octo+U01hP6e/TTmzofW/R72UpFG+q3kQne
 h+7OE8BXKqtrk+Q5ho3HmlbeCKEgZs7l61ktNlxSYNdRZPz3sW/5cSCRzHCtIovi4JHVb4GDYAv
 ScuFJRBZIn5npwNujUwldJKIfnWV4+TudK44w8C+IqBYtODfbnghKkcK08/NRYa25vAaepOeHWf
 q65F/hQfBZTxizE09Gg==
X-Proofpoint-GUID: JN1EaXfU0m8re51c9VG_tmiklxOn9adt
X-Proofpoint-ORIG-GUID: JN1EaXfU0m8re51c9VG_tmiklxOn9adt
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69940167 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=9AfIhKOTUZz-8RWr15wA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_214928_791656_AA1ACCB8 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

This series covers support for UHR capability and operation (11bn)
parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.

The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
There may be changes in the code to adopt upcoming 11bn spec changes.

---
v4:
	- Addressed Pablo's comment on mac80211_hwsim

v3:
	- Addressed Johannes's comments
	- Removed reserved macros and unwanted
	  IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP

v2:
	- Rebased the changes on top of Johannes's initial UHR commits
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 288 ++++++++++++++++++
 include/linux/ieee80211-uhr.h                 | 239 ++++++++++++++-
 2 files changed, 520 insertions(+), 7 deletions(-)

base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.34.1


