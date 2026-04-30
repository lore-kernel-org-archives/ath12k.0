Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CABCD13D2
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=X5oIGaxyt3WbVvkN7c2AzJQax7
	DtGBThvlfjP7+aNd/UvaWXbjRoSfk4CS2ohsOENP0EjJB9q0QmRtLuLzs6A9YRA8e0oNcXkOO3Gwl
	wgX4rEVYzP39A3H2ZguMc5kE4/yzsu21xaO5ufDst3bvM8JkLHQsOCgEIkmDeF/WYv7Z/VbUzfwsi
	zpoz+U3nnzk7cWiLgl/8GrV8r7ywegmHEQiwOL7n3UxQgr3s3DRPU7+1q4aWxk7MOHJvDHJqYOvy+
	Y8reOuaJaDfO3TU0UzotHCvz5tdLFm2CMa7uWvRPCeTlP694KsqREmUAH/zEDY0VIselGHXz6XyN1
	EJG4LL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyC-00000005z3R-3WLy;
	Thu, 30 Apr 2026 21:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyA-00000005z25-0zJk
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UIHb6s2481719
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=; b=kKwkiZEKvwM7Fm0C
	GYBkEu+VLUWSTWy/8hbRaIhk0M9p9i3OG5XvQBKSIUhSF5t3l5ESPRmIiScdUVZc
	R46F1jY6TaQtVn0RkMjreRJGf/zaNIk9+njZYxeoeD7Ak2cQ/I4gPt5ARnvInVpl
	wt+FnwEwOaHSkcyEjNxvJM3R8LKQhWPfhipOirUJDuYqx5bterrj6cnWqavbRWuZ
	0GxWN5e7tfYWcwMtinUw3vG+uSfQTS272IEyYB8WfWQ0VFSjh2506CuHVYakf7yH
	chO9sLl/4KdwaT1SFgB2iVZ4SI1KHUvI2PY5z/0QzCh/HR5YgTDEHyanvxabNI7v
	N4gleA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6j82m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so2955080eec.1
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584649; x=1778189449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=RPDE+L76pvTBUBu4vAVaxANMZYEvme1E+u3WuaPqyrznTSFie9WHarSNsGHQzses39
         eS91T9NlA17LArVNGhfT7TphNXpqTYjhOUm/EJBzfOVuK4imm1JWMqMpN3Sn/2cqEeVt
         9uXxv2Hk7BSAR2E+rhLwE/n9GqUpB0g42CagFdYY3x9RJO6Fwd8czNT3RBvgiAeoGqH+
         K75GgbgEqdKs1grW1fCT82nfqgsZf0qHxl8W2wq3hapiCwLGeMPw6oQVwafx4e3UboKp
         G8TgsryY3bc057FYaEdot0Yq1xE2axYH038RueBJKfmk5Z4iTyC3OuvGJfzL+mM+xB08
         5KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584649; x=1778189449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ORbwj1deeV9w7+GF7fhmUVzGC2pR+Jjv+JopQhPjcs=;
        b=IYOWDiXQFqGAg0RHLKhuU0YSMP86fxU4CKoq6SZewjjLMNnWthgxrGuN2e1RNgZoT2
         UUNXgQMqtlzFdYL5zwQ4+ASWWgS1CXcLmWUgUY3DkxOxj0eJK9j2loCvn4rY8sk43kNK
         O2Lmr4gV3pHEsYiOyg7xu/42uFuRDc1OXTleZdTrvPuQXQ+6DAzlA1lwr0r1BJgcw/ap
         S6P5AC4SLQuOdnBQpXwunX4bnVlc4di9gCIMvz3V2THLVclp/5eh2j32d/LHlxZ3tqnR
         msPOnQ3Oap5sOVyGQahljzt9j2nvimHQ2P2fl3lkrP2/2uOs6pFUL3w+63yTYZTv5uyW
         4B+g==
