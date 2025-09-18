Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BFCA1013
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9VvUPUVQh+BuTqJ8FxkvH9ic5yM2CzEkTeOHa83Du4=; b=Bu2OkQ7uJ0YJyznGiHTizsf6bv
	74K6Y/SCRjSBVvNjS+hx0oHzDFFyEch+Xju8K5EiA+qJl0R93RM6GAU9Bggatc7mrsQgXpblctz7z
	gryrrJ6zli1/rXlC2YsBBE9c2x3Txm7lWIUcpj7yTLcG32USkwLPXnfcMJ2JystM0zMYNZF+nxIeh
	u3h5gU1SD6BJDtHFHpY7pzisbzRPHrhHz8slGMja59qznOn4+f2KJjcoEnBXcfyS001aoK8LOfWUG
	MkoqUGIWh5krM8YaH7fidJPo2ivuRBkej2U3vNH1HFutqroNK4XdN/J+eWwd2SUXl9fllUpgpG/cz
	tBvqqLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLW-00000001Rjs-3z4b;
	Thu, 18 Sep 2025 23:47:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLT-00000001Rhx-2cqR
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IILQZc018272
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9VvUPUVQh+BuTqJ8FxkvH9ic5yM2CzEkTeOHa83Du4=; b=jHgo85CJAuDE+xRl
	LYA+0DUvHuZp45NF1axF/vcwjqXqCs6SS0meJnajA1ivgMM3QOWPALTvbkAfiED+
	jh1noXn0NQcp8OW4hS19Yh4DblrLCoaP0wzbXhKOLCp1VbPBYRXQBgWIzwd7Az0D
	6E6d5jIa9ZcAOQwqBNGZqzuQmEG6eg9ECrlhmUKSY5KJ4aQr6+HwjCh2ujWKqK3v
	/KmFb+Vj+TmjuV1CT6xhBru2ujImFW+bLo7sUSN4bi35F3X7znyB5z+90c9SjF4F
	dKyt+Kj/Z/3N5tjgc+gznYXT1wXrrMUH5578mSWvOf15cYb2geZ6KsAiVr5s3g09
	nL8uJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwgcc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ced7cfa07so14218825ad.1
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239241; x=1758844041;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9VvUPUVQh+BuTqJ8FxkvH9ic5yM2CzEkTeOHa83Du4=;
        b=qS86YM8O+4PZFQPbFe1yo283ZHn31rwfpnjom5+E2Y+wBE8NoDlbhbABbqodapyrcX
         r1snEG+fFB3S8bBK5yahtmhdsxK8tej9xMsOv874Q9FOdgV29ZdO21gh3BTDhfilnrfL
         F9aNYYA7keStDJpo4n4moCM8KyZQh1DA2Lg3L/XyXUUX2+WQvwR8lDP+3RDAIBYib7Wb
         //IH83ZfkQvv22tD/ry3B+5FXOfYvu97gDcCYLLVIBc1CtvnKSccBlXM5Og+wuiU7+zM
         SGwj+wmAgys0O179kG5XYvz+lomaEPDwHCMSXKmFn6OVVGhx/SJGIVbwjkovEAfkU/W5
         2cPw==
X-Gm-Message-State: AOJu0YwHZi/5dQyHCmp1WjNnjDDauGdR4XJRjSuhTBONi2kijq96vnAE
	XsROTOonaJ2bMlc95GDFnsU5EAP3Cwr2YH3q3CFxkf7RJ69ATQGm7ENYpcNRWLut48TOccx9tDq
	6hL5t58V/YZjNF4DO33WNxliSXU3m73G8u1XFt3F1R0O91vMUah0O3kyUf8uR5Kc/E9INTINc
X-Gm-Gg: ASbGncuRQo7mme+ecD58nI683xpd1gMySe8jYQwv2fTbeyJ35+UXHiwAavHqwdbK1ks
	KN/8QTTAf5Zy/33G9HLKdAELCmkM5f+TUF+tkQAhEm15bn51wOHKVJ+cZjZpHGDOtg8/1mz3JKC
	5hqFEqwvW5JLh/W9/5mp/zMFzAfFLpfN7nR345qW0MHDFOmQ7J0zl3uK9EJV1OgpaXLGGEw7gWz
	edoljisTFJEvRAj24Zj8QNKTJGIrWbNkzZgskEs/BfOjWDcrW2wsxMW3/lBXuWJ/R24CiiHTjiQ
	3LibIVa8zekO1uJBtBSBe1/R1IjkVmBypQhq3KiciTcq2PNaFYk8zi/1KwMCSuSRc/TsOnHNmDj
	q
X-Received: by 2002:a17:902:ecd1:b0:267:af07:6528 with SMTP id d9443c01a7336-269ba50848bmr18339825ad.35.1758239241389;
        Thu, 18 Sep 2025 16:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmDrSiEHLdRTJZ8d//te6Sl23OAe9Ed7ZGshB9Ih1576AsbgyQ4dbjzo3oY6Isu1jHsx8rAw==
X-Received: by 2002:a17:902:ecd1:b0:267:af07:6528 with SMTP id d9443c01a7336-269ba50848bmr18339615ad.35.1758239240965;
        Thu, 18 Sep 2025 16:47:20 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: monitor mode fixes
Message-Id: <175823923998.3217488.6011123637670407753.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc9a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-ZAtyTsNoej9e0GDpi0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/KnInxxcOZT+
 zJN1UEVFzO1dpcuVgFhrPWF/5L1z0dzWEGN6Ru4nesnQiJX2Jr5QcJXVtLgWW/36Zbm5VES212u
 aE45XA3gxCBlaL42rZHgUqZLnBTFDNtgzgAQjWBGiLf0ZSX7TUYJ8CeMjrPOLJDhKBG2/6zIF5D
 anqrHFq9WPZ4ieHVz/fm+9KLd2C3UhM6+5zLvPBuGeTk1nbhu9cQp1xZqsCxjQecCgcfJtwLTcH
 M/WkgTCVjZFiHps7oQHR4tOCKpVs5NGOvMu31/TuR2mnDbSRDzjHhKDuUcOeMtwraY2+L70nyTe
 BPdrT6t6PzhugTrsLmO2q3zNsTBCbUM5otDRDbzH4DirgOj0rTyKJdl50zXEAOouB+cSgJvMzmV
 k1NIAhpL
X-Proofpoint-GUID: Ov5-LEQuQMnxjm5QVNeH2kl1TaN4F1Ob
X-Proofpoint-ORIG-GUID: Ov5-LEQuQMnxjm5QVNeH2kl1TaN4F1Ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164723_672142_20D9583C 
X-CRM114-Status: UNSURE (   9.01  )
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


On Tue, 22 Jul 2025 17:59:31 +0800, Kang Yang wrote:
> This patch-set includes three nit fixes for monitor mode.
> 
> Kang Yang (3):
>   wifi: ath12k: fix signal in radiotap for WCN7850
>   wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
>   wifi: ath12k: fix the fetching of combined rssi
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: fix signal in radiotap for WCN7850
      commit: cf412ae7b7124e2b3bfe472616ec24b117b6008a
[2/3] wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
      commit: 6b46e85129185ec076f9c3bd2813dfd2f968522b
[3/3] wifi: ath12k: fix the fetching of combined rssi
      commit: 7695fa71c1d50a375e54426421acbc8d457bc5a3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


