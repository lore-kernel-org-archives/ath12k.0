Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B237CCD19E
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+b7fUgZwhhMaLQsGZ0tNXlB2cPB46PT3vVgnAlTc8A=; b=UpnOeoFEtgRTC4333UCPVImi5O
	R/UK3SiSAqzhn5dttABGKB3CS857sOAktHtPUxjTu/fmYXufdiCkUTMGL8i3UkOZLDBVQ4W68jY4K
	/b4RV78unIiTZKH8aY0UlwOaB1SQThnVbp4fdYwHUuOWSeWm0/uGYnKHI57IWfPHVZgghv1TYMwBr
	NOuv+sqghcu6eI4h6V7YzZgJHroZp2NoWpPJ4bM9L3W/TJ3h1wqLhrVdu9BWMHj+g9tucj261aJfw
	1fzkeHOzz64gk7n6/9280muypy/NMSrE37EgDRysHHiJckz9IhYgB0KoGp+55i31EWoBZ9P9mJPAm
	cX4S3e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6g-000000035jp-1NgT;
	Wed, 15 Oct 2025 23:40:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6e-000000035h2-0ZZq
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJXoMA017026
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+b7fUgZwhhMaLQsGZ0tNXlB2cPB46PT3vVgnAlTc8A=; b=VtlVbtWFuiK/Px1f
	ZeTTrOJjRGBTNh6AaZyF232N4ZERwcKRkVFYmJqwz1XKFE6pd3jGxRr//FAL5D88
	vWSGUEuYNL2SlT2JiEbESMPeqaGHJFtogzT9MWd7sZ9Bb/HVRzWALktqYJZI9fns
	zClPWm7/RFhZHA5mYcD1TOrAm1ZqsSuu1u12mSvCS+QDsQGHZ5q7W+18/j2suFt8
	GKDRfNTxTj2wLfkmVbUKWPYqaR2pySgO+xknSqjN9eW0gwsD0sTbrLyKtVuBFgV3
	/p7dLhfrfW070xsYNb8yxBL5IRKk2lM7kw5KB8N6i4uaF0xvIukFk+dJs5fyw3xu
	3dYicg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdke97g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2908ce6ae6fso1450685ad.2
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571630; x=1761176430;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+b7fUgZwhhMaLQsGZ0tNXlB2cPB46PT3vVgnAlTc8A=;
        b=pN+FveqN+7oYXS8aGc8n4hOIpvD1P5AaGpYwELaLgCMJibT6tGdNf9LkM7ew9xqyBK
         ZMGOX11XL8TArNwWLpNi+HgVHK6bP5eMVa9JzTIbxEddpfdscPkHlGxUlAbIfaj+GYrD
         3iFv7zUoJGlinXUPPjYFgzU/zHx/1CRM9hqhA/zYgr1kB91lcI1k6Dqtv04MYDxGAW95
         Igw2Xqb2xjf4tfaZ8PYcz6F09LWYxlXS/4SQDWoLT9jF35yOqBth3tsJ8I0qOeBk1fQy
         EzBU1SUdoX3qh3754H3C+x0bh1dh91n8J9mf+6BKEdUr9/ckw2xF2GIfEg5grU61Wscm
         e9iw==
X-Gm-Message-State: AOJu0Yw8bJoh+3pAJqNqjtC3IvwITJ40HtTJZkVjjR951xQT6W/CQAOf
	wCwNbKrUWFWQAY8k3MlmuTHj48sauAkcsZCc86mWbpZEeVqzGCasjfyq7CvLSAokDaAi7NN7ta4
	dQ8p4JUr9mvASbw9t+Px6+fpOsYhovpu2cSP6AoiU/Bbg0nDiQfidJv3DbsqrYvf3
X-Gm-Gg: ASbGnctnzmZ8Ub30HEPEig0wnX8ZqkadQXLbHPPuYbjFQSoxxirOGyocyJBi1FHxtjC
	VKSCVliopbzcv8WPHFbudVbLfREHuWc4ILk3uojwtZSiNAqsjfitOfYF7eBD5yPUX3ILo3Y4ROM
	2NZ1lKNbRXdXwiFm9Eb6F1YGQ3PFgzlPMnDUrZA+V6LYieb4xOpiZRu5pEpzktY2TZN6TYv0WEb
	a3bB+MVwdtVRrK5xl6Krh/CrYdRaSJp9uZVwAkLG4xx/oFwmOWulz0fg93uHVGgg/pZ6AQbgrj9
	P4AAvb38DoH4vFPTQG5AX0qgxwIjbT+IpsR0fGSkYrHyPHesxd1h+lIJt1kBawc9f8EvQjTqxYR
	i0Gc/X61mlJVjscFJIYlDUeQ475y9HjfO9tI=
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id d9443c01a7336-290272b553fmr383878735ad.31.1760571630036;
        Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtnl8Z3lrpsvoHLdyFpof73aobDtGKw5VSBB4MvACNrnYCN9HTDw4RMMR9B9Aki4eEXmU1CQ==
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id d9443c01a7336-290272b553fmr383878415ad.31.1760571629557;
        Wed, 15 Oct 2025 16:40:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250924134336.888-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250924134336.888-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Defer vdev bring-up until CSA
 finalize to avoid stale beacon
Message-Id: <176057162888.260563.18352558949798033216.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: kddvuZEmzWqfay81YV8KGGc7_xyUqIFn
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f030ef cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LBCZ_CLYCgsH68C2wnUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: kddvuZEmzWqfay81YV8KGGc7_xyUqIFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2LkZdSY4h1rJ
 ilGrO9ADop1bgQvgakTT6Vo2JpzUMKA/KMyLDA2FtFv24VGOS0YinEfcXr55Bp59BO7sXQWHg0r
 y9jA43Zphd4OID1qjQbIx1WQsKmEyppUS9VxjKwxnbQpWkC8zg2PDk6ww+z6/lf7a5ucfdgHDY2
 VNC7vmzBvhTcW/FgslQpnnGnbMLqUW2EvKXlxyuxWDWMP0jAVcxAZLBIZ5VXFS2DFAdOxYNJaLn
 hymZ3vgAKVx35LTFHO08T8CA5SYz5mQ8+lHE5VE195FhIit9AOllD//du4nGbLS/RhVnlByiEV5
 3DT/J/9F41xtChdGzPF1bWbP9RHhrgSlMRqbljmqcIB2o115j7AyKZTgzdgQn9z77BQmZC/qTdT
 6EcjbshsyOMr5HLg64eiPvGIq2UNKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164032_307433_7EA1DAB5 
X-CRM114-Status: GOOD (  10.55  )
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


On Wed, 24 Sep 2025 19:13:36 +0530, Maharaja Kennadyrajan wrote:
> Mac80211 schedules CSA finalize work twice during a channel switch: first
> during the reserved switch phase and again during the finalize phase.
> The beacon content is updated only during the second schedule, which occurs
> after the reserved switch completes. However, the ath12k driver attempts to
> bring up the VDEV during the channel switch callback
> (ath12k_mac_update_vif_chan()), which leads to premature installation of
> stale beacon templates before the updated content is available.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon
      commit: 6917e268c4338ceb5916c8695423597ed8c8b38e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


