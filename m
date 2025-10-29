Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E84CCF9F0
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vggPJY16TqzMi/evuM1V0ydgNwJL8MMswUJoiRHlisk=; b=MEpHHSsIcbUzn66kVlycNikzFE
	jG4ykK9/JnWJB69gWKRApttYcVzI/pxwO0FAKdzqFbvXBSPohyNq9sh0r2J6Um08wnjdBafAh/DCC
	Oiwqclfnv/2rOgY/NYpO56jIxnoqP/62Bg9GnIn4GYp6kuEOlNF0ruFrvQPP8IA4j/FQ/uTkfljlS
	uSCY5ZhmIHBkDY4R6A3Fhynjx0PDp1b64lN+4P1l4oy/osrXO3CUk0RevfTNAsTa5c9wV6P7C2j5r
	CYFTgkQVzBmHpZeg605OjWuRX3OdxDa7JDIfOzC3riCERXdSVaxBIsDObHqCfx/2O0Oriqa8Yv0ZQ
	dB4nLqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7A1-00000001a96-1FYI;
	Wed, 29 Oct 2025 14:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE79x-00000001a8l-2zCf
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 14:28:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBhdN83692101
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 14:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vggPJY16TqzMi/evuM1V0ydgNwJL8MMswUJoiRHlisk=; b=YWJ6W16a7/7YaezD
	QwvfYSbq6m5asUI6VsLRiwCZoKSYZSGCn4Lx4aH1VZau+heT9PmeGC4R8jQAQZ2I
	fi2Z+51yiYILwilFcNqNhpf1pfiafA1ihZYvSGcw+n+jMXv6C+VO+aRvIG3VtioE
	ZlUcbNb0YlnpB4VH8AX154Fwfojh4ENWdaTN5JAuwViOGDKebmTCOzE8HpldXaqn
	HN4bdxP7zdhHfWKiYyj/Vp54Pn6v2wadaw+0l0l5xKqatIz6cw5TNUxNcRhTaeSG
	3KDiXbbDLZ9seZfUU46pyS7y411iRnrWzcheXy7iUivX4tLamE9eQeVpzfxW63Ek
	N/D4mA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2juyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 14:28:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso14134081a12.2
        for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761748100; x=1762352900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vggPJY16TqzMi/evuM1V0ydgNwJL8MMswUJoiRHlisk=;
        b=bbvjtS+nEZDmk/vzKeyKxzp4obZkA+RbsVI8LyKumzr77dJkc0f2Jr07JMRMTPQ2b8
         FymwcjHeYHDK86cxks2w+yundZXkO8l1todj3sJuSs6lSsi29JvHkTeIB+Hpe2n7Hw8Z
         +SshZ5jmYCuexNEJipmjjiYW+z0ycfjgWKEcXY6qjAZdmlcjl2HWY624wN/phLoMMXTQ
         0SUpZVn8XWWqZocFpHmQqZTl4IPFy6i5chxVkIBDGHstFmd2y0uF+b7HMwMuv/BNU7SK
         Xn6mxqxFCvi7hGCmognbB7M/KVorVkBER1u2voRBCGtl97whRoGPVhdSc/XEH1tFT3e6
         ahLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748100; x=1762352900;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vggPJY16TqzMi/evuM1V0ydgNwJL8MMswUJoiRHlisk=;
        b=gzdGgEJ5GT4PF9eIxAcsN+AfvoXSD4ac63oWCPL19YvEomaFpuYUmjMix237i7guIA
         ZjEVWHsNQAfhKKqHOh4c40G0kO+ldV3bWx+9FmENL/08FBuWj43XfEOi/9F2JW7HLVfG
         wbg1HKm5wwHcsWJqClAWeATsTF8/JhV3H0eo7dajxCQHaPTe3Ha9dvEPm9jpYtyntgpj
         s6M0Cx1SJkh2yTY8Pk8gEFjfT9/ZiyYuI/MCysGPNk135+BUosmhRms/7Oz2VzmAowUB
         3Ta0EdTJFn/GWxvuaN1pYmHhH07T0Qzg3vQIm8Sae5pZs618yXYHhehoH9YWJcWBDds2
         8Czw==
