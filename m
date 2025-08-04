Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2130C87FCF
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qND7eaxsDP2YPzCmQqdenqTRv6C53QulbhoZonDQY3g=; b=EBDrWkVPPldBPP
	wKRdVIEvWKZeMd2BHj1C05Oh7RF5RrUHpQ31Z8zW4TeMvXsuVHF2Ym+FOuYqqcLkenav4jwLc43cn
	/civDBa4hT7+IE0ZuMkr9DdMn88FOyfVl7c5NhyVrzawqTx+G9MQpJYCKSU0RWLzWK+hIKbnf6uGx
	fh8aiz45SfB+Ya5SjcBIe8tuBGQzmt4mvp0L8RcGYy6+qXGkFAKOjfr/pub1JFSGmlh7TIYasM4ut
	PyRt/TQ6TG6TgLTTKFIH578I7Zi2LgRYmryQn0m9Pum47AFctpECkeK76cB8FRdGAsaFEpk7cG+XX
	KEM1qVN3YLxA7nA/Aglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuty-0000000AU0n-1J3X;
	Mon, 04 Aug 2025 13:06:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuWO-0000000AOZl-3QG4
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 12:42:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749A5ft006884
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 12:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qND7eaxsDP2YPzCmQqdenq
	TRv6C53QulbhoZonDQY3g=; b=QkzzhEWMpf04esR7GHNFhWVzSRpYXF/4m6wB8g
	Jamr0hpExVesI04EoauCvUwjcrLLx5KXuSQWRyL3p2up5pK/sewZsLYa7wTez9r6
	OD6keTtzWGGZZMp4CvbswLsqbaw2WU2cNKewB7ymLBY4UL/a2/witv0RPvnSCucb
	ur+TzNpLhOI+Loem6mJN2uaMIN4d52GGUXn62bvXxx5Ro3cQf6ioIGceFDMJBCod
	GqqlXi3uB/XrRUphQxl1uQWstwYACP7L75FaMmZeS0/dzLR77UuJDJZOIudc2Her
	9bpVVOokDEX4P6EyCMlP3cjd4vvF0SzjLpkOr2nPceb1BnSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek4x81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 12:42:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso2589805a12.1
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 05:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311351; x=1754916151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qND7eaxsDP2YPzCmQqdenqTRv6C53QulbhoZonDQY3g=;
        b=B3z2dyEqeWn4GGXVNUJeA4i1WItTpK9i2wP34m6gMEB/+XFfekXYj4F9121O21XqeS
         SsYnr2z1mbAeXbHIotGU1bw8vp4df+0RTg7D3JZAaVAtgVODkBUtFpgG200Z/BxTpz0D
         gkgfKfzWRiVDsdHyLXx4fIdihmHNq3wOHUgm1xjPLLlJcyn8JCC3nFlQgnbSHyOsKrYl
         CJkbF0Gr00w/PgoUCna7aVoNKTOGcqC1PmcaO9rMlsJrm+xme6m3yYbBA66khUMmsZqq
         +MJ0tRTsC9otD7UWsQjYOWW3iXUYmc85kRuS9z2Ui048KvJdH+ps0fegamF+gmHaw8/z
         9COw==
X-Forwarded-Encrypted: i=1; AJvYcCWFYcqd5c3+0xFhAxdEqecBTWONKTBTHRpiJf6tLc1Qia1UXs9qSwfkkCX8M72x5Ss1ajPK/Zo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jWx3tVTQZxtSONTHUSml0dYH95UYPDwcXjOxHnUgiA4sZsuq
	GudZJ6kU5pF3aBwoUWcRMsbzqK5C+0TjP7dR+pn9oAsvtP46/disiVDYyCY67LdfSQNI5osuYBC
	NTXfp3w9I0CBEnekeWUy1yeMak4+Sgq7tOK6ypWUeo/BQxpk5XP8IqX+ht9zLgIMl
