Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59621CCA470
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUY4YONPgcK6eZeiCt9e1QSImJTa3obP9OtEgCFMl7o=; b=kPqET0aMJTYqzjx9cBQyspoFzt
	NQ4QhCA9dnRT2eCqpr+sDjxjIIn07yTdC/Abn5ZWiU0yRnUwcEfoFWqFclWLQRDpoWLiTYdE2gsNr
	L53bh3IFb3a8QTFQ30jxx66uWm0+ZQ/XxxlD0Nfq7W47hyzAXCDKej56/MTY+vIPBg7jxqhpfh+vY
	8L2CtnUYINP87qDN7YeHQ0PcL42iZ72wERtfSSHFrDJpxgeOBsI6OA1bzsB88QUhjvO85ww49k8Yn
	mLgVzYJ4iSGjPRRU3LxqqLNQvDHNCHI6S7TbLP7xtBPBMcFcDxixDVfm1hYuMZDj4FneLGNScrQyu
	Z5+7uqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3d0i-00000005kxJ-0PNs;
	Tue, 30 Sep 2025 16:15:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3d0f-00000005kwr-1jcQ
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 16:15:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC4FTJ013512
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 16:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUY4YONPgcK6eZeiCt9e1QSImJTa3obP9OtEgCFMl7o=; b=kkkKtKiH1G1UE6Rx
	7SnS+Q9y3zuE0sYNIabIHoPj6yDx4/U1ArIcn3lL+jycxhdOU6/LBjsClc0k4k2B
	MsGWY84iBm2rbSw0Xl/2flCyJ/hMf9YiZP0Dz1xuQOxWyPxnr5YEhLDb0VY22v/t
	ndonNjwzbayFyDZQh1c3f/mKTH7BfSrpJtUntNyJRsy1Z2QYKDSksvjIKFzYUtYR
	m6aWoc0Jtc8bON2hGh9RhdyjpxH7e/gFBeH4dcIGs9pdXfytYPWtTVmTMMVYmvSJ
	dmLNscMtt74luLWS7fHJU6GfuUuaBiywULOmfSO9eX3S0l+P211OQcT1K8jcsuLS
	I56fNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a61mu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 16:15:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339a6d9defdso45405a91.3
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248922; x=1759853722;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUY4YONPgcK6eZeiCt9e1QSImJTa3obP9OtEgCFMl7o=;
        b=ElWgw7Uk+bS1Fz0t2zzd7GG+SriGLZzUJX6Dnzyzz5H6TBkwMnpAYPH5Q7JSZq/U61
         9lqLeF6jy1iDJH1NJPC/x3WGF6jhPEhdX48gNRMzdeeK+oiVQCg68zvPuHzjQmEBqqbG
         gGWeEa/FO4R5BsTTLUC0+aU4UaL2Ryc2FQa/oPMhF/v92uUi/arY3oiX+b9onhzttMCz
         gu5bDJ8cxbmohxHrzVV7E1dlTx04ipR9PAhlXeI+g4+KZ5o26JfDD5Lg6yBmZhIIX9tZ
         BPXkcGFNuIehmceXxYKdYdNhm11CWFEiSrM5Yf5sbJghlCOSEAcx+MXD4PjZ0s+qn68L
         oJOw==
X-Gm-Message-State: AOJu0Yx0Oh9PXbXFDP7Hd088PCkhoyAOGZaj6cNr+h4jx3DIKhnix+FG
	nAOypADBrw0hQupkp2CD2T+8j67YaqJAfSTTsIs4rUoZSg6DI8hVWnbtHVw57Uy27SBYZLwr/il
	tHa/wxMNi3SdZra5SnGzO7ADchIduTDrEyxmBXyJmU4uvDbJBfgEeLpwX+0W6inhmzi52AVF0
