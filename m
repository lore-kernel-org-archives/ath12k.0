Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B139C4450B
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2UhV5ZG27BTbav84ggIuCwnmDvPXOmTrYziV6NoH20=; b=bEtJaoQrq2CtaMARBkyA5ltgge
	01eAI6IveuKZJAWa+jzpHkXcU9Cq36imO4rXgsy/W8Nkt5qacUpxWUMGn93rVh6pp6dK/++qxktNj
	P468lvqRKF8ZlYDJzGGBWpPS74YkmRnKVLIHozWq5DZmjqwuOc1yWk8UvkU6pyrFvU3LohPYwyXaO
	ywgOX90RDZYQeapTsrTgACqalb1Nbsd5beH54RwVgiqtDjkKC1WxtnvWKAp6HUINlturprmximp/d
	tE/lDraNoQaa4HrsESc1/86yHVAdlac0+zO0RR7X8NUjpSd9f1QRGFbHa/hDlu8Hjhkfwbj+cXt8E
	g8DuzkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXx-0000000Cq6P-3QOe;
	Tue, 14 Jul 2026 18:07:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXr-0000000Cq4V-3qyJ
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:07:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7CIk1091459
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2UhV5ZG27BTbav84ggIuCwnmDvPXOmTrYziV6NoH20=; b=QrRIBmnyfd+QA+dL
	iCs5X6F4vCxINPpok3lWjFHt4js1g3Fu1Llp0O0aJLTk/7ZnOpX+DAUm/ehli91a
	6KJVqFA3M4UN3PQGYWzwBuqgBbwYegCBzL1hbJ7tPQV8Fkaaa3Y6NeeTx55vwl7K
	Sz4kNE2zWBBnFSJOZZ+YhQ9Vji2FoCHEp+pvRvXURTedKfgRDgLIEWmeyMrOLG9q
	wpJA8LnboxxznazXnQl2LGIEaGfVrprnFLqXWwgrDjjr/ZuIF7RcT34x13eDqAVC
	OAn6DhIKKCzRD98n5Z0HvUTQ5SJPxBmT5aduHYKqarcPoCecOJlIIOM6fAr3d0z6
	+AtgKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjgcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so465948285a.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052470; x=1784657270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2UhV5ZG27BTbav84ggIuCwnmDvPXOmTrYziV6NoH20=;
        b=T564oEMdvDxXWKyYwKpmxSni+LTsGHqcO9gjnND1atl+2/y98mI1drvxYPro9wjX++
         Ib0OSQrR1lsG5XW7BK/qghbuhtWmODejNg7247XRONOVc/CZgGTeqHYuxJP7oeb2IqVx
         Rn5GR4qkPojGYEw7/kXu9wGe/4xvI1TX7j9GHbglCkf7bO2Ugn6fNQl8DLBD963OHXQO
         +5y62kDD4wr9laNzrKiJutiwqE97vM3bqQFvD6DVtk+4SLZJqDBzoIPP5CeeV3ReYnxK
         StKuQEr/QR2NqqNlcMedp3DQNbG7twBvNv0ZsYzUO6xV2XZGE62wKROPK5J7SUfDO8rA
         e5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052470; x=1784657270;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2UhV5ZG27BTbav84ggIuCwnmDvPXOmTrYziV6NoH20=;
        b=KF+u8t6CLsEdG+eJnixtmXpSMA1j7cbkdikTYauJlf+BkjWmj2c1t3OQMYPrjrUj6B
         pLm0DG1tfpuwQDAe1MKPDGA6Ni3H4AduGjKixagWoInMVTq/AfSuQwtc0dpna5WEOPjG
         x0mujGEskT3mNqFo1czPUgrzVeB4wpcCDxGAg2Yytl/od7/Z/EbGtC5viD6LvI6ESSf1
         wQXCwKaA8eC8K7opGEy5hsxXWUUNrFTUsU7o1jOSVT2qM3dAeIm3MCm51v3KfUe3FLKC
         LGASlmDl/IadB3WlSPah+R9IrqerGxP3THXJk4zELwj4MVx4jdoabEYYuerESziBjO96
         yzMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rovo3GdEat0I0wHR0VJv8jjBC9Nu4Q7zA7iHKiJmuts+d04wmn03sBUWbtP/etSIzp37maD2+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzD9TdCuf7Ez2ENd0tI9IEl+vIAJEi+K1EDtQ1N6Rh95c0l2Ags
	fsrX8iqHUaGt36tVhhAUP8iWNCkRUj5tH8JifL9cPuFdFjOHyp7EUWFcHJPHEaqflcxUaUvSFJA
	bSoj6WKVPTiWq6pmru81lNSG0FQgBonku4xJX2PS20G5rgEEZssV3POowBYgP8gRd
