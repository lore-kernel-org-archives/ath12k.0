Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6863AC2D0CD
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zr4WSApnfNvfnXCeJq1mAiDIlMO8zxTYHyPtn0ik4nY=; b=goIMygpNsAxGaC
	Yrz1n7K056ICoOj6UhkbZsKrksxmPZVdeWOODKIC5Ca+M58eWnmqQbN3KjjCTWSyUykZPHEZlgvH4
	REPJsiAkgT7/ZwNvvf9YtMceHts8Wx8rD4nUrW6zFWPeaQzaVrwfiv36JL+0fEAxBU8bYgjutqyP2
	PZjanaFumz8ZjzKU1IohGfS8VOLIiscT5hBJJl90AnYQQ2RSMbscriNw8T+M4JD/GB4RYrp/dDMzN
	M+rEnD3hzJg2oSovPR1GtzyAEddAK+VgvO8Siny8IZzfCadCuWr2Ot1/pEQ3VG+E9Q5jl9XE+pDIY
	E5fjBPI+5t1R7Xfqt7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmn9-0000000GWkC-0FOX;
	Wed, 21 May 2025 16:59:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmn6-0000000GWj9-408R
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 16:59:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XPaB016624
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zr4WSApnfNvfnXCeJq1mAi
	DIlMO8zxTYHyPtn0ik4nY=; b=CaDUV+g6h6ltTYOonhUfIS5gPp+CcfLIUJAt7O
	qFFPW0pCe8ZOcJ8bCrNOrd5veZTv+XK1y5FZyBRDGJx/Ar3ppWfZAgAMjEsQFnjm
	8E5QAyB9krRb0GEy6KFG7PVMw5HzJGk1Y+SvnfRc5VptMVkljGoCZRwZkIvtf7me
	Go7W8wWonKhQt7UWQOk9lt/NwjIc9nkv0pKzVzqwQJwcZsBRVd+jmlpZ3ZSRevR7
	d0SW9GWU3nHoMOKjQ1is0KRTdP4Nf94ZQXHO+e1dbuST/Srjo9raLYG8UaZeNM8I
	Y5sC73VFIZpsMCD3JE1N/GKq5qjdrVt5gHUGkepCLi7y3ZFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9up9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e5c14b49cso4798360a91.0
        for <ath12k@lists.infradead.org>; Wed, 21 May 2025 09:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846778; x=1748451578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr4WSApnfNvfnXCeJq1mAiDIlMO8zxTYHyPtn0ik4nY=;
        b=l/6B6ZZpTXlaYcO+fWWiuJCA9DsPpGTZqU/VBaiA4oUmEpyEaWiYyphLmeMXi3tzdD
         sVgvtOPQUw5FONvJrh7SbMnT5e1IfSk/ynIg+3hisaqbOHhmzdk6a08xmYv2P3l3TZO6
         fY8FWWeolrQopt+gBBDBZY0hYTDTFtxtWGHKh6A4O/x1krKmzS/y5wEIuyps2Sf9Hcc9
         9jNIicn0UKf5Ufga+3er55LUIAVLtPT7leVxgCr2Q3d78SZKEe7y2AIZKRlPQdFunT7t
         zJ1iu9dWvJ7mp+oQHDN7awnMkmQWsjWHxAbz7c9x9HthogMB76PDyxXX1/pSzKLzg4hi
         zzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8qTlm3cAgC99bEr2OibVnR5s9DAJmer+aezLHU1fChJX0bj80eAseN8iXOkfQgWAelSXZOTY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx/zDlvW3ygtVKvgfOd6QOjVIU32rk+8tBz2RqDNXe95qLMxAe
	rVoVuRwoVOS7y2FOU8A1qL/eIRHeyl+OBQiFie6j+D7nZZcKINp2XkIeZI/vHHp3m1MdO28kNob
	GT6m2RELWu5931SV4CwXQIkMcx+vbDOMxXdGOx67MJWdmVcC3ug8eonjOVBVMmI87GP21bYCZ
