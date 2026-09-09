Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA106C79FBD
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5lixX1Alyq/0zdhWcJ9wc/nl03/G/Kw2uZA3TA+6b4=; b=xJv8shnbyYGL9cYK0ASLYJLEE2
	5Y4zDXof3AekpiRhWuyCAdxiNiZi568CDOezSJyQKJiCd3Zm+KQ7Cwls7t/z20Mb8ZNeoTutj6XQ7
	jGXCOdczFcWrETvsaT2bub59Z2qjZcRgkXJIFDX7nIerDW1tAn07Rh7lD2tCqZTqAOg0AT8mkKwGS
	HgrltVxYqPx8P9HeW0bkGPNFuGmC4qlTKuOso1yBBe+RmXTujktfJ3GFsOEBc7+rr7V8wQbzLOlYK
	Ikb+RmGA9Bgcq4cdy/qaBu67bCve+nLYIN6L/o0a0X5v15nLYOeisEdp05Cvm9eM7F0ZckIi3PQGf
	MdndVzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYN-0000000CYLg-1u0p;
	Wed, 09 Sep 2026 17:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYL-0000000CYKZ-2ka0
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H76al1899424
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5lixX1Alyq/0zdhWcJ9wc/nl03/G/Kw2uZA3TA+6b4=; b=POpwW0y1EESu7+75
	dNf3deop60NNEJTqmlFEvI2f5AbOdtUVm9mUJc2LgvbN6Tpwc8sCzFGiKTwYDW9k
	l0lBIBXb+yN8aK4njZjiBLgJM5ofjPPRML+v6NLrHF5ZzdNr34PWrjuw4gU3s0ZZ
	iELwemRDSb/MaXpJX/IW86dYdbSi/J5672zBbQn0dC5r2mhq9RjzKLZAQG37H+eV
	rG4vLKr8kFyyQ2lzV4+r+Idv8arH8ndjWmoJQnZpzQvqzvoIA5EEFgKW6XOrn3y3
	ZI1jU6Bg3AsVCTySSeFNqyG82AwyDH/RERUcJ3tTL7kDFoDzEVFnHsg+7KUMeCq4
	37iEIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vhnfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso99562a12.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976664; x=1789581464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5lixX1Alyq/0zdhWcJ9wc/nl03/G/Kw2uZA3TA+6b4=;
        b=SbqIOu6PUIowZw6fAFQeCS7avrMrjuBaKXYKx4ghulezhO7YEZFSVSDcmVRv0tBXrs
         ZumaA8uiFY5X1RaepQf7yL6l3Ku9mSq30J4j24mhEUzg+ECVu/tGsizHdxMtCX01bHq6
         5fLNY08GBnqqwsnQ2QtBeGyynFqj01iFlOCPxfEKgc1f6Ugd6lf7WNjRaznGU0ORIG2y
         Vi1Ja3+FJt+JHqDKZyYjNhrn9eJuIXr0hI4FtHB/bpCVbaqTkBmd2yJvY1xoGmoE3s+e
         g8fKrWHPkb/eapOKQhusqYYWo7Kh0CapbxLHqZTZb+LeFgu+BtDOceJgKSJqPtfg9t65
         5REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976664; x=1789581464;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5lixX1Alyq/0zdhWcJ9wc/nl03/G/Kw2uZA3TA+6b4=;
        b=jM0srV3PXPjYxFoz83Y04sH5MUa+1+lhPP1C03TZh+XV419Blep+uWbbSLSqnIGQA1
         sDGjytkCtNm/UZgKr4ddjMCNms9SQMko9g/4Hx2dcIGZG+P3vorptAcyB5Qzbn4hFRkb
         U4tG7L+wOJ75+n3eBwNlOSIR7LGQxRdOOhhGNeuyBc5CXNTNGzG7N75hhbxiQhPU9Ank
         cjvssinr3qDbbkFGAV2gcEYqLzOgIRHM5jpnXpNU73Qd9qJqfAWgTeXDaTLGt0L08O/J
         nU0VUznSBs/XSOVed8RoS6eYl/W5QshmAt9dCol+w8iU2O03m6tb8Duh2GFWiz3yhmZv
         wsAA==
X-Forwarded-Encrypted: i=1; AKwUvBw5ph6AiOBe4uTtAY2lTHyZ/ru1obmedmk2uqFyYzS6fMbjVtSJ4UD00aJdlSzpEkDg9j7DzrA=@lists.infradead.org
X-Gm-Message-State: AFuF++mBmlSLCT+Vax1eCs0X7EhAHju7lNtwnyN+nGyrSVO2HziRQr/Y
	GLcypagizlFFU1mum8Dz40ZYDPI3OFUNEc/NR7HfWC1iDj28vVxkdB/zVpe79TK7KLI0pz2If7V
	dyc1748gH7s7FcolGNbQl/lF86ymjLmEsP+CRRdoHDfmKjPDl+GeWlBnhiBEY79f4
