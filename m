Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CEEC3ABC9
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvoHKEkjzzYcPzo6Da3jASTKrHpVPvX8RiAcr3Pjjtw=; b=AzNyuVzYSbsLWpmWO4VBtPKnPg
	+87DPC8iuW42AzxMVzkzxla6kNR/36poAEiOZR7+WYwFpExkOPZ0gE+LQ/NSmYjFCujer5JOG1Ib/
	WKXCUIeqFenGwEK70o/m7ewzJJeEobqeI0vGAXRRVnQ7O0f8fBVrnCulehhYh33K+c7YHxx+4z8Z2
	fL9GTfJZvr/yumz2LsoQq4ECeP7ixg/2+lH5JjDfye2SMleysactzke0XdBEXHxHjH/Io9Fozg/9D
	aEY6TZVFjOG/gIMIF2Hh3tQFbSQ7OWUAPl8FtmJxVr8T7ERXVOnj6tPaXgb7D086zjmI0gC6p81UZ
	hatf2wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v4-00000004TqN-3xe8;
	Fri, 16 May 2025 19:40:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v1-00000004TnG-0udJ
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBBn2e026148
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvoHKEkjzzYcPzo6Da3jASTKrHpVPvX8RiAcr3Pjjtw=; b=e/Syyj8oMw7KPHcv
	5THUBGlvmthJ1Kre/H2hk2LE7QLmuK79U1ovoFJDYBuXFAGwDerrWwc1AJi/5wNf
	yr8H/xFSua7MywaO277xowGkZt8ND2mA0u2jxvScN6lSnB6GWmeFiON08SfnXfey
	kMjuS8jOnO6ZAeJ5zZJfhBt2QL9ar4EwDUiEwhw52sweQWfI5cGp9MxX6so76FDU
	LhpsZF+L9j54sJByLaGxUFCGVzHpJGacTJjVPGJjwvdLlf00j7Hd0pjGjvXsrNe4
	/k7cV8+SIAC9LHi9uagq2TfxHdlVA4+HjcCL47jJkOjJHp4cWGOd+HcEtQSMeknk
	4ny6eg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyu82c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e6c82716dso19745535ad.0
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424429; x=1748029229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvoHKEkjzzYcPzo6Da3jASTKrHpVPvX8RiAcr3Pjjtw=;
        b=SqdD1g1qezl6QOOOiQyRthCo5vsHTyRY71ruIG02UxEwnck7V3NTLhk+XJbDDlAfVv
         uFoXQGvcoBobTa+rVfChB37fT2RpK1GAq3nUVOOFlFLhIs46WgCIMnrj1CkBu2tirpVv
         U96kb/uMGeGPHUS5DpWGDXRoXoqJQ+65Ualx4RBFQuvUHe0bL29YNEgFgTFkZsqNONmT
         khm+wicBxUCyQ91UHn63ZdT8AsfCdbkjpuKR9qFij1XGwaUzhDswy5XUkRYC7xuwECdO
         5k2RoFPALP4B5r8hrXM1qtx8Eg8JK5SvL+JX69Ta1q3mVMTnR6fDngoKheG8qTGMUf/a
         zrWA==
X-Gm-Message-State: AOJu0Yx+pBrZM0WRMmg/+9LL+ZqYfTPyI1wgcZ4OTU+hGg/0xL2K2puC
	sMClD+PE6cnj0v6nTPtb/3PE0JP5dYj6ddDIQdSSbPLJ0iv+89l8kJYh2CpETWgYOSU3VJcgHr0
	xdodLOqBJrApQRX2r3xW2V5MHDhTd0raeJ/sI/PZkVDI5g8ZyzI5JH8s6Msan0Rah
X-Gm-Gg: ASbGnctS1uth2zBIEvUezRSsfiyI++SHVorzev4Ab/+XCizARHe5QurWU5y2XY2ubMo
	wY1KjzZqtD8A/Z+ImzhUPgknp6vJNeolCpSH5i7c9keYQl8FarAjC0jbSSCG7wlNr/bpeUDAAxy
	PiDGP22Y+505Dv+N0Xi9OTECYWHtOLQKnvit1NQ7bezFJKka/aCRz/qkGPTMG4HRsQlW+WE2HvC
	iBB6CK89O8hSOZ5vUN2JR+HN4wJbQFpzpb3gotOgjzq4ualm/kRPHoRPdqGXBwoPxJ4OwadYtyB
	nbkbNSXAo02jkj9VQvkIXzLsoyLbE/2lRvzOMJGHFmj+mdQ4
X-Received: by 2002:a17:903:187:b0:231:9817:6ec1 with SMTP id d9443c01a7336-231d4e55359mr57479085ad.17.1747424428536;
        Fri, 16 May 2025 12:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Fl4Buz7XgPH4csT8qvjpXcGdBTeEEqM64uxIAnQiWW5H0Ey2pjXi1jomB/OZVtroTO8pbQ==
X-Received: by 2002:a17:903:187:b0:231:9817:6ec1 with SMTP id d9443c01a7336-231d4e55359mr57478825ad.17.1747424428180;
        Fri, 16 May 2025 12:40:28 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <20250417065237.2507613-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250417065237.2507613-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support to simulate
 firmware crash
Message-Id: <174742442738.3316767.17251889559296921974.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: wrbKs24oGUraYjOjRsdc6GlGtaTvAv2j
X-Proofpoint-ORIG-GUID: wrbKs24oGUraYjOjRsdc6GlGtaTvAv2j
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682794ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hXFIHNaUnWQ0vPDBKDkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MyBTYWx0ZWRfX6q+1L1oKzYYM
 IY7sKC8Oth/tAmsb35Howz02mAWHLIAvaSBDEU2++Vytv4R56C8nX5LQQUuEBJ8NM0dJkEOzXay
 j5bsWhD/4F8N0LPccQqvkLjZBE8tiEptvUa78Td7ijCyCRp+GkoVOpidUjWJeogdBN8M6v8+MuQ
 U5I795xkM0Ncaexp10qj5oVjokVm19CLGG5OnK20dOovsI2hW9iTTc9qSZEYCywZ6mWDrtt4Pkw
 KXIvq6Eo59o/QPrA29mNGX2gaoAM4KkmgNcfd1IXgnECq/tPR5BIbZqtvPTGwSYd33vR2XKf1rQ
 Cd/6Nwz1kMN7L7EpoQXXYyL3FtJ99LaG6EUPdB0kXFphqMjZjNKxaTnMQZ98XJMIFMLOWC3DQ+Q
 QEB0TowaW0B9B5lnchUYhf8I9zmCI0sZZwyjiAbaqHtLDXbRweQH007MP2b543NClqhh2PG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124031_278109_CC584F9F 
X-CRM114-Status: UNSURE (   6.75  )
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


On Thu, 17 Apr 2025 12:22:37 +0530, Maharaja Kennadyrajan wrote:
> Add debugfs support to simulate firmware crash to test firmware restart.
> 
> Usage:
> -----
> echo assert > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/simulate_fw_crash
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support to simulate firmware crash
      commit: 7971bda2fe57cd86ba8e1588366c1633cbd007c3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


