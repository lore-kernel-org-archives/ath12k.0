Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F3AC36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAlXsfsrquK1S93niFLe52PvZv7ysy5cm+5sewzm3OE=; b=C3FB6G0AoQyydBUrrgBiETA2E/
	7HJoF/NnSiRW01sZPIO7/Vj9JL6U3vGgva1gI8wkXEERXT3vdB3EN/PwNCyIImVNBQ1noh0iWjiZq
	0C0YYhBdluJ5yF9BkC6p08NKWRU9Yo04r5/do9Zrb2nPMdIHALAvsBIQWX/08UKeMyjOTjsLr2GkR
	jNwf+gY54Zj3wRFcnaCZc8YpUVXOoD2Nz/2HHqCa7i7FDAVTUKlSpBdCysVjuVje6CZdRjVS/huCm
	dBNfcTT4muZM1iuuyDzmZYDz7IqnymlWcVDdMnbXcO5zHxo/QWoY20phzaVDnwibMpfWZ8cTxDgmE
	TFVtW7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WwF-00000007aS9-1PNO
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 15:02:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wcj-00000007VUV-0you
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 14:41:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398AnJa006892
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAlXsfsrquK1S93niFLe52PvZv7ysy5cm+5sewzm3OE=; b=kY6A0Gw5RjTgDUQx
	0WNBUEzbuAGu7lG9fqa2sqxAxn+bToNflyVS5aEOy/ivCfDwzlVJmJJnVe43s7Z8
	1czlzyx3yRNh6sQDmx4cG64N+Dy18wvA1w7spXfUVSWQORgC8ecvdDFXPbAqT6Iv
	meT/FmzBe2130OXePMoT7qmD2e2IJ7OmPHILtfB24TCLMBPwycMAVKVf3Pun4UCH
	IxttwLkg+dzlPz+w3brPv45JfeWFGnG9ecdbqHU6ZAPaG1iZZDtDUPdXkS/7izwx
	pRUhMj+WqwWu6KW+G84xYRO5IZJv+HWPxsF20qMVBx1ThLvTAMt+NuWoRbieb3dx
	tR6hSw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3kp2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 14:41:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af8a4410816so5659270a12.1
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209710; x=1744814510;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAlXsfsrquK1S93niFLe52PvZv7ysy5cm+5sewzm3OE=;
        b=pRZ4lOTN/VTFB8l3mGLWo67e7uPsqToYrQ/72XGA13TJXxAGEcDddBxystkqylk59Y
         65MNd9cY9vo3K3gWA2RbwLc2DYBvt5Dz8vZv2A/rABwxxxxLNQbqTRD4cK+sCaew70rj
         eCgjaAusDfK4Hb24Xg8YqQGT/S55/JjWrmiR9Dz8A678YPLmJdjYngh90yyVBtiOQP9s
         Ok5JDToJmyHVdoV5Z9OkfDjnoqUXNuZ8o2jn18caYYBsRSBISPTrOZV62NuuR2wvOwQG
         FRjU1EKeLlzybOvixcIuPF+Wi9D8JbJ0h8ABU3z/ShJsjqxiV7mK4PcVsSBtx1QUUgfL
         zvxg==
X-Forwarded-Encrypted: i=1; AJvYcCXUC5ScckFWXCSqbVfM1MrOrl7P8bb2l3vG0Pw4RgCl8akD2FeSBfBMcEfFy7j76E64+6nXvHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxADe2ACsXEVVpxlLUtGk4XLOKBqjeofQRJGzSo1ey7P/7WSEbh
	xx7YJ3xrqcMs4CPE6OMVV+Uifr1pqRMNw57ulXLohOHNjfbdMLDqTyB0YCInPaILwJPwara6C4W
	WcSxg+40FXnPp6Iqb1xejjlfWQrMx1TJ6liJvh4EhRtzpWy41gir4G2wzKwx+ezGfMkIc
X-Gm-Gg: ASbGncuZ3vVgYQ2WkPjbJA99eP98WUZI47xcbgPlWbR/+6BHbdv0mHuuyDB0zE3najE
	n/uEGPUMOSqqdL6GszohztS44qs4Ka5GTzClqZ+pWOM677gWIKFqGThp5QgxNs0S/FCJr4OQyK/
	ag8TG4aL/VupVyIxJ+nHkIvaJ6axn6jQF4j0KPTErS0zoDBKoJg3e3L3KfOUfT8qW2tFUQ8i0qL
	lGQCinzZt+ZsZF14sqLPmAQexf642CoKs/zYYlbRwoiYwhg+iCh5BkllpB0+jReFarlh9lQXC5+
	+7CSmEXwcgmxio4DWxv17hApLY4Y+oTNtZq4clZBkjqnc7nP
X-Received: by 2002:a05:6a20:2d29:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-20159158073mr5477094637.7.1744209710188;
        Wed, 09 Apr 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd0U8em6xrEZ2t7SnXCW3CgYP38EE8cCvSPcV7P2UyDUSrlOWDuG74IpGN+9Z1b3imdkiXgA==
X-Received: by 2002:a05:6a20:2d29:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-20159158073mr5477058637.7.1744209709823;
        Wed, 09 Apr 2025 07:41:49 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2571sm1307153a12.19.2025.04.09.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:41:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
References: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: ahb: Replace del_timer_sync()
 with timer_delete_sync()
Message-Id: <174420970903.585328.11717154866782453003.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 07:41:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: pD4D3_Zvf1SXVcXxdKXadwr_d70CQQIu
X-Proofpoint-ORIG-GUID: pD4D3_Zvf1SXVcXxdKXadwr_d70CQQIu
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f6872f cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=xVpgQal_Ih3nwBzge5IA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=863 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_074153_393521_C7618073 
X-CRM114-Status: GOOD (  10.56  )
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


On Tue, 08 Apr 2025 09:14:12 -0700, Jeff Johnson wrote:
> A linux-next build error was reported in [1].
> 
> This is the result of a treewide timer cleanup [2].
> 
> The ath12k AHB support has not yet landed in the tree where the
> cleanup occurred, and hence a new call to del_timer_sync() was not
> addressed by the treewide cleanup.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: ahb: Replace del_timer_sync() with timer_delete_sync()
      commit: 25b2f46bd7de2f0007d742de9d2e72e65db0edf3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


