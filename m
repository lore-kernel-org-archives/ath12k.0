Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A0D79740
	for <ath12k@archiver.kernel.org>; Sat, 31 Jan 2026 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=; b=Qd+WMvO8aWDWCC1/E7JDYWaITw
	9b8zcM3YTvFLpyWWLXCkWmLhxyUROP1ZnYy/NxuAuBOyF0QdpAc3GMNgKVCeA5LagsRf16OeTHhnU
	7erLDIySWE8+GQ+dT4wd6XUqTIPQ8l1iJZJ6UoQEWHsqC7Qm2uGnB7G0WhMa3PLFW0oD6VLIcMIml
	hpH+JRZrVhiADacKPE0NOSdz2OvQdm8Q0xseF/PcNiepi2BIoPKB+XDAEpyjYL4ivCo8yRxiNhSCA
	/yR7FDKBG0P5vnom4tbPwOGEJPKcnHM6NYfpM5tyvq4N+QkTN71P0wbSibKpYfvRWVRrXEuiSV9Rd
	pOGmma3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eP-00000002MsA-011O;
	Sat, 31 Jan 2026 06:40:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eL-00000002Mqc-1Q9U
	for ath12k@lists.infradead.org;
	Sat, 31 Jan 2026 06:40:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U5mh447301
	for <ath12k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfLFnX/pj06+42VOeKs579fA
	r4gQfJugqfCbVka7R48=; b=gqe1TvuTQykpAnbs5syhyV19Zb0JB4DvSwyMCrZ1
	rXFdenj1qvete+UFM6GVhAF+ZGfa3lT0a2MxDs/bgjDM+FNN88BVqwFf3CsWVHmB
	Y57Rmn8/QONQhuLFez1LyzSnZYKngkJPMRQxgigpHjWJCnsdNqPoL5yhGSur58eB
	9d1bKnId1uQfRwR2iZbBOZ+T1gR3/EGdBBUsPs9hC/BQKWmL3rb0AaqDeDIKT/zj
	8Jq80h2yHDSudSYnPzQ/bXTZmvfGRk8+gjLj8XPpoj6+ckV2kX2H0lCRCCVQFExh
	P8YhLPBZTVrQXwKjfMq3GTiiZvHV7bChU/87fDDnRvuA9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrr942-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so1211409685a.2
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769841602; x=1770446402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=AsuhfqT5aTOrkyK6gkFiEW2tOeKYLVZSUC4JPeevLXElTpVindghYtXLAzemZAhpZx
         3kLULCmokgLrJoJwt3aw6ijj0G1i4uUnHWRdEnLHvFO1OGc1Hnsn2zm3PKzgt2bTw1dZ
         U4/8UNCFFtsowVjXB3CLr8rVIwP9B0pWx2cuUePtuXin/OnocGOFmVGW7QEu6SeJECT9
         c/HU+iEaNVceVs592y21fVo8pt6TBPWt+RApnAqow90ilN2VcSVFtuFBgXlxGDlt9UtG
         xeqtI3GVK4lJjJ3zVvbI+ErOidrb4O1WzEMRg9A9o9CJHwtyjSP/6Gi8pvKRsmfSsOmk
         HpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769841602; x=1770446402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=RJ3if/yLchyVmT1mxT2nLD5i5EJEWJw7BB8iS3GmEDn5mTrQw9Lna2YhthLoe4iAay
         2zbl0efyUNrA7IyxUzamnmSvQRujIXZhdan3YN8ModGbUBeNHDhqShhfDU48ncp5KEfi
         Xwaez94kEhs1A3dnZT0/ATbwgL4YZcVS46TUGbqAmgDBqCHuS+f2F4xFEoGMhHdUY4n9
         AEuPWbNpKgspXcZt5GuQG+HkeshnBPnrAtCpisTOC/l717dx5pkBWO0La+Fvoe/GYL3U
         Gu9TlQKl4KDG/KtKHaOz0R2+sjrTn7QmDZ71cCQic10YZio1vyae+8XLKSHSWuvZG6zV
         PC4A==
