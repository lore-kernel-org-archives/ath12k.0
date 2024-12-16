Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A70E77180
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A30SR6P2F4Bg88v0mF0YsJP4SvSWPa5Vxlr8SxbBJ4U=; b=UKeXT0N8y2vSpiHmQmpF5qePhU
	PhfoXNYcCf+f71pCBDZ0EiZTJb7gQqx9GMiiD5FdhwgApG9PuPFjxUPNZmqCIRRCU4WK5xV/DfOSs
	lPCiS8AfxgQOrEOP/FTNNRJ8Lm3RjaEpjmuc7J4SYIuhk4812GST23y89I+Yf0LR4J50Lo5/G/u9u
	AKwHiKzLqjvt80qofFo0pMVRCTHgBpWdIYfpEgdhkwKUeo/7E7yTvvuCLkTMx30e+1ffsP2joAuID
	hqu1umMFLNOUBFF8xQVbaKKRKmiYYCi2+VCR4Npafnn9jc94UuYWWUor/lNxdOjx7M7huGFXtjnje
	MtSMqkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJM-0000000AfSt-0fiK
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 16:51:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJD-0000000AfNo-2H5D
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 16:51:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGD0Zto023667
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A30SR6P2F4Bg88v0mF0YsJP4SvSWPa5Vxlr8SxbBJ4U=; b=gIzLm85r/NWGsYkC
	CDGSTMCeZqK0iOjwHLBHp+GI+rbv7N2b6sJtdR+V5cYxsjUmNgnfAc0G515UNrSV
	5iyd2fWQWdjUmc7kavgCI/dclLVs+7HSTkUqzNR+6lOIk5aCU7v1TMnAtwZGkdoa
	jtziw1QqHn3ygtVY30geFIkbHklKfLMRTFX1v6rSROKMpxuu/O6XsZD9sApUioLQ
	YRsC2pit+Ju6pHKKSddxaBi+C+XL7+Yr77OcJURYyRes6+x+QniSdbFaylUKnjmJ
	IBSsjThz59sh0vA528a/6KjJA7tM7+M+E8QuwDyPwSTtu0ut6PZYQoodVHjwKH74
	FzE8UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jmqcgk5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-725cf06e7bcso3424965b3a.3
        for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 08:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367861; x=1734972661;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A30SR6P2F4Bg88v0mF0YsJP4SvSWPa5Vxlr8SxbBJ4U=;
        b=cutM+Kodr+TNVSi4wjTy+6AQIAfkSmRuhwxcnQBeHbnfqzqrQ/7gvoPD4ulZbbI03a
         +og64aOgx82n0/zt9y0ZIKXTHBSS4ojc7ng5BuPrYJzBDhMGju0cmCctzayX6Y/GQv5c
         5mjvzADthrOiP7LmDYzzYf9PkLLYddokJ+fFvYtkZEsJsDjGfBkxVS4LZzCWAmS+mwZR
         AlFsJzFi6k1JtC4EycwnrUoA/6Han0AO9BtMenssN381sV6kyQWQdYDDoCpdBteFQj+Q
         GOGxzepV3NbyBu/YeWuA2et3OChVQfKTTyZQhBKxB424apkAxKD/wTwdCTRqepQ3/seT
         ftlw==
X-Gm-Message-State: AOJu0YzpsK0WpO9/ulmw3bSmeV8xyLvoo8cAlpy2VrR0TW1LmV56vnWm
	f6kMbVF5MgIQrvunm/LLHK5hsKHH9Dqk1KYHWjEmKh4i6BF7IHWsFl+XOSibZEHBmfqD5ULnw7M
	4JsFGkWyJ3KRuSh9LCqzB9reB5gp7gG3fpodG+kJWXVxBItQdgFjuAsZrc9/j
X-Gm-Gg: ASbGncvzHPATY2+hBe9HYOlMyLdj0Hprna9Khc5G08slAteyz9EcmCj8aHDjmG4mGNZ
	20U53Dg4nbZOg/9x9+PCCDAbLkSxnHN5Q2GjoyvzZrcaLgXSXsu85/ucDtq/JBvT5ZWG7eMbbPq
	5N3iAZRil9nEuB3ElssQWn24eqVRzkbjjp1NtmrQ969pAXvgWeCaxwku2Z0pcHrrROYGfVu/PZO
	A3AC1eDuoKH5kyUkbstvPmB5h1i+6TLjV7Aczex8RBzqCrR2rnYnllGH1qaO53E1na7zluTvone
	9rtoeYC69BGD139pRQ==
X-Received: by 2002:a05:6a00:330a:b0:729:597:4f97 with SMTP id d2e1a72fcca58-7290c243231mr20951650b3a.20.1734367860704;
        Mon, 16 Dec 2024 08:51:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHE+RXhL7PwjdEM8OJ4eq1C6kH23qH1FIqxLWVJgsjJzzTgC5L8N+5TXVmtuDizMBEjICTEA==
X-Received: by 2002:a05:6a00:330a:b0:729:597:4f97 with SMTP id d2e1a72fcca58-7290c243231mr20951615b3a.20.1734367860303;
        Mon, 16 Dec 2024 08:51:00 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bcde43sm4937486b3a.194.2024.12.16.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:51:00 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
Subject: Re: [PATCH 0/9] wifi: ath12k: MLO support part 8
Message-Id: <173436785972.3413746.2874349352867763991.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 08:50:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: mTqxApVOpWgvHagsMSFZWyfKF_dVjWPb
X-Proofpoint-ORIG-GUID: mTqxApVOpWgvHagsMSFZWyfKF_dVjWPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085103_728088_B04FC3F9 
X-CRM114-Status: GOOD (  10.77  )
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


On Mon, 09 Dec 2024 20:54:12 +0200, Kalle Valo wrote:
> Getting MLO to work with QCN9274 is getting close, this should be the second to
> last patchset. Small patches this time. Minor changes to data path to support
> MLO, some interface combination rework and few fixes.
> 
> Please review.
> 
> Aditya Kumar Singh (3):
>   wifi: ath12k: fix ath12k_qmi_alloc_chunk() to handle too large
>     allocations
>   wifi: ath12k: fix ar->supports_6ghz usage during hw register
>   wifi: ath12k: pass link ID during MLO while delivering skb
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: move to HW link id based reveive handling
      commit: e536c8690cf423f47e5e2f491134d3511edbbaf2
[2/9] wifi: ath12k: add partner device buffer support in receive data path
      commit: fc1e7e004b1808da38c862d57fccfad631a1445a
[3/9] wifi: ath12k: add helper function to init partner cmem configuration
      commit: 5a8abdf88deac066c4c4a224e45b80088ea94ff0
[4/9] wifi: ath12k: introduce interface combination cleanup helper
      commit: 2e4b8a49191ea9df8430cb6e8af7429eadd54709
[5/9] wifi: ath12k: Refactor radio frequency information
      commit: 4b861d256235c0c94d1a09e4dd888accc0eec5e9
[6/9] wifi: ath12k: advertise multi device interface combination
      commit: 03156d08d9ae768bffc0eba5eeeede868f52331f
[7/9] wifi: ath12k: fix ath12k_qmi_alloc_chunk() to handle too large allocations
      commit: c14725f359ef982923f3bc7e222c7687ffe4e496
[8/9] wifi: ath12k: fix ar->supports_6ghz usage during hw register
      commit: 95740fb0d3dbe276bf414c44cea0c35948407800
[9/9] wifi: ath12k: pass link ID during MLO while delivering skb
      commit: 1d015d783da57b002fda75b29aa3b886724c0129

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


