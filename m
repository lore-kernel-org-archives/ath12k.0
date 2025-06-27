Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4890C7EE2A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKmlYnBP9zOMxT8PZn1r52h16H/B0zHwpvwe0daHy0k=; b=TrNtWdJw2Is1tmxKmOXa1TEzoc
	JIfuCmMDpQBh6lirVaMOXyMcknboxcGaYb/m7ae7bo+gGDD8pfcznz6Je1zxT9GBkld/lXmUOwobX
	WGR4N543Msq/C4B+H7tmRwqh1nwu/soJtu71ugyluk5xRgXEyslHvsAFXHhmbtYrhbM3ZW9r5KB6S
	LHwItXZZPyeIs/DWxou5wP1tmar5M3od3s5UcSLSUqr2AtfD7zMC0wSLoMN31T5upYLjTmRyss/kp
	fXPOfAvjgykzkzNB8dEC32zoewuE7MqPVw9UytX+R1bE3OUnP/2mVvXY1MjmCFG4DMV/2rxJwp+Ui
	JecTlLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFo3-0000000FlUP-14lF;
	Fri, 27 Jun 2025 20:36:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFo0-0000000FlU2-2BLJ
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 20:36:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC8H6w014328
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 20:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKmlYnBP9zOMxT8PZn1r52h16H/B0zHwpvwe0daHy0k=; b=LlJgQf5o0xsZZxNA
	RYCIxKueCv6zkmlNfPlFNVx+Q2Wdc6us2nG5NjDezr6G3fTqvFTGDbwy5GCVY1gp
	Z2d7w6LerftUaeJ4Jd8mwJEwlEw4w7cvjjGqyZz/igqRkfi6SZZIQd+NzhmTWwhd
	5L7g7yg0EHRV8tqPQv6hSOjjPk9t0Lfo4h9qPm6VfXmJISMXzoRqRptSsLAfmIyy
	dNbABuBECfU9jqU9xEcBX5nX6BKHi5b93F/SVOxpC81UOZPHE0d841JDTRjsDoWN
	O6tH+V3KMne2ALQ3e/XzA+jQ9sdWQ6JxjTHlyBZPgkRMm8NJcAIrfpxH+Jkiq5wA
	tOxCYg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn1rb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 20:36:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7492da755a1so295821b3a.1
        for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 13:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056575; x=1751661375;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKmlYnBP9zOMxT8PZn1r52h16H/B0zHwpvwe0daHy0k=;
        b=VIydefoBVfKUJC7ajZZsOy3oO6UBmtGTO/YNpc5rmbLnq8F8OHOyRaIx9132T4KMdJ
         M+NmvQV1lZvZlkXc8z2g3/iQ8WFS45UheW2Jdy9HRaLMJVtOgBWBIKRiPcno/NPHzcuC
         5p8a7Sf1tgH+uiBVK0vMYMz2bg1un/fnqvT2+EfDnTZibJHK8roWceBj9D68j5qm1/Ul
         ni04e8CPRj88u5HIjzVzub44x3wpWRgyvvdC1u58peOJYuPj4ik8y6GLuzqiYxbfh55x
         +AQwa3NefOIKucpoe09EsCnROXPfyGGqdglm7JFyfxJq7DCqZ1SynTPLYjCFXGcqB9j0
         dqGw==
X-Forwarded-Encrypted: i=1; AJvYcCV1sY4O7GXhdGm95I/dWQm336IYu5hcWO7ygOWR6Oko76hLX8zX3K/G8pGotn4zx7sr/IMzcW8=@lists.infradead.org
X-Gm-Message-State: AOJu0YytRrIwQjNr/kMmKh8ttBtw1VFnFisKR1XwBbYjQqp3sEEEl31C
	puLLVTueQO8Jyo0lhKqG5FeSU2u4esciKUH0BnNdvp+pxMjauhdR7DyJSVngIxso3fvCP+OdtSv
	P4In6SSn83HWpOj+3PMNcnpWWYLGwYmJ0XA6BGncz4orcMnIyOOMc65UEios5pfz/
X-Gm-Gg: ASbGncsLOBmpxpCtvBJYrSFvyNng5f1CDXX4ZjjqD0gkgnpUIvHLkXnKrba9zTMW1Bj
	Euo/hXbws8T945XhRCUOVWQv4Hdlos+cMHIAuAZq2vmt6R+l0hkFHl9vapMvsqseVh5kMwDCLVS
	bJG3uH3o2hflfpL9oqqh+rdDwbNujMCs6wWQAvHePpXZzbTdMgD+TkVDSl76EA1WQTjht6iltlm
	X3SWVuZ9H3Sd5pxm0TGrQkrKpNhMrlzOz/ddHFQ8VJUUv+oOsRVMUoY55ARNQPxcLsZTKh4gGOP
	t6dqUcn38/aCR4oqYt4VSVP2TfqFmfO4pMaUAxJYgmeWVoBcWcU5OblB2Yk=
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr7154806637.22.1751056574729;
        Fri, 27 Jun 2025 13:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvRRER8EH+IDOvZPMZ8NqWYOV/aI1CaW87KVYa2720l/lwfwzGQgiN3cck/ApDlyzqHXs54w==
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr7154773637.22.1751056574326;
        Fri, 27 Jun 2025 13:36:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea0bsm2240472a12.41.2025.06.27.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:36:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
References: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix timeout while waiting
 for regulatory update during interface creation
Message-Id: <175105657343.1441396.2046714051243602990.b4-ty@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 13:36:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 7J_k8rhFqXelxX_2RTEE4CtNKay5RoO9
X-Proofpoint-ORIG-GUID: 7J_k8rhFqXelxX_2RTEE4CtNKay5RoO9
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685f00bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xtsjAY5F9q7pcwWWpd4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE2NiBTYWx0ZWRfX9SBD/cuDfk9K
 FCjouvgVYqRHEH/uHe6LpooNMrYdS0t35zyEUz1591GItzAnL2p8aDLXPmQTIoDG0CpWUuKD4Rd
 VeS2WeJ9qO47puENyQZxHEpo0F1aoaye6D8bVPmibDuXu70w4CCb+HdG6WP9aa8szHjSPHaZ61W
 LcWx3JNJwUgo0dBmXjd2hLFaSHT1zUV2R4Pvh9RP/AvmV4ozBZO2qzwckQgRzVLAW9duEro6+kl
 gNqqrHnMU+NyJcftW53FhI/CbPrXhxYXW47iMJlfz/uj2sy/1pbzpN6lBGn1To7F15NEVu3a857
 c7VH1OzAU7JkgTyAitTxVVx6iWHp+gICMGr2Y36xS/bafT9LMmTd9N3PnbpKQezm/GhOBBJmYo7
 34LpPHid0PRXCYMuHkvA/WbnDc9dIKBLcL7VMyzWOsBxhsrVzmz1khhXjYlKQadma+fydA6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_133616_587069_7FA1505F 
X-CRM114-Status: GOOD (  11.63  )
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


On Thu, 26 Jun 2025 10:49:56 +0530, Aditya Kumar Singh wrote:
> During interface creation, following print is observed on the console -
> 
>   Timeout while waiting for regulatory update
> 
> This occurs due to commit 906619a00967 ("wifi: ath12k: handle regulatory
> hints during mac registration"), which introduced a completion mechanism to
> synchronize the regulatory update process. The intent behind this change is
> to coordinate the timing between when the firmware sends regulatory data to
> the driver and when the driver processes that data.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix timeout while waiting for regulatory update during interface creation
      commit: 6e17bbb5a86e6c68d65e38dfc850699e7a0706cb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


