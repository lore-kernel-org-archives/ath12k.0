Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC128C369A1
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yltj8V/FaVbMSn3d0Z2qwwLYdmKBWgYnuTV92lGPDnk=; b=dma+e8fzoHB9gJiUEObuCNk59O
	CSwjL3BYXbielPR61ipwDVWt6Py9l3IMFhi/i7zwmlbTN+MK48UPAFtnvXUwMYX2xTbAloW0ON61Q
	RDvmposbp+qtladl8tBOTY7p+RwlgDbDiwmCWPoWDgL41qbzZ+DtPkXStTTZDkwYee7xhq1XiVcKU
	oP5i016Z546Xo2t7gAsZoMeuowjtB+3d/DEYGRRsp4hQubTL37Y87w2gvzxi8/i9/jIwbU6cyF34F
	zsIPTkj4pyFjmXgQHAJaI41wj+8p4mmNXxhB/9PHzE7JI6qaKKdToP+beGxE0Z2Tpw3wPD+8D4nvw
	5ApIqf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPj-0000000FPRR-1rzj
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPh-0000000FPOV-2PMy
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3efEZ010677
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yltj8V/FaVbMSn3d0Z2qwwLYdmKBWgYnuTV92lGPDnk=; b=QBpxb7U9Mn/ZY0IW
	QUjlFwrAc6rBkpKJ/KwtkZYNv9p0UuJ9zZOO9E/x217M+Xn0YUgajqZKCIYTjV4r
	CfvUkQpXXExzx5cx4Pt2sa8xdKuQfn8Tp8xISy1OhOQadjHre8iXTpVpWfshPg2S
	PRljKOAdcQA4PuGWr9rZWjQ7i8NOIdR8kU+qsg3n2ppyWqHQJwNuiTIvLShfghtX
	LhlJY+10/9gpHWoGi6+Y1cxfoEjbvKOjzWVJLxlU6W3bxOHD1Y4rzORgTil6QyZN
	7iZ5GRPj8Qky7uQFnA6/UPqYFEOnyJBzDxnUL8KCfDRlvalu3KDo6toQApVBiuqr
	hyd6zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs103hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso33459805ad.0
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431855; x=1745036655;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yltj8V/FaVbMSn3d0Z2qwwLYdmKBWgYnuTV92lGPDnk=;
        b=kAA9WC1TaiQVoX3JKe9q2BOuBBKcYXXc9gtGG46VlQfCYFW4/Cqzt+EEV7m07JIYHA
         lX7jS1RsBHPJu6obtJBVpi7pjNNRjA/cE9yT5FDg1efRuLz9mtp/j95zClApEZStVgI5
         HOZvH69sd+80BGH1SD/Qu1uKqHGNasQuWjcDO7fVA7aEHou6m+chFWHRG4sZLBWoJkox
         oUCWFwgvU+Topx2xbax00ktCRTlHRsGV8FKa7EdMBmXksfbpjP3nxPhEOKeWWmS51zSO
         9Tpj19StYIck9l5nDt0Ioh5FSYluGRGSOyoUTOTV00ocJZUl6gBPkR69PpQ3jmWyQ1E7
         gtOw==
X-Forwarded-Encrypted: i=1; AJvYcCVRZBfTY2f/11HT06tUZ4ryN2OH4xXciYNLleHUM5LkDN0J8vEBIxQj51wO7pzJcpNOVfOFgdY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrcJ8lhTYdHI5CYO+YQ9ORH9KSyhYhOCtQf6LU5Xv0fIN1dyp
	OKGNHA4mbA8ARQcH2QDJsYgqaGPgoPpn8evPOroqQIUsaosoLqgS4CpR8I8kBYpe0EynFvAz2XZ
	X4Z/S2JQHfTB3d/OowgAq1j4sZt3mvCOcCK/ZnE+OTO+mXUHGpfDaDyWVPv2B
X-Gm-Gg: ASbGncsUkEJMm47HHlSPW8LJBciV3tWzcPS26FqSEruneHPUoXEGWvB/yJSigWFzQtd
	RaeZ5rsqmMRWVxrjZV8UV4S2GkSIcaMPmOW+h5MWj6Nm0FrbyYtq/LCn8unZfu1gEWIbCorn9Na
	Gkyfm6W9fNyWxccFjlFQTj1bbDwMdfvULY8bjXcn5YNfJDEew4+LJHwxlnRjS5wDWnnLvIVjpW8
	aVpPOcOqJDKuDVSNTEzdlfQr9zQEaoOLxu2aVaBA0wzi9Ge6W8dIjmjcKf++IX6Rm1se2ZvDtwD
	g56Nx6M7jQFIKfK0ipXSoC1Gk6MlU3eKGy7KTF8hSL+QjPFR
X-Received: by 2002:a17:903:2d0:b0:215:9eac:1857 with SMTP id d9443c01a7336-22b6943010fmr130686825ad.5.1744431855266;
        Fri, 11 Apr 2025 21:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaF/ZdumqPMm7Lo9UgIJs3LlV557WY/BkCBFOJHRD5je46M0dwSnCadkd518sE39kMcv9Fcg==
X-Received: by 2002:a17:903:2d0:b0:215:9eac:1857 with SMTP id d9443c01a7336-22b6943010fmr130686505ad.5.1744431854652;
        Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Message-Id: <174443185385.2972989.16898377871566470788.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67f9eaf0 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 518vvkwZm-Avkm2mN53n4gHamWpAQEkX
X-Proofpoint-ORIG-GUID: 518vvkwZm-Avkm2mN53n4gHamWpAQEkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=644 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212417_756467_6482ADB4 
X-CRM114-Status: UNSURE (   8.17  )
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


On Wed, 09 Apr 2025 14:01:25 +0300, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix buffer overflow in debugfs
      commit: 8c7a5031a6b0d42e640fbd2d5d05f61f74e32dce

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