X-Gm-Gg: ASbGnctzDueSefDkxWmg66EBE5ynMc3TuHRh8H/oVcvNrwzsiw07qiPB07OgWl4UoEo
	QkIIYpzYQRnKBFTIHkWQ4ypR3WoT1YXVVSf0tsBh0+hHmld7ZS+/TAq1WO0zF9z6sNUVaDH1tg3
	vLy4BSr6YUJwYOmmJxZNRbLeY7nPr5kfY39oZQmlLx+PXouMxYtUFGTjZ26/TeOpbKZfifQQ3TD
	jGjQbCbviAAuUsq5WaRRQnIB1EhvkZalFP5/70S/zuP0mPRvz0SVpJRd7QmT+iIdZUIfcFV+boo
	4dUvFkc8TlR1Z+xWAjXfYho+MuNgaWAaelyy6saVf81m4x0mFBn2aIdH7FU/++SYTURGSe931No
	qqkVHWw==
X-Received: by 2002:a17:90b:388d:b0:335:5e84:6d37 with SMTP id 98e67ed59e1d1-339a6e90566mr61969a91.6.1759248921078;
        Tue, 30 Sep 2025 09:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA8UYnM12JxvjjDD1gn3e/aoSRjVXLHoJX2SG7jFct1nzIYATY62zI3lilxgdW76ZRPhqHKg==
X-Received: by 2002:a17:90b:388d:b0:335:5e84:6d37 with SMTP id 98e67ed59e1d1-339a6e90566mr61833a91.6.1759248919176;
        Tue, 30 Sep 2025 09:15:19 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be2353dsm20643545a91.21.2025.09.30.09.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 09:15:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
References: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng v4 0/6] wifi: ath12k: Modularization of
 objects for Next Generation Driver
Message-Id: <175924891816.2990410.6891956881168623595.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 09:15:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc021c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=J40jnxQbjyWMeiFgDVIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: XQVq_tbmjaQ4g9mTdBUpjXHVb57X2HM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX3FonNdGngwMd
 joVrHf55ZqULn9YkjoZQzKeHSRZX5To/cxwUSPCR3DTXWL1QtdVtcYRn4Xm6tl+WJbrKXaU1uhi
 r/OVX+mAAd12oEYweK0wB4mr0LbmEs7EhSap6ksDoPCV7UaLp7y3VS2b8gmwm82SFLubwplHz4H
 hD1DR6jeP78eLqWPNH2g6MUjHwGPorpKNEivRSfdx6UosTkYjdmyKogmwk8muK+ab3NkbUt2rT/
 AMYempi920h+Cb6bMLIxC6XHJDqo3m35m8jt4P5N5GcVgEb1s/kG0CjHecjhlo/c0z0X3gmOyMX
 ku+cYTml9CT/hx7N0aemcvPDD7f/KuH2pWMDxqkofYOD33mosE223aBPDVoOWPYNS2AstWBcVYa
 tmoE5omW/W4j59iEfYLRxARTg2mNzg==
X-Proofpoint-ORIG-GUID: XQVq_tbmjaQ4g9mTdBUpjXHVb57X2HM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_091525_576176_1B9F8164 
X-CRM114-Status: GOOD (  12.56  )
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


On Tue, 30 Sep 2025 18:39:59 +0530, Ripan Deuri wrote:
> The primary purpose of the patches in this series is modularization of
> object structures along with their allocation and initialization APIs.
> 
> Patches in this series are made to achieve the following:
> 1. Modularization of device object to have a separate DP object in order
>    to support chipsets of different hardware architectures
> 2. Refactor hardware group and vif structures to optimize data
>    path operations for future extensions
> 3. Add framework to support architecture specific interrupt handling and
>    ieee80211_ops registration
> 
> [...]

Applied, thanks!

[1/6] wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
      commit: 3a52762b539f6eefa6f600ab58577ee09f26657a
[2/6] wifi: ath12k: Support arch-specific DP device allocation
      commit: 614c23e24ee84d5cc2c1648941ee7156b4fb173f
[3/6] wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
      commit: 8042e30acd1f48aa7d79a9be3b64b04376b0014c
[4/6] wifi: ath12k: Add framework for hardware specific ieee80211_ops registration
      commit: 914c890d3b905165afa17356bcf4e23352411486
[5/6] wifi: ath12k: Add framework for hardware specific DP interrupt handler
      commit: 39538dc8860aa523dde38ab68a333cac4a98d9f2
[6/6] wifi: ath12k: Refactor ath12k_vif structure
      commit: af66c7640cf94aa77314cf8d5e95141bdecbc1ee

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


