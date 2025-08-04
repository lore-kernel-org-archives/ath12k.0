Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D8C87FDA
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7khlvNNDuoulE+J6oEwv77nicTb/IEKyXaurbG6alM=; b=2HAw6qrkEY9gk/Y0xDT/8Pibaa
	em9K41q6pfk2duTB7YQGQFNy221Lo5y+cmbha4V3DOiZQrV1lonuQ3nwd9FAQVnziMIw90kjXgEhh
	YWt1kZ4C71BKqRfAsm3RfWPUWt+7celA0DOdepi3ygJbMe0QsBV11G39hHDVZi3zogFUPu/FB5IrW
	jIEmXZZEoM6c9NTpGoktt7WOdAFJEH+OiIY+BONLMjMFuoO+OqXFKvILxPWLFh5e0mFSgvMfNTuRA
	acCO/jGspQ4YZXE2gT82e8W6Y/VOy6wW5dFZIy4ib+n+QvDBprzVH+zUJ6ccAf3wWCnljRhS7nmlV
	+TOYFiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiutz-0000000AU1G-2f43;
	Mon, 04 Aug 2025 13:06:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuWd-0000000AObz-1mvP
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 12:42:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749m7p2031987
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7khlvNNDuoulE+J6oEwv77nicTb/IEKyXaurbG6alM=; b=QrwY1oeFsDIdUUZt
	h+veGqFgX2T0df+pc0yih0yBxRl8y1jGxqQ/NV5o04cHaybiU5MCubmOddioLmkL
	mDGn1KsoDGSPT4iLTXY1fsEiJxkuoWF/KCZBeTvppJv0LL27S5+BNj2bGHgMQChB
	jZM5GVJcL6/68lc6LKdY45Vy5iB1qVpB3SKiCBImC0Db1MJUxZwnQBTpHQ7h8RgY
	I3BlVHQua+S8sDEeGPu9Wi2nxjw3JGyM3Hcgo33Bv1G8HYdNKzibG8K6Vn4xuDHF
	ucWOuAQgJv7E75Q1bSsEzgNQwcoMgaxGgU89Z9Ej00/OCoGsDGb4hXBkXpX+/cjH
	7TE+Wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a1sjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 12:42:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2403e4c82ddso32863775ad.1
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 05:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311365; x=1754916165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7khlvNNDuoulE+J6oEwv77nicTb/IEKyXaurbG6alM=;
        b=hXkkGYRxsa4tv/ZVOOfL+1xyh6+pmCDH5R2dCu/GTybwsx4k+8PXbgLz3R1TNayAbl
         FbOUX6s539/cbZv+J8ff9ipw/TCdbPCwdDpyyntOt2Mbfc0EwliTql9K2TBZmnkTgMvk
         yXdStwqRbZ5bIvcZY5NA7MAHvHFuV7s9Xii7w7npOOCz/coceKNDS+gf9WBs03jCZ+7Z
         fcVJ3RTM9Zdd+gOi3UjQ3bZSaV/kA2ytY9BjY+cvN8NLo7jiL/JkEEXv5QA+u8zQk5Q0
         r65db+Bu1zE+5pXtk5z/3pymRwqscM189pnfqvQx3i2Q0QH2BQJSObWSNARcfGbhxDwu
         DpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW35KrqmEAkmAVRnMqMXLE40YdPEUdLXmYlQHyqKFDweVuSLaWbT8e9gKyO7P+HBi9oDNLEAr8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3G6K93ylvlTT6D2b+c5PtaCUzczcsoKSvBPfJG9+pEy4QSh7M
	HClIKyHStlxwTqkinXf25gTPGdXqnDjV25J54T2PnkmDEl0hHSG9ueUK1Y3zJR4BelW+b4HVB0/
	7kcL868OIqKLL7Uwxh0kxNEFyVBAd5cENmg2bVLiOyeQsq1qp/NLjkRqt4Jxj1l11