X-Gm-Message-State: AOJu0Yzjxzlj5yKP1ka809tnknLUjpTaEL1gBb/rBFpKGvRznB1kAsiO
	t4HmpEuvMZHL7Ga4b6N0WevyWeIXZ8SFF9cyV31yQTfqeYChqoUAtuWPFXgE3bWgE/ZrHe6/v4c
	feJ8YZDu6IrV0VAd1k3iJaKXBP84W3GHzCo5a1Fgqk9+7SQMRLgxigEP7C0EKmvaF
X-Gm-Gg: ASbGncuZgQD/JpSxO0B5velNYvf+/uA0eYWZLyafw0JN57DzFzpIk5j5EdH+TZJgxry
	YR/fO2Pw5rmr/5rHVF4GHXZwxIBFa+UkPwVVLB70cpBM3oKvsUngxL/EF2ZJt658npot8YqvqGp
	nLEP3PP9ER0HbsnF/F7qqqJvjFoF+/YfoljwUGKasa2ozphq6I/le10rilVRoxobv3gQaPJ5JbX
	yLRp8MRicXRoG5U5xUL4JighGSh92Ifp3d8x2gC0cfb3AF8AFDw+h7RLVjvrskWGDfUk8mHzVoo
	mp4iqlH3k8olKDqXgngw+P/k8jYcXVlmQxXuuBlYj1go48XZXCfkraBHAasK+/NEy3IVkW4CM/b
	kBBmit+h2pSJheFkJ68oZO4xt+fUdFCFA+1s=
X-Received: by 2002:a17:903:ac3:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-294def4840dmr33515375ad.61.1761748099400;
        Wed, 29 Oct 2025 07:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXSG/iIAfbNKQsaW5cMe90cddH0fAKzPWthKI8ur+hYnd6C2vR441AKTqe3jtSdiOkoukbHQ==
X-Received: by 2002:a17:903:ac3:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-294def4840dmr33514865ad.61.1761748098745;
        Wed, 29 Oct 2025 07:28:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0c414sm154236885ad.44.2025.10.29.07.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:28:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ross Brown <true.robot.ross@gmail.com>
In-Reply-To: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
References: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] Revert "wifi: ath12k: Fix missing station
 power save configuration"
Message-Id: <176174809787.67078.9723142274217890219.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 07:28:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 82LIAGz1zhmfCDP5puPl1BGuTqxNYHow
X-Proofpoint-ORIG-GUID: 82LIAGz1zhmfCDP5puPl1BGuTqxNYHow
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=69022484 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QZKgdDJMxHbNcH4R8hkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExMiBTYWx0ZWRfXzIovXG/lZWYd
 HfHodmLj+OuOJf/hEk54/Z48yIh9Q9X+eZoV4zCEtK9Uc5Qoq8Ozut72cK1DULdbu5R3E13n3VW
 mSofEOC6HatxnOzR/TAONiCr7SMG+UkKIBdkFQUrTnbKwYu5mAlu7daGRapEkhnYT7ZXGhAMpRI
 ez9O4W/c7+X547ACwKXU6ofe0g2H03RCYHbpuN25NrSPHWOJBYtlqTUEMv5ZB8Yv94vNXCVolFS
 I/LhKnFZNNBmDVsE88d+EPCiL/K9cyvcfzvgWkvo0VsOBE9JYbb7vUBAOoYaI0WyVB+n51IU3mT
 z+K7kHi8B1IVtGTnqDOxGUzWxUy8HS4C7ouqNxQ7ALExLOKqlKUN92LN0I2FOT+1Czmw0U840VM
 6JuQasQgNzC72VOqTRuGtfGgwRk6iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072821_892756_39A73B8B 
X-CRM114-Status: UNSURE (   7.95  )
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


On Tue, 28 Oct 2025 14:07:44 +0800, Miaoqing Pan wrote:
> This reverts commit 4b66d18918f8e4d85e51974a9e3ce9abad5c7c3d.
> 
> In [1], Ross Brown reports poor performance of WCN7850 after enabling
> power save. Temporarily revert the fix; it will be re-enabled once
> the issue is resolved.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] Revert "wifi: ath12k: Fix missing station power save configuration"
      commit: a7716c9d922d6245b308e92824b95831bde44553

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


