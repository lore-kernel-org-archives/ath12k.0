Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BCC3601E
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/WmIDBmkJ9OWpixQlYZczF//mMv6RkTX6rhwr46yNE=; b=kt3xA8/6YHgRTqXuqllZjKBtan
	VqmnmwYl3bHtNL++Y6aYyxqJDC+7wclMsfnkA+BOsILNIQbQD5gIHeSVQhshPRNKQHRysopTcrdrV
	SDUMry6kTeB7jV1FbWI3XW4ZJ5MfcPMn1+CQ4on3e8valgNqj0vUQswtHXsWJE6IxSuF0Qh0dCSL1
	FQPDgP25BswVR+sIKFhI+8ZqVCtoA02y7U7IPbjLo2v8XRtnIAT4nKRTigGQAggfwZC3owofKIf0L
	tGLXAgWI0u9XFSEohjWiKhyY8D9EMtmWQje8No6bNnjAUoQ+0vrpMpbIRizOfUHwQh3g1Sexhb8Az
	eyv4XAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAF-000000018Fu-2eKD
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 16:17:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oKN-00000000wa6-0PlS
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 15:24:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dlcF028092
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 15:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/WmIDBmkJ9OWpixQlYZczF//mMv6RkTX6rhwr46yNE=; b=g3WgyvolJIOZ40te
	G+ZxzwbJgZwhrtPD9E9zXdIt6iFoGbZbZ2vEGhpgZRpZVSPWlIctTlqaiLuiMuTs
	KzVXlSWHZcnHF0ugwmXYYa8TL4Fj6yTTnGKXvcZlIGeFAi+HI5Ul9ywAkFlxeBkF
	FOKhdEZ2sx8NSl5x4Twsy9FJv4Uc44Rko8XCARawWjLzHx25fTGyXK1akBHSvKXe
	jqu6xAc4vwq0tS44vyKRQVbV2INYH5X/o1y5Ypl+ORWj5L5PBqGnaXnjlcG7w0li
	DReeX4MRE8ZR9OQRXIPF0vfxYOy+KC4kU8kBf7NcfxY5O5fimO0+HxDmVsJ2pnJb
	WT+6sw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyvpcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 15:23:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227a8cdd272so38857625ad.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039437; x=1744644237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/WmIDBmkJ9OWpixQlYZczF//mMv6RkTX6rhwr46yNE=;
        b=wtO5F0G4k1pMARAUefvaiRW1KVzv5QvFP3Jsi7tgq3qCvzwwlN3TyezCMOOxscdqmW
         AQ8MOiIttq0AsclDiJ2Lzc3n52n1YA+vMVQ3klOMrAOY6NwqpYJiKwwSG4+8Y17PVg8e
         gRCUIKrd0gb2NHFsh2CzsfXsXQZdADIfPwUC/ec1ZXtYVT8oI08UaMp1HIQ9/m/2ost7
         aiXD2RoA0zdlUGHUsz8SUiHAzJIZDqWQp2PkzQnuUiysB4X7vkDDkFVoPFvb3wmgVvyd
         4xboDaWX/H3t0HWHcFMGbScEL8d1R2gYXJlv3XqF/vat9p6I3LxrBvBeu73BJKgXC+Xm
         ON0A==
X-Gm-Message-State: AOJu0YyadYTWrjxbl6yVISGEUUwK/m6+ShJtPa0q9689jyOZ3OZxDlew
	Rn2R6qnsFnxBj+7I2lvB1M7smEblRL4OOyIKF23P7z24B1ZKwsnvySqOrkunF9xKNIgg3TC9enx
	D3JtDTHZeN/Z1cJ35cIkFLMJu8fHhrvzldKK0pHG1f6TqCPkBUksBXRkg3Ztx
X-Gm-Gg: ASbGnctrrCMklCVsyi9xkR7uVY0qL5JD1j2hRQBqe4lnGv0yPEhc5bfYydJbBejDGio
	RTTgmIvhVhBksDj/Z9iaa/NU5EGeOwex/d9EVIsQYO44fPVbCNAJ9h0Q1a2YsppmJDZLEL7glMO
	jMvunZ8+1rM8azuUsj8j+Y+do1oMgzPvFMhgaU3SpYTN5V60rn5+WnBXP6kTKOGa/YF9+F2y36N
	6GPTJnRqmrKEmJPH8hCow/eJHh60NtH8MOikf3Id5TiyME2xnB/dHM0/QeBwT+0C8YeqvYUhbRk
	QWZb9dDVsiRTcSH7DOFnDi0uw8lhZUQ46BDjlSUMQBTYkJEDsIEy
X-Received: by 2002:a17:902:ebc9:b0:21f:ba77:c45e with SMTP id d9443c01a7336-22a8a1d230bmr173288125ad.45.1744039436745;
        Mon, 07 Apr 2025 08:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtVvUgJgoESeXWEn0mznhFx7fSjezYDZxgWSyW5Zj/fYDcMecZQLSuuR50ZTUgntjs5LAYGA==
X-Received: by 2002:a17:902:ebc9:b0:21f:ba77:c45e with SMTP id d9443c01a7336-22a8a1d230bmr173287375ad.45.1744039435936;
        Mon, 07 Apr 2025 08:23:55 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7d3fsm8691592b3a.180.2025.04.07.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:23:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250402175714.2667270-1-praneesh.p@oss.qualcomm.com>
References: <20250402175714.2667270-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix memory corruption during
 MLO multicast tx
Message-Id: <174403943537.2068408.1682750933741678430.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 08:23:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: F77809shc2cL0_jPr1Khc9_FYprRN-uG
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f3ee0e cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VIh1eF_YvHMjifF3oykA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: F77809shc2cL0_jPr1Khc9_FYprRN-uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=603 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082359_260919_F12C50B7 
X-CRM114-Status: GOOD (  13.42  )
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


On Wed, 02 Apr 2025 23:27:14 +0530, P Praneesh wrote:
> The struct sk_buff's control buffer is shared by mac80211's struct
> ieee80211_tx_info and ath12k's struct ath12k_skb_cb. When the driver wants
> to transmit an skb, it caches all the mac80211-specific information from
> struct ieee80211_tx_info, then performs a memset on the control buffer
> before writing the ath12k-specific information using struct ath12k_skb_cb.
> However, during multicast tx, the key is being filled into the driver data,
> which overwrites some crucial members like link_id and flags in struct
> ath12k_skb_cb. This causes invalid information retrieval when the driver
> accesses these fields during ath12k_dp_tx(). Fix this issue by removing
> the key filling logic during MLO multicast tx, as it is not used anywhere
> in the tx path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix memory corruption during MLO multicast tx
      commit: 6f8a27a584b23e9dedefd6cb110dd2587b84a6d4

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