X-Gm-Gg: ASbGncvLpfPX798tbftSa6SA9JJhQcjSZmJ0InMGjueojjJAawxQOX6bKzvtDorMD9r
	VRvPZcXzclu5B4G+C9aOJPy+X5pidKODVWfJdE83H80vNMVoB5v3ju2VblChYZS3I6qpoIxH7cr
	iv++rA+pWvXKCakyvQ3NIBkgU7KMJLoRg5Je/XUlOqyegjLbu7z2qnulDdq+qNCXXvNi/ghAwsJ
	6WUhrg7MVgNEGTqiLGFYDZIcZa3XKB/dRrshfbpxyXm89rRt2CRRfUU2JZ3MQ8jonYnKScdY/vk
	g7T3wE4rovJV6J4dlZZwq6OExiBzbDevSSSi6c2VOM1QZfwCuSYhxXW3ta6pRvEwgGQ=
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145455505ad.22.1754311350811;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG07rzuN1fGkVlEDwaXMjcJKT4QW5T0QWL8B3N6dJhvgGjnkR3R+HIt1As8+4jwK2M5o5BtGQ==
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145454915ad.22.1754311350374;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Date: Mon, 04 Aug 2025 18:11:48 +0530
Message-Id: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyqkGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3dyUkpz8xJTUIl2IfLGuZWJyoqlpqkVymrG5ElBfQVFqWmYF2Mz
 o2NpaAFv6VxZjAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=840;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zP+SLmOOtTIzO9h/zziRzrIH5ayjpiu27qhU5x3QZj4=;
 b=rX93wR4WgVYLlBcmB1rP7toMI/2qOHb6pLI8G7KQoJvGrWbEZfhFvr4DTzgeHlDFnC12NCLsJ
 n3B4pD+68yEAYtaMDGR+A80oiHxe30L8LX/YjdLYpSdQVaMP+ZMUXf1
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6890aab7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mWPGPCZChkjDq24jzmIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MCBTYWx0ZWRfXxT1u2GdBVIBh
 wWE3unatFQoIJk4JTWNx/zqu5gh9QQfXuglXabfHvTTKJCf1kBvD4Q2vHELUxE7HmKOzx25Upsm
 1r72eg2//7a02e4bTQFZSAudQukYH+vZKJQ1Gx52jwGQGn/4O+TtWzcFxQUnrYessPQs/rsNO3m
 /0ZImF0M5oXRAQge1nq/CHtKwvz1AHAnIECksIu/rCymTPAkT8Ex7giHhbfxmmsepo9qPX+rhx8
 Vr6GUzonKG475qx7CuG+IFdh5AFyl1cFBNMu0aXr+C1VVB1zT9549Cu81LMxGCobFwFOBDoxssr
 gA9Mu6ipnbV96r19GRq+ceMueBp02MtdKTemNO09mu6QKZvMFIO55VYjP27Ct8B7dmsXsSyNOy7
 88TzH5HqtqGmF0OSSXYDTmchKyV0zId4P3+QmZlsmLJ2861xJbWkSOyuBYDXnurl+nEcMH1y
X-Proofpoint-ORIG-GUID: mJxg2EnNTZLGhfMNZXOBrcjKXzWfI8S8
X-Proofpoint-GUID: mJxg2EnNTZLGhfMNZXOBrcjKXzWfI8S8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 mlxlogscore=850 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054232_866114_E83F6725 
X-CRM114-Status: UNSURE (   9.76  )
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


---
Mukesh Ojha (3):
      soc: qcom: mdt_loader: Remove unused parameter
      soc: qcom: mdt_loader: Remove pas id parameter
      soc: qcom: mdt_loader: Fix check mdt_header_valid()

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 22 ++++++++++------------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 21 insertions(+), 25 deletions(-)
---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-mdtloader-changes-9aca55e8cf37

Best regards,
-- 
Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