X-Gm-Gg: AfdE7cmoaHUxMWBK17jf8AAKX6oumY20cl0LF9d3ZTwdz/8TbwgayABMag4H83XZlRG
	iCBHMuWzX0SYsJSQWrai/T3chFHzbOTRG/ObEHIxcilOxpW5H6l5h3ko2yP7YscmpR+fVZNESXL
	Am/q8cN6hTUyLHoW67RfSsG8jeDD1mUZyNMb1JEc3qYsG/9/TeUs7XYf0fOdht+1PYk7fdtfOzm
	EUXmK2plbvVd9xkpyyOQsZKCPbXUkGmTDYayEPSlfIz21U8SlTCe/1BDK0v2ZaDh9JZWH/8b69H
	9lOHlO/9JrQ4w8vaKnhrEqYFX+D/GZ36e11/JzFXfDwnJb68G4BuUcKolNvhY0nnB4mB9LlQang
	RMZMYWlt0I5gP9F6KyGKpYa6R7LMBmsJc23I9CQOhl5CDB5tIoLYEyqyIY7441fdUdQ==
X-Received: by 2002:a05:620a:6019:b0:92e:fe59:d619 with SMTP id af79cd13be357-930868321f2mr320335285a.10.1784052470371;
        Tue, 14 Jul 2026 11:07:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:92e:fe59:d619 with SMTP id af79cd13be357-930868321f2mr320330285a.10.1784052469882;
        Tue, 14 Jul 2026 11:07:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
References: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix ath12k_wifi7_mac_op_tx()
 style issues
Message-Id: <178405246855.4102418.571192529778728385.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: maGu_BNJQZnJ6Xh6V-y3-jvNoWIthLt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX4unwj1Xe9DEy
 trMRP+vGmj5Im3WiPbrwqN+CZXdavp1zWmWZpCzUg65MyQ4jOrk3Lf9RG7KsOP5LcajcZmUKDko
 74EcOaSesh62DNoA1vp91YC9Qc0v5p/RlAbTsW5YSk8cH8h13IXaErbdJ1vbqW58nS8mb2cfjWi
 Kd83Zc3JU/ChHMtsyUq489RZldm9v8tgkAaEyTSMhDD6LW1Sb5aEsWHD/SojH7a78cGAPGuIVCx
 ctn/tUQfaoKqCe1ZIZs0rrlX1gp9dKStHRT/CiWpbV0yowjvzbOmChYJ2+bqX57gTR1vE3GCXU/
 A5Kprk8dyfZMOSoXrJDrNGVtWnefOYp7okEltOtVtjSaVv06mpLDGr1xHShEzVQamS6oWMlGLQE
 cr1LoFRkqP6VkbmHpNzkNc07Kpf2iNXrg0SHP6nvtkvNatp73c2T06RTSXCjNS9SaytzaGbSRwQ
 Q76mta0Iu+/cikAoMKg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a567af6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ciNmkqmFweInwRYSI6gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX3LK/EH6Vwi5w
 OHDKoRgCsxLtn5jLKLLJKiQJ2qUhmWWfXZSxE1PL/NUEKu5pFl/YXhMdKquegve8orGqe7C8l1p
 u3ukr1SB39XqYd/pR4RVHirJojijTOU=
X-Proofpoint-ORIG-GUID: maGu_BNJQZnJ6Xh6V-y3-jvNoWIthLt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110752_083890_0B5A164E 
X-CRM114-Status: UNSURE (   8.61  )
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


On Sat, 11 Jul 2026 08:31:10 -0700, Jeff Johnson wrote:
> Commit e47d6c9bb416 ("wifi: ath12k: Advertise multicast Ethernet
> encapsulation offload support") introduced a few style issues.
> 
> ath12k-check reports:
> drivers/net/wireless/ath/ath12k/wifi7/hw.c:1042: line length of 92 exceeds 90 columns
> 
> And automated review did not like one if/else that did not use braces
> for a single statement that also included a block comment.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style issues
      commit: 6385fd09a399805e82e50b228f1af318316aaeb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


