Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7ACCA6015
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=; b=SwSCUnBdq0rVDK0sliUAGwIPn9
	N+j9lsve8Z4pdpQ7xI66wQObPjUA6Dm91lyWZP4rgQY82phiuEQiIIfADRSMNCLbwy2opYmajBtz8
	0sJiI22HH8hdmLWOr/ix4fldfODL5iqjzCjJBq2E9IJ9QIcTYpgmVByw5XWjoqURZAoPQJX0ZMKVS
	P2DsyZlPjjNtMtE8xap1nB3X96jdKaGJ6VMI462WqO0FZEQkQ6hDhHX+WLnviCZa5PlXEaReTH8/2
	5Uhx5HWzq7V0T1PUuix72U8W8Z4YXZrPb0JjuJtyhUAVjOJaGi0K7fX+QkSJReESyMxKvPqn5NTNg
	Y17cySlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB1G-00000006PmB-2YhL;
	Fri, 09 Oct 2026 13:52:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB1D-00000006Plb-3VQs
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 13:52:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKeZW887313
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 13:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=; b=CLbFjZ8oUEMIw74o
	Pr8rBbHUU1nJ1UwIS78zyGcjQnVgg5Xt0tw5moOEGGn7+XXn96RzTAWBFydnfrNJ
	6NAspX3sOimeQsh5KcDbxUDwK+PbT8YDuwzPUOBlC/8+0TMhqU6D2O/eAYKaKfa9
	vg3FYsZnBDyL+mWC7M1+snmaup0HnR1OTYWiY5BaUHXIxlvyPEtJcLUTOyLOPWWN
	BTjfBCFllrehXwWpXmMRPqNGFVGG5e8VE5XBxHNzKbmlbjrZJIyT3BI5di7M7WUN
	svlke71y/HWAbBh2cZskIQreHmkf6sGE/otz6McUYNlPmRSz6sM6YkUabjp6ey68
	emx08A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3s9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 13:52:14 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so5513388b6e.1
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553934; x=1792158734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=;
        b=SZugYlvx/Pu96+ZDyi9XWnR3/yCPALwH/Btr6uqGd8uLAnfZRyUrdlHjnUk85roLUS
         xWNXhZTVo+Ya7/aAPBsdq7nTeoDwmF8/pQ+smel9DuvUSoUPgJfEebyqMJlxzB3wLD7Z
         MASz6B1+NjOkWu44lDM8XBi/1BqBbWO8wGhioiFYRS3IUtzzk7K+U+pKsV5XnoLOPKEC
         /Bwb1I5vllUUT2aZROQbFZSjoYO0PX99ll6aBB6F3SSlEZUkfO6wF/jymTxivn0Tyk+R
         NOBnRIyFVk6K0yDixJhaX7rcBe+v/c57La5Gcgr0pATABE2GKzGQWP7Qb34hpGbx9wIT
         s3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553934; x=1792158734;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=;
        b=WYvnpcC4blN4tvn8JIGp3dZ6XXc5YkqI7ISIQ4a6uY7XCmN9qRgFzDFD8QmHE2D1OP
         RKtUI8Wv5GhUBbcQHuISNXscGJsFyI5SznG2e/RrDONjKhXCBcMBIPdd6iEgiiosb4pZ
         G3lB1IkJT0IY7w7oPMlfZxkennn3fgYkkRW6ZubPERLYcTrdaslHIE7z9VKxtUpu5kMJ
         qq1BTX/uZlBpJUBoFM5C8lHCP5p8k126JLyq9MJpfosiLqBUjG82ug/6sPokWQkWQuvn
         Bar46x03XBk5wapDsdgv2GVfYIRize0v4aIPkn9AN9zUeBSUGAaELeKKOG3UYhZQRIMC
         +1ww==
X-Forwarded-Encrypted: i=1; AKwUvBxzhcPjbwMrXVKIJ9GjGNhUYz1ELdf7UCjkTWAv97eA0/sFD8cQN+3maegUIZEr4S31//qCgsM=@lists.infradead.org
X-Gm-Message-State: AFuF++lvmXyp1D7zvkjaCtXq9zqJdRG06VjRqtPSfgoeu2qK1zrsdVo1
	V8rhkOpEjJhtToWakG3t+s2S1BRXSC89b2pjQLk8Ck2UAdIxkaqawiL4TRLmMnNC8jwXOXVLELt
	Embc9tnRoMQs7vHKu6QQoGZ7VXMGysXTaurJLVh+ryq5oVykBQmMYQ+HeP8rSRELV
