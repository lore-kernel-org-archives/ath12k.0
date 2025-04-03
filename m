Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4581BC3601E
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gFDh7FLlCD2oGYiapfu55+XPBan0+1amH56RwhTihCk=; b=HECVUbk8xE4OAWxsxp9m8KDbWz
	nnL1NQCuZy/vS3CnVjg7sHSRejz/eZfkUEVloAcKEFAQ056H6oZ4YYzsCuh/gHHH9Tfeb1xvscR8j
	KhrHaFvBtza9q8Rmc6aaWOJkbS+GGH1HycnmJcVYmsXmIqOAgY2wRLcfsG+LeqOuQeaQLADhp7hnq
	/h77Ut4ftQn99XcBqsC3OPk3YtweDyenxOwlalyFNFbwuMMinGRJT7zZSVzIk+AslWTa4u9qbmy3y
	TokyGcrhpO6oteqhXB7ydEgaH9kHoXCE44l5ldwQmUaQ9+VIjJhNia6yLzBywfMWInBlM5OkV1G2C
	Vl5PqyIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fq9-00000008FQd-0Ajs
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 08:22:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fq6-00000008FPE-0JAy
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 08:22:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533839tX020825
	for <ath12k@lists.infradead.org>; Thu, 3 Apr 2025 08:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gFDh7FLlCD2oGYiapfu55+XPBan0+1amH56
	RwhTihCk=; b=Pmv/4Z0UgraRyhI+8BUz4wo/OAOmZwHm1XkPsZD7nSERCw9gr27
	co3dJpvK8jL2FNZ7NVrpeUsd49PTNFfDOoCrB/xPOKG7NfGf07HhMorErlHu9H4Z
	o3Dsm+ZhM4BJW2sBDTu6VG7KhcuiGVSBK6zrmw/bYvneXg0qM+1jOxALHh2U+QgO
	6KXTiX6KelggDTkaDWB32RSDe81fei1BlYs4Bqp78F8d/ZTPZ8WCrZD4Tdq6fft2
	29Q5G8CIdcyemPSkZdOcA0C/xzis5ovM1URduZBkQGQM5B2XiKjrx6CmEmUNuybq
	Dc5LdKjmBBsfX7FsjKg0rOKBLK61posB47Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qpaae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 08:22:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73720b253fcso616935b3a.2
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 01:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668535; x=1744273335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFDh7FLlCD2oGYiapfu55+XPBan0+1amH56RwhTihCk=;
        b=MdalcDhrv6uFR/ZRGQ0/3PjoJDurlg5/J6JP1o3mhKhfucGbRIhjcWDmLPhGhuTLQM
         0bwk1Yhq7ezA63Ivfp/Dc3JH+IRuftIZ6CzNcJE3czu62Udk4+pNUYE5D7SVI3zAzhZh
         WFaO716354O/A2A76nGyf2jvGOX6Gb4mSb7qtUYjf7fZB1McfAAU/yS9wJS/0VtWaVYj
         ID0dxY3afRNKY+w0x0wJWkGFRFTaFvH5jspgO01MecnyM1KCmfGp3/GhdYqOhHYxbgHj
         zA9AeXF8n8OmE8Z3z5/wRVnGpHXz0FuLt+3iMPrnD3ur+NLQ3iLjwN0Fw330tsXYF9dC
         JFIQ==
X-Gm-Message-State: AOJu0YyB2/ROfeBMIKpMJIxpM4z9HnOtCUbnCTqavwBSry8U7DITo7Wc
	uT78deUiym0LPXfDxk9qA1EtOCTaw22NiHdueB6fsKsaLVn9C2cFuCcEvNlz4fAgKsVfBRucvP2
	0HI81lU0lZ3VTZq2sTsoDzNL4yyYmnnc4unz2J7iBpHLxxOw16/sR2Waw+8V7/oXLS0wA
X-Gm-Gg: ASbGncv6V9+yfFOxOqXGtCx+1DwpyGqwrlPo02B7oVGoEty0uAirED+08v53AM1vWZI
	AhG6vfd7p1zkNN3CSF/5tJIsfDrvv+7xl+DDrVWQwfc0iLi3QgCSx0ldtuQ8IfbAUQLsGZGdyL4
	AlGDsfOLYbobPwlLkaknBeMz4bFFTGcdLdjHoqLXNhZ9Y5tEt6sEMSXH1/IxYdwppsz1T+JuJGF
	UowwZa6di8UYK0t9/ESHAFu5/T2Mh45insgkZ8AB0sdNmrzNMudXh5tq1s11+WlKGaSCkQBzXpN
	eZG5WF5qxoidj6zCiwycnllw/hzWko81tzUoOkswDICsM5U4319kO0dA98oJ0LjCjocBZGSfQel
	0O74J51gX6ednQDZS5z+v8OzKAB8l7aJn42Xg8Uc=
X-Received: by 2002:a05:6a00:3392:b0:736:a7e3:d4ab with SMTP id d2e1a72fcca58-7398033f56emr23962635b3a.5.1743668535080;
        Thu, 03 Apr 2025 01:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5SE5ineQ9nDIgZdwea03Xg6Iituu2oOp0LLHnkqT9edWih06WmeTKizWXRgiTUm3g1TlqZg==
X-Received: by 2002:a05:6a00:3392:b0:736:a7e3:d4ab with SMTP id d2e1a72fcca58-7398033f56emr23962595b3a.5.1743668534604;
        Thu, 03 Apr 2025 01:22:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea080esm900381b3a.108.2025.04.03.01.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:22:14 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Handle of key_cipher in MLD AP
Date: Thu,  3 Apr 2025 13:52:05 +0530
Message-Id: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ee4538 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=JoBvbwHCwcdsu1lL9X8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: jua4c8EmK8Y59Us9M4cWDEMpRSEuaAzs
X-Proofpoint-GUID: jua4c8EmK8Y59Us9M4cWDEMpRSEuaAzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=648 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_012218_242232_F4718FF8 
X-CRM114-Status: UNSURE (   8.30  )
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

This patch series ensures the correct handling of key_cipher, which
represents the group cipher of the MLD AP.

Aaradhana Sahu (2):
  wifi: ath12k: Resolve multicast packet drop by populating key_cipher
    in ath12k_install_key()
  wifi: ath12k: Introduce check against zero for ahvif->key_cipher in
    ath12k_mac_op_tx()

 drivers/net/wireless/ath/ath12k/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)


base-commit: c0d45354abf5763f3de37d0c59fd863d193c7275
-- 
2.34.1


