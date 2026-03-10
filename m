Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E69FEB1060
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAVrSs/RbTskVAhrKyYHE5rdAkjuJ7IjWtFskKC2vBs=; b=BjhTkpWUBOzSK18g3adcFd6PEP
	A+aBB8ycJZD1CWvaxaPdXKRpGkqsWqIhsB1VnnNxNHSv7poqUzle7hFzoimCbDYnYEGJH+h7zV7J0
	Ks1YacJJCNi7DyYpszov45c5Qi9kyPs5EpRn5GvcHC+GEEyUqSeokWltWhtdGEUzydf13DjigcgRY
	W0qaOLA97VhNMlX9PJrD24Ax78/ItdKjl7NSBs4/D50mxIUudZDH4xk7YRaRtwazIDQzXeFJXwst/
	27Ft7Erxr19X+h+v4wRMslvg+oWbGRF9QLtPHAL2FGRuEISP9A3ryFLzhwq+psCFMTAlPUM0ZdJPl
	jcgnC0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzz3u-00000009oeK-0ZEW;
	Tue, 10 Mar 2026 15:31:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzz3p-00000009odZ-0z1f
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 15:31:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACavwi964619
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAVrSs/RbTskVAhrKyYHE5rdAkjuJ7IjWtFskKC2vBs=; b=ky4xIO0L5EWX5w4x
	5Oaqk/EAJ0Ix0FOUTXmHDGxDJ2d4oHj9mlCWjITuS3Siw3YId845Y1Dej4ljii2I
	omKcpmbERGQcKD+frcnRjqOzHFZ6aaizIBA/A2d/a+ixBziu6zOdd62fXXyYlzUB
	95v0qQ56SWfSCxjIOfVIboOSe4hdhO1HdEAxKtKyxpmAzSjPHu48711exQabQlhl
	0u+qEWyhuPAuIyk1Q3aixwhhUZ4RLYGhQYYr/NGF2Vmatua7aRLoLvskIiti5aUL
	e3Q4QvFX1SbD51eXPr4Bi6Akp2R/377ZVOR8iigSVFGNMM+ZU1FLPPYYDoHbCc+s
	ads6iQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477ktxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:31:52 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-466f6c0bcebso23155041b6e.2
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773156712; x=1773761512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAVrSs/RbTskVAhrKyYHE5rdAkjuJ7IjWtFskKC2vBs=;
        b=bi2FfvJ6Cnjn6mKiRr7kh5tM1Po6ia6yaAHLrbj4fqw9sVxwIKQqVOitrjgpSNdFiC
         L5rYb1y13l7mOzPNtf50w/9bxDJVS+jsZxXeRLZzCGALxTInWWHtyL0KgrInJKzpPx4J
         MmIZ0gymPY9Fudbx/ycVUN764+kKkAIfzol0LstEMJ02lsNx9z8abaXPHNfLBj1KV7Ah
         3cwA6ds7WlCzUZGaSNIT/oobhBijjAg090SQaTww7j/Xq6jcSs21PPfLkXaW2Vgii0p/
         T5ky98yKdYJ3uvVsL9WhuEwqUYfyTDOQDjJBKooyCyc3EnDDh+sZPM/7kDM2I9ILEYkJ
         cFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156712; x=1773761512;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAVrSs/RbTskVAhrKyYHE5rdAkjuJ7IjWtFskKC2vBs=;
        b=wmLPRQaYxTvJGqPJkw9euLmdMa2rNgFDOSVxsJYNWiXrqsVPA8BjxWaD4wAcqSML/l
         qhIgoF6OR4EtrKRmMs5jJT2oUkmXUkLFxprkTSwm1FX/sk3segwACb+ymdhB1Zn+dzxo
         15DAoF1/a/ZYJaNGvyT22I5BD5wHUH/dnsg55VrFkjk1NEgn/ZkfQxJkVK0ciNfraEs3
         /a2VHm7DsjHmE+tv3VglghEeo1WoPhTRAMkQAhB2gQqr+XI/U+32H144fF7qfWklgia6
         dS8TNDn2XosQyAr3nagksJqwvMjonjFLfIR3tx5s6NkTVITxG00taYDRQ4sq5+apaXnY
         ioHQ==
