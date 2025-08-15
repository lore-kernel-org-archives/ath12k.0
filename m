Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6387CA0EDC
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4P3lXv4/uPA7E/VgfMVu1UmSqEzdZA+CkvLhRV6TU5U=; b=M+/Lm4ESgzZnJO
	l0YTgnefaXBrI5yd9ySGHPtNY3jt1Hv2BsbYTa5VoU5KvXFO83FE1mWdlDC9KJNyi/TPaXS9r3nMq
	1XT+OlowL1NbC6gkd6EcvGT82OQxWq0/ygKycfIpUTGADceUVtdGGilJmGqxR5/cx+tbQ5Z/XjuMi
	5YxoJOCtW670QUV3OUtK1QhgnJLC3PYOqnaHQMdNpibjaCwtzC5738OBFb0x62nzwPd7PUaWc5euw
	tl2kDZgKbRmahdKIXrH4Y0DkJznsbM7reYkskUdHrP73eISVAii61smfafDcu1ZqMb+sZcgYNGZYa
	JaWmod0ZjsJZYtIhFaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVU-000000013UG-1Odi;
	Fri, 15 Aug 2025 01:45:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVR-000000013Sb-1oJq
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHUU65012188
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4P3lXv4/uPA7E/VgfMVu1U
	mSqEzdZA+CkvLhRV6TU5U=; b=WS6Z9hB9e8LqSb8eKL6cdbY78dkdRjMB29jJWu
	FhiSmMzhbfAU7LDHmHQG2Q9zA5/bGGUK4LgbRSlagB7QQTGac+8nd5EA9tmQc2c2
	Ab5pgA+3V4NxDkxRJ36D1Qtr7iA5gvOAaeB7YNi6Zg+oE8he9a5eIYixr/W9NAdI
	SHh7CqKgfnTBPr7///9hwabIeF63aOuGVQkKbsBSxDwrGB/4XXe7YG0wjuG1/e/b
	2y6vxjNC+KUI2Qd9/0Fx9aCcdOgAp3/NpnU1a2O+BQGl+45YlBDdHV2dOXyRkZtl
	4ZUomUKDLJAIZJamQSiK2D/AXbuhKpoXAkhiNompT9C6IE+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxftxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445805d386so16221535ad.1
        for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222314; x=1755827114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P3lXv4/uPA7E/VgfMVu1UmSqEzdZA+CkvLhRV6TU5U=;
        b=LVOctVYRMMCTZ2XXL9yAGTL2SuheLsiBayupxq9zEBkeOsy9G2jSGUZI7AsP7UgFlD
         358F0zdfvBc4rd75uYBYoLxEXZU16BGKV1RJSO1+OFnxMIU0z5gqyLDNpXZv7NJ1mDFR
         Gdhp+YIqCeW1ezXGvLYCWytEZom1T8ImWPaJ/wYcpgnRATHzwJdE9UcyQkAOPsl9lnjD
         +1bAlBhGyrVw0jytoDCV4g6l3k+i4/4lY7KP3d1EDKQ6FFx1W5XyU0/qyQFkfIPhWYIb
         GCWfRNVWnsWivAMJCE37h1GITkMT3V9x1OnG9jw7MW0FUkpKCaWXI1NIS5SNWVLHlSWB
         28rA==
X-Forwarded-Encrypted: i=1; AJvYcCUnDH8yuWfX6cCLSsVHZVSyVj7QsyGFGPbLVt9KYzRZRs87zmJRbPnoPMItMEQ3+xN/w+b3hf0=@lists.infradead.org
X-Gm-Message-State: AOJu0YynoXq+7mVJM3FVlNZL7fe9Eg+9NNpww9bTUpOZHQxoglele0eF
	G3AkR2xarTuoMlHTDIrgiXSFK3pt6o+vKqe0Tw9ynh/9AJtDPzOAVOzovT2PVypHSwGKCDp96jI
	wY0s58gNI7QdeTBvY4ucjevQFsoe/J1FMbb9p3p6HejzCiPITrLGQftb1M0ka9gdJ
