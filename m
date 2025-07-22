Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D372C83F27
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ZMDuKP7h3626TyycBatNbgqTtgdtOYqWeLoCfMOJHo=; b=E5cWGQrdBw8aRUVHEahPM8POrZ
	4KHyNKP1M5pdBi0G9TxOgJZ30kD4QKalVEcm7lWl9qt0QIXBk/jOnPiCk8fWFPslVXZjG6qQEeMVy
	hq5yYArLlQ05bMeHCoctStXigIufM/RqJOG4obEqBwJLqycK9AqquhPfZC5z5xw5UhybtVatlLSOO
	+GxVbQEsw7OGY9E8KBxTD0tXtuwslMxQsCauoOdrQ8kfdJ+brIRFF9teh+VY+9ULtlAZXxysUez7y
	iBdVIhTvGneUDAsTxEbuhVnGOuiw6QKzVwuoxlBl+g4TXop6bxDSDvNyAIQ1YaxfIAii0XuoG6fPH
	aU0N4q6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9tl-000000026hD-1D24;
	Tue, 22 Jul 2025 10:07:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9mm-000000024ww-1AMR
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 09:59:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3Pn7Y015848
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1ZMDuKP7h3626TyycBatNbgqTtgdtOYqWeL
	oCfMOJHo=; b=l377SriCwrrn2xwlVhYH/PfxqioUxL/H72SmZpOI6rdyPBY0u77
	hlrJPD2Jul0aPQEWvGUffMK4mGmN58hRLEO6q+S14geQxLEDloWYWNqVyjombP0j
	aLtcxf06hPU7oH7ZYlBd4NtzjSKW3ulqTnoPAMQJJ/mXVvIUsgJUkIRKu4OUBPqY
	lbbW9eApAMqQK7gAx27dQlCoW/+bVHnPWpQOAK3lpidm5MnZxarjOFBU9gVXbr2L
	VpAiw4pe/l7RNwGe7Pd0A1T3dHVDdsDEyTiO2Q8Jkn0x+Nx7fyG8wJMdae2J9ncr
	nHBcbqErVqrzjixatGwQ2eDdj5Ma5byhgqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451gupv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748e6457567so3480869b3a.1
        for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 02:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178385; x=1753783185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZMDuKP7h3626TyycBatNbgqTtgdtOYqWeLoCfMOJHo=;
        b=Porr0HsUHR63s0QlSepZpbHZdpzjvidTGWmLpvqHaigMj/09ryISpwuO2/2LCZSDlD
         NZmHI9FsyfDOnJzyy95augfsZwtuAAwyrF4+m7sOuCzs4xlvqne237zCS6oiyXh2hiIY
         n0hB8HdxAzAqAvZ2GOaW9HgWlDk6rFVI+ezQGPshXPP91pnXWlrm4bPE/SAkaIIrEwFV
         MBdbrJ766yAMiP8UtzMORt5vcun0mUHoVt4uslTK1a19D3C3fhtN5sZvtezpJOupv+xZ
         6UTYfySIKX+Up8iZUS96sa9ffY9QpVxY/SH3oEntLQ/m99m9lKKrp+xEjlk0ocnlzmln
         5Mzw==
X-Gm-Message-State: AOJu0YymATFtWBNGk6MqZyvDmwxw8L+7fP7as5rPyOwjLjIH7Q3RcTY5
	BvfU6OlZ7QuUz3RJy1CfAB/TFgTt3cVJNsm9TPCJly9uSTrKxJ9/nfuWsXQdFN4GfezrzKGpRA+
	lJZZ6WkVfc15qbaKLtAF6bCaDtaWCsRAAJRe/R3oLxUFO+7Tp9LeceIps2bWsmF9V7IBMUEBe
X-Gm-Gg: ASbGncskI+ha7KhPNelDFDbKMvpJq3+iwoekZWkuI4DJPMDYS1xsKFChiEggFspyUax
	rfLmf8w2LG1N5F0tcFJNWhN+9Z62wIsDaQhOK6sK/aoZw8bqf4n0WhmvpAGfAfFCjQbGVJ2zedq
	J9vzdAaPaOdx4gTg7zZhi6DdOHVgfs/WFuP0/lIuXSOIHO+U987xSiUE2KOmQB7VYxw/wg9znRi
	kH48nfNTWfbDwZDdl+xinpxHuU7RQ8JKN7YuzV1n35zz6iHg3UVXsB4uJRRyTFh6iGmUy10QBwM
	vrnY8As3ANXqJeWiDH3wSNZ9CsyCdYbI7PkcvAxUukH3PjX5Xu/z4OrqT/Xru5Z+087SlIu3/tY
	wHVAVBtBlwJcRlcEZw25YAcNjawoFaNmKx9yFVq/7bBMdmH7q/wS5Tw==
X-Received: by 2002:a05:6a00:399a:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-75ed0ab2986mr4076290b3a.3.1753178385072;
        Tue, 22 Jul 2025 02:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGrni+EObt9NBsaW6z39B8SXXX060AJ5RE0lVvSp3vfwVB0UxwL9lzaqRR0yY0KJSTSxJB7g==
X-Received: by 2002:a05:6a00:399a:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-75ed0ab2986mr4076264b3a.3.1753178384623;
        Tue, 22 Jul 2025 02:59:44 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d6bf2sm6851065b3a.53.2025.07.22.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 02:59:44 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/3] wifi: ath12k: monitor mode fixes
Date: Tue, 22 Jul 2025 17:59:31 +0800
Message-ID: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f6112 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=yHWqMfdfMdZBZPA-_MsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ajlo9jx7Ce5OaqhWCjhs7tL46Cgy8Jdv
X-Proofpoint-GUID: ajlo9jx7Ce5OaqhWCjhs7tL46Cgy8Jdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfXwXmZnvAktV+b
 qe3Gn1yZPhn22bYbfdDgQKeWJC91JOGD9Li294iZehaTwrUtRJOzYchgVB7XUi38iQOX/3UcAK7
 89q9IqvYLp2HrIxIJiz/+PDp9H8LSCHKXDKjcxSoCQzHuzMt4v4IyFuDpojKs5ws0KhYBk/J2jn
 vTfTAEv0aebKJkviuHKpr7fVOkaeIrqUGbdpd7l3F4U2y46ZBLMCVAfzCKRKiEMfuvbaOyn7u+k
 Wz6NQpVd+d6GINvmRwgaZby5UD05nKBpeKpIesevPIX6xo/dPN7/MIN1pIA87NRmGSim29V9qG1
 bXB2m8zBke56fFMopT8Qe5hQReTZ3zqoECccpvCFvRmGjXTPlK09M4VxuRdWJCmFQxy9V7hGIG/
 Oi2qEUBtPHd1OuCVBAPkSBiE4KyjMbjbi1Uii62eh6CB1TarqoxJBmY5DBJO2E9uxWxaJBtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=717 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025948_450383_B52D3383 
X-CRM114-Status: UNSURE (   9.20  )
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

This patch-set includes three nit fixes for monitor mode.

Kang Yang (3):
  wifi: ath12k: fix signal in radiotap for WCN7850
  wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
  wifi: ath12k: fix the fetching of combined rssi

 drivers/net/wireless/ath/ath12k/dp_mon.c | 49 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/hal_rx.h | 12 +++---
 2 files changed, 46 insertions(+), 15 deletions(-)


base-commit: e4f11ae0c4b29ca0c133f891412afd5dcddc68ff
-- 
2.34.1