X-Gm-Gg: AYBFou2qiFkizaYc5lPB36bOkRO4tR4dT6Fpoij3BwcaiIuhiYju/DM6lc7NWuHggN0
	oLRGAHylyh/Y/B/e6dTkXyE7Tp64pDj/b+M1ZRLC3tQvSsylcUBcQA+ymzFFpqjKEcBku54v9cg
	feKKRxO2coCxD0OpJv8JDutBd0HwEdu70tFbOqi+4g9m7IcVurbTMYrjmuJyo4EIW0W+zJqSbSJ
	W4Vx/IuGrKwPdwUXm0sgGyROAOSUJGX1wTJYAmkxuNVO90bV6UqGr0xNEYqwIDIf7apYJt0GPZP
	ZWiqrRKC28TlnVMSdOFH/RzqXYfiT8FwroEroGNwlSMVWQcKH82Cs31rm48ANMa0xCSwQkj2rom
	p3WckSJIJWKrJlQw/lQSeQrQXzxylte65IijmdnnkzoG9xAzhDwmKMu4=
X-Received: by 2002:a17:90a:d445:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39d77962e7emr439396a91.9.1788976664168;
        Wed, 09 Sep 2026 10:57:44 -0700 (PDT)
X-Received: by 2002:a17:90a:d445:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39d77962e7emr439349a91.9.1788976663575;
        Wed, 09 Sep 2026 10:57:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Kamil Bienkiewicz <perceivalpercy@gmail.com>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260828005126.1685832-1-perceivalpercy@gmail.com>
References: <20260828005126.1685832-1-perceivalpercy@gmail.com>
Subject: Re: [PATCH v3] wifi: ath12k: advertise AP_VLAN interface mode for
 IPQ5332
Message-Id: <178897666026.2048605.8140168520113839058.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa19e19 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=se3CdF6FxZ-kOEWZ8NQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QPI7pKNTzxGolADTo5AW_FxmGiZvKdN9
X-Proofpoint-GUID: QPI7pKNTzxGolADTo5AW_FxmGiZvKdN9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/Z7rB6lwwaJm
 XuVDzKWEKdaykfVcEYfqT8tRP15bQhAdpASDTPNwrXd/OsON2MfXIeusVPeTqq2ChBwlE6cbVu8
 d3LPpOlnI2UrAIOL5Un19QdGfryH2FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXxC+RnspH5i5x
 XRxPSus1rM1GhWVujwmRzAM0T8K6KsHQ5aMpID5jl88fvke8G7ui0DjaVYqfC0ieE5aLDrcoUpU
 5dKhj8M8ajt0p11/+hZozfMavJw3t0rf8aGLyNJaYnHgg1jlJieSqbYIRY2JXNn9SwGNyW46E68
 4f1swes/XLIfkLJNnXiXH58ehY5uV7w/sr0f0PrROI8perhVGzE6uQ26wDjlJzrld6HpZg2/XSA
 WSOXsZhmxtrswm4zAyMbWDEmswXdpHpmlH0SkQW0fYprK6vQSjwd/hUWXdEMizzrmno4dxNuuKx
 tyfNdALtv6uU7WbQEhgni+gjMb4ea7ipa/DbF1GKXk5pZsFVdmLvtGJUNZHKJWNZFllaVJXlM3r
 9uOHPI+F/iDVD/r7Mc4qO5qJjPEFEup/i/tbMXJjd+F/ZKLlHSfEXMbwmIsmDMQ5KpJ3sS7KdqL
 3aOhf1+6EAn8IUDandA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105745_717428_743A5F9C 
X-CRM114-Status: GOOD (  11.08  )
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


On Fri, 28 Aug 2026 02:51:26 +0200, Kamil Bienkiewicz wrote:
> Only the two QCN9274 hw_params advertise NL80211_IFTYPE_AP_VLAN; the
> IPQ5332 entry does not. ath12k sets SW_CRYPTO_CONTROL, so mac80211 does
> not add the mode on the driver's behalf either -- ieee80211_alloc_hw_nm()
> only does that for drivers that leave SW_CRYPTO_CONTROL clear, leaving
> the declaration to drivers that can transmit software-encrypted frames.
> 
> AP/VLAN is therefore absent from the wiphy, and creating an AP_VLAN
> interface without NL80211_ATTR_4ADDR is rejected by
> cfg80211_iftype_allowed():
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
      commit: 6a0832c986f14518645714be87724f13e9d59a95

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