X-Gm-Gg: ASbGnct/QuiTg9BiANGhcxw/89lDBZ1Zh998zUSGHiDKRvtZ23EdnQVYfeKFkdNZOVw
	jf4vIbtw3X8OcEdGMYGJWjquNJ4Iy0rteuqUHaw2fUDHom10cA1W/MNPLJ8ICGQfNYEq8YP0k1S
	KOTIaDDYgyC9Pq7aO8qw64akrLivapgGRtXm55l8pznEJ4Cn1/gSmyDBYY9Gx8MtBA69djADLS/
	P1yczNkkO/2VRc9/Xt1ymugDPasIfIVMWD3IUSCOVqgKjnsQXxnM0gK53/31WHRwDfthzF2RjWP
	uC8e54GeJTp5lQLAeNlMI3rh9s1yx21Xk3exUDzhrXDXSwhXfKPhajOgRmCHCjqvBg/rNzLh96F
	EMviuL4rapxtbxdc6
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id d9443c01a7336-2446d715b0bmr4579885ad.14.1755222314392;
        Thu, 14 Aug 2025 18:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqjJ5BnUL+tpWpRnC86E4QXEbco0IbzESSL4M5fmEVPbzVuES86olfGCLzLuwlUQ8m/AAbsQ==
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id d9443c01a7336-2446d715b0bmr4579565ad.14.1755222313913;
        Thu, 14 Aug 2025 18:45:13 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:13 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath: downgrade logging level for CE
 buffer enqueue failure
Date: Fri, 15 Aug 2025 09:44:55 +0800
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiRnmgC/5XOSw7CIBCA4asY1k7Do1p05T2MCwqDJVFQaKum6
 d3FxoULjbohmUzm+xlIwugwkfVsIBF7l1zweWDzGdGN8nsEZ/JMOOULKhkH1TZggm/hoqKH4EE
 joD932CFY5Q5QKqmQW22YQpKZU0TrrlNiSx7XHq8t2eVN41Ib4m1q92zaPzPie6ZnQIGu6sWqE
 lyglJuQUnHu1EGH47HIz9To+b8uz67Of6+MZrYq8YMrXt3yB1dkV9SCLtFaI+v6jTuO4x3/AR2
 UkQEAAA==
X-Change-ID: 20250812-ath-dont-warn-on-ce-enqueue-fail-4a8ae2fcd1ae
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+6zbBID8apxO
 8a5MpHIF/yVYmBdqr9JmwbMB8VxpApriZIeIQJMqRO3z53/vVJ0uvig6t9DTDoxhKwiNJfSDgX4
 cOfmQLiR3LBPGuuug1S+zmOiNDHlHylCblZeLQw/l8Pw0yhsNagl+vioUnXTicJEb8FUkViN7QY
 mgGvGxkIPHibK1cerHZJci2gGRcZnyjow/sNQE+uZtUkjLrnMKOZL6rCAJK2qAkSa5HjqFyzHqF
 NDzj3DYezda8k3Lent4pYzR2FJHgWJZ4z/0JhjppadnDasU4blHn/vN/apHjjNy7//Ol/+DFeOE
 lBkN8OTxyk26E8W+5hTjlEzWLAdxR9nlUJOrI1xmZy0lUTdtLMlpmlp3t/psKQCrQd5oF2CFHEK
 YxU+pZlx
X-Proofpoint-GUID: py2gW1rpB_GobnIjcoOwn69cEUkq6HGK
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689e912b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nBwn2dWH28VFQPEByrQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: py2gW1rpB_GobnIjcoOwn69cEUkq6HGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184521_593693_66DA1DF9 
X-CRM114-Status: UNSURE (   8.85  )
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

The CE buffer enqueue failure won't cause any functional issue, downgrade
logging level to avoid misleading.

Also fix an incorrect debug ID usage for CE.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (3):
      wifi: ath11k: downgrade log level for CE buffer enqueue failure
      wifi: ath12k: fix wrong logging ID used for CE
      wifi: ath12k: downgrade log level for CE buffer enqueue failure

 drivers/net/wireless/ath/ath11k/ce.c    | 3 ++-
 drivers/net/wireless/ath/ath12k/ce.c    | 5 +++--
 drivers/net/wireless/ath/ath12k/debug.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028
change-id: 20250812-ath-dont-warn-on-ce-enqueue-fail-4a8ae2fcd1ae

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


