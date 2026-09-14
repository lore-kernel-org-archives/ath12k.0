Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B25FC88E72
	for <ath12k@archiver.kernel.org>; Mon, 14 Sep 2026 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=; b=M42Af9U7LnZqsRiPJyMGmFT+j+
	EwdMUELYPPZ4alj4bpiOKTq76/rS9ZO65yuIDJP8OT1Kg9JeWa6H1PP0UzkZnk5xbnnc3BbFi5H3L
	Fj8F1BBH/EkQ3rAGCV0xma1r/LRC9ua4ZO8z5zo2z9spXegFvtt0U0TkXw2Y6I6X6KOp5OmYV83Bg
	3nq+gDdn1/w5zpbZ1ByZ31ZuAEdIz+C8g8hArUy9rvkPvMd6GjqqRLDfxcL7rapYH1bp7VB7yYl8X
	2/PokrRbvUXqr3FsspoDwd/TiF06zGohBmWXLIyL9UJT5cp9vNoA8b4gf5mUrYs30RFaeZfyyDDoP
	68/TG66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BhH-00000004Tmw-0yNV;
	Mon, 14 Sep 2026 18:46:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BhD-00000004Tl0-1ry7
	for ath12k@lists.infradead.org;
	Mon, 14 Sep 2026 18:46:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xse1025796
	for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 18:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=; b=llX3C1pT2oJpHBmG
	63LvUiHXFHmIW14Nrh/mIaQfJKGQmLvv7i3MiioJbK3Dzz/7RMMrY8E6SYbM4da5
	xyREVw0AuY4NdkQq6+RU1ADpUWCF6EWYj6n/2mk63nfQDOfFD6pCh3qyj61Lkjg4
	rS8n5LzAx6aOhGgqv0nbnBSec60VCh0xPn1udjkOGTpUPWltYb5ddHGBtArnao1H
	hd9DnacfJPzq1hNqGP4RidZ2PP4Q5/uCGeHbPz9aBkvyuaqHy4TKexrY5nZIQWqn
	foSOON1A/2eWw4I122teVS0HHhq09I8cMyOnUUiqoos2wDOh1cG/7PeBQwu4xA0C
	xYqkfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5tj0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 18:46:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so2714972a12.2
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789411585; x=1790016385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=;
        b=c0SvncWiGip7SzIsnOvEH9BnZgTB931tVp2KIfJO6mhdsKXBI3sOowsRud0C152SK8
         5joMIWOnXaiBLVLxYIvTBhTLuTkhJsmmZZyB+E7MOh/LSuFt6pFkg2jZOTzCCXFhxce6
         quHsULFHFWMwqNqzE/io8HTJPD1DuY9Bj9Gm9zq4TFv2LBsr6zkbA//e0e/s2XiYwKfY
         XUD46EYcWM6SsMr7fxI0wBFKyHarYCHq7hZuGdJ0yUjv/CDZqaL/l+q12jlIcqO3rwul
         kvf7Y1hqcK2YOdMMEATmlOthxvacaxSs2PiqaqgZ9VB0QaVTHBYJvOFy5hhZJOmmvct7
         PPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789411585; x=1790016385;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGLIJ9VPDDvsw+y1uf101oTVK9Fsa0HkriLejdXe5bg=;
        b=sD3j0JtmIAnTV9OPMNi8hAJ5ziPUngB9VdHy6J2bzVW6PJdcngRuEYbzvMMC/QX1Yz
         ndmuIlO1ZvFVu1Q/VlTfzr5P3dAt0GNArjP0/wejZInRe7on5/EiLdmD1il0+kLyPmp+
         eSwXN6kD502M8RwDXlTeSywh94xAD9FnSUx+pXz/JQ9w7yl7RNUR1iCwjufwKF2Nz6zk
         jKAMSYeAWKh1OHRVhaHZTmcRW7v+HdxbNQtuQDJC5tyNh59ynDgCLHTnf79b8CCGocJ0
         zoGDvaPHkQnI5Knb+uHXQ0QIfH8+ch52M99ni8CDmiZeXRdlHzOa1XDDFh2d8rhamTqc
         ekFg==