X-Gm-Gg: ASbGncuQq1HwGiEZZCKdEB/eKoQ1e2Weu/QP8UIn33jrJ/d84imsJZhEOMoog6hFgXx
	aTo52Bckciep1YZn1MULSKYbOsFQaHVmm2HOB6CRolfUkQ0ytE4ICYRAniYupA2vpYL1aP0IEHK
	1Kyk7IkvpeR+gosDqt01uDAbp1mu//5RuKb9XCsRT5WUPTyKD7ICaL/3Tzwyn1v5NBuof9icpqk
	tGnKPqGDwyld/RbOTE1r0OW8qUYFLDIsoxyMP5D2DdccNQTrtr9EHANflrkxcSpfVspOAmxmGna
	uYUWCECgdrWdDH4Pc1OgTLzUgFjBRgCibSWO9n+c9uh3jOgjGSR+mqTWzf7KrkVQiJ0=
X-Received: by 2002:a17:902:dac3:b0:240:6ae4:3695 with SMTP id d9443c01a7336-24246f461e1mr130978975ad.4.1754311365210;
        Mon, 04 Aug 2025 05:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeOucmT72G4obyRlN+ZWNcH5Q2iHFWuRsaszukVqVSTemP28S1LdiDIliCYgYSEqOFKiYRGQ==
X-Received: by 2002:a17:902:dac3:b0:240:6ae4:3695 with SMTP id d9443c01a7336-24246f461e1mr130978495ad.4.1754311364777;
        Mon, 04 Aug 2025 05:42:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:51 +0530
Subject: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=1035;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZD2cfNOpHxwkRMCN7+js1vyBb1FTVU2dFAlUapNz9qo=;
 b=mtBwG5naW5sNpYeSB0s+MuWu8v5N3eNWKJQxjUkuVslBWPyqweBsrkgRKZIKRu6ocioTpjV+E
 38wGTOcs9trB0+XJueeCQ+8YMfYUL4Njd8SL8xUVCDRnhbU8P0YfH6V
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX2E6T7yZiSlBu
 /87uNd6CEzu9FahkqYKwKwo5elMIU8wLEmoW3p6Zi9FD04z0dxg0JR4kaYhZWMaw6s7om2eetG5
 tExsODqoHHmKgfOzkPpUCPuUR+hfHXeXGLgUwZB81IFCPfIZnxr2YO2+KM7x4v1tpI+cG4IO6ke
 OAImoqrSr2iEdnd4G7BmbP4GEckjYIWlW0YBu99DEo0svDOM5yog3RAQrMWQkxjsYWzU8svhggU
 ByDIwZsHO4NUUqyAOON+2fslf4nm6DZzK+uY5aSIJxqQ6Jz0s6rkZvxMrwf5YQwQW6scRYEGpgB
 nY/6Pao5HGew9+uR3iGiURbNdz56ELP0xsjdro48telr6ibTocBtCqG0HolJdH0x03B44JkybhX
 MpKS5ZQcR3Vn5U1K5SJ+HY1f7jI3lBNXNQMQ36NxjXi5GErbqd83hZnbwzBHP5rdZwTNKxwQ
X-Proofpoint-GUID: wRrhCoh2jBkJuefUKMoxv0lMko7W5jDI
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6890aac6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o9fwi_DDGJO2X54_KKEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wRrhCoh2jBkJuefUKMoxv0lMko7W5jDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054247_588059_0B275F2B 
X-CRM114-Status: GOOD (  15.11  )
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

Firmware binaries may lack section headers, in which case
the e_shentsize field in the ELF header can be zero.

Update mdt_header_valid() to correctly handle this scenario
by adjusting the validation logic accordingly.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 7522223835f5..8210fb3dd51a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -39,7 +39,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	if (phend > fw->size)
 		return false;
 
-	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+	if (ehdr->e_shentsize && ehdr->e_shentsize != sizeof(struct elf32_shdr))
 		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);

-- 
2.50.1