X-Forwarded-Encrypted: i=1; AJvYcCUzU9ows576pOPBtsKCeAs7xmIWZtk0sGVzakEDjMHdtP5eF/LYzF7Xi65zKvnrh4r/OUi523U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOhK1mG5U2dLryytySmcaYabZyN3d3VB/1XHF6/U9M7/SVYjr2
	rTxE67MA7UujzKJExiGW84lgAjK6iVqo8WT0+pPUIncHzRfaCBLjCj/jUJh/toR8h7s30z08C43
	BDXwkPyeg9oPMeFWTKTnfkVjW2FEuVY/90Bb2k1p5RLmGCLhAoVfOst6gIhZQUPPp
X-Gm-Gg: AZuq6aJ0dIekq2YNI5GJfaoJ3uD+uXk1Kc98OF9piTrD63DBDP0tsw/gSgMQ6lqiAHB
	PyY6I9NxNtqDcTFFDjI3BTde8q40Tgr1QhfDZheXW0YvZ8JQrLJddHBsR4LOy94XKmrGZ6BIMAR
	pd6Rr4Xw0ojEfuyeZivorAki39pN5anuO6/2G+X95r7xUwzB4ckqVJcKdjMEon7Z/5bm3sbXPNA
	9Ub5syTjfjCQbyZkmYOycu3PoZuEm59m4O2iIaCCnF3RCulgXDQcRcf4L4qUGZDlTcqyGwdlrS0
	aoeix3moKa/JQnxFDvsRmoY+k3YPpPp5cmtvtn1gBYzH/OutXn40cnA5lqA+YJHLA+tSgJV74XY
	/fdG5g8LI+IsSRDSdldVsvXrDOx3KnvgNY12lnO83ou8Fg92kvScpBte2jiNtHqw3VeS0VL/jDk
	hxL0n6AFy9UzcL+QftQO903XE=
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723603985a.45.1769841601672;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723602685a.45.1769841601226;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c621basm18212161fa.13.2026.01.30.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:40:00 -0800 (PST)
Date: Sat, 31 Jan 2026 08:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: p1o9qnQNrQb5dvFYdmwTd3YLTz8T3tf2
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697da3c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gcp-Y-p2_AVPb3T4FLMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1MyBTYWx0ZWRfX1niOU/EM8EmQ
 +fZYEQ3N9pkz67wnleLABdjVK7TVcb3QelgZyV3Ro6OAkd1Yv1jdGVgWXfQnRKZHY6lZ2UFzhOO
 qKyAb7nBv57W0VeIfSccglbV/AbWQeCUsEZ8Q3E19MZ1WyTLltNn2wMCvAM3Gx/hAqHllHruE7M
 B40Ik3jlWFt3OTwOv1qb2Z0oyOd7on9T7CT97vSWplXk4zeZbqKhCRLMdOdqY0OSggbGAkDxsfo
 xyRQqaYtmxo3xMbw2LZWIiEUs9VIqdncZfRJxPcTMu8SFb2NkTaw/qsErLXglzURv02bTsH3W3Y
 XwFlPtw950OwBZYlnm2Bn3YUiM3CVSdnZrE7IaAm7bjImENfvPuqfe7CP6mJPtPesb04LRsU6F7
 MoJCwQFOJ6ZKfbQcrvVfevjoHNlkUOimLCqF6gBavEh9q60deIGrYC1AEx2t3pHUYy2v8ddWqcl
 yhvnu9BPVQGUpmCtkOg==
X-Proofpoint-GUID: p1o9qnQNrQb5dvFYdmwTd3YLTz8T3tf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_224005_505981_70C6D49A 
X-CRM114-Status: GOOD (  14.13  )
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

On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> For ath12k:
> 
> Update firmware for QCN9274/hw2.0.
> 
> Update board file for WCN7850/hw2.0 to support:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255

These two were not a part of the previous upload, but... They again have
board-id of 255 (unprogrammed). Why is there no calibration variant?

> 
> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry

