Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A312C3ABDD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/e3e2z5AY3dvWJWjj8/0LGComyR7HNo8bLoVcERyAYQ=; b=c+PJpH0+z9qLcXV4x4K+X+YRkl
	kaRiG0P3dErQBgl0JNQ/5WzecoEhFCF1EY+rQoSiOHJdcyqGSAvy1776W7g9ly07ZHVa4o9gZ9dvA
	6fF+9MyR54Jb55jd0Y23XmFES2mBXjMvIxkJJOB+u/FziCc6R21b/zCBOUaUCSh4zKqreyJdqy4AU
	j8pnQ1bj6POZkPbN7Mi1i2oL9T4XpofC0mntiaPHRfVnZwf2a9s058UW/UhRivbaCAug2UBwv4vvq
	EPfamFr/5emQMwNwm0NLrjx9rL/uE3LpF0rzsBklqaDkl5N+g8nkJysalQdQC8/uxV3hrgnnb64XX
	A+bnZKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56Z-0000000A7iB-48zo;
	Mon, 19 May 2025 18:20:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4av-0000000A0ug-0WIi
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J90brW004518
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/e3e2z5AY3dvWJWjj8/0LGComyR7HNo8bLoVcERyAYQ=; b=B3lkiDGP0fJDjXVJ
	c6cgHNR+tCc8PPE2j62lIgp6zef5oychid87alC+9szNo5gxgNG8bnWhxZtQoetA
	h9g3TXKH/FVyt/Yyl+n4o4yNojaPtglpP0yUmv78seNfs21wyfRj1obF/J7Gc+04
	wtbqT9ET3cS0Cs9a3d7U0vgqY48ci1R9ezwkVQs/FCWJNEpK80yDf6CwjBdq/sLl
	tRrMCLIE25rxp0dzTsXpOQlQOTYwm34t1GiqwXeB0TpSFLIqym1Wr4V3mciWzP1m
	Yk4N8Guk7cPSNbII3d4hIld1PudwUt53M58pXPNj9spcV064KUro/BR9bqu15PSM
	VVQ+Yg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn9gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231e412d4c9so21862425ad.2
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676887; x=1748281687;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/e3e2z5AY3dvWJWjj8/0LGComyR7HNo8bLoVcERyAYQ=;
        b=NqMr2wU/k0gEVOQXEk5JCNFNlWXf6PoeqSvnUCj3NjuuY2KgVpON7t3uZoQcAHW4C2
         b67uhv7bVHwXB8fnH2j+PJhw6i86OvwI8FmemmiLJCxMZb0Fd+AlWiu30FniqAx+jx1f
         LfX2DZsqKiACHx8t7hBZ2Z8DEClUUJpAVVGaE4u+B3DkI3ab44N5LNRDUi3YCkhYo6uu
         gDpWXQIrQQqKR0RusSrvUuR0mzYftKwAzrpm432Oo7vs9UOkPe3eed6M/4tfwBgudVSS
         VRSpvtIsF41eqmN7s5JlPzYJf3vXDqU1NnkhDVmdsvi4Q8dtLZbZIQsqGO8I+8LTPJSC
         7bFA==
X-Gm-Message-State: AOJu0YyTrkPoqFlOjZA8cvfqC95YcqVVDbIvI6gdmuuQxC/bOLQNZ7Dv
	/vppPQcPXqNNHZc7Bj+dyioWCyFGIAmkj0JyyNH11IZcN0zn8Rqp/qPGrzUq4x2zsxVQFTQnBSx
	OtT4LoK8fhC/Pj3QN78+DsHKalHWOiZK5rWIeoeB81cbSlm1YpaYaCM7Pzub1XiqZObnq87d7
X-Gm-Gg: ASbGncveGHpxJ+6CiWrDiMu+H6aGM/6XeIoZfMgkVvfuuz7Zht4dREo38CLfNMi77qO
	KPy1zfk5OnmnoznQ5AfzldeAh5Ok0m6FnnY7mG2jCqcZQFcKDAVFJkmxWHnhBiKki6wTJxB2qny
	U3+PoSaaP581bJC8RXbVvLR2e+X+ce1dCGSvxa0x8fUeeZ3kOCZj1TLxNyCpVbUSW3ZZi9hEZjG
	nSKYINWcnBbMm163QfqUPW6Yd3YaroFKnF9g80vueYcYkC8AkJiTAk8cHpgbDWXSGTeBvGHupxB
	ZRE09cq0c3iav49ZTjZ4DgIZfG7+mO5TWjupo7pNxAHzjYCw
X-Received: by 2002:a17:903:4b4b:b0:223:5e6a:57ab with SMTP id d9443c01a7336-231d45327d9mr198728855ad.39.1747676887606;
        Mon, 19 May 2025 10:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE7jAEDksz+o1nGDCYSWrXDzdLHDiReaAc6YlapevPWDBvK5hsB2mFgnITsqQrP0IAnnVcpQ==
X-Received: by 2002:a17:903:4b4b:b0:223:5e6a:57ab with SMTP id d9443c01a7336-231d45327d9mr198728555ad.39.1747676887243;
        Mon, 19 May 2025 10:48:07 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <quic_yintang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250423055650.16230-1-quic_yintang@quicinc.com>
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix asymmetry between
 ath12k_core_init() and ath12k_core_deinit()
Message-Id: <174767688667.2567051.15535558244008333035.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: SODKPddw4LwkTlnynaIDonrH16hBHPrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX0xKLFHImwTKt
 6fh4r8QTBlhIEKvoybu819CP2Umlcamz7wEFyNvjPIJmabiVXBwzq3yoaGSbv7vLGBte73AZV/j
 n8Fz+WzhjoTYhTAx1BhTGZ3hgJHwx0WvQ7uKU9oFARybCsAKT0FTjUzCZ09eRYAdueoRrQskHGj
 jg+eVGw7To4C0oA5rjQtd9UopxoRBeXcLSROYHPaHBZ481EfVNRgOfO81Co1IE5k13AUZMpz+P7
 IB0BtcjcdJGGd6/lvW8ih2f9PbY6g3uyHvaYnD+czNXatupyYXkBvtFP3RYcteRPlwxGYvbfLHs
 ik/4Xnu8kSiT4FIQWHMC3iRezFmJxVquFPoBicbB1F8oTFVVSUyHaCNocNEEmphjXAWNdIufWtC
 0vL+Y4GPrNvKjXbFBamcmZXQ6yfe7asWdMzavf3WMQZTtMMsdKZDuQnQIAe++GEtHJL2VI0r
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b6ed8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HYYPFgkb9UnnZKMoj5YA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SODKPddw4LwkTlnynaIDonrH16hBHPrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=428 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104809_167960_34B878C1 
X-CRM114-Status: UNSURE (   9.78  )
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


On Wed, 23 Apr 2025 11:26:48 +0530, Yingying Tang wrote:
> There is asymmetry between ath12k_core_init and() ath12k_core_deinit().
> It will cause page fault in some case. Reorder and relocate the release of
> resources in ath12k_core_deinit() to avoid this asymmetry issue.
> 
> Yingying Tang (2):
>   wifi: ath12k: Reorder and relocate the release of resources in
>     ath12k_core_deinit()
>   wifi: ath12k: Adjust the process of resource release for ahb bus
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Reorder and relocate the release of resources in ath12k_core_deinit()
      commit: aabd3be90579ed088aa34f0584ab6836c735c76f
[2/2] wifi: ath12k: Adjust the process of resource release for ahb bus
      commit: 167e6fc7a4471db2c88bb8da32ac444734a41cea

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