X-Gm-Gg: AYBFou1VKm2W2gcFfzpO3o7YzArk2QFAp7ttHumZT9E8cDTF6mhjXAtcJVtzKAstujr
	+WzssGYvz3tH0RkkHPyyMbMyp6pGmqMq42tXDzSbH0K91XqT31kvjPs4HG2Jn7V6jFEcrupyXIY
	6b9f5RGRxhJgVt8N3Is8RTkuI/0rU76gEqP2z6p4qTam7P3ewhZkXw28sBSJI/XCbmO0LnKpFrk
	DgxNbJZLSkSh5VniBuNGlfKwKrt+ukKBzSLAu3dsrUyS/9o4ECWMKMcDaZJ53lFuz59iNs9jX3x
	iEpYLod/8f0Pg28LoLK/qqH3DmSMpdf/EByTmdwl3x/PFJpuY4RLQmQmwiui8gsHcnyOl4F82I4
	VKiGU9ShTlT57euM+bUL6yAc8iCl0q+vVC1x7JziZYzc1r9YIYIlvZp4=
X-Received: by 2002:a05:6808:138e:b0:4d6:90f3:74b3 with SMTP id 5614622812f47-50c553c9e9cmr1325759b6e.51.1791553933930;
        Fri, 09 Oct 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a05:6808:138e:b0:4d6:90f3:74b3 with SMTP id 5614622812f47-50c553c9e9cmr1325740b6e.51.1791553933478;
        Fri, 09 Oct 2026 06:52:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm1949024b6e.5.2026.10.09.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:52:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com, kang.yang@oss.qualcomm.com
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
References: <20260922200643.1133491-2-ivitro@gmail.com>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC
 address pool
Message-Id: <179155393169.875832.17468268809769517120.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 06:52:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX0I44nQqpdyFY
 Dauhw0S2hSY7vDVRC2V2hEs43iwnEcmsvIWxnuSHewEpCv+fKcEtCGCGfk7+4EnDV6n4BzCrAZv
 evYcewTTV8N6E+a9AvNG1LOafQRUZVyPaTMecU88Hxx62eBPeJh4J2/ZBfSn+aAInehxUb+7mGG
 0/k9kCHsp4VOSatvcRPhPfnQY3gcaTvJSq51ju163Po72k7Bff1VeQV1Nb2kfGlJITJhsBpejy3
 QIKXQvZgSiAmGQgXAAnlpmkn+ug2a6gV1xgTE9hxOFnhHWZUXe6ndstcU/UDeWHZ/59YrSYV5zk
 P95rsSvj2K/Uxh4kOuAIkroTKw/qKh/MbFXSop5mJLxfYNduB63iob8wWkAU/LhmUAy3Oxavw6y
 BrUWZhe0/zSB2u1gYI4hGWhi5WR+0z+4tqsQN8RduUdJhb7lRk75y9MgNj8UIOKtTuLWBBwJ8+x
 wvQkOOxwJZQaNHIJAHQ==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8f18e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rRgXgv_aqFsOssekQl8A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 4nibER4sHSviwZIPCIN9zpqB0CrLlOHv
X-Proofpoint-ORIG-GUID: 4nibER4sHSviwZIPCIN9zpqB0CrLlOHv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX9mdnKFNxJnda
 wunnCf0FXn26lqz8c88kbqPCzQHEBZV+3apawZqMCax2qUBdNbChemMDjjYyOv1sX5mgGoGeeLw
 QrmlTb5Pk/R6Dq4caJv8C8wQrjO1WTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_065216_041853_DAFECDAC 
X-CRM114-Status: GOOD (  10.27  )
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


On Tue, 22 Sep 2026 21:06:42 +0100, Vitor Soares wrote:
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: advertise interface MAC address pool
      commit: 4b2f8de21708c02203a31e2e83f8240dbdc702e8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