X-Forwarded-Encrypted: i=1; AFNElJ8fGbaR/P+0EIkpy0ZqYT1igf1ZoPA7YqAwhWT5MUbUgfU3iHeD3qjXeW7kSn88clFq7/n4nGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXrFr75C6HrdiWYmOfT66opNqMC/eEUcQaYa9S3Q9Jue1jfJMY
	4P8ldBnCZDTCNMQjzntPLvBcYHVG0DscLkWugqPkG2Z1a/cGWS8DDEbOYfyLRyk0mRfms7w/JJt
	LP+7GK/6bQmD0HM10kq71upnT0DqbSNbnAHdR+Ou2fvbUTg38gqSVfNj8dJzh9CDH1kEvu+5y
X-Gm-Gg: AeBDiev4iFjFKHgcdT8Ldusb18iKbiEqr27Q9upfsJkzm+HmVPHO+vULQsfUzHpNhn9
	b0J/6e932RsxnrTK32wC7Vb6TCRvkrpXPC7i73wbfxQwPB9Xxk+UFfKBxP3XFNB9OQY48LbagNd
	xH4RZuqUkMtXuy8eWVPuBolD5kRGm8dS8xCv4d3xjNpg1AEXSuTjnkUEdiLdV9ASU9VD7rRvwwM
	Mjt7ndWXfP2+wwC1n7VTfL0ZrkSn8aAUDf/eeIA95xmVKtY3fAqwf6jnabUzWofg7r9XU+Vjoeb
	S0pDYwa9s+itLYftV/2Sav1CblTAQpHfMDFbUVaSQ2Hk7JUqOYLbKAYOTdf9y9FgX60zOmYRJ0x
	GC/BfNG2NX1pT3PFFyH1xoFnCl7zAeIVzF8Mkgv8sXMZCCNn8Hit89MDVJRrlQUy45X10peR9uV
	Ur20+xUaH1I4k=
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269194eec.23.1777584648427;
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
X-Received: by 2002:a05:7301:168f:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2ed3e9749d9mr2269158eec.23.1777584647794;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath: Unify user-visible "Qualcomm" name
Message-Id: <177758464704.1848985.17511825714813027637.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: suOk2YbYHO-CTf7jIkFyUwFAqbT_hZ2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMSBTYWx0ZWRfX0iJAn4pQq7mm
 3S82fNcooj6ZAxwY79UEDCSN8yji2NxQ07t/bmcHK8+bvnFMFaxJuRlc9gjjaYEsgy+noQgDqyl
 D1Z88METAFZnvTguUjlmNfM3+AAboh62zmDEMkFA9p16lla6gaJBPsHbwv1p4Z+zAEoOG7JORy1
 ndsn0f0c5YslulxuGw7lV1dxTJUtFVsKV0yFneJld+TswtSEUwUx+CS59/4BWY+a0I+mcYC93g6
 eDZBWTR1JklHIkH0rl0MvEZYrk+sbL8bVMI7swL8E5+jQrTH0xBXK31sDTcLn4OiA/zfkLsgmok
 m9TjEvVu2Tk6QN2qx+Np7OovSeB8Y2QfkeXLdB+YDmIlPoftfwNsrZUM+PCHczSenDyFFRg21YY
 A5sPK4QPpfTDEA3opRQyQW6DLsQgaDrAK/GA3IFOH6tDijnJ5g8PhSbmv8zSn4jNgEOHFxygAGt
 HUTc45fbe4TAISBMbdA==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f3ca09 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=haabeQbpXhb7lDqDI2kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: suOk2YbYHO-CTf7jIkFyUwFAqbT_hZ2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_143050_280712_BA9CC8C9 
X-CRM114-Status: UNSURE (   8.36  )
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


On Mon, 27 Apr 2026 09:00:41 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] wifi: ath: Unify user-visible "Qualcomm" name
      commit: 2419d92ad387ff34376e7c3afc300cff651038da

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


