Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A6C83F1A
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PSVwncDU6Dys5JEA52xmdLuexYAaayc7t0DglVd9hSU=; b=3vfttxl8wLWYcI562OOolsmaMz
	X88+PsNO930LvEI01HTXG6v8dGdXfxFziU6hVZp/kgEHCYOlcz/oRBj2NgJSHTRJklGz5505uRlQm
	ku52JqjCNL6Yk3DANM+UcPI9jGTjuYLa5B70gOUhIN6rfgAd/8KAksacljQO/Y1zphsHkVGl5uFJW
	u2F0+GLG3K7r8Zb2j2BSNk4AT/UjpdjEilPWa5HJq2ksF09/gRgUuwFYontusdb8bY3nOXZrYhABt
	5ajjv8/O5+hrrXLM3uOO9vocVb25uHPzSHi2dU/1HW/yK1OWmTdY7qXwqxc8INXJ5N58w/yyYPlM4
	u4vOCtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubV59-00000003llc-1Uff;
	Tue, 15 Jul 2025 02:07:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubV56-00000003ll7-10F3
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 02:07:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGL4w7012235
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 02:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PSVwncDU6Dys5JEA52xmdL
	uexYAaayc7t0DglVd9hSU=; b=O3ukXhLZxqN3YiATmr03C6jdAR5sbb8uS33RiV
	rCNRTDFsRf/Qkp6J1FTpCntkw6oKwRQR3SsOyBC++4eIqVAWPGYjjJd5iD39s4LX
	K6fzyNx9JbdpUsUpRFUNjzay2zjgex1g6ykqCz5sC7jn1FIWfhrQ14ANCiQ6+e+p
	eMsp6GpBqkhxY0QyyL/3aa0EDw7hr7Txb7VNuzOXu2y3rOkn2di8908qhvcdqC7h
	8Bsuqs18+0RAv49g4DasyP3TN9LsHct3mhbdcYcEcCa2z6s3Im03L93lAC9BHLBW
	UFk+HudJ01u2OrIP4BAZurSKcy7Qe13a3VsfrkPfKPYm+m/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yh9vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 02:07:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23536f7c2d7so79573395ad.2
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 19:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752545261; x=1753150061;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSVwncDU6Dys5JEA52xmdLuexYAaayc7t0DglVd9hSU=;
        b=qYu7b2iP5+vxPaZOCVqFALO/ynC78hHCd9w55EvqMmnPjvVsO8/NqA0PZhJAvBXhKp
         S0rvaxtyv18Icbwd/Sd+1T7jCqHr3fK+LIjc7mw2jZXx7arccjwxsLCbAwR1rxCBLFaH
         03sWiJF1nc7mivYcGLtb7xbyOx8H+F7OHL5daV9c49YcKy5f/XQeFKref80Djuaehjw9
         L+317IwUIczJWZ4h9R2x1CLriM/wUb0oAW3sU8woSh+b5NKtAO90WSqsyJqIhlUSUwaK
         hAMcS2ir3l9SmW7UzX0iHkz0TS9L4q2iCfSjUPdUgC3xRO9gyWHbyzaQbXJLtvsS4++V
         KwHg==
X-Forwarded-Encrypted: i=1; AJvYcCWOUVSZWic7qS4ftTXHDk75B5fVzgae0Q1SoV61OAxunwa7AU5PN7MaTzFgsD0YVFB5uo06FqQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVxjyjVKztrUksXQbN9hQ+lcWVOuUQtDtjNQnjqEAlxcC/fjJA
	DknxJVC41Cd+n8r18cRd4A1/+9Nu0nm49T7YZbUDPlQjCB8JyUpxm321IVx7W64iDuYNAtUkq0z
	1aL2H+EYQItJNsw/aOJ5tzd3AyaE2OXZIIDkLGz/dDI80deQoKL89ymlNh97srebyC+JrMbJm
X-Gm-Gg: ASbGncu4meObXXuopZ8SlCDqt07BBxNsIjdsn8Ipp8l+9h4OX5Pi0kbsMuPxUUHeUSj
	e3Cy+/R+8CtMYZD/jYqu+vqDDc4xVDUUtdiHzKn9R1hPDrnWlz1GoTyXSEcL9LviX6w8j5tEz7O
	AMH9iIdVEhIWncqmwp/iWiuAahPdUH2OT3NKzRxHb01CVj4K3p5IBv+oZTcDfcB1vNt6EjtzCQy
	gqjh0spZ6DS0seupDTPZANfh25G4xrrljluejsUeVZjzWp79F4vtJUke6R1jgi8eiS5281LJjGW
	ZU2qUreJh6H8HCFqj2E8H59ioHAsWuDP74Wl1mRjcDEoC6OLDEaxxTnZoWfhQQOjAtxY5UtRPdI
	NE3MOEOVtOVCVLm9jIw==