X-Forwarded-Encrypted: i=1; AKwUvBxLRClkvg4eJbfSs59QUoghSC6hIzfpn5fBqJkfsXmcWqplzgsiW0RjHJ8JU/gfF8durV4xWtY=@lists.infradead.org
X-Gm-Message-State: AFuF++nMgIMmaejea5m8wIZwZLXRF4VxuCSTaAZ2uvkZQArPeRgIsuKl
	2t7lXCQkWrCM62bd+XA8miispBUNeKnDKFvRtMsfKxVHdIpmf2givtiGJA036nHFI0zSURAJcij
	zdYnKiDyRGDZetNbNugVFH20k4sAT3vZ0FL4oO31htLF7wDxYYUzFjcJ9UFvJo/em
X-Gm-Gg: AYBFou0AXig84y6rqW5rSWZFGAzfnE1RjxAMCuAIO/n+a40lec2d9MxXj3YcE0l4niX
	rPKf+hKPb7I1Ca7OF/pFBwWD8EWnQAuVPKCvGgm9crsBnIb1Xwg07iu/gscg7lyBAIcEgZxS70Z
	D7m25rkgnABLR7kWyGgoQ/W44cxVrosxdptHrOkXy1MjuAVsrW6z73Uio3B1kW9ievnbJxSkJqb
	VdMb/tzYbOEy3GEm2uORZnKJFz2CC31syS0tGGa2csOYrtjjkjiRiaBH8oAV0ydu4JaumE0aaHF
	aQj3Lvo1ksPYDK1TTCeAA1nI2EHSPq8OWh8+0jbTtNlc6O2C5scn1RW3BrWPWEURIRPSBW3aVyN
	shVzlLCVFHkGQUPUVT1QmSrcMh8p9a/HjoNW0YA252UEmBFL3M43+RfU=
X-Received: by 2002:a05:6a21:481:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3db4039cbebmr8612110637.1.1789411585196;
        Mon, 14 Sep 2026 11:46:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:481:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3db4039cbebmr8612040637.1.1789411584633;
        Mon, 14 Sep 2026 11:46:24 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm32032524eec.20.2026.09.14.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:46:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: ahb: Revert undocumented ABI and dead
 code
Message-Id: <178941158388.2896945.2176290382706529944.b4-ty@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:46:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfX2oppqVe7+rfC
 LnoW+8Sm0f1fhLGzfLHxLSSWKf+HM91+ZMy/vXh745e4wPypp0qGK1LtWp9PaoqV2lKeqE2HKA4
 VuOr5YS5HZ1yEZ59r5Jev8dC7rZj0Dw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfX/S0wzp2+uoF8
 e4aDuaxaRkLx1dNGWXw9XImstoiH0r+faPN6D2e+11FsEbIQ/lMfin4Tv3yM1hCrkoQAER9l9MM
 xEFGESlNG7V6SvXpGToIX2e7jPA936/gMltkaHmQmZm4qk6g66BauxIvh9eOagkTFi7i9bzGWaR
 zh8OLdlhC7XoByyaqA63k3ClV5AVbHhQTscsyMKN7oo+3ttlkiriTWlTHnXb038An9T3/ofGT4s
 /MJGyiM1+ZJ4mXlbrvTAYgWHNPxYN5cs6DP69Q8dnMSFm+/U6Zzdq0SBAWanyHe6rD+GYPw3UcQ
 hYuG0l6BY/Y58u1Cyyy2Jogmw5Qe4rKYRI+PT+yL7G7u9bVcP0Fz9B/I0YGzi73d4WOAsouV5SQ
 uaV3Nqygl+qTGLJUf0T3SGdPo+Gl2nXVFc22/th43a1XNpufn2mjavJrzeRfvVOhPxUrjOmEDUZ
 Y/laWuiUlZLHlsDfTFw==
X-Proofpoint-GUID: Co3YBvu7rWXI8GmQ81ua_jpJSnaGPefE
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa84102 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qqqMIIPnSBjTorXjQPsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Co3YBvu7rWXI8GmQ81ua_jpJSnaGPefE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_114627_605279_771C1F7F 
X-CRM114-Status: GOOD (  10.06  )
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


On Tue, 25 Aug 2026 10:13:14 +0200, Krzysztof Kozlowski wrote:
> Commit 96f46607bbce ("wifi: ath12k: add AHB platform descriptor
> support") added undocumented OF ABI, by relying on a very specific node
> name.  This is not allowed and was never acked by Devicetree
> maintainers.
> 
> Additionally that part of code is not even used, because all devices
> have exactly the same user pd, so this was added "for future".  Adding
> dead code just "for future" is heavily discouareged in kernel coding.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: ahb: Revert undocumented ABI and dead code
      commit: ce9d5197d651cdd0fbb586c3d77c28438abe1b10

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


