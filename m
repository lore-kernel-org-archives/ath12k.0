Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BE8C87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpHx3wnKFJA=; b=MweNvv+ZStSewBLiH+u64eGKB2
	YXgWaQh3JWjj3AqDh4kFTGHqkaHUehcFdtq5P8cp3eSMjclvLrzljvfZ6HA3riM9fQk9yOLOvb87L
	EyltFZjPkOS0/Yc2sL7XR0aCL81KNA8TxgP8vUW2iq8ZNT3ZMPf/3LE8Vtb63tvcyRC6UvYwq70Iz
	yQR0Ff8uHlkiAKOmjxe6UT7/Qa/QvmpzZ5Lx5XEb9bn4hJuFMV0CDMSKLeWxCA9yKNaFqHMWw6xII
	VP3QpoZdVC+BfnhVs38OzUXQWJ5Zc6uRjcseAUrJRlKkdEgwz+eeeaTn/CUhKbaahanKopArol2LU
	JZ0Dwg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0L-0000000FwPB-3Fmq;
	Wed, 06 Aug 2025 17:32:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhte-0000000FvLf-3nBa
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 17:25:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CPDSk019908
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 17:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpH
	x3wnKFJA=; b=VD9wmOYDlZZ+wc29v4hP/QvVEoydomsDECUYB5Y1zl0BtGGRDkJ
	P+YAyEndBnMQ8OHhYtRBrutJ3y1n7Vg2c9VVg9zodZSMZm2lS3gOB702edLcEwhV
	E2D6zOV7TNDtfFiqe2UfHIWSc6cCQ64SK0Jm5kRXvjDncqBYfROTPdVWFicJpIpk
	F66Ul9V0uOENdBAjNAu/Xfm3jAacB5wcA3g9UP5P6asEGd6bNeW01uO3GcV/F11i
	9RMyMZUIucIJ9rnBNGT5sKR7kWVN9RA11ng2t3qB0R1RJdh6JGnlT8AyxuPCZ1h1
	YIeMkReASIUPcqxqd7h+QObQIS6nD23A2qQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1bj8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 17:25:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso29554a12.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501147; x=1755105947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVYjI3rygCGwLfBirqa4CEGJ+oQnrEt/kpHx3wnKFJA=;
        b=eukE3Ehz4fiPpJVswOcreVbnvBN22H84z2lJTjMCD03emWRscVzdx/LSruE3oQW/Xg
         5QF6ee/P7osu3iTN6nDX67AAUyxaVFmQ6u/JLHBCpjCqpTQmD9akmfHVCYFYuyl6L0GE
         aGHOQ6GK1KmlUXqLYQKgRg7dkMdsFumC6e5MAgItRLz1sb3MlQfeOwblD6rSkwulzMxN
         hdJ7RTHfPh+XJEIQK0K0/ruTrQFz4joDeeTiV9iBvtFlCI15+e7GynUt/EGDtP+jmBow
         79scZiwIZDTOFNzJR98qr7+nBRZ4/BMUpHhpZpqUUhKAxfmfP/gEcLfoWE0jccWZ1A/h
         YC2w==
X-Forwarded-Encrypted: i=1; AJvYcCUJEqwKE2Cx+TStraPJAG8Lhd8tMjqjQ23quIKqWswNj/OWzdUSHcTao41qFpys4rHj1H57ys8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3sve5vIvZf+xDlK01RFAc5a4YBR+cIuBVudHHqvFs0zSJRBKx
	TFXmYA8TFbT3DCcoIF+Uvl4LXDxSdyq3qXgf/UaSWRrt6GNXCunsaIr9EOJyTLd8JnoYNPdW8RO
	tpuSkmPr3L2kKM7OQxUIKclTKiUN3mKqgfTI2wAJO7HcxTiySE60cKjXsD08xCEhh
X-Gm-Gg: ASbGnctdnaMCRNnzlgzQQqEYLVwovQnF6k+Yc2xoeDGn6B/iA90AItoRcaDluirHG/z
	GvTOj2YoYdxHuhVYOwVcHuXtDZOVpEFGegP7qKah6UBXiD76tE2QmN1WupqbNRqm92AfNfh5kjx
	i/EtLgBwbiuMrwaYJHhZ4UdWwN2EXfi/l7SBojc2Si7yWrd0ZYkVTT/OLNd99wKEz5Gd8WQ9rz1
	ttSHhkqxNDbJDfEGtFNvgJfKkC5WRXzcl1JIDO363NTJCtt19zcC8pvemuD7HBsFCG510w8TvH+
	FMiw3cc1IV9knRiI4/VXFEKiHFhzFZMB5T06JeQK9i9YfjXX+KDQwlq8uGX7Mq1CB/s=
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563441637.34.1754501147502;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu+nPMT7IIoSPFhOuYdFJmJMRBwrZH5TbAT34dZUvgIdZmjKpP2Xiim6bvjiybrcOPhuzQjQ==
X-Received: by 2002:a05:6a20:6a26:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-240314f8cc4mr5563397637.34.1754501147071;
        Wed, 06 Aug 2025 10:25:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Date: Wed,  6 Aug 2025 22:55:28 +0530
Message-ID: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXz04cZaAUxyMC
 3ST2G5WlZbIwe9M5pOqKUA8uWNoe8p+gahFZIigwWH5fp4/9iLgPSZg5S0D4V82VIipkxeOePc4
 QAgq1rfDMhXA9x6+Wr3wOOyTnNp+Gq9nEwZDsC7uZeo+RT6HnAmmbcuxOR2uG9TLDfOZ/QwGb8B
 HzYcXbeh4afgRKcUqUHLOXK0XbSs3Gz0KPblNAwpA6xjDIOzly1Q/9BGL8AIAJTkCC7+yk8TND5
 TbXNdynwGN59N8W4E5fICnnb6RNr6C7BmRGf3TtZ62Fh1C7cbwc0/9+rrpolc/khx3cd5unZq+p
 kW9ce0fS9RsTAoW3/GkuxQ+4DsbUJvT/cjMFrFCvODt4nU7c/NJC6YAnWVJtMM8TAM7295iRoAN
 0Vq2frz2
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6893901c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o9fwi_DDGJO2X54_KKEA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jU_58r1vtLpxtH07-gQSKxjV5Z8umTdA
X-Proofpoint-GUID: jU_58r1vtLpxtH07-gQSKxjV5Z8umTdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_102551_054957_E2BF0434 
X-CRM114-Status: GOOD (  14.04  )
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
- Make this patch as first patch of the series.
- Added R-b tag

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..2a14ba9b0fb6 100644
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


