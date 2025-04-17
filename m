Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CA4C369CA
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=M6X9kEY/zijZBuf9aAfO0AR/ny
	/tTyxKYOkGW9hyRon8MMfIr56fl+fCUyEU0YTGCpqts22Xxlhhb3Fq9tgs8D7XbYOslaagG3+DzMR
	bbb+mZSq+AbBZpmyx/4wOGkVBZr7pc5gKKiEqsgH+VvPS2Og90GDwJYoEP6JsKhVgb0jpYQHR4GON
	yAmDhh5Btz4JmrSQEPK54Ie1qnG6I99l8u1ZZrglQDOiF6gfgSnKHJiQoHpaGQntmbKAP/zTI31ae
	hCNEp2MuKtOuEnCAaTu+8Se90iHA7DENZpThU0F59/u+BFbts60KLMYNp+dCn3+B1/pO4nU/tq7hF
	/ntmi87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB3-0000000EVZT-3P4Z;
	Thu, 17 Apr 2025 22:57:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAz-0000000EVTT-0iHD
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMt8TA007964
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=fpad8Zkxw42D9J01
	Lp5PLjxxqf5lULuggiPbI0MfNVrmp0jEGN+0uxTh+/NkWruxd7+jHFzLnskQMcn7
	m+sQbV+yPVT8XkmYYQlHWjMnm4RUShnOqeJIPxOKNgHMDl5TuvSnMk+VJ4QZCNZT
	YGAtWhexjyt7PxjtxduWikStvu1jZzeDvhOXCtSDI+i8EMd+Pn9BJkY1bFzvtQ8S
	6kKfkF1OKr6Ziegne6qJP0dc/9MI+sNIngUyZXn7b4I2uEixBwBHONWmJ6ZhAP6i
	tPxrLsTnoSwzOUFHTZREzCRarse8F5mco/dQEW3kZgsCPQ8JrEB8vP+D6K4vP2lZ
	fypbzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjra28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73c205898aaso901592b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930663; x=1745535463;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=;
        b=wBqsd6y1m6V0FjPo6ZC0EJGvXXsaOMvxSurqG6dda0aLsFWR34blEmSvjp6sJIqIzL
         UvqKtj9NqcuBTTvjsooLtvhjBEmtt3lxNiw6WJwlDBmXFBASgige2UB9ciM9ufIp/n1P
         6jV359wY2X+qsXpOHedGpQx1QSMnDDYO+Mwi6bZR5chQz2UUodCh+1J4RKM+cPTJMGbJ
         VgosRicFYFPhcxuqk83vOn4HKvjw8QmFKvgsv5jY4PZEzbyPP17xubQ6y8OpWTjlBHLV
         UJnOPqeh7gI8QI1tnIZQh2N1T+hVhtL3oVvO7Tz0sfyxverFy2gxfmoly9UdzNxvxYUR
         i5uA==
X-Forwarded-Encrypted: i=1; AJvYcCWepAh33/htxpbLHbQ4bq9IEIrweiEQY21bue/mf0WgxGSvYQMSqAzkPsy5vueHaDgqo62BQbk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5+goglSPWljuFBe2t3NIXXV3cowDPJwvfmoKDzO2Zr1Ed+r66
	p5FiwPbbQuG/mvgiTHTYIDzzOF9VBfkqVuulrwTKpYtkM8P4qL+TIdermxhooAt87fpjVoRU1H0
	96cK1aVIbeB5yUuoBXmkzXjNJaS8pm5Iob2xJ7iXGpvDuLLD/dFAIv7tDMVII7ap3Vcqx
X-Gm-Gg: ASbGnctIyyCGTDLs0IeXrEsQAO9WrquqxvaW9/67c++cky/vWWwf4i1XNvvQn31EKD6
	eFcguxl7jmHArRanOTdX8GBwvf0g9qgUiNRqDW1RW+jexUEtFUOOGyLbNUae5vAlJQ4lEMIxKoy
	wR5yQIlU/lQUR7v99MDHCKW1UPMXJihC7mWpozdove9es1WUOyor65xjh85XdnyqDrCwwa2JixR
	eYIGBj8xkZBSQ4WEqat7u1hXVlJR5bce3XFFs7zsMnYMx6AEwKU2sJzMIDuM1djwnhdLxTavODF
	AYN24C+SrpGu3ckwM8/y3RmR6nJ3w05gArVex1qxgQwK2caT
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806990b3a.20.1744930662682;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBlUcOaye28+dYXVT5e8hcezLBg2+PLcejjCu36v0S/nGdgKehCY5UEe/2PNm1Uh5qKd8eA==
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806963b3a.20.1744930662149;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, wcn36xx@lists.infradead.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
Subject: Re: [PATCH ath-next 0/4] wifi: ath: Don't use %pK through printk
Message-Id: <174493066126.1347382.345644321134226340.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 8Uww-bYLQIpabzzT-zJjO53692bQ8nhz
X-Proofpoint-ORIG-GUID: 8Uww-bYLQIpabzzT-zJjO53692bQ8nhz
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=68018768 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0rtzQTkjgJck7GMvs3kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=656 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155745_376711_C8D8C72A 
X-CRM114-Status: GOOD (  10.15  )
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


On Thu, 17 Apr 2025 15:19:06 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath10k: Don't use %pK through printk
      commit: 8add2b8d72722b60c749b559db2a2aef6c9def68
[2/4] wifi: ath11k: Don't use %pK through printk
      commit: 27c57c84922ef1dc72a2ea3a5427cdbaadc9be44
[3/4] wifi: ath12k: Don't use %pK through printk
      commit: 7e7f948c7d14ab5a6cfb26146a0d4734781903e3
[4/4] wifi: wcn36xx: Don't use %pK through printk
      commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