X-Received: by 2002:a17:903:1ac5:b0:234:db06:ac0 with SMTP id d9443c01a7336-23dee264f3emr234356505ad.45.1752545261213;
        Mon, 14 Jul 2025 19:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJcKH2/xSIW5sa5dra/KGf3NPul0JNAK8Fy/Ps1y4FVsqv9aC49irxSUQ7qZWB9zBprTyTsA==
X-Received: by 2002:a17:903:1ac5:b0:234:db06:ac0 with SMTP id d9443c01a7336-23dee264f3emr234356015ad.45.1752545260784;
        Mon, 14 Jul 2025 19:07:40 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42abd8esm99760635ad.54.2025.07.14.19.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 19:07:40 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:07:35 +0800
Subject: [PATCH ath-next] wifi: ath12k: remove unneeded semicolon in
 ath12k_mac_parse_tx_pwr_env()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-ath12k-unneed-semicolon-v1-1-9972fd4cef07@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOe3dWgC/43OwQ6CMAwG4FchOzvCJgh48j2MhzI6WYRNN1gwh
 He32dlEL03+NP/XbiygNxjYOduYx2iCcZaCOGRMDWDvyE1PmclCVkUtSg7zIOSDL9Yi9jzgZJQ
 bneVNe9JdV1agQTFqPz1qsyb5yqjELa4zu9FmMGF2/p1ORpH2P/UouOCNxg4lAHZFe3Eh5K8FR
 uWmKaeR6Cj/5CRxIPojPYtlDeoLt+/7B1EfIXIeAQAA
X-Change-ID: 20250714-ath12k-unneed-semicolon-896fbb45afac
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxOCBTYWx0ZWRfX5KvSXmQhIZUE
 CymzKG4xbyzKFhIeTxZSgqCiTYVFKSBlYRflwpgzFMhtE+EafJoMWWr2fMXqBxYbaE0VZ7rlg+I
 3td0Zv12yAGOJu1omd9S/uKUSkqdtNPNPIF33f57iUmG/RL1hzgrjBzrK6gKWyLp222DPEnw5RN
 ltkiYfapbswFu7tcTeML9gb+LDQVBoVw8RoHfo5HxIJ8V7FOMN8Ffg3AECngs7jMzMrK1b8s/EK
 M4TLdFUTIBwJJRSPQN3NVBY8U5SbRKw4ecac2Z6Q5Oa0XDdwhiJBbqeMyi16jz2Z5cdFRpjtUzF
 5zDqZ1mADr4Y2y1D1sxGF9l/NS51gPnNPV17WmfWEJMS3jxAafVIuPPetfmAtbuLdYz+qqBWCI9
 1HxDQyVaKpIambTKtgiEQ5Ma+l8yXT8e50UDXIXrVnweZVZMYcl0AIpQ5o7kuAmyXXbuTPgm
X-Proofpoint-GUID: kFgt30MJRUAjNezi8y3OJtuLIW7y7Pz5
X-Proofpoint-ORIG-GUID: kFgt30MJRUAjNezi8y3OJtuLIW7y7Pz5
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875b7ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kzacFtwYidqRY08iEG8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=901 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_190744_434927_6861AC27 
X-CRM114-Status: GOOD (  11.87  )
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

Kernel bot warns about this unneeded semicolon:

	drivers/net/wireless/ath/ath12k/mac.c:9785:2-3: Unneeded semicolon

Remove it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507132355.ljWuxxjd-lkp@intel.com/
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5333da9cac1b2cae4a71c975bf927de8182c357b..a5fb917812c1ed2e60a3ceba32d092d7198e6054 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11424,7 +11424,7 @@ static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
 			    "no transmit power envelope match client power type %d\n",
 			    client_type);
 		return;
-	};
+	}
 
 	if (psd_valid) {
 		tpc_info->is_psd_power = true;

---
base-commit: 3a6df1678acc3687d49ce94e23df7b6a289f27f9
change-id: 20250714-ath12k-unneed-semicolon-896fbb45afac

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