X-Gm-Gg: ASbGncsqopc5gFJuVM5Y/RS6ZgGz0ZudcozU9KDCJXb+7W6isrZOvi3C4a6tq0gSC1p
	Hc+V/Zds9PeL4Mf72t4ljFzAbtTVSqm1kcvj1ZSyVsMlLBpexApnC9yH8ucBBgW92N7mfS2YwGZ
	5YOjtgucX8+F7DoZ/dd9BvgaoCubFSk0qQPYfUA3HNHbaUjDVZ0Jpfau2FMXy59TL4DrCYD3Ja2
	Ln6Lv9I1pKc3nnvmx/2ath+kXI2kLnew0YlKaEelNO1RlU/ZtvFahWef11kbsUGyH7ul9f2D5gu
	gygBswu+OnJpqClLYymfpKxfKYExQbyuLAh+amEB7jMrlz8cUeRrKcLwODdQxbSgK1PELhHhIn/
	ONkcFG3GCiIzUqBR0R10C+6JOfoNX+N27NDeM
X-Received: by 2002:a17:90b:28c3:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-30e7dd430ddmr36472184a91.8.1747846777518;
        Wed, 21 May 2025 09:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNrVIcI8Rdmnz/M0wlFT/WEJL9WfEZ6e9A3coQK80grSSbO+IdGvRiCwx3jNOkI6C930Cjg==
X-Received: by 2002:a17:90b:28c3:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-30e7dd430ddmr36472148a91.8.1747846776986;
        Wed, 21 May 2025 09:59:36 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:36 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: fix several regdomain update
 issues
Date: Wed, 21 May 2025 22:29:28 +0530
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAGLmgC/x2M0QrCMAwAf2Xk2UBaqTJ/RUTCGtcgdKPtpDD27
 4Y9HtzdDlWKSoXHsEORn1ZdsoG7DDAlzrOgRmPw5AMF75Bbcv6LH+3ICYvM8b2tkZtEvF2JQyA
 muY9gg7WIaef8CdZhlt7gdRx/kUXGUnYAAAA=
X-Change-ID: 20250521-ath12k-fix-ah-regd_updated-630a550a0e79
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e067b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=cVR6XFeMKWr3T3-t-FUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xgi-AbcFtU-vdjk-j0EIm-jJmyR-DSpv
X-Proofpoint-GUID: xgi-AbcFtU-vdjk-j0EIm-jJmyR-DSpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX4Ac8rk6xVfUK
 z8xAC6OLQK1jJv2Lf1M7lwVC4eiX7E1z40Kfo6cgZ+pzrqclKjaYjGl6paa5p3vaLUJSwa6G+sT
 PdOCIKa97U+UR0wLXLnKwB5N6h8KCL4hERyzxTTReKT6kebMSoQTzMGULjUh9MvtVksy/kqqt0g
 KVxeRfeWD2z4IwAoIDcbvpI2CkRDsmvqdYdQOsIyQS1Kl/fQ9A8fOJMVFx/RMQIxVlB9ORf1hDD
 WyfGPQXrbaIM1F+chiPZkPSD33CYKt1RF+PEnr9Jrp6RYRieYNYEqWkQXKn0QTKlxP3YPTpya6/
 XhKz9Q0llKjlzscRU0RMHeLXPSFHFX9Lh7RpOcps3fk6Y10gF6WyKrN7A45Q3/lvnjPS8i6/fYj
 c29SZAEuvMh9pkJBvW7o5uOD9CPwIHYyPrPGszXwj8jujgfGxBGcAcrKHC7teXKPDNGsPcFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=889 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_095941_114663_D9204ACD 
X-CRM114-Status: GOOD (  10.86  )
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

Following commit 4c546023d71a ("wifi: ath12k: update regulatory rules when
interface added"), the WCN7850 fails to connect to a 6 GHz AP due to
ah->regd_updated not being reset. This issue is addressed in patch 1.

For the same reason, regulatory domain updates also fail during interface
addition and connection establishment. These issues are resolved in
patches 2 and 3, respectively.

---
Baochen Qiang (3):
      wifi: ath12k: fix regdomain update failure after 11D scan completes
      wifi: ath12k: fix regdomain update failure when adding interface
      wifi: ath12k: fix regdomain update failure when connection establishes

 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 drivers/net/wireless/ath/ath12k/reg.c | 2 +-
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 5b5f14fc4d737a956dedafb996459c4276f4fa49
change-id: 20250521-ath12k-fix-ah-regd_updated-630a550a0e79


