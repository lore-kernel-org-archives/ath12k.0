Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB3C3601E
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 03:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nHx5YfSqtlHj20/N6ZfiHX5TvhGAs23D4EkjGG0LWaY=; b=2VE2m09vtqKaxg
	cWlfKcqNP/nsKR6cgLEE3AgURrrajKTfpIgRytjtwRYM97L8Bw8GIkmuufwWhWxsYtIiQFkUhGt0f
	93j+9XROJZiDdV4M3/OM4NWKfNbIHScclX08m8s2QIHRPTb4RcJjpwvHA89hCSVzeKIFXYsN3/C1p
	zsSoJkInU596oF+HC84sRmGfopPXG5tB84QZg8Dx3know3VWaafggn5qyV9K9ziKGev45vryCaj2Z
	vqkIVD9311IS7Z3/e6f0iHVGnuuqjnGytLr5A+6UVzD62uDKATbMFI7eFT6g5dhevJ8WvMUDoWaNK
	1lHDWXB8zAuS2VJLWLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hW-0000000CMUP-0HZA
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 03:05:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34hU-0000000CMTl-0atl
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 03:05:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B24SSI006849
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nHx5YfSqtlHj20/N6ZfiHX
	5TvhGAs23D4EkjGG0LWaY=; b=CV+QpCiJ/uMr7DhrRqAFF0TIKSw7Bii+L/UwWm
	3TOohqFm/C39BpENUPVIe+V2Gd+0rBZS9YHcUy0opqEqavhLRZ72+0Qd6aUeQcQ6
	J6mmDtZx97l6IH7QwC3nY+sFmRwS8pZBiMzsuufuFq/40vLkv7fLafbljZ3x3TWk
	j641wCkmUiMJANZqYbXK/47t94YtAditU+dTkzFAW7WdOTDP0O8OjFw277OvMw1q
	YAlcDmV8gr1G2un9kZPCeBF0YTjT54nf0e8ktxgIiVEkYyVPJD/+M30sQAz5UxgH
	j7oUPEgedwPS9FjzxOPvFxGztxoWOQueLpnLfX5Z7A798msw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3j053-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 03:05:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-afd1e7f52f7so932076a12.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340701; x=1744945501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHx5YfSqtlHj20/N6ZfiHX5TvhGAs23D4EkjGG0LWaY=;
        b=TDagFaD3saKYTkkBXUyIbXdYlBJ2nl6SEJ8+DEhndqR6VBJPnO7Ku3KBc629aZBKYf
         s3TcecXtL0wmbg79pWruv3gzqsOVb5fYjezNcZsoAefsfr/koEZHPYLy8DRYrcI7NoCW
         vSdlKc+tEWW6sRh20boIXdyBShRy/KlkEKakd520rC7wqKUgp9PW92+nN6zxgaQYoW1E
         qh8fM8nPbS8mdhBCPPvS31ahB+GAVI1DxZ/sD3aV1NvsWTggX/ak78USsZEciL5pwWKl
         2f2vTfIR3V6Os1bYnCJNK2FJHwEa4pDUj7EcIb1DBhlPmAzR5OgXtbET63v/B0F2HtxQ
         bshQ==
X-Gm-Message-State: AOJu0Yxiq4W8rW4GnLreK1sxvXPcpv97IH2/Ap5oCyWMTVNa1+rOFPMG
	zNO4b0RRRtqYmxu3/VB2g9PX3FNOwkfL6CfqRMUBPOcjwbNLyzrUrkMX6RxweDyNJHQSxLyl7J2
	5Zf7eTZtwaXwCLiwKjBbpwaqARpm7LN4KMqRQAIbrwww3Z582xk57WGGhoUViJvRat4Zb
X-Gm-Gg: ASbGnctTx/mPoXw7zwosMmzZf1VGNPU6adgCfCPQk3qn6O0gq4/R0COUDC4eBbSF9jj
	Rtl91ZRN+W7F6Ruv8U1+1UU8wrcqrb5yMbyDwGSRmhJ6LTF60cMkyXOmbZnm2Rk5VlFskSTea0z
	odwOq2ud7J3tUroVK7wKvXap+eO4cpiDe8805wQ7HjLPdK/2CFbZPlnLIDF08P6Zngp6yvkPPr7
	rELI17VcXXHzLaABgYZ+370mb6ZaocpWcCXDnIp/M/dTxbxInUhDBbfDZFfhTzPmtieKaV2A++G
	3lvdbf4itwFs6wZC9GnbJcj1VtqIm3VgvMl2+bqkAuLCYWstpv6TOR4VH1wID6ZijJMOlM9A3aI
	HP60xX7/c9K9sDrrJ6tKf0XJbajmN4gmxF6sN
X-Received: by 2002:a17:903:3c67:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22bea49d2f0mr16013025ad.7.1744340700894;
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFCDKl4DwyCQfNv7W6tRbhC5Kqxgu6akEze7BUhaRkI04YuDAONMnHWdUH05sUp5X8zL69Q==
X-Received: by 2002:a17:903:3c67:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22bea49d2f0mr16012725ad.7.1744340700468;
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:00 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: handle scan vdev consistently
Date: Fri, 11 Apr 2025 08:34:49 +0530
Message-Id: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKG+GcC/3XNTQqDMBAF4KuUrBuJ+UHtqvcoRWIyakCTNrHBI
 t69IXTRRd0MPObNNxsK4A0EdDltyEM0wTibQnk+ITVKOwA2OmVECRWEE4p7s7ZBSdtGDbFNFT0
 ZO2DoRQdc0K7hDUrHDw+pmeEbksuILawLuqfNaMLi/Dt/jCzvvzg7wiPDBFdQV7LiRNdSXF0Ix
 fMlJ+XmuUgjy5H/atWhxpPGuJTAFWhByj/avu8fo7inihsBAAA=
X-Change-ID: 20250402-fix_scan_vdev_handling-ef5be452b949
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f886de cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZlTS7ONVMdPG7i3X-G0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: QAU_f9nLsXCZHjPPUt37YQOKcXmBcEMT
X-Proofpoint-ORIG-GUID: QAU_f9nLsXCZHjPPUt37YQOKcXmBcEMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=890 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_200504_324308_01CE834C 
X-CRM114-Status: UNSURE (   8.72  )
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

This series of patches addresses the handling of scan links in the ath12k
driver to improve consistency and functionality. The changes ensure that
link ID 15 is correctly used for scan operations across both ML and non-ML
interfaces. Additionally, the patches prevent scan failures by fetching
link_conf only when the link ID is valid and setting appropriate default
values for scan vdevs.

Currently, no issues have been observed; these changes are intended as a
cleanup and to ensure proper handling. For split-mac these changes are
pre-req change.

---
Aditya Kumar Singh (2):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations

 drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
change-id: 20250402-fix_scan_vdev_handling-ef5be452b949