X-Gm-Message-State: AOJu0YzmC0cwxkmjJT2Yr2VUd88NRkLBmzN79GfBwGuMmqrt75PwnWGj
	l09E+p0qMjFRSxxkaeCIPvLJwrSZrRkfNhP/Fwlrn2Gcbs7p8QyxV0yHTeT26PHjgFS5fgqKzgZ
	6HsZ/3G6dVYPz78jSsaxy/jqVMCxqTOhRWXVAPcv8tg1G9AyJW2BX/tFWyXWwQrDG
X-Gm-Gg: ATEYQzyyqh4G0438G6abvhAsW51Gwf0xEJIZgHIjp+8OMGwpUkxp0gUIe5Q08HMLRnY
	2i8BD5id46KuFjtbbg1e8ChiGIPs/ff7S1T6BGdxaED1IWZazDHWrjZh0bov3CBeKQJEQXe97vE
	L6zL0DplfizlmVQBbcpC/vGElLoAHiYAdXHfN7wMDVOumvby8WDvPc1/HKLChrPMM7jyx8N3Nn8
	+H+86PNjKLWjtYRDkFDu1KoGtMpFmQXjEHSrCa5OlAVM/lmcrOjYwzDy5k5pig2SoPpE8IcEylR
	6bdZ3mxRIKwo/3jb8xLtqwCW4THcTbbZPWo3BTNkr4YNdnBBCXMt8D9lBxPnfCr1nzvZEpvX4Ag
	B8L1yQpOh5JLz8NhtFnGU6CQK6yG/6fRUujnGvg3ODzlMUPuN9Rcb8PPs446JR/Nt+ax41gy6Xn
	nU
X-Received: by 2002:a05:6808:3025:b0:45f:cf6:d09f with SMTP id 5614622812f47-466dca3781amr8509055b6e.16.1773156711654;
        Tue, 10 Mar 2026 08:31:51 -0700 (PDT)
X-Received: by 2002:a05:6808:3025:b0:45f:cf6:d09f with SMTP id 5614622812f47-466dca3781amr8509034b6e.16.1773156711147;
        Tue, 10 Mar 2026 08:31:51 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671e48c8bdsm1924672b6e.4.2026.03.10.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:31:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260306032252.2237722-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260306032252.2237722-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Use .mbn firmware for AHB
 devices
Message-Id: <177315671028.4092534.3433473847177396584.b4-ty@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 08:31:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNCBTYWx0ZWRfX5wNkJx+DJQzq
 p9iktShU+HgU8GOm/Koo/lkQD+qat+LG4pKx7hkagdT4zGoh7dPfI4KoS+2GXOYU0z7eKBaUSfZ
 Jc5pY9tlAJBiYu3E8DhVDnTqGw+WCSll+EiC7FMlXHh0OU4jY5KbaspnIWi7OB0TIheYekuWks1
 wCj2PTXNTjFzyEpDV0W74KMwZeORmSxR1qruAWvBvdLAZOXRPbuj7p7AvKdSe4lviK522sZd6Qw
 fCT3DMgX2KiFxeI7mE53wl1/ttB8MRVyK+jTWadE4J0OKfwzP3UuI05LWNbFD7yoDLaeba6SjDp
 5/6553ib98b7y4UTHipNNT/a7Q3gnVVPwVhzvVUVANxkrSiV7bY/zJ6UP9Cf6j2+TktJ8Q28Ush
 KlTVaJDZoIQe18Snxh/rSrRv0nwIiziPzEoQOATe2aYLDakQc0Ey9uLw/0hizxuQTH/z0V0cKe7
 glnweYaL1S3fsjuILqQ==
X-Proofpoint-GUID: vcCexni_bW-QuvBquafft0rewJbJY-Xm
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b03968 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=G5qMDu7UX_ImuAN12AcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: vcCexni_bW-QuvBquafft0rewJbJY-Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_083153_399187_D66D4515 
X-CRM114-Status: UNSURE (   8.90  )
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


On Fri, 06 Mar 2026 08:52:52 +0530, Aaradhana Sahu wrote:
> Currently ath12k AHB devices request firmware in .mdt/.bxx split
> format. AHB firmware is transitioning from the split format to a
> single .mbn file.
> 
> Update ath12k to request q6_fw.mbn and iu_fw.mbn instead of q6_fw.mdt
> iu_fw.mdt respectively.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Use .mbn firmware for AHB devices
      commit: 27401c9b143278eb9fa7d46f97ab063d65e5afd5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


